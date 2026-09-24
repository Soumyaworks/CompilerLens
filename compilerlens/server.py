"""Serve the existing browser application and saved artifacts from any install."""
from pathlib import Path
import json
import threading
import webbrowser

from .storage import load_run, workspace


def create_app(run, *, web_root=None):
    from fastapi import FastAPI, HTTPException
    from fastapi.responses import FileResponse
    from fastapi.staticfiles import StaticFiles
    from .backend.api.app import app as api
    root, artifact, _ = load_run(run)
    artifact_file = Path(run).expanduser().resolve() if Path(run).is_file() else root / 'artifact.json'
    web = Path(web_root) if web_root else Path(__file__).parent / '_web'
    if not (web / 'index.html').is_file():
        raise RuntimeError('Bundled webpage missing. Run python scripts/build_release.py or install a release wheel.')
    app = FastAPI(title='CompilerLens')
    # Share API behavior without adding static routes to its global app.
    app.router.routes.extend(api.router.routes)
    artifacts = workspace() / 'frontend/public/artifacts'

    @app.get('/artifacts/index.json')
    def index():
        selected = json.loads((root / 'index.json').read_text()) if (root / 'index.json').exists() else {
            'workloads': [{'id': artifact['compilation_id'], 'title': artifact['compilation_id'],
                          'description': '', 'source_entry': '', 'source_preview': '',
                          'stage_count': len(artifact['stages']), 'op_count': 0, 'evidence_count': len(artifact['evidence'])}]}
        if (artifacts / 'index.json').exists():
            others = json.loads((artifacts / 'index.json').read_text()).get('workloads', [])
            ids = {w['id'] for w in selected['workloads']}
            selected['workloads'].extend(w for w in others if w['id'] not in ids)
        return selected

    @app.get('/artifacts/{name}.json')
    def saved(name: str):
        if name == artifact['compilation_id']: return FileResponse(artifact_file)
        path = (artifacts / (name + '.json')).resolve()
        if not path.is_relative_to(artifacts.resolve()) or not path.is_file(): raise HTTPException(404, 'Artifact not found')
        return FileResponse(path)

    app.mount('/', StaticFiles(directory=web, html=True), name='web')
    return app


def serve(run, *, port=8000, open_browser=False):
    import uvicorn
    if not 1 <= port <= 65535: raise ValueError('Port must be between 1 and 65535.')
    app = create_app(run)
    url = f'http://127.0.0.1:{port}'
    print(f'CompilerLens: {url}', flush=True)
    if open_browser:
        timer = threading.Timer(1.0, webbrowser.open, args=(url,))
        timer.daemon = True
        timer.start()
    uvicorn.run(app, host='127.0.0.1', port=port)
