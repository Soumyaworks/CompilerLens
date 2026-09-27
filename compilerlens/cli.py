"""CompilerLens command line. Diagnostics go to stderr; JSON stdout stays clean."""
from __future__ import annotations

import argparse
import contextlib
import json
import platform
import shutil
import subprocess
import sys
from pathlib import Path

from . import __version__
from .storage import load_run


def positive(value):
    number = int(value)
    if number <= 0: raise argparse.ArgumentTypeError('must be positive')
    return number


def line_range(value):
    try: a, b = map(int, value.split(':'))
    except ValueError: raise argparse.ArgumentTypeError('expected START:END') from None
    if a < 1 or b < a: raise argparse.ArgumentTypeError('expected 1 <= START <= END')
    return a, b


def parser():
    p = argparse.ArgumentParser(prog='compilerlens', description='Inspect model compilation from Torch to MLIR, LLVM and assembly.')
    p.add_argument('--version', action='version', version=f'CompilerLens {__version__}')
    sub = p.add_subparsers(dest='command', required=True)
    compile = sub.add_parser('compile', help='Compile and capture a model into a fresh run')
    compile.add_argument('model_id', nargs='?')
    inputs = compile.add_mutually_exclusive_group()
    inputs.add_argument('--example', choices=('matmul', 'linear_relu', 'mini_transformer'))
    inputs.add_argument('--python', help='Local file.py:factory returning (module, example_inputs)')
    compile.add_argument('--seq-len', type=positive, help='HF static sequence length (default: 16)')
    compile.add_argument('--revision', help='HF commit or reference; resolved commit is saved')
    compile.add_argument('--offline', action='store_true')
    compile.add_argument('--seed', type=int, default=0)
    compile.add_argument('--cpu', default='host')
    compile.add_argument('--capture', choices=('standard', 'full'), default='standard')
    compile.add_argument('--lineage', choices=('auto', 'required', 'off'), default='auto')
    compile.add_argument('--out', type=Path)
    imported = sub.add_parser('import', help='Analyze existing mlir/llvm/passes dumps')
    imported.add_argument('source', type=Path)
    imported.add_argument('--out', type=Path)
    imported.add_argument('--lineage', choices=('auto', 'required', 'off'), default='auto')
    inspect = sub.add_parser('inspect', help='Inspect saved results without recompiling')
    inspect.add_argument('run', type=Path)
    inspect.add_argument('--show', choices=('summary', 'architecture', 'stages', 'evidence', 'ops', 'ir', 'objects'), default='summary')
    inspect.add_argument('--stage')
    inspect.add_argument('--module')
    inspect.add_argument('--lines', type=line_range)
    trace = sub.add_parser('trace', help='Query compiler-recorded source attribution')
    trace.add_argument('run', type=Path)
    selectors = trace.add_mutually_exclusive_group(required=True)
    for name in ('op', 'module', 'source', 'from-stage', 'object'): selectors.add_argument('--' + name)
    trace.add_argument('--line', type=positive, help='1-based display line for reverse lookup')
    trace.add_argument('--section', help='Object section, e.g. .text')
    trace.add_argument('--address', help='Section-relative byte offset, decimal or 0xhex')
    trace.add_argument('--to', choices=('llvm', 'asm', 'all'), default='all')
    diff = sub.add_parser('diff', help='Compare stages on the same compilation track')
    diff.add_argument('run', type=Path)
    diff.add_argument('--from', dest='before', required=True)
    diff.add_argument('--to', dest='after', required=True)
    diff.add_argument('--mode', choices=('text', 'semantic'), default='text')
    view = sub.add_parser('view', help='Serve this run in the existing bundled webpage')
    view.add_argument('run', type=Path)
    view.add_argument('--port', type=positive, default=8000)
    view.add_argument('--open', action='store_true', dest='open_browser')
    doctor = sub.add_parser('doctor', help='Check installed compiler and native components')
    bench = sub.add_parser('bench', help='Benchmark using the exact captured input tensors')
    bench.add_argument('run', type=Path)
    bench.add_argument('--workers', type=positive, default=8)
    bench.add_argument('--repetitions', type=positive, default=10)
    for command in (compile, imported, inspect, trace, diff, doctor, bench):
        command.add_argument('--format', choices=('text', 'json'), default='text')
    return p


def doctor_report():
    from .lineage import native_binary
    from .services import versions
    from .toolchain import find_tool
    native = native_binary()
    report = {'versions': versions(), 'native': {'available': bool(native)},
              'tools': {name: find_tool(name) for name in ('iree-compile', 'iree-opt', 'iree-benchmark-module')},
              'web_assets': (Path(__file__).parent / '_web/index.html').is_file(),
              'supported_target': 'Linux x86-64 CPU', 'host_supported': sys.platform == 'linux' and platform.machine() == 'x86_64'}
    if native:
        try:
            result = subprocess.run([str(native), '--version'], capture_output=True, text=True, timeout=10)
            report['native'].update(path=str(native), version=result.stdout.strip(), available=result.returncode == 0, error=result.stderr.strip())
        except (OSError, subprocess.TimeoutExpired) as exc: report['native'].update(available=False, error=str(exc))
    report['ready'] = report['host_supported'] and report['native']['available'] and report['web_assets'] and all(report['tools'].values()) and all(v != 'not installed' for k, v in report['versions'].items() if k != 'compilerlens')
    return report


def render(value, *, json_output=False, kind=None):
    if json_output:
        print(json.dumps(value, indent=2, allow_nan=False))
        return
    from rich.console import Console
    from rich.syntax import Syntax
    from rich.table import Table
    from rich.tree import Tree
    console = Console(highlight=False)
    if isinstance(value, str): console.print(value, markup=False); return
    if kind == 'ir':
        console.print(f"{value['stage']} · lines {value['start_line']}–{value['end_line']}", markup=False)
        console.print(Syntax(value['text'], {'llvm': 'llvm', 'asm': 'asm'}.get(value['language'], value['language']), line_numbers=True, start_line=value['start_line'], background_color='default'))
        return
    if kind == 'summary':
        console.print(f"CompilerLens · {value['compilation_id']}", style='bold', markup=False)
        console.print(f"{value['stage_count']} stages · {value['evidence_count']} evidence items · lineage: {value['lineage']}")
        console.print('Target: ' + json.dumps(value['target']), markup=False)
        if value['coverage']:
            render([{'Stage': name, 'Ops': c['instructions'], 'Debug': c.get('debug_locations', '—'),
                     'Dispatch': c.get('dispatch_resolved', '—'), 'Source': c['source_associated'],
                     'Module': c.get('module_associated', '—')} for name, c in value['coverage'].items()])
        for note in value['notes']: console.print('• ' + note, markup=False)
        return
    if kind == 'architecture':
        root = Tree('Model architecture')
        nodes = {n['id']: n for n in value.get('nodes', [])}
        trees = {}
        for n in sorted(nodes.values(), key=lambda n: n.get('depth', 0)):
            parent = trees.get(n.get('parent_id'), root)
            trees[n['id']] = parent.add(f"{n['path']} ({n['type']}) · {n.get('parameter_count', 0):,} parameters · {n.get('mapping', 'unknown')}")
        console.print(root)
        console.print(value.get('mapping_note', ''), markup=False)
        return
    if kind == 'trace' and 'matches' in value:
        console.print(value['relationship'], markup=False)
        console.print(f"{len(value['matches'])} matching instructions; {len(value['origins'])} source locations")
        rows = [{'stage': r['stage'], 'line': r['line'], 'id': r['id'], 'instruction': r.get('text', r.get('opcode', '')),
                 'origins': '; '.join(f"torch-input:{o['line']}:{o['column']}" for o in r.get('origins', [])),
                 'via': '; '.join(f"{f['file']}:{f['line']}:{f.get('column', 0)}" for f in r.get('frames', []))} for r in value['matches']]
        render(rows)
        for note in value['notes']: console.print(note, markup=False)
        return
    if isinstance(value, list) and value and all(isinstance(row, dict) for row in value):
        keys = list(value[0])
        if kind == 'ops': keys = [k for k in ('id', 'line', 'name', 'text', 'origins') if k in value[0]]
        table = Table(*keys, expand=False)
        for row in value:
            table.add_row(*(json.dumps(row.get(k), ensure_ascii=False) if isinstance(row.get(k), (dict, list)) else str(row.get(k, '')) for k in keys))
        console.print(table)
    else:
        console.print_json(json.dumps(value, ensure_ascii=False))


def main(argv=None):
    args = parser().parse_args(argv)
    try:
        command, fmt = args.command, getattr(args, 'format', 'text')
        kind = None
        if command in ('compile', 'import'):
            from .services import capture, import_dump
            kwargs = vars(args).copy()
            kwargs.pop('command'); kwargs.pop('format')
            # Libraries sometimes print progress to stdout; reserve stdout for the result.
            with contextlib.redirect_stdout(sys.stderr):
                root = (capture if command == 'compile' else import_dump)(**kwargs, progress=lambda label: print(label, file=sys.stderr))
            value = {'run': str(root), 'status': 'complete', 'artifact': str(root / 'artifact.json')}
        elif command == 'doctor': value = doctor_report()
        elif command == 'view':
            from .server import serve
            serve(args.run, port=args.port, open_browser=args.open_browser)
            return 0
        elif command == 'bench':
            from .benchmark import benchmark_run
            value = benchmark_run(args.run, workers=args.workers, repetitions=args.repetitions)
        else:
            from .queries import inspect_report, trace_report, diff_report
            root, artifact, lineage = load_run(args.run)
            if command == 'inspect':
                if args.stage and args.show not in ('evidence', 'ops', 'ir'): raise ValueError('--stage applies to --show evidence, ops or ir.')
                if args.lines and args.show not in ('ops', 'ir'): raise ValueError('--lines applies to --show ops or ir.')
                if args.module and args.show not in ('ops', 'architecture'): raise ValueError('--module applies to --show ops or architecture.')
                if args.show == 'objects':
                    from .lineage import object_sections
                    value = object_sections(root)
                else:
                    value = inspect_report(artifact, lineage, show=args.show, stage=args.stage, module=args.module, lines=args.lines)
                kind = args.show
            elif command == 'trace':
                if args.object:
                    if not args.section or args.address is None or args.line is not None: raise ValueError('--object requires --section and --address (not --line).')
                    from .lineage import object_lookup
                    value = object_lookup(root, args.object, args.section, args.address)
                else:
                    if args.section or args.address is not None: raise ValueError('--section and --address require --object.')
                    value = trace_report(artifact, lineage, op=args.op, module=args.module, source=args.source, from_stage=args.from_stage, line=args.line, to=args.to)
                kind = 'trace'
            else: value = diff_report(artifact, lineage, args.before, args.after, args.mode)
        render(value, json_output=fmt == 'json', kind=kind)
        return 0 if command != 'doctor' or value['ready'] else 1
    except (OSError, ValueError, RuntimeError, ImportError, subprocess.SubprocessError) as exc:
        print(f'compilerlens: {exc}', file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print('compilerlens: interrupted; captured diagnostics are retained.', file=sys.stderr)
        return 130


if __name__ == '__main__':
    raise SystemExit(main())
