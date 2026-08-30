"""Registry of workloads ingest knows how to build.

Add a new workload by writing a `<name>.py` module here that defines `WORKLOAD`, then
registering it below. `build.py --all` iterates this dict; the frontend's landing page is
generated from it via `build_index()`.
"""

from __future__ import annotations

from .base import PHASE_TITLES, PassTrackSpec, StageSpec, WorkloadSpec
from .linear_relu import WORKLOAD as _LINEAR_RELU
from .matmul import WORKLOAD as _MATMUL

WORKLOADS: dict[str, WorkloadSpec] = {
    _MATMUL.id: _MATMUL,
    _LINEAR_RELU.id: _LINEAR_RELU,
}

__all__ = ["PHASE_TITLES", "PassTrackSpec", "StageSpec", "WORKLOADS", "WorkloadSpec"]
