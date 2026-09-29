"""Validate pinned pretrained checkpoints through CLI, Web Explore or Playground.

Example (from source, cache location controlled by HF_HOME):
  python scripts/validate_hf_models.py vit-tiny --out build/vit-check --offline
  python scripts/validate_hf_models.py tinyclip --mode web --out build/clip-check

Uses real model loaders and compiler processes, not mocks. Each output directory must
be new. The temporary API binds only to loopback and is always stopped. --installed
runs outside the checkout; use --python to select the wheel's environment.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import resource
import signal
import socket
import subprocess
import sys
import time
import urllib.error
import urllib.request

ROOT = Path(__file__).resolve().parents[1]


def stop_group(process):
    """Stop only this validator's session, including any compiler descendants."""
    try:
        os.killpg(process.pid, signal.SIGTERM)
    except ProcessLookupError:
        pass
    try:
        process.wait(timeout=15)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()


def request(url, body=None):
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/json'})
    with urllib.request.urlopen(req, timeout=15) as response:
        return json.load(response)


def run(args, checkpoint, out, env):
    command = [str(args.python), '-m', 'compilerlens']
    if args.mode == 'cli':
        run_dir = out / 'capture'
        cmd = command + ['compile', checkpoint['model_id'], '--revision', checkpoint['revision'],
                         '--seq-len', str(checkpoint['seq_len']), '--out', str(run_dir),
                         '--lineage', args.lineage, '--format', 'json']
        if args.offline:
            cmd.append('--offline')
        with (out / 'compile.log').open('w') as log:
            process = subprocess.Popen(cmd, cwd=out, env=env, stdout=log,
                                       stderr=subprocess.STDOUT, start_new_session=True)
            try:
                if process.wait(timeout=args.timeout):
                    raise RuntimeError('CLI capture failed; see compile.log.')
            finally:
                stop_group(process)
        return run_dir

    # No connection to an existing user's API or saved workload library.
    with socket.socket() as sock:
        sock.bind(('127.0.0.1', 0))
        port = sock.getsockname()[1]
    url = f'http://127.0.0.1:{port}'
    with (out / 'api.log').open('w') as log:
        server = subprocess.Popen([str(args.python), '-m', 'uvicorn',
            'compilerlens.backend.api.app:app', '--host', '127.0.0.1', '--port', str(port)],
            cwd=out, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            deadline = time.monotonic() + args.timeout
            while True:
                if server.poll() is not None:
                    raise RuntimeError('Validation API exited; see api.log.')
                try:
                    request(url + '/options')
                    break
                except (OSError, urllib.error.URLError):
                    if time.monotonic() > deadline:
                        raise TimeoutError('Validation API startup timed out.')
                    time.sleep(0.2)
            body = {key: checkpoint[key] for key in ('model_id', 'revision', 'seq_len')}
            body['offline'] = args.offline
            if args.mode == 'web':
                body['lineage'] = args.lineage
            else:
                body.update(stages=['input', 'executable-targets'], want_asm=True)
            job_id = request(url + ('/explore' if args.mode == 'web' else '/compile'), body)['job_id']
            while True:
                job = request(url + f'/compile/{job_id}')
                if job['status'] != 'running':
                    break
                if time.monotonic() > deadline:
                    raise TimeoutError('Compilation timed out; see api.log.')
                time.sleep(0.5)
            if job['status'] != 'done':
                raise RuntimeError(job['error'])
            (out / 'job.json').write_text(json.dumps(job, indent=2) + '\n')
            return out / 'workspace' / ('runs' if args.mode == 'web' else 'jobs') / job_id
        finally:
            stop_group(server)


def main():
    checkpoints = json.loads((Path(__file__).with_name('hf_checkpoints.json')).read_text())
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('checkpoint', choices=checkpoints)
    parser.add_argument('--mode', choices=('cli', 'web', 'playground'), default='cli')
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--python', type=Path, default=Path(sys.executable))
    parser.add_argument('--offline', action='store_true')
    parser.add_argument('--installed', action='store_true')
    parser.add_argument('--lineage', choices=('auto', 'required', 'off'), default='auto')
    parser.add_argument('--timeout', type=int, default=1200)
    args = parser.parse_args()
    # Do not resolve a venv's Python symlink: its path selects that environment.
    args.python = args.python.expanduser().absolute()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    env = {**os.environ, 'COMPILERLENS_WORKSPACE': str(out / 'workspace'),
           'HF_HUB_DISABLE_PROGRESS_BARS': '1', 'OMP_NUM_THREADS': '2'}
    if not args.installed:
        env['PYTHONPATH'] = str(ROOT)
    checkpoint = checkpoints[args.checkpoint]
    report = {'status': 'failed', 'mode': args.mode, 'checkpoint': checkpoint}
    started = time.monotonic()
    try:
        installation = json.loads(subprocess.check_output([str(args.python), '-c',
            'import json, compilerlens; from compilerlens.services import versions; '
            'print(json.dumps(dict(package_path=compilerlens.__file__, versions=versions())))'],
            env=env, cwd=out, text=True))
        location = installation['package_path']
        if args.installed and Path(location).is_relative_to(ROOT / 'compilerlens'):
            raise RuntimeError('--installed imported the source checkout, not an installed wheel.')
        report.update(installation)
        run_dir = run(args, checkpoint, out, env)
        if args.mode == 'playground':
            info = json.loads((out / 'job.json').read_text())['model_info']
        else:
            info = json.loads((run_dir / 'model_info.json').read_text())
        for key in ('model_id', 'revision', 'adapter', 'task'):
            if info[key] != checkpoint[key]:
                raise RuntimeError(f'Checkpoint {key} differs: {info[key]}')
        if info['param_count'] != checkpoint['parameters']:
            raise RuntimeError(f"Parameter count differs: {info['param_count']}")
        verification = json.loads((run_dir / 'verification.json').read_text())
        if verification['status'] != 'passed':
            raise RuntimeError(f'Output verification did not pass: {verification}')
        report.update(run=str(run_dir), model_info=info, verification=verification)
        if args.mode != 'playground':
            artifact = json.loads((run_dir / 'artifact.json').read_text())
            sidecar = json.loads((run_dir / 'lineage.json').read_text())
            if not any(s['language'] == 'asm' for s in artifact['stages']):
                raise RuntimeError('No assembly stage was captured.')
            report.update(architecture=artifact['architecture']['mapping_status'],
                          stage_count=len(artifact['stages']), lineage=sidecar['status'])
            if report['architecture'] != 'exact':
                raise RuntimeError('Module-to-Torch mapping is not exact.')
            coverage = {s['name']: sidecar['stages'].get(s['id'], {}).get('coverage', {})
                        for s in artifact['stages'] if s['language'] in ('llvm', 'asm')}
            report['coverage'] = coverage
            if args.lineage == 'required' and any(
                    not any(sidecar['stages'].get(s['id'], {}).get('coverage', {}).get('source_associated', 0)
                            for s in artifact['stages'] if s['language'] == language)
                    for language in ('llvm', 'asm')):
                raise RuntimeError('Required lineage has no source links in LLVM or assembly.')
            if args.mode == 'web':
                published = out / 'workspace/frontend/public/artifacts' / f"{artifact['compilation_id']}.json"
                if not published.is_file():
                    raise RuntimeError('Web Explore did not publish its artifact.')
        report['status'] = 'passed'
    except Exception as exc:
        report['error'] = f'{type(exc).__name__}: {exc}'
    finally:
        report['wall_seconds'] = round(time.monotonic() - started, 2)
        report['child_peak_rss_kib'] = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
        report['output_bytes'] = sum(p.stat().st_size for p in out.rglob('*') if p.is_file())
        (out / 'validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    return 0 if report['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
