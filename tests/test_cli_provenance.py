from __future__ import annotations

import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from compilerlens.provenance import SourceIndex, assembly_locations, analyze_files
from compilerlens.ingest.mlir_loc import source_location_sets_by_line
from compilerlens.queries import trace_report, diff_report, inspect_report
from compilerlens.services import capture, import_dump, save_inputs
from compilerlens.storage import atomic_json, load_run


class SourceTests(unittest.TestCase):
    def test_fused_origins_preserve_columns(self):
        text = '%0 = arith.addi %a, %b : i32 loc(fused[#loc1, #loc2])\n#loc1 = loc("a.mlir":3:4)\n#loc2 = loc("a.mlir":3:8)'
        self.assertEqual(set(source_location_sets_by_line(text)[1]), {'a.mlir:3:4', 'a.mlir:3:8'})

    def test_asm_resets_zero_section_and_function(self):
        text = '.file 1 "/captured space" "dispatch_0.mlir"\n.loc 1 18 8 discriminator 4\n  add %a, %b\n.Ltmp:\n  ret\n.loc 1 0 0\n  ret\n.loc 1 18 8\n.section .data\n  ret\n.loc 1 18 8\n.type helper,@function\n  ret'
        locations = assembly_locations(text)
        self.assertEqual(set(locations), {3, 5})
        self.assertEqual(locations[3]['directory'], '/captured space')
        self.assertEqual(locations[3]['discriminator'], 4)

    def test_duplicate_dispatch_and_helper_never_guess(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'llvm').mkdir(); (root / 'mlir').mkdir()
            anchor = root / 'mlir/ir_00_torch_input.mlir'
            anchor.write_text('a\nb\nc\n')
            atomic_json(root / 'manifest.json', {'files': {anchor.name: str(anchor)}})
            for prefix in ('first', 'second'):
                (root / f'llvm/{prefix}_dispatch_0.mlir').write_text('%0 = arith.constant 0 : i32 loc("ir_00_torch_input.mlir":3:10)')
            index = SourceIndex(root)
            self.assertIsNone(index.file_for('legacy_dispatch_0.mlir'))
            self.assertEqual(index.resolve_frame({'file': 'helper.cpp', 'line': 1}), [])
            self.assertIsNone(index.canonical('/unrelated/ir_00_torch_input.mlir:3:10'))
            self.assertIsNone(index.canonical('ir_00_torch_input.mlir:30:10'))
            origins, relationship = index.resolve_frames([{'file': 'helper.cpp', 'line': 1}, {'file': 'first_dispatch_0.mlir', 'line': 1}])
            self.assertEqual(relationship, 'inline_callsite')
            self.assertEqual(origins[0]['line'], 3)

    def test_anchor_membership_is_added_once(self):
        from compilerlens.ingest.schema import Stage, Operation
        from compilerlens.ingest.lineage import build_lineage
        anchor = Stage('s0', 0, 'torch-input', 'Torch', 'frontend', 'mlir', 'mlir/input', 'matmul')
        target = Stage('s1', 1, 'llvm-codegen', 'LLVM', 'llvm', 'llvm', 'llvm/file.ll', 'fadd')
        anchor.ops = [Operation('s0:op1', 's0', 1, 'torch.aten.matmul', 'torch')]
        target.ops = [Operation('s1:op1', 's1', 1, 'fadd', 'arithmetic')]
        result = build_lineage([anchor, target], source_sets={'s0:op1': ['anchor:1:1'], 's1:op1': ['anchor:1:1']})
        self.assertEqual(result['lines']['1']['stages']['s0'], [1])

    def test_native_fallback_is_explicit(self):
        with tempfile.TemporaryDirectory() as tmp, patch.dict(os.environ, {'COMPILERLENS_NATIVE': '/not-present/native'}):
            self.assertEqual(analyze_files(Path(tmp))['status'], 'fallback')
            with self.assertRaises(RuntimeError): analyze_files(Path(tmp), 'required')


class QueryTests(unittest.TestCase):
    def setUp(self):
        self.artifact = {'artifact_version': '0.7', 'stages': [
            {'id': 's0', 'name': 'torch-input', 'text': 'a\nb\nc', 'line_count': 3, 'track': 'module', 'language': 'mlir', 'ops': [{'id': 's0:op3', 'name': 'torch.aten.matmul', 'line': 3}], 'op_count': 1},
            {'id': 's1', 'name': 'target-asm', 'text': '  add\n  ret', 'line_count': 2, 'track': 'device', 'language': 'asm', 'ops': [], 'op_count': 2}],
            'architecture': {'nodes': [{'id': 'layer', 'path': 'layer', 'source_lines': [3], 'mapping': 'exact'}]}}
        self.prov = {'status': 'native', 'stages': {'s1': {'records': [
            {'id': 's1:op1', 'line': 1, 'opcode': 'add', 'origins': [{'file': 'mlir/ir_00_torch_input.mlir', 'line': 3, 'column': 10}, {'file': 'mlir/ir_00_torch_input.mlir', 'line': 2, 'column': 5}]},
            {'id': 's1:op2', 'line': 2, 'opcode': 'ret', 'origins': []}]}}}

    def test_forward_and_reverse_preserve_sets(self):
        forward = trace_report(self.artifact, self.prov, source='torch-input:3:10', to='asm')
        self.assertEqual(len(forward['matches']), 1)
        self.assertEqual(len(forward['matches'][0]['origins']), 2)
        reverse = trace_report(self.artifact, self.prov, from_stage='target-asm', line=1)
        self.assertEqual(len(reverse['origins']), 2)
        self.assertEqual(trace_report(self.artifact, self.prov, from_stage='target-asm', line=2)['origins'], [])

    def test_invalid_selectors_and_incompatible_tracks(self):
        with self.assertRaises(ValueError): trace_report(self.artifact, self.prov, module='missing')
        with self.assertRaises(ValueError): trace_report(self.artifact, self.prov, module='layer', line=1)
        with self.assertRaises(ValueError): diff_report(self.artifact, self.prov, 'torch-input', 'target-asm')
        with self.assertRaises(ValueError): inspect_report(self.artifact, self.prov, show='ir', stage='target-asm', lines=(1, 3))

    def test_op_and_module_selectors(self):
        self.assertEqual(len(trace_report(self.artifact, self.prov, op='s0:op3')['matches']), 1)
        self.assertEqual(len(trace_report(self.artifact, self.prov, module='layer')['matches']), 1)

    def test_cli_json_and_bad_exit(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            atomic_json(root / 'artifact.json', self.artifact)
            atomic_json(root / 'provenance.json', {'schema_version': 1, **self.prov})
            cmd = [sys.executable, '-m', 'compilerlens', 'trace', tmp, '--source', 'torch-input:3:10', '--format', 'json']
            result = subprocess.run(cmd, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(len(json.loads(result.stdout)['matches']), 1)
            result = subprocess.run([sys.executable, '-m', 'compilerlens', 'trace', tmp, '--module', 'absent'], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertNotIn('Traceback', result.stderr)


class ServiceTests(unittest.TestCase):
    def test_input_values_survive_including_infinity(self):
        import torch
        import numpy as np
        with tempfile.TemporaryDirectory() as tmp:
            tensor = torch.tensor([[0.0, float('-inf')], [0.0, 0.0]])
            records = save_inputs((tensor,), Path(tmp))
            np.testing.assert_equal(np.load(Path(tmp) / records[0]['path']), tensor.numpy())

    def test_reject_invalid_compile_before_work(self):
        with self.assertRaises(ValueError): capture('model', example='matmul')
        with self.assertRaises(ValueError): capture(example='matmul', seq_len=32)
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaises(FileExistsError): capture(example='matmul', out=tmp)

    def test_failed_run_records_error(self):
        with tempfile.TemporaryDirectory() as tmp:
            out = Path(tmp) / 'failed'
            with self.assertRaises(ValueError): capture(example='unknown', out=out)
            self.assertEqual(json.loads((out / 'run.json').read_text())['status'], 'failed')

    def test_import_does_not_overwrite_source(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); (root / 'mlir').mkdir()
            with self.assertRaises(ValueError): import_dump(root, out=root / 'nested')

    def test_offline_revision_resolves_cached_ref_without_api(self):
        from compilerlens.models.detect import _resolve_revision
        sha = 'a' * 40
        with patch('compilerlens.models.detect.HfApi') as api, patch('compilerlens.models.detect.hf_hub_download', return_value=f'/cache/snapshots/{sha}/config.json') as download:
            self.assertEqual(_resolve_revision('example/model', 'release', offline=True), sha)
            api.assert_not_called()
            self.assertTrue(download.call_args.kwargs['local_files_only'])


if __name__ == '__main__': unittest.main()
