"""Web Explore forwards lineage modes and reports capture progress safely."""
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from fastapi.testclient import TestClient

from compilerlens.backend.api import app as api
from compilerlens.storage import atomic_json


class ExploreLineageTests(unittest.TestCase):
    def test_modes_and_default_reach_capture(self):
        for mode in (None, 'auto', 'required', 'off'):
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                run = root / 'captured'
                atomic_json(run / 'model_info.json', {'model_id': 'test/model'})
                atomic_json(run / 'artifact.json', {'compilation_id': 'test-run'})
                atomic_json(run / 'index.json', {'workloads': [{'id': 'test-run'}]})
                progress_updates = []

                def capture_with_progress(*args, progress, **kwargs):
                    job = next(iter(api.JOBS.values()))
                    self.assertIsNone(job['progress'])
                    for label in ('Loading workload', 'Compiling workload'):
                        progress(label)
                        progress_updates.append(dict(job['progress']))
                    return run

                with patch.object(api, 'REPO_ROOT', root), patch.object(api, 'JOBS', {}), \
                     patch('compilerlens.services.capture', side_effect=capture_with_progress) as capture, \
                     TestClient(api.app) as client:
                    body = {'model_id': 'test/model'}
                    if mode is not None:
                        body['lineage'] = mode
                        body.update(revision='a' * 40, offline=True)
                    response = client.post('/explore', json=body)
                    self.assertEqual(response.status_code, 200, response.text)
                    job_id = response.json()['job_id']
                    job = client.get(f'/compile/{job_id}').json()
                    expected = mode or 'auto'
                    self.assertEqual(capture.call_args.kwargs['lineage'], expected)
                    self.assertEqual(capture.call_args.kwargs['revision'], body.get('revision'))
                    self.assertEqual(capture.call_args.kwargs['offline'], body.get('offline', False))
                    self.assertEqual(job['lineage'], expected)
                    self.assertEqual(job['status'], 'done')
                    self.assertEqual(progress_updates, [
                        {'label': 'Loading workload', 'done': 1, 'total': 24},
                        {'label': 'Compiling workload', 'done': 2, 'total': 24},
                    ])
                    self.assertEqual(job['progress'], {'label': 'Complete', 'done': 1, 'total': 1})
                    saved = json.loads((root / 'jobs' / f'{job_id}.json').read_text())
                    self.assertEqual(saved['lineage'], expected)
                    self.assertEqual(saved['progress'], job['progress'])

    def test_invalid_mode_is_rejected_before_capture(self):
        with patch('compilerlens.services.capture') as capture, TestClient(api.app) as client:
            response = client.post('/explore', json={'model_id': 'test/model', 'lineage': 'invalid'})
        self.assertEqual(response.status_code, 422)
        capture.assert_not_called()

    def test_required_missing_analyzer_gives_actionable_error(self):
        with tempfile.TemporaryDirectory() as directory, \
             patch.object(api, 'REPO_ROOT', Path(directory)), patch.object(api, 'JOBS', {}), \
             patch.dict(os.environ, {'COMPILERLENS_NATIVE': '/not-present/native'}), \
             self.assertLogs(api.LOGGER, level='ERROR'), TestClient(api.app) as client:
            response = client.post('/explore', json={'model_id': 'test/model', 'lineage': 'required'})
            job = client.get(f'/compile/{response.json()["job_id"]}').json()
            self.assertEqual(job['status'], 'failed')
            self.assertIn('Native lineage analysis', job['error'])
            self.assertIn('Automatic or Off', job['error'])


if __name__ == '__main__':
    unittest.main()
