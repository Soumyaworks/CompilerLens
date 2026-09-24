"""Integration contract: standalone, NewPM plugin, annotations and preservation."""
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

binary, opt, plugin, fixtures, checkpoint, llc = sys.argv[1:]
fixture = Path(fixtures) / 'fixture.ll'

def run(*args, **kwargs):
    return subprocess.run(list(map(str, args)), check=True, capture_output=True, text=True, **kwargs)

with tempfile.TemporaryDirectory() as tmp:
    tmp = Path(tmp)
    output, annotated = tmp / 'report.json', tmp / 'view.ll'
    run(binary, '--input', fixture, '--output', output, '--annotated-ir', annotated)
    report = json.loads(output.read_text())
    assert report['coverage'] == {'instructions': 4, 'debug_locations': 2, 'line_zero': 1}
    records = report['instructions']
    assert len(records[0]['frames']) == 2
    assert records[0]['frames'][1]['line'] == 18
    assert records[0]['reads_memory'] and records[2]['writes_memory']
    assert records[1]['operands'] == [records[0]['id']]
    assert records[3]['frames'] == []
    assert annotated.read_text().count('; compilerlens.id=') == 4
    baseline, passed = tmp / 'baseline.ll', tmp / 'passed.ll'
    run(opt, '-S', fixture, '-o', baseline)
    result = run(opt, f'-load-pass-plugin={plugin}', '-passes=compilerlens-provenance', '-S', fixture, '-o', passed)
    assert json.loads(result.stdout) == report
    assert baseline.read_bytes() == passed.read_bytes(), 'Reporting pass changed IR'
    # Annotated view remains valid LLVM IR; comments do not alter semantics.
    run(opt, '-disable-output', annotated)
    checkpoint_dir = tmp / 'checkpoints'
    run(checkpoint, fixture, env={**os.environ, 'COMPILERLENS_REPORT_DIR': str(checkpoint_dir)})
    reports = [json.loads(p.read_text()) for p in checkpoint_dir.glob('*.json')]
    assert {r['checkpoint'] for r in reports} == {'before-optimization', 'after-optimization'}
    obj = tmp / 'fixture.o'
    run(llc, '-filetype=obj', fixture, '-o', obj)
    dwarf = json.loads(run(binary, '--object', obj, '--section', '.text', '--address', '0').stdout)
    assert dwarf['frames'] and dwarf['frames'][0]['file'].endswith('dispatch_0.mlir')
    assert subprocess.run([binary, '--object', str(obj), '--section', '.text', '--address', '0xffffff'], capture_output=True).returncode != 0
    bad = tmp / 'invalid.ll'
    bad.write_text('define void @broken() { ret i32 1 }')
    assert subprocess.run([binary, '--input', str(bad)], capture_output=True).returncode != 0
print('Native reporting, inline frames, memory/def-use, annotation and read-only plugin checks passed.')
