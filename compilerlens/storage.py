"""Durable run storage, independent of the installation directory."""
from __future__ import annotations

import hashlib
import json
import os
import re
import tempfile
from pathlib import Path


def atomic_json(path: Path, value) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temp = tempfile.mkstemp(prefix=f'.{path.name}-', dir=path.parent)
    try:
        with os.fdopen(fd, 'w') as stream:
            json.dump(value, stream, indent=2, allow_nan=False)
            stream.write('\n')
        os.replace(temp, path)
    finally:
        Path(temp).unlink(missing_ok=True)


def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def slug(value: str) -> str:
    return re.sub(r'[^a-zA-Z0-9_.-]', '_', value).strip('.') or 'workload'


def workspace() -> Path:
    if os.environ.get('COMPILERLENS_WORKSPACE'):
        return Path(os.environ['COMPILERLENS_WORKSPACE']).expanduser().resolve()
    repo = Path(__file__).resolve().parent.parent
    if (repo / 'frontend' / 'package.json').is_file():
        return repo
    return Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache')) / 'compilerlens'


def load_run(path: str | Path) -> tuple[Path, dict, dict]:
    path = Path(path).expanduser().resolve()
    artifact_path = path / 'artifact.json' if path.is_dir() else path
    artifact = json.loads(artifact_path.read_text())
    if artifact.get('artifact_version') != '0.7' or not artifact.get('stages'):
        raise ValueError('Expected a CompilerLens artifact version 0.7 with stages.')
    root = artifact_path.parent
    lineage_path = root / 'lineage.json'
    if not lineage_path.exists():
        # Read saved runs produced by the TestPyPI 0.1.0 release.
        lineage_path = root / 'provenance.json'
    lineage = json.loads(lineage_path.read_text()) if lineage_path.exists() else {}
    if lineage and lineage.get('schema_version') != 1:
        raise ValueError('Unsupported lineage schema; use a compatible CompilerLens version.')
    return root, artifact, lineage
