"""Benchmark saved executables against their captured input values."""
import json
from pathlib import Path

from .storage import load_run, digest, atomic_json


def benchmark_run(run, *, workers=8, repetitions=10):
    from .backend.measure.bench import benchmark_module
    root, artifact, _ = load_run(run)
    index = root / 'inputs/index.json'
    if not index.is_file(): raise ValueError('This run has no saved inputs. Recompile to benchmark exact tensors.')
    inputs = []
    for record in json.loads(index.read_text()):
        path = (root / record['path']).resolve()
        if not path.is_relative_to(root) or not path.is_file() or digest(path) != record['sha256']:
            raise ValueError('Captured input is missing or its hash changed.')
        inputs.append('@' + str(path))
    executables = list(root.glob('*.vmfb'))
    if len(executables) != 1: raise ValueError('Expected exactly one saved .vmfb executable.')
    result = benchmark_module(executables[0], inputs, repetitions=repetitions, workers=workers).as_dict()
    result.update(workers=workers, input_values='exact saved tensors', compilation_id=artifact['compilation_id'])
    atomic_json(root / 'benchmark.json', result)
    return result
