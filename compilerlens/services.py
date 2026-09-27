"""Shared capture/import service used by the CLI, Python API and web backend."""
from __future__ import annotations

import dataclasses
import importlib
import importlib.util
import importlib.metadata
import json
import platform
import re
import shutil
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

from .storage import atomic_json, digest, slug


def save_inputs(inputs, root: Path) -> list[dict]:
    import numpy as np
    directory = root / 'inputs'
    directory.mkdir(parents=True, exist_ok=True)
    records = []
    for i, tensor in enumerate(inputs):
        array = tensor.detach().cpu().contiguous().numpy()
        path = directory / f'{i}.npy'
        np.save(path, array, allow_pickle=False)
        records.append({'path': str(path.relative_to(root)), 'shape': list(array.shape),
                        'dtype': str(array.dtype), 'sha256': digest(path)})
    atomic_json(directory / 'index.json', records)
    return records


def _fresh(out, name):
    root = Path(out or Path.cwd() / 'compilerlens-runs' / f'{slug(name)}-{time.time_ns()}').expanduser().resolve()
    root.mkdir(parents=True, exist_ok=False)
    return root


def versions():
    result = {'python': platform.python_version(), 'platform': platform.platform()}
    for package in ('compilerlens', 'torch', 'iree-base-compiler', 'iree-base-runtime', 'iree-turbine', 'transformers'):
        try: result[package] = importlib.metadata.version(package)
        except importlib.metadata.PackageNotFoundError: result[package] = 'not installed'
    return result


def _finish(root, info, lineage, progress):
    from .lineage import analyze_files
    from .ingest.build import build_artifact, build_index
    from .ingest.workloads.generated import spec_from_dump_dir
    analysis = analyze_files(root, lineage, progress)
    progress('Building artifact and source lineage')
    spec = spec_from_dump_dir(root, info)
    if not spec.stages: raise ValueError('No recognized compiler stages in the dump directory.')
    artifact = build_artifact(spec, root=root, analysis=analysis)
    atomic_json(root / 'artifact.json', dataclasses.asdict(artifact))
    atomic_json(root / 'index.json', build_index({spec.id: spec}, {spec.id: artifact}))
    return analysis['status']


def capture(model_id=None, *, example=None, python=None, out=None, seq_len=None,
            revision=None, cpu='host', capture='standard', offline=False, seed=0,
            lineage='auto', progress=None, max_parameters=None) -> Path:
    """Compile one HF ID, built-in example, or local ``file.py:factory``.

    A factory returns ``(torch.nn.Module, tuple[Tensor, ...])``. Existing output
    directories are refused. A failed run retains its status and diagnostic files.
    """
    if sum(bool(v) for v in (model_id, example, python)) != 1:
        raise ValueError('Choose exactly one MODEL_ID, --example, or --python.')
    if not model_id and (seq_len is not None or revision is not None or offline):
        raise ValueError('--seq-len, --revision and --offline apply only to Hugging Face models.')
    if seq_len is not None and seq_len <= 0: raise ValueError('--seq-len must be positive.')
    if capture not in ('standard', 'full') or lineage not in ('auto', 'required', 'off'):
        raise ValueError('Invalid capture or lineage mode.')
    if lineage == 'required':
        from .lineage import native_binary
        if not native_binary(): raise RuntimeError('Required native analyzer is unavailable; run compilerlens doctor.')
    root = _fresh(out, model_id or example or Path(python.split(':')[0]).stem)
    progress = progress or (lambda label: None)
    started = time.monotonic()
    state = {'schema_version': 1, 'status': 'running', 'created_at': datetime.now(timezone.utc).isoformat(),
             'parameters': dict(model_id=model_id, example=example, python=python, seq_len=(seq_len or 16) if model_id else None,
                                revision=revision, cpu=cpu, capture=capture, offline=offline, seed=seed, lineage=lineage),
             'versions': versions()}
    def report(label):
        state['phase'] = label
        atomic_json(root / 'run.json', state)
        progress(label)
    try:
        import torch
        from .backend.compiler.runner import CompilerRunner, RunConfig, TRIM_ELIDE_ATTRS, TRIM_CODEGEN_PASSES, EXAMPLES
        torch.manual_seed(seed)
        report('Loading workload')
        if model_id:
            from .models.detect import detect
            from .models.hf_wrapper import wrap, wrapper_source
            detected = detect(model_id, revision=revision, seq_len=seq_len or 16, offline=offline)
            module, inputs, info = wrap(detected)
            source = wrapper_source(detected)
        elif example:
            if example not in EXAMPLES: raise ValueError(f'Unknown example: {example}. Choose {", ".join(EXAMPLES)}')
            workload = importlib.import_module(EXAMPLES[example])
            module, inputs = workload.build_module(), workload.example_inputs()
            info = {'model_id': example, 'kind': 'example'}
            source = Path(workload.__file__).read_text()
        else:
            filename, separator, factory = python.rpartition(':')
            if not separator or not factory.isidentifier(): raise ValueError('Expected --python file.py:factory')
            filename = Path(filename).expanduser().resolve()
            spec = importlib.util.spec_from_file_location('_compilerlens_workload_' + digest(filename)[:16], filename)
            if not spec or not spec.loader: raise ValueError('Cannot load Python factory')
            workload = importlib.util.module_from_spec(spec)
            sys.modules[spec.name] = workload
            sys.path.insert(0, str(filename.parent))
            try:
                spec.loader.exec_module(workload)
                module, inputs = getattr(workload, factory)()
            finally:
                sys.path.remove(str(filename.parent))
            info = {'model_id': filename.stem, 'kind': 'python', 'factory': python, 'source_sha256': digest(filename)}
            source = filename.read_text()
        if not isinstance(module, torch.nn.Module) or not isinstance(inputs, (tuple, list)) or not inputs:
            raise ValueError('Factory must return a torch module and nonempty tuple/list of example tensors.')
        if any(not isinstance(t, torch.Tensor) for t in inputs): raise ValueError('Only tensor example inputs are supported.')
        module.eval()
        info['param_count'] = sum(p.numel() for p in module.parameters())
        if max_parameters is not None and info['param_count'] > max_parameters:
            raise ValueError(f"{info['param_count']} parameters exceeds the {max_parameters} parameter interactive limit")
        atomic_json(root / 'model_info.json', info)
        (root / 'source.py').write_text(source)
        state['model_info'] = info
        state['inputs'] = save_inputs(inputs, root)
        standard = capture == 'standard'
        runner = CompilerRunner(RunConfig(layout='ingest', target_cpu=cpu, debug_symbols=True,
                                         elide_attrs_larger_than=TRIM_ELIDE_ATTRS if standard else None,
                                         pass_log_after=TRIM_CODEGEN_PASSES if standard else ()))
        result = runner.run(module, tuple(inputs), name=root.name, output_dir=root, model_info=info,
                            on_progress=lambda label, _done, _total: report(label))
        manifest = json.loads(result.manifest_path.read_text())
        if manifest.get('errors'):
            failure = manifest['errors'][0]
            raise RuntimeError(f"Compiler failed at {failure['stage']}: {failure.get('stderr', '')[-2000:]}")
        state['lineage'] = _finish(root, info, lineage, report)
        state['status'] = 'complete'
        # Retain _full: it is the authoritative export for recompile/reproducibility.
        state['file_hashes'] = {str(p.relative_to(root)): digest(p) for folder in ('mlir', 'llvm', '_full')
                                for p in (root / folder).glob('*') if p.is_file()}
    except BaseException as exc:
        state.update(status='failed', error=f'{type(exc).__name__}: {exc}')
        raise
    finally:
        state['elapsed_seconds'] = round(time.monotonic() - started, 3)
        atomic_json(root / 'run.json', state)
    return root


def import_dump(source, *, out=None, lineage='auto', progress=None) -> Path:
    source = Path(source).expanduser().resolve()
    if not source.is_dir() or not ((source / 'mlir').is_dir() or (source / 'llvm').is_dir()):
        raise ValueError('Expected a dump directory containing mlir/ or llvm/.')
    if out and Path(out).expanduser().resolve().is_relative_to(source):
        raise ValueError('Import output must be outside the source directory.')
    root = _fresh(out, source.name)
    state = {'schema_version': 1, 'status': 'running', 'imported_from': str(source), 'versions': versions()}
    atomic_json(root / 'run.json', state)
    try:
        # Copy only capture inputs, never arbitrary output or recursive run directories.
        for name in ('mlir', 'llvm', 'passes', '_full', 'inputs', 'source.py', 'architecture.json', 'model_info.json', 'manifest.json'):
            path = source / name
            if path.is_dir(): shutil.copytree(path, root / name)
            elif path.is_file(): shutil.copy2(path, root / name)
        for path in source.glob('*.vmfb'): shutil.copy2(path, root / path.name)
        info_path = root / 'model_info.json'
        info = json.loads(info_path.read_text()) if info_path.exists() else {'model_id': source.name, 'kind': 'import'}
        atomic_json(info_path, info)
        state['lineage'] = _finish(root, info, lineage, progress or (lambda label: None))
        state['status'] = 'complete'
    except BaseException as exc:
        state.update(status='failed', error=f'{type(exc).__name__}: {exc}')
        raise
    finally: atomic_json(root / 'run.json', state)
    return root
