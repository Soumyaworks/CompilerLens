"""Shared types for defining a workload's pipeline.

A workload is one compiled program (matmul, linear_relu, ...) with its own dump directory,
its own stage list, and its own pass tracks. This module holds the dataclasses; each
workload module (matmul.py, linear_relu.py, ...) instantiates them, and
ingest/workloads/__init__.py collects the instances into a registry.
"""

from __future__ import annotations

from dataclasses import dataclass, field

from ..schema import (
    PHASE_BINARY,
    PHASE_CODEGEN,
    PHASE_FLOW,
    PHASE_FRONTEND,
    PHASE_GLOBAL,
    PHASE_INPUT,
    PHASE_LLVM,
    PHASE_RUNTIME,
)

__all__ = [
    "PHASE_BINARY",
    "PHASE_CODEGEN",
    "PHASE_FLOW",
    "PHASE_FRONTEND",
    "PHASE_GLOBAL",
    "PHASE_INPUT",
    "PHASE_LLVM",
    "PHASE_RUNTIME",
    "PHASE_TITLES",
    "PassTrackSpec",
    "StageSpec",
    "WorkloadSpec",
]


@dataclass(frozen=True)
class StageSpec:
    relative_path: str
    name: str
    title: str
    phase: str
    language: str
    description: str
    # Which comparison track this stage belongs to. Diffs are only computed between stages
    # of the same track, because a diff across tracks asserts a succession the compiler
    # never performed -- the whole-module phase dumps, the extracted device kernel, and the
    # per-pass snapshots of a single function are three different things.
    track: str = "module"
    gap_note: str | None = None


@dataclass(frozen=True)
class PassTrackSpec:
    """A run of per-pass IR snapshots pulled out of an --mlir-print-ir-after-all log.

    These fill in what the phase dumps skip over. Each becomes a run of sub-stages inserted
    after `insert_after`, nested under it in the UI.
    """

    log_path: str
    # Substring identifying the printed operation whose history we want. A log interleaves
    # dumps for every function in the module, so this selects one function's timeline.
    scope_contains: str
    insert_after: str  # stage name these sub-stages follow
    track: str
    phase: str
    description: str


@dataclass(frozen=True)
class WorkloadSpec:
    """Everything ingest needs to build one workload's artifact.

    `dump_root` is relative to the repo root (examples/<id>), so the same spec works whether
    ingest is run from the repo root during development or Stage 5 points it at a fresh
    temp directory from a live compile.
    """

    id: str
    title: str
    description: str  # one line, shown on the landing page
    dump_root: str
    source_entry: str  # the top-level call the source demonstrates, e.g. "torch.matmul"
    stages: list[StageSpec] = field(default_factory=list)
    pass_tracks: list[PassTrackSpec] = field(default_factory=list)


PHASE_TITLES: dict[str, str] = {
    PHASE_FRONTEND: "Frontend",
    PHASE_INPUT: "Input",
    PHASE_GLOBAL: "Global Optimization",
    PHASE_FLOW: "Flow / Stream",
    PHASE_CODEGEN: "Codegen",
    PHASE_RUNTIME: "Runtime",
    PHASE_LLVM: "LLVM",
    PHASE_BINARY: "Binary",
}
