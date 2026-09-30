"""Source artifact generation must share the capture pipeline's lineage behavior."""
import contextlib
import io
import json
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

from compilerlens.ingest import build
from compilerlens.ingest.workloads.generated import spec_from_dump_dir
from compilerlens.lineage import analyze_files, native_binary


class SourceArtifactTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name) / 'fixture'
        (self.root / 'mlir').mkdir(parents=True)
        (self.root / 'llvm').mkdir()
        (self.root / 'mlir/ir_00_torch_input.mlir').write_text(
            '%0 = torch.aten.relu %arg0 : !torch.vtensor<[4],f32>\n')
        (self.root / 'llvm/dispatch_0.mlir').write_text(
            '%0 = arith.constant 0 : i32 loc("ir_00_torch_input.mlir":1:6)\n' * 20)
        fixture = Path(__file__).resolve().parents[1] / 'llvm/tests/fixture.ll'
        shutil.copyfile(fixture, self.root / 'llvm/dispatch_0.optimized.ll')
        (self.root / 'llvm/dispatch_0.s').write_text(
            '.file 1 "/captured" "dispatch_0.mlir"\n'
            '.loc 1 18 8\n  movl (%rdi), %eax\n  retq\n')
        self.workload = spec_from_dump_dir(self.root, {'model_id': 'fixture'})

    def test_default_auto_records_fallback_without_native_binary(self):
        with patch.dict(os.environ, {'COMPILERLENS_NATIVE': '/not-present/native'}):
            artifact = build.build_artifact(self.workload)
        sidecar = json.loads((self.root / 'lineage.json').read_text())
        self.assertEqual(sidecar['status'], 'fallback')
        self.assertTrue(any(note.startswith('Lineage: fallback') for note in artifact.notes))
        assembly = next(s for s in artifact.stages if s.language == 'asm')
        self.assertEqual(artifact.lineage['lines']['1']['stages'][assembly.id], [3, 4])

    def test_required_rejects_missing_native_for_single_and_all_builds(self):
        for mode in ('single', 'all'):
            with self.subTest(mode=mode):
                output = Path(self.directory.name) / mode
                args = (['--all', '--out-dir', str(output)] if mode == 'all' else
                        [str(self.root), '--id', 'fixture', '--out', str(output)])
                with patch.object(build, 'WORKLOADS', {'fixture': self.workload}), \
                     patch('sys.argv', ['ingest.build', *args, '--lineage', 'required']), \
                     patch.dict(os.environ, {'COMPILERLENS_NATIVE': '/not-present/native'}), \
                     contextlib.redirect_stderr(io.StringIO()) as errors:
                    with self.assertRaises(SystemExit) as failure:
                        build.main()
                self.assertEqual(failure.exception.code, 1)
                self.assertIn('Native analyzer unavailable', errors.getvalue())
                self.assertFalse((output / 'index.json').exists() if mode == 'all' else output.exists())

    def test_off_skips_native_execution(self):
        with patch('compilerlens.lineage.native_binary', side_effect=AssertionError('must not run')):
            build.build_artifact(self.workload, lineage='off')
        self.assertEqual(json.loads((self.root / 'lineage.json').read_text())['status'], 'off')

    def test_capture_analysis_is_reused(self):
        analysis = analyze_files(self.root, 'off')
        with patch('compilerlens.lineage.analyze_files', side_effect=AssertionError('must not rerun')):
            build.build_artifact(self.workload, analysis=analysis)

    @unittest.skipUnless(native_binary(), 'Build the native analyzer for source integration checks')
    def test_native_results_reach_single_and_all_frontend_artifacts(self):
        original = (self.root / 'llvm/dispatch_0.optimized.ll').read_bytes()
        for mode in ('single', 'all'):
            with self.subTest(mode=mode):
                output = Path(self.directory.name) / mode
                args = (['--all', '--out-dir', str(output)] if mode == 'all' else
                        [str(self.root), '--id', 'fixture', '--out', str(output)])
                with patch.object(build, 'WORKLOADS', {'fixture': self.workload}), \
                     patch('sys.argv', ['ingest.build', *args, '--lineage', 'required']), \
                     contextlib.redirect_stdout(io.StringIO()), \
                     contextlib.redirect_stderr(io.StringIO()):
                    build.main()
                artifact_path = output / 'fixture.json' if mode == 'all' else output
                artifact = json.loads(artifact_path.read_text())
                sidecar = json.loads((self.root / 'lineage.json').read_text())
                self.assertEqual(sidecar['status'], 'native')
                for language in ('llvm', 'asm'):
                    stage = next(s for s in artifact['stages'] if s['language'] == language)
                    mapped = artifact['lineage']['lines']['1']['stages'][stage['id']]
                    self.assertTrue(mapped)
                    self.assertTrue(all(1 <= line <= stage['line_count'] for line in mapped))
                    if language == 'llvm':
                        self.assertIn('; compilerlens.id=', stage['text'])
                        self.assertTrue(sidecar['stages'][stage['id']]['native'])
                if mode == 'all':
                    index = json.loads((output / 'index.json').read_text())
                    self.assertEqual(index['workloads'][0]['id'], 'fixture')
        self.assertEqual((self.root / 'llvm/dispatch_0.optimized.ll').read_bytes(), original)


if __name__ == '__main__':
    unittest.main()
