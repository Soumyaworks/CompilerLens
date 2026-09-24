"""Native LLVM reports and conservative source/assembly joins.

Def-use edges and source attribution are deliberately separate relationships.
"""
from __future__ import annotations

import json
import os
import re
import shlex
import shutil
import subprocess
from pathlib import Path

from .storage import atomic_json, digest
from .ingest.mlir_loc import source_location_sets_by_line
from .ingest.llvm_parser import parse_asm, _classify_ll
from .ingest.schema import Operation

PROTOCOL = 1
_LOCATION = re.compile(r'^(.*):(\d+):(\d+)$')


def native_binary() -> Path | None:
    override = os.environ.get('COMPILERLENS_NATIVE')
    if override:
        path = Path(override).expanduser().resolve()
        return path if path.is_file() else None
    package = Path(__file__).resolve().parent
    for path in (package / '_bin' / 'compilerlens-native', package.parent / 'build/native/compilerlens-native'):
        if path.is_file() and os.access(path, os.X_OK):
            return path
    found = shutil.which('compilerlens-native')
    return Path(found) if found else None


class SourceIndex:
    def __init__(self, root: Path):
        self.root = root.resolve()
        self.files = {}
        self.names = {}
        self.aliases = {}
        self.anchor = self.root / 'mlir/ir_00_torch_input.mlir'
        self.anchor_lines = len(self.anchor.read_text().splitlines()) if self.anchor.exists() else 0
        self.anchor_aliases = {str(self.anchor), str(self.root / '_full' / self.anchor.name), self.anchor.name,
                               'mlir/' + self.anchor.name, '_full/' + self.anchor.name}
        manifest_path = self.root / 'manifest.json'
        if manifest_path.is_file():
            manifest = json.loads(manifest_path.read_text())
            original = manifest.get('files', {}).get(self.anchor.name)
            if original:
                self.anchor_aliases.add(str(original))
                original_path = Path(original)
                if original_path.parent.name == 'mlir':
                    self.anchor_aliases.add(str(original_path.parent.parent / '_full' / original_path.name))
        self.legacy_anchor = not manifest_path.is_file()

        for path in sorted((self.root / 'llvm').glob('*dispatch_*.mlir')):
            self.files[str(path)] = source_location_sets_by_line(path.read_text())
            self.names.setdefault(path.name, []).append(str(path))
            if match := re.search(r'(dispatch_\d+)\.mlir$', path.name):
                self.aliases.setdefault(match[1], []).append(str(path))

    def file_for(self, filename: str, directory: str = '') -> str | None:
        full = str(Path(directory) / filename) if directory else filename
        if full in self.files:
            return full
        # Relocated artifacts: only a unique basename in this compilation can match.
        name = Path(filename.replace('\\', '/')).name
        candidates = self.names.get(name, [])
        if not candidates and (match := re.search(r'(dispatch_\d+)\.mlir$', name)):
            candidates = self.aliases.get(match[1], [])
        return candidates[0] if len(candidates) == 1 else None

    def canonical(self, location: str) -> dict | None:
        match = _LOCATION.match(location)
        if not match:
            return None
        filename, line, column = match[1], int(match[2]), int(match[3])
        # Only the captured Torch anchor is eligible; never join arbitrary helper lines.
        if (filename not in self.anchor_aliases and not (self.legacy_anchor and Path(filename.replace('\\', '/')).name == self.anchor.name)) or not (1 <= line <= self.anchor_lines):
            return None
        return {'file': 'mlir/ir_00_torch_input.mlir', 'line': line, 'column': column}

    def resolve_frame(self, frame: dict) -> list[dict]:
        if not frame.get('line'):
            return []
        file = self.file_for(frame.get('file', ''), frame.get('directory', ''))
        if not file:
            return []
        origins = []
        for location in self.files[file].get(frame['line'], []):
            origin = self.canonical(location)
            if origin and origin not in origins:
                origins.append(origin)
        return origins

    def resolve_frames(self, frames: list[dict]) -> tuple[list[dict], str]:
        for index, frame in enumerate(frames):
            origins = self.resolve_frame(frame)
            if origins:
                return origins, 'debug_location' if index == 0 else 'inline_callsite'
        return [], 'unresolved'


def assembly_locations(text: str) -> dict[int, dict]:
    """Location-state machine for LLVM's x86 GNU-style assembly output."""
    files: dict[int, tuple[str, str]] = {}
    active = None
    locations = {}
    for number, raw in enumerate(text.splitlines(), 1):
        line = raw.strip()
        if re.match(r'\.(?:section|pushsection|popsection|previous|text|data|bss|cfi_endproc|size)\b', line):
            active = None
        if re.match(r'\.type\s+.+,\s*[@%]function', line):
            active = None
        if line.startswith('.file'):
            try:
                parts = shlex.split(line, comments=True)
            except ValueError:
                active = None
                continue
            if len(parts) >= 3 and parts[1].isdigit():
                # .file N "file" or .file N "directory" "file" [md5 ...]
                directory, filename = ('', parts[2])
                if len(parts) >= 4 and parts[3] != 'md5':
                    directory, filename = parts[2:4]
                files[int(parts[1])] = (directory, filename)
        elif line.startswith('.loc'):
            active = None
            parts = line.split()
            if len(parts) >= 4 and all(p.isdigit() for p in parts[1:4]):
                file_id, source_line, column = map(int, parts[1:4])
                if source_line > 0 and file_id in files:
                    directory, filename = files[file_id]
                    active = {'file': filename, 'directory': directory, 'line': source_line, 'column': column}
                    if 'discriminator' in parts:
                        at = parts.index('discriminator') + 1
                        if at < len(parts) and parts[at].isdigit(): active['discriminator'] = int(parts[at])
        elif active and raw[:1].isspace() and line and not line.startswith(('.', '#', '//')) and not line.endswith(':'):
            locations[number] = dict(active)
    return locations


def analyze_files(root: Path, mode: str = 'auto', progress=None) -> dict:
    reports = {}
    if mode == 'off':
        return {'status': 'off', 'reports': reports, 'notes': ['Additional provenance was disabled.']}
    executable = native_binary()
    if executable is None:
        if mode == 'required':
            raise RuntimeError('Native analyzer unavailable. Install a native-enabled wheel or set COMPILERLENS_NATIVE.')
        return {'status': 'fallback', 'reports': reports, 'notes': ['Native analyzer unavailable; metadata/assembly fallback used.']}
    errors = []
    native_dir = root / 'native'
    native_dir.mkdir(exist_ok=True)
    for path in sorted((root / 'llvm').glob('*.ll')):
        if progress: progress(f'Native provenance: {path.name}')
        report_path = native_dir / (path.name + '.json')
        view_path = native_dir / (path.name + '.annotated.ll')
        command = [str(executable), '--input', str(path), '--output', str(report_path), '--annotated-ir', str(view_path)]
        try:
            result = subprocess.run(command, capture_output=True, text=True, timeout=180)
        except (OSError, subprocess.TimeoutExpired) as exc:
            if mode == 'required': raise RuntimeError(f'Native analysis failed for {path.name}: {exc}') from exc
            errors.append(f'{path.name}: {exc}')
            continue
        if result.returncode:
            message = f'{path.name}: {result.stderr.strip()[:1500]}'
            if mode == 'required': raise RuntimeError(message)
            errors.append(message)
            continue
        report = json.loads(report_path.read_text())
        if report.get('schema_version') != PROTOCOL:
            raise RuntimeError('Native analyzer protocol mismatch')
        reports[path.name] = {'report': report, 'report_path': str(report_path.relative_to(root)),
                              'view_path': str(view_path.relative_to(root)), 'input_sha256': digest(path)}
    if not reports and mode == 'required': raise RuntimeError('No LLVM IR available for required native analysis.')
    return {'status': 'native' if reports and not errors else 'partial' if reports else 'fallback',
            'reports': reports, 'notes': errors, 'binary': str(executable)}


def enrich_stages(root, stages, analysis):
    """Return full precision sidecar and explicit origins for the legacy UI contract."""
    index = SourceIndex(root)
    sidecar = {'schema_version': PROTOCOL, 'status': analysis['status'], 'notes': analysis['notes'], 'stages': {}}
    source_sets = {}
    for stage in stages:
        records = []
        native = analysis['reports'].get(Path(stage.source_path).name) if stage.language == 'llvm' else None
        if native:
            stage.text = (root / native['view_path']).read_text()
            lines = stage.text.splitlines()
            markers = {}
            pending = None
            for number, line in enumerate(lines, 1):
                if match := re.search(r'; compilerlens\.id=(\S+)', line):
                    pending = match[1]
                elif pending and line.strip() and not line.lstrip().startswith(';'):
                    markers[pending] = number
                    pending = None
            ops = []
            for record in native['report']['instructions']:
                if record['id'] not in markers: raise RuntimeError('Native annotation/record mismatch')
                number = markers[record['id']]
                origins, relationship = index.resolve_frames(record['frames'])
                op = Operation(id=f'{stage.id}:op{number}', stage_id=stage.id, line=number,
                               name=record['opcode'], dialect=_classify_ll(record['opcode']),
                               types=[record['type']], operands=record['operands'], text=lines[number-1].strip()[:400])
                ops.append(op)
                records.append({**record, 'line': number, 'origins': origins, 'relationship': relationship})
            stage.ops = ops
            stage.description += ' Native LLVM annotated view; original dump retained. IDs are snapshot-local.'
            native_meta = {key: native[key] for key in ('report_path', 'view_path', 'input_sha256')}
            native_meta['llvm_version'] = native['report']['llvm_version']
        else:
            native_meta = None
            asm = assembly_locations(stage.text) if stage.language == 'asm' and analysis['status'] != 'off' else {}
            mlir = source_location_sets_by_line(stage.text) if stage.language == 'mlir' else {}
            for op in stage.ops:
                frames = [asm[op.line]] if op.line in asm else []
                if frames:
                    origins, relationship = index.resolve_frames(frames)
                    if origins: relationship = 'assembly_location'
                else:
                    locations = mlir.get(op.line, [op.source_loc] if op.source_loc and analysis['status'] != 'off' else [])
                    origins = [o for loc in locations if (o := index.canonical(loc))]
                    relationship = 'compiler_location' if origins else 'unresolved'
                if stage.name == 'torch-input':
                    text_line = stage.text.splitlines()[op.line - 1]
                    column = max(0, text_line.find(op.name)) + 1
                    origins = [{'file': 'mlir/ir_00_torch_input.mlir', 'line': op.line, 'column': column}]
                    relationship = 'source_anchor'
                records.append({'id': op.id, 'line': op.line, 'opcode': op.name,
                                'origins': origins, 'frames': frames, 'relationship': relationship})
        by_line = {r['line']: r for r in records}
        for op in stage.ops:
            origins = by_line[op.line]['origins']
            source_sets[op.id] = [f"{o['file']}:{o['line']}:{o['column']}" for o in origins]
            op.source_loc = source_sets[op.id][0] if len(origins) == 1 else None
        stage.line_count = len(stage.text.splitlines())
        stage.byte_size = len(stage.text.encode())
        stage.op_count = len(stage.ops)
        from .ingest.llvm_parser import histogram
        stage.op_histogram = histogram([{'dialect': o.dialect} for o in stage.ops], 'dialect')
        if records:
            counts = {'instructions': len(records),
                      'debug_locations': sum(any(f.get('line') for f in r.get('frames', [])) for r in records),
                      'dispatch_resolved': sum(any(index.file_for(f.get('file', ''), f.get('directory', '')) and f.get('line') for f in r.get('frames', [])) for r in records),
                      'source_associated': sum(bool(r['origins']) for r in records)}
            reasons = {}
            for r in records:
                reason = ('resolved' if r['origins'] else 'no_location' if not r.get('frames') else
                          'line_zero' if not any(f.get('line') for f in r['frames']) else
                          'dispatch_without_anchor' if any(index.file_for(f.get('file', ''), f.get('directory', '')) for f in r['frames']) else
                          'external_or_ambiguous_file')
                r['resolution'] = reason
                reasons[reason] = reasons.get(reason, 0) + 1
            entry = {'name': stage.name, 'language': stage.language,
                     'source_path': stage.source_path, 'native': native_meta, 'records': records,
                     'coverage': counts, 'gaps': reasons}
            if native: entry['functions'] = native['report']['functions']
            sidecar['stages'][stage.id] = entry
    return sidecar, source_sets


def object_lookup(root: Path, object_id: str, section: str, address: str):
    binary = native_binary()
    if not binary: raise RuntimeError('Object lookup requires the native analyzer.')
    path = (root / object_id).resolve()
    if not path.is_relative_to(root.resolve()) or not path.is_file():
        raise ValueError('Object must be a file within this run.')
    result = subprocess.run([str(binary), '--object', str(path), '--section', section, '--address', address],
                            capture_output=True, text=True, timeout=60)
    if result.returncode: raise RuntimeError(result.stderr.strip())
    report = json.loads(result.stdout)
    index = SourceIndex(root)
    report['origins'], report['relationship'] = index.resolve_frames(report['frames'])
    return report


def object_sections(root: Path):
    binary = native_binary()
    if not binary: raise RuntimeError('Object section listing requires the native analyzer.')
    reports = []
    for path in sorted((root / 'llvm').glob('*')):
        if path.suffix not in ('.o', '.so'): continue
        result = subprocess.run([str(binary), '--object', str(path), '--list-sections'], capture_output=True, text=True, timeout=60)
        if result.returncode: raise RuntimeError(result.stderr.strip())
        report = json.loads(result.stdout)
        reports.extend({'object': str(path.relative_to(root)), **s} for s in report['sections'] if s['executable'] and s['size'])
    return reports
