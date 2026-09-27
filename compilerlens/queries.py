"""Queries over saved runs. No compilation, network calls, or tensor imports."""
from __future__ import annotations

import difflib
from collections import Counter


def stage_for(artifact, selector):
    matches = [s for s in artifact['stages'] if selector in (s['id'], s['name'])]
    if len(matches) != 1: raise ValueError(f'Unknown or ambiguous stage {selector!r}; inspect --show stages lists valid IDs.')
    return matches[0]


def module_for(artifact, path):
    matches = [n for n in artifact.get('architecture', {}).get('nodes', []) if path in (n['id'], n.get('path'))]
    if len(matches) != 1: raise ValueError(f'Unknown module {path!r}; inspect --show architecture lists valid paths.')
    return matches[0]


def operations(stage, lineage):
    saved = lineage.get('stages', {}).get(stage['id'], {})
    if saved.get('records'):
        lines = stage['text'].splitlines()
        return [{**r, 'id': r['id'] if r['id'].startswith(stage['id'] + ':') else f"{stage['id']}:{r['id']}",
                 'native_id': r['id'] if saved.get('native') else None,
                 'text': lines[r['line']-1] if r['line'] <= len(lines) else '',
                 'name': r['opcode']} for r in saved['records']]
    if stage['ops']: return stage['ops']
    from .ingest.llvm_parser import parse_llvm_ir, parse_asm
    from .ingest.mlir_parser import parse_operations
    parser = {'llvm': parse_llvm_ir, 'asm': parse_asm, 'mlir': parse_operations}.get(stage['language'])
    if not parser: return []
    # Legacy artifacts may have trimmed indices; reconstruct display operations only.
    parsed = parser(stage['text'], stage['id'])
    return [{**op, 'id': f"{stage['id']}:op{op['line']}"} for op in parsed]


def inspect_report(artifact, lineage, *, show='summary', stage=None, module=None, lines=None):
    selected = stage_for(artifact, stage) if stage else None
    node = module_for(artifact, module) if module else None
    source_lines = set(node.get('source_lines', [])) if node else None
    if show == 'summary':
        return {'compilation_id': artifact['compilation_id'], 'target': artifact['target'],
                'stage_count': len(artifact['stages']), 'evidence_count': len(artifact['evidence']),
                'architecture_mapping': artifact.get('architecture', {}).get('mapping_status'),
                'lineage': lineage.get('status', 'legacy'), 'notes': artifact['notes'],
                'coverage': {s['name']: s['coverage'] for s in lineage.get('stages', {}).values() if s['language'] in ('llvm', 'asm')}}
    if show == 'architecture':
        architecture = artifact.get('architecture', {})
        if node: return {**architecture, 'nodes': [n for n in architecture.get('nodes', []) if n['id'] == node['id'] or n.get('path', '').startswith(node.get('path', '') + '.')]}
        return architecture
    if show == 'stages':
        return [{k: s[k] for k in ('id', 'name', 'language', 'track', 'line_count', 'op_count', 'source_path')}
                for s in artifact['stages']]
    if show == 'evidence':
        return [e for e in artifact['evidence'] if selected is None or e['source_stage'] == selected['id']]
    if not selected: raise ValueError(f'--show {show} requires --stage.')
    if show == 'ir':
        if node: raise ValueError('--module filters operations; use --show ops for module filtering.')
        text = selected['text'].splitlines()
        start, end = lines or (1, len(text))
        if start < 1 or end < start or end > len(text): raise ValueError(f'Line range must be within 1:{len(text)}.')
        return {'stage': selected['name'], 'language': selected['language'], 'start_line': start,
                'end_line': end, 'text': '\n'.join(text[start-1:end])}
    ops = operations(selected, lineage)
    if source_lines is not None:
        if selected['name'] == 'torch-input': ops = [op for op in ops if op['line'] in source_lines]
        else: ops = [op for op in ops if any(o['line'] in source_lines for o in op.get('origins', []))]
    if lines: ops = [op for op in ops if lines[0] <= op['line'] <= lines[1]]
    return ops


def trace_report(artifact, lineage, *, op=None, module=None, source=None, from_stage=None, line=None, to='all'):
    if sum(v is not None for v in (op, module, source, from_stage)) != 1:
        raise ValueError('Choose one --op, --module, --source or --from-stage selector.')
    if (from_stage is None) != (line is None): raise ValueError('--from-stage and --line must be supplied together.')
    if not lineage: raise ValueError('This legacy artifact has no lineage sidecar; import its dump directory first.')
    result = {'relationship': 'compiler-recorded source attribution; not persistent instruction identity',
              'lineage': lineage['status'], 'origins': [], 'matches': [], 'notes': list(lineage.get('notes', []))}
    if from_stage:
        stage = stage_for(artifact, from_stage)
        if line < 1 or line > stage['line_count']: raise ValueError('Line is outside this stage.')
        found = [r for r in operations(stage, lineage) if r['line'] == line]
        result['matches'] = [{'stage': stage['name'], 'stage_id': stage['id'], **r} for r in found]
        result['origins'] = list({(o['file'], o['line'], o['column']): o for r in found for o in r.get('origins', [])}.values())
        if not result['origins']: result['notes'].append('No resolved source attribution at this display line.')
        return result
    anchor = stage_for(artifact, 'torch-input')
    columns = None
    if source:
        try: stage_id, line_str, col_str = source.rsplit(':', 2); source_line, column = int(line_str), int(col_str)
        except ValueError: raise ValueError('Expected --source STAGE:LINE:COLUMN') from None
        if stage_for(artifact, stage_id)['id'] != anchor['id']: raise ValueError('--source currently requires the torch-input anchor.')
        if source_line < 1 or source_line > anchor['line_count'] or column < 1: raise ValueError('Source location is outside the anchor.')
        selected_lines, columns = {source_line}, {column}
    elif module:
        node = module_for(artifact, module)
        selected_lines = set(node.get('source_lines', []))
        result['module_mapping'] = node.get('mapping', 'unavailable')
    else:
        stage = stage_for(artifact, op.split(':', 1)[0])
        found = [r for r in operations(stage, lineage) if r['id'] == op]
        if not found: raise ValueError(f'Unknown operation {op!r}; inspect --show ops lists IDs.')
        if stage['id'] == anchor['id']:
            selected_lines = {found[0]['line']}
        else:
            result['origins'] = found[0].get('origins', [])
            selected_lines = {o['line'] for o in result['origins']}
            # Preserve full origin tuples for a non-anchor operation.
            exact = {(o['file'], o['line'], o['column']) for o in result['origins']}
    for stage in artifact['stages']:
        if stage['language'] not in (('llvm', 'asm') if to == 'all' else (to,)): continue
        for r in operations(stage, lineage):
            origins = [o for o in r.get('origins', []) if o['line'] in selected_lines and (columns is None or o['column'] in columns)]
            if op and 'exact' in locals(): origins = [o for o in origins if (o['file'], o['line'], o['column']) in exact]
            if origins: result['matches'].append({'stage': stage['name'], 'stage_id': stage['id'], **r})
    result['origins'] = list({(o['file'], o['line'], o['column']): o for r in result['matches'] for o in r.get('origins', []) if o['line'] in selected_lines and (columns is None or o['column'] in columns)}.values())
    if not result['matches']: result['notes'].append('No captured destination instructions resolve to this selector. Missing lineage is not inferred from operands.')
    return result


def diff_report(artifact, lineage, before, after, mode='text'):
    a, b = stage_for(artifact, before), stage_for(artifact, after)
    if a['track'] != b['track']: raise ValueError(f"Incompatible comparison tracks: {a['track']} and {b['track']}.")
    if mode == 'text': return ''.join(difflib.unified_diff(a['text'].splitlines(True), b['text'].splitlines(True), fromfile=a['name'], tofile=b['name']))
    ca, cb = (Counter(r.get('opcode', r.get('name')) for r in operations(s, lineage)) for s in (a, b))
    return {'from': a['name'], 'to': b['name'], 'track': a['track'], 'op_delta': b['op_count'] - a['op_count'],
            'operations': {k: cb[k]-ca[k] for k in sorted(ca.keys() | cb.keys()) if ca[k] != cb[k]},
            'note': 'Operation-count comparison; not a proof of equivalence or a transformation attribution.'}
