"""Numerical smoke validation of a compiled forward pass on its capture inputs."""
from pathlib import Path

from compilerlens.storage import atomic_json

# Float32 transformer reductions differ between PyTorch and fused CPU codegen.
# Calibrated on pretrained ViT-tiny against float64 over three input samples.
# Keep a small absolute floor so near-zero outputs cannot hide large errors.
FLOAT32_RTOL = 1e-3
FLOAT32_ATOL = 1e-4


def verify_forward(vmfb: Path, module, inputs: tuple, output_names: list[str],
                   report_path: Path) -> dict:
    """Write a report even on failure; never treat matching shapes as correctness.

    This checks one synthetic sample, not model quality or all possible inputs.
    Call only for executables targeting the current host (or generic CPU).
    """
    import numpy as np
    import torch
    import iree.runtime as runtime

    report = {'status': 'failed', 'rtol': FLOAT32_RTOL, 'atol': FLOAT32_ATOL, 'outputs': [],
              'scope': 'PyTorch vs compiled forward on the captured input tensors'}
    try:
        with torch.no_grad():
            expected = module(*inputs)
        expected = expected if isinstance(expected, (tuple, list)) else (expected,)
        vm = runtime.load_vm_flatbuffer(Path(vmfb).read_bytes(), driver='local-sync')
        actual = vm.main(*(tensor.detach().cpu().numpy() for tensor in inputs))
        actual = actual if isinstance(actual, (tuple, list)) else (actual,)
        if len(actual) != len(expected) or len(expected) != len(output_names):
            raise ValueError('Output count differs from the adapter contract.')
        for name, value, reference in zip(output_names, actual, expected):
            value = np.array(value.to_host(), copy=True)
            reference = reference.detach().cpu().numpy()
            if value.shape != reference.shape or value.dtype != reference.dtype:
                raise ValueError(f'{name}: output shape or dtype differs from PyTorch.')
            if not np.isfinite(value).all() or not np.isfinite(reference).all():
                raise ValueError(f'{name}: non-finite output cannot be verified.')
            difference = np.abs(value.astype(np.float64) - reference.astype(np.float64))
            error = float(np.max(difference)) if value.size else 0.0
            report['outputs'].append({'name': name, 'shape': list(value.shape),
                                      'dtype': str(value.dtype), 'max_abs_error': error})
            np.testing.assert_allclose(value, reference, rtol=report['rtol'], atol=report['atol'],
                                       err_msg=name, equal_nan=False)
        report['status'] = 'passed'
    except Exception as exc:
        report['error'] = f'{type(exc).__name__}: {exc}'
        raise RuntimeError(f'Compiled output verification failed: {exc}') from exc
    finally:
        atomic_json(report_path, report)
    return report
