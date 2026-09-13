"""Reusable runner that reproduces the CompilerLens IR-dump pipeline for a
PyTorch module: export -> per-stage MLIR dumps -> LLVM-level dumps -> full
pass-boundary traces.

This mirrors, as a callable, the exact command sequence validated by hand in
experiments/matmul_debug_passes/ and experiments/linear_relu_dumps/.
"""

import json
import re
import shutil
import subprocess
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable

import iree.turbine.aot as aot
import torch

OPERATOR_PATTERN = re.compile(r"\b((?:linalg|torch|arith|vector|scf)\.[a-zA-Z_.]+)\b")

# Where MLIR puts the inline weight payload of an exported module.
_DIALECT_RESOURCES = "{-#"


def _strip_dialect_resources(text: str) -> str:
    """Drop the trailing `dialect_resources` blob, keeping the IR itself.

    This is where an exported model's weights live -- all 35 MB of bert-tiny's torch-input
    dump. The operations above it are what the viewer shows; the payload is only needed by
    the compiler, which reads the untrimmed copy.
    """
    index = text.find(_DIALECT_RESOURCES)
    if index == -1:
        return text
    dropped_mb = (len(text) - index) / 1e6
    return (
        text[:index]
        + f"// {dropped_mb:.1f} MB of dialect_resources (the model's weight tensors) elided "
        f"for display.\n// The compiler read the full module; only this copy is trimmed.\n"
    )

DEFAULT_STAGES = (    "input",
    "abi",
    "preprocessing",
    "global-optimization",
    "dispatch-creation",
    "flow",
    "stream",
    "executable-sources",
    "executable-configurations",
    "executable-targets",
    "hal",
    "vm",
)

# --- trimming defaults for real models ---------------------------------------------------
# A downloaded model embeds its weights in the IR and runs hundreds of passes over a large
# module, so the untrimmed dumps are unusable: bert-tiny's pass log alone came to 8.6 GB.
# These two settings bring a run down to ~160 MB while keeping the same IR on screen. The
# hand-written examples are small enough to need neither, and `--full` opts out.

# Constants bigger than this are printed as an ellipsis in the stage dumps.
TRIM_ELIDE_ATTRS = 16

# The device-codegen passes worth a per-pass snapshot: how a linalg op became tiled loops,
# then vectors, then buffers. Printing after only these keeps the kernel pass-track intact
# without dumping the whole module after all ~950 passes.
TRIM_CODEGEN_PASSES = (
    "iree-codegen-tile-and-distribute-to-workgroups-using-forall-op",
    "iree-llvmcpu-tile",
    "iree-llvmcpu-tile-and-fuse-producer-consumer",
    "iree-codegen-generic-vectorization",
    "iree-llvmcpu-tile-to-vector-size",
    "iree-codegen-iree-comprehensive-bufferize",
    "iree-codegen-vector-transfer-lowering",
    "iree-llvmcpu-virtual-vector-lowering",
)


@dataclass
class RunConfig:
    target_backend: str = "llvm-cpu"
    target_cpu: str = "host"
    stages: tuple = DEFAULT_STAGES
    # "flat" keeps everything in one directory (the original behaviour, used by the
    # hand-written examples). "ingest" writes the mlir/ llvm/ passes/ layout that
    # ingest/workloads/ specs read, so a run can be turned into a frontend artifact
    # directly.
    layout: str = "flat"
    # Weight tensors are embedded in the IR, and a real model's are enormous -- bert-tiny's
    # torch-input dump is 35 MB, distilbert's ~530 MB. The frontend embeds stage text in its
    # artifact JSON, so eliding large constants is what keeps artifacts loadable in a
    # browser. None disables it (the hand-written examples are small enough to keep whole).
    elide_attrs_larger_than: int | None = None
    # A pass trace prints the whole module after every pass. That is fine for a 100-line
    # matmul and ruinous for a real model: bert-tiny's stepB log came to 8.1 GB across a few
    # hundred passes. Cap what we keep -- the log is parsed for per-pass snapshots, and a
    # truncated tail costs some late passes, whereas an 8 GB file costs the whole run.
    max_pass_log_bytes: int | None = None
    # Which passes the stepB trace prints after. None means all of them, which is right for a
    # small workload. For a real model, printing after every pass produced an 8.6 GB log for
    # bert-tiny, and truncating it kept only the early host-side passes -- losing exactly the
    # device codegen the kernel pass-track needs. Naming the transformation passes we care
    # about captures that codegen at a fraction of the size.
    pass_log_after: tuple = ()


@dataclass
class RunResult:
    name: str
    output_dir: Path
    manifest_path: Path
    files: list = field(default_factory=list)


class CompilerRunner:
    def __init__(self, config: RunConfig = None):
        self.config = config or RunConfig()
        self.iree_compile = self._require_tool("iree-compile")
        self.iree_opt = self._require_tool("iree-opt")

    @staticmethod
    def _require_tool(name: str) -> str:
        path = shutil.which(name)
        if path is None:
            raise RuntimeError(
                f"'{name}' not found on PATH. Activate the project venv "
                f"(source .venv/bin/activate) before running the compiler runner."
            )
        return path

    def _elide_flags(self) -> list:
        if self.config.elide_attrs_larger_than is None:
            return []
        return [f"--mlir-elide-elementsattrs-if-larger={self.config.elide_attrs_larger_than}"]

    def _pass_print_flags(self) -> list:
        """How much of the stepB pipeline to print.

        Printing after every pass is the honest default, but the log grows with module size
        times pass count. When specific passes are configured we print only those, which is
        what makes capturing a real model's device codegen affordable.
        """
        if not self.config.pass_log_after:
            return ["--mlir-print-ir-after-all"]
        # No --mlir-print-ir-module-scope here: with a named pass filter, MLIR labels each
        # dump with the operation it printed for -- "('func.func' operation: @name)" -- which
        # is the scope the kernel pass-track needs, and ingest/pass_log.py reads it from the
        # header. Asking for module scope instead would print the entire module (weights and
        # all) after every pass: 5.2 GB for bert-tiny, versus a few MB for just the function.
        return [f"--mlir-print-ir-after={','.join(self.config.pass_log_after)}"]

    def _capped(self, log: str) -> str:
        """Truncate a pass log at a whole pass boundary, if a cap is configured."""
        limit = self.config.max_pass_log_bytes
        if limit is None or len(log) <= limit:
            return log
        head = log[:limit]
        # Cut back to the last complete dump so the parser never sees half a module.
        marker = "// -----// IR Dump After"
        boundary = head.rfind(marker)
        if boundary > 0:
            head = head[:boundary]
        return head + (
            f"\n// Pass log truncated at {len(head) / 1e6:.0f} MB "
            f"(full log was {len(log) / 1e6:.0f} MB). Later passes are not captured.\n"
        )

    def run(
        self,
        module: torch.nn.Module,
        example_input_args: tuple,
        name: str,
        output_dir: Path,
        model_info: dict = None,
        on_progress: Callable[[str, int, int], None] = None,
    ) -> RunResult:
        output_dir = Path(output_dir)
        ingest_layout = self.config.layout == "ingest"

        # In ingest layout the subdirectory names are the contract with ingest/workloads/.
        mlir_dir = output_dir / "mlir" if ingest_layout else output_dir
        passes_dir = output_dir / "passes" if ingest_layout else output_dir
        dumps_dir = output_dir / "llvm" if ingest_layout else output_dir / "dumps"
        for directory in (output_dir, mlir_dir, passes_dir, dumps_dir):
            directory.mkdir(parents=True, exist_ok=True)

        manifest = {"name": name, "layout": self.config.layout, "commands": [], "files": {}, "errors": []}
        if model_info is not None:
            manifest["model_info"] = model_info

        # One real checkpoint per stage `_dump_named_stages` actually compiles, plus the five
        # other phases below -- a true count of what `run()` does, not a guessed one, so a
        # caller can show honest progress instead of an animated bar with no real meaning.
        total_steps = 5 + len(self.config.stages)
        progress = {"done": 0}

        def report(label: str) -> None:
            progress["done"] += 1
            if on_progress:
                on_progress(label, progress["done"], total_steps)

        torch_input_path = self._export_torch_input(module, example_input_args, mlir_dir, manifest)
        report("Exporting to Torch dialect")
        self._dump_named_stages(torch_input_path, mlir_dir, manifest, report)
        self._dump_llvm_intermediates(torch_input_path, output_dir, dumps_dir, manifest)
        report("Capturing LLVM intermediates")
        self._dump_full_pass_traces(torch_input_path, mlir_dir, passes_dir, manifest)
        report("Capturing per-pass traces")
        self._summarize_operators(mlir_dir, manifest)
        report("Summarizing operators")
        self._summarize_dispatches(mlir_dir, manifest)
        report("Summarizing dispatches")

        manifest_path = output_dir / "manifest.json"
        manifest_path.write_text(json.dumps(manifest, indent=2))

        return RunResult(
            name=name,
            output_dir=output_dir,
            manifest_path=manifest_path,
            files=sorted(manifest["files"].keys()),
        )

    def _export_torch_input(self, module: torch.nn.Module, example_input_args: tuple, mlir_dir: Path, manifest: dict) -> Path:
        """Export to the Torch dialect.

        Returns the path the *compiler* should read. For a real model that is not the same
        file the frontend displays: the exported module carries every weight inline as a
        trailing `dialect_resources` blob (35 MB of bert-tiny's 35 MB file), which the
        compiler needs and a reader does not. When trimming is enabled we keep the full
        module in `_full/` for compilation and write a display copy with the blob replaced by
        a note.
        """
        export_output = aot.export(module, *example_input_args)
        text = str(export_output.mlir_module)

        torch_input_path = mlir_dir / "ir_00_torch_input.mlir"
        manifest["commands"].append("iree.turbine.aot.export(module, *example_inputs)")
        manifest["files"]["ir_00_torch_input.mlir"] = str(torch_input_path)

        if self.config.elide_attrs_larger_than is None:
            torch_input_path.write_text(text)
            return torch_input_path

        full_dir = mlir_dir.parent / "_full"
        full_dir.mkdir(parents=True, exist_ok=True)
        compile_input = full_dir / "ir_00_torch_input.mlir"
        compile_input.write_text(text)

        torch_input_path.write_text(_strip_dialect_resources(text))
        return compile_input

    def _dump_named_stages(self, torch_input_path: Path, mlir_dir: Path, manifest: dict, report: Callable[[str], None]) -> None:
        for i, stage in enumerate(self.config.stages, start=1):
            stage_path = mlir_dir / f"ir_{i:02d}_{stage}.mlir"
            cmd = [
                self.iree_compile,
                str(torch_input_path),
                f"--iree-hal-target-backends={self.config.target_backend}",
                f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
                "--mlir-print-debuginfo",
                *self._elide_flags(),
                f"--compile-to={stage}",
                "-o",
                str(stage_path),
            ]
            result = subprocess.run(cmd, capture_output=True, text=True)
            manifest["commands"].append(" ".join(cmd))
            if result.returncode == 0:
                manifest["files"][stage_path.name] = str(stage_path)
            else:
                manifest["errors"].append({"stage": stage_path.name, "returncode": result.returncode, "stderr": result.stderr})
                break
            report(f"Compiling: {stage}")

    def _dump_llvm_intermediates(self, torch_input_path: Path, output_dir: Path, dumps_dir: Path, manifest: dict) -> None:
        vmfb_path = output_dir / f"{output_dir.name}_compiled_host.vmfb"
        cmd = [
            self.iree_compile,
            str(torch_input_path),
            f"--iree-hal-target-backends={self.config.target_backend}",
            f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
            f"--iree-hal-dump-executable-sources-to={dumps_dir}",
            f"--iree-hal-dump-executable-intermediates-to={dumps_dir}",
            f"--iree-hal-dump-executable-binaries-to={dumps_dir}",
            "--mlir-print-debuginfo",
            "-o",
            str(vmfb_path),
        ]
        result = subprocess.run(cmd, capture_output=True, text=True)
        manifest["commands"].append(" ".join(cmd))
        if result.returncode == 0:
            manifest["files"][vmfb_path.name] = str(vmfb_path)
        else:
            manifest["errors"].append({"stage": vmfb_path.name, "returncode": result.returncode, "stderr": result.stderr})
        for f in sorted(dumps_dir.iterdir()):
            manifest["files"][f"{dumps_dir.name}/{f.name}"] = str(f)

    def _dump_full_pass_traces(self, torch_input_path: Path, mlir_dir: Path, passes_dir: Path, manifest: dict) -> None:
        # These two are iree-opt's own module outputs, not display stages: no generated spec
        # references them, and each carries the model's weights inline (626 MB apiece for
        # distilgpt2). step_a is genuinely needed as stepB's input, so when we are trimming
        # both go in the scratch area the caller deletes afterwards.
        intermediate_dir = torch_input_path.parent if self.config.elide_attrs_larger_than else mlir_dir
        step_a_output = intermediate_dir / "step_a_iree_input.mlir"
        step_a_trace = passes_dir / "passes_stepA_torch_to_iree.txt"
        cmd_a = [
            self.iree_opt,
            str(torch_input_path),
            "--torch-to-iree",
            "--mlir-print-debuginfo",
            "--mlir-print-ir-after-all",
            *self._elide_flags(),
            "-o",
            str(step_a_output),
        ]
        result_a = subprocess.run(cmd_a, capture_output=True, text=True)
        step_a_trace.write_text(self._capped(result_a.stderr))
        manifest["commands"].append(" ".join(cmd_a) + " 2> passes_stepA_torch_to_iree.txt")
        manifest["files"][step_a_trace.name] = str(step_a_trace)
        if result_a.returncode == 0:
            manifest["files"][step_a_output.name] = str(step_a_output)
        else:
            manifest["errors"].append({"stage": step_a_output.name, "returncode": result_a.returncode, "stderr": result_a.stderr})
            return

        final_vm_output = intermediate_dir / "ir_final_vm.mlir"
        step_b_trace = passes_dir / "passes_stepB_full_pipeline.txt"
        cmd_b = [
            self.iree_opt,
            str(step_a_output),
            f"--iree-hal-target-backends={self.config.target_backend}",
            f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
            "--iree-transformation-pipeline",
            "--mlir-print-debuginfo",
            *self._pass_print_flags(),
            "--mlir-elide-elementsattrs-if-larger=8",
            "-o",
            str(final_vm_output),
        ]
        result_b = subprocess.run(cmd_b, capture_output=True, text=True)
        step_b_trace.write_text(self._capped(result_b.stderr))
        manifest["commands"].append(" ".join(cmd_b) + " 2> passes_stepB_full_pipeline.txt")
        manifest["files"][step_b_trace.name] = str(step_b_trace)
        if result_b.returncode == 0:
            manifest["files"][final_vm_output.name] = str(final_vm_output)
        else:
            manifest["errors"].append({"stage": final_vm_output.name, "returncode": result_b.returncode, "stderr": result_b.stderr})

    def _summarize_operators(self, output_dir: Path, manifest: dict) -> None:
        source_path = output_dir / "ir_08_executable-sources.mlir"
        if not source_path.exists():
            return
        text = source_path.read_text()
        counts = {}
        for match in OPERATOR_PATTERN.finditer(text):
            counts[match.group(1)] = counts.get(match.group(1), 0) + 1
        manifest["operators"] = dict(sorted(counts.items(), key=lambda kv: (-kv[1], kv[0])))

    def _summarize_dispatches(self, output_dir: Path, manifest: dict) -> None:
        hal_path = output_dir / "ir_11_hal.mlir"
        if not hal_path.exists():
            return
        text = hal_path.read_text()
        bodies = re.findall(r"hal\.executable private @\S+\s*\{(.*?)\n  \}", text, re.DOTALL)
        normalized_bodies = [re.sub(r"@\S*dispatch_\d+\S*", "@DISPATCH", body) for body in bodies]
        manifest["total_dispatches"] = len(bodies)
        manifest["unique_dispatches"] = len(set(normalized_bodies))


EXAMPLES = {
    "matmul": "examples.matmul",
    "linear_relu": "examples.linear_relu",
    "mini_transformer": "examples.mini_transformer",
}


def _load_example(name: str):
    import importlib

    if name not in EXAMPLES:
        raise ValueError(f"Unknown example '{name}'. Available: {', '.join(sorted(EXAMPLES))}")
    module = importlib.import_module(EXAMPLES[name])
    model_info = module.model_info() if hasattr(module, "model_info") else None
    return module.build_module(), module.example_inputs(), model_info


def _load_hf_model(model_id: str, seq_len: int):
    """A HuggingFace model, in the same (module, inputs, info) shape as an example.

    Kept out of EXAMPLES because these are not enumerable: any Hub id works, so it is a
    separate flag rather than a registry entry.
    """
    from models.detect import detect
    from models.hf_wrapper import wrap

    return wrap(detect(model_id, seq_len=seq_len))


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Run the CompilerLens dump pipeline for one workload.")
    source = parser.add_mutually_exclusive_group(required=True)
    source.add_argument("--example", choices=sorted(EXAMPLES), help="a hand-written example workload")
    source.add_argument("--hf-model", help="a HuggingFace model id, e.g. prajjwal1/bert-tiny")
    parser.add_argument("--out", required=True, help="Output directory for the generated dumps.")
    parser.add_argument("--seq-len", type=int, default=32, help="sequence length for --hf-model (default: 32)")
    parser.add_argument(
        "--layout",
        choices=("flat", "ingest"),
        default=None,
        help="flat: everything in one directory. ingest: mlir/ llvm/ passes/ subdirectories, "
        "which ingest/ can turn into a frontend artifact. Defaults to flat for --example and "
        "ingest for --hf-model.",
    )
    parser.add_argument(
        "--full",
        action="store_true",
        help="no trimming: keep weight payloads and print IR after every pass. Produces the "
        "complete dumps, at the cost of size -- bert-tiny's pass log alone is 8.6 GB.",
    )
    args = parser.parse_args()

    if args.example:
        torch_module, example_input_args, model_info = _load_example(args.example)
        name, default_layout = args.example, "flat"
    else:
        torch_module, example_input_args, model_info = _load_hf_model(args.hf_model, args.seq_len)
        name, default_layout = args.hf_model.replace("/", "_"), "ingest"

    layout = args.layout or default_layout
    trimming = not args.full and model_info is not None
    config = RunConfig(
        layout=layout,
        elide_attrs_larger_than=TRIM_ELIDE_ATTRS if trimming else None,
        pass_log_after=TRIM_CODEGEN_PASSES if trimming else (),
    )

    runner = CompilerRunner(config)
    result = runner.run(torch_module, example_input_args, name=name, output_dir=Path(args.out), model_info=model_info)

    print(f"Wrote {len(result.files)} files to {result.output_dir}")
    print(f"Manifest: {result.manifest_path}")
    errors = json.loads(result.manifest_path.read_text()).get("errors", [])
    if errors:
        print(f"{len(errors)} stage(s) failed -- see 'errors' in the manifest.")
        return 1
    return 0


if __name__ == "__main__":
    main()
