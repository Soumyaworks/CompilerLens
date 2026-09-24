"""Smoke test an installed wheel, with the server/browser in one process namespace."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import tempfile
import time
import urllib.request


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('python', type=Path)
    parser.add_argument('run', type=Path)
    parser.add_argument('--browser', action='store_true')
    parser.add_argument('--browsers-path', type=Path)
    args = parser.parse_args()
    source = Path(__file__).resolve().parents[1]
    env = {**os.environ, 'PYTHONPATH': '', 'PATH': f'{args.python.parent}:/usr/bin:/bin'}
    with tempfile.TemporaryDirectory() as cwd:
        env['COMPILERLENS_WORKSPACE'] = str(Path(cwd) / 'workspace')
        command = [str(args.python), '-m', 'compilerlens']
        doctor = json.loads(subprocess.check_output(command + ['doctor', '--format', 'json'], cwd=cwd, env=env))
        assert doctor['ready'], doctor
        assert str(source) not in doctor['native']['path']
        print('Installed doctor:', doctor['native']['version'], flush=True)
        trace = json.loads(subprocess.check_output(command + ['trace', str(args.run), '--module', 'model', '--to', 'asm', '--format', 'json'], cwd=cwd, env=env))
        assert trace['matches'], 'No installed assembly source matches'
        print('Installed trace:', len(trace['matches']), 'instructions', flush=True)
        server = subprocess.Popen(command + ['view', str(args.run), '--port', '8768'], cwd=cwd, env=env)
        try:
            url = 'http://127.0.0.1:8768'
            for _ in range(100):
                if server.poll() is not None: raise RuntimeError('Viewer exited early')
                try:
                    with urllib.request.urlopen(url + '/health', timeout=1) as response:
                        assert response.status == 200
                    break
                except OSError: time.sleep(0.1)
            else: raise RuntimeError('Viewer failed to start')
            for route in ('/', '/options', '/artifacts/index.json'):
                with urllib.request.urlopen(url + route, timeout=5) as response: assert response.status == 200
            print('Installed HTTP routes passed', flush=True)
            if args.browser:
                subprocess.run(['node', str(source / 'scripts/check_viewer.mjs'), url], check=True, cwd=source, timeout=60,
                               env={**os.environ, **({'PLAYWRIGHT_BROWSERS_PATH': str(args.browsers_path)} if args.browsers_path else {})})
        finally:
            server.terminate()
            try: server.wait(timeout=10)
            except subprocess.TimeoutExpired: server.kill(); server.wait()


if __name__ == '__main__': main()
