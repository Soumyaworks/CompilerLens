"""Regression checks for release-tool selection and tag-only publication."""
import unittest
from pathlib import Path
from unittest.mock import patch

import yaml


WORKFLOW = Path(__file__).resolve().parents[1] / '.github/workflows/publish.yml'


class ReleaseWorkflowTests(unittest.TestCase):
    def setUp(self):
        # BaseLoader preserves the YAML key "on" instead of interpreting it as bool.
        self.workflow = yaml.load(WORKFLOW.read_text(), Loader=yaml.BaseLoader)
        step = next(s for s in self.workflow['jobs']['build']['steps']
                    if s.get('name') == 'Verify wheel repair tools')
        self.preflight = step['run'].split("python - <<'PY'\n", 1)[1].rsplit('\nPY', 1)[0]

    def run_preflight(self, version='0.19.1.0', executable='/release-venv/bin/patchelf'):
        versions = {'auditwheel': '6.8.2', 'patchelf': version}
        with patch('importlib.metadata.version', side_effect=versions.__getitem__), \
             patch('shutil.which', return_value=executable), \
             patch('sysconfig.get_path', return_value='/release-venv/bin'), \
             patch('subprocess.run') as run:
            exec(compile(self.preflight, str(WORKFLOW), 'exec'), {})
        return run

    def test_pinned_tools_pass_preflight(self):
        run = self.run_preflight()
        self.assertEqual(run.call_count, 2)
        run.assert_any_call(['/release-venv/bin/patchelf', '--version'], check=True)

    def test_old_patchelf_package_is_rejected(self):
        with self.assertRaisesRegex(SystemExit, 'expected 0.19.1.0'):
            self.run_preflight(version='0.14.3')

    def test_shadowing_system_patchelf_is_rejected(self):
        with self.assertRaisesRegex(SystemExit, 'Wrong patchelf on PATH'):
            self.run_preflight(executable='/usr/bin/patchelf')

    def test_branch_builds_cannot_publish(self):
        trigger = self.workflow['on']
        self.assertEqual(trigger['push']['branches'], ['main'])
        self.assertIn('pull_request', trigger)
        self.assertEqual(trigger['push']['tags'], ['v*'])
        self.assertEqual(self.workflow['jobs']['publish']['if'],
                         "github.event_name == 'push' && startsWith(github.ref, 'refs/tags/v')")
        self.assertEqual(self.workflow['jobs']['publish']['needs'], 'build')

    def test_ci_runs_on_main_pull_requests_and_manual_dispatch(self):
        workflow = yaml.load(WORKFLOW.with_name('ci.yml').read_text(), Loader=yaml.BaseLoader)
        trigger = workflow['on']
        self.assertEqual(trigger['push']['branches'], ['main'])
        self.assertIn('pull_request', trigger)
        self.assertIn('workflow_dispatch', trigger)


if __name__ == '__main__':
    unittest.main()
