"""Registry of workloads ingest knows how to build.

Add a new hand-written workload by writing a `<name>.py` module here that defines
`WORKLOAD`, then registering it below. `build.py --all` iterates this dict; the frontend's
landing page is generated from it via `build_index()`.

Downloaded models are picked up automatically instead of being listed here: any
`examples/<slug>/model_info.json` (written by scripts/compile_hf_model.py) becomes a
workload whose spec is derived from the files actually on disk. Hand-written entries take
priority, so a generated directory can never shadow matmul or linear_relu.
"""

from __future__ import annotations

from pathlib import Path

from .base import PHASE_TITLES, PassTrackSpec, StageSpec, WorkloadSpec
from .generated import discover as _discover_generated
from .linear_relu import WORKLOAD as _LINEAR_RELU
from .matmul import WORKLOAD as _MATMUL

_EXAMPLES_ROOT = Path(__file__).resolve().parents[2] / "examples"

_HAND_WRITTEN: dict[str, WorkloadSpec] = {
    _MATMUL.id: _MATMUL,
    _LINEAR_RELU.id: _LINEAR_RELU,
}

WORKLOADS: dict[str, WorkloadSpec] = {
    **_discover_generated(_EXAMPLES_ROOT),
    **_HAND_WRITTEN,
}

__all__ = ["PHASE_TITLES", "PassTrackSpec", "StageSpec", "WORKLOADS", "WorkloadSpec"]
