"""CompilerLens artifact schema.

This module is the contract between the compiler side and the frontend. The ingest layer
produces exactly this shape; the frontend consumes exactly this shape. Neither knows
anything else about the other.

See DESIGN-DOC.md section 6. Changing a field here is a breaking change for the frontend,
so bump ARTIFACT_VERSION when you do.

Standard library only -- pip is unavailable in the dev environment (see PLAN.md).
"""

from __future__ import annotations

import dataclasses
import json
from dataclasses import dataclass, field
from typing import Any

# 0.2 added Artifact.diagnosis (the Optimization Doctor's findings, baked in at build time).
ARTIFACT_VERSION = "0.2"

# Coarse groupings for the pipeline sidebar. A stage's phase decides where it is drawn and
# what colour it gets, so the user can see at a glance which level of abstraction they are
# looking at.
PHASE_FRONTEND = "frontend"  # PyTorch / Torch dialect
PHASE_INPUT = "input"  # IREE input, ABI, preprocessing
PHASE_GLOBAL = "global"  # global optimization, dispatch creation
PHASE_FLOW = "flow"  # flow, stream
PHASE_CODEGEN = "codegen"  # executable sources/configurations/targets
PHASE_RUNTIME = "runtime"  # HAL, VM
PHASE_LLVM = "llvm"  # LLVM IR
PHASE_BINARY = "binary"  # target assembly

PHASE_ORDER = [
    PHASE_FRONTEND,
    PHASE_INPUT,
    PHASE_GLOBAL,
    PHASE_FLOW,
    PHASE_CODEGEN,
    PHASE_RUNTIME,
    PHASE_LLVM,
    PHASE_BINARY,
]


@dataclass
class Operation:
    """A single operation parsed out of one stage's IR.

    Stage 1 only counts and displays these. They exist now because lineage (Stage 2) needs
    them, and extracting them during the initial parse is nearly free.
    """

    id: str  # globally unique, "s01:op4"
    stage_id: str
    line: int  # 1-based, so the frontend can jump Monaco to it
    name: str  # fully qualified, "linalg.matmul"
    dialect: str  # "linalg"
    results: list[str] = field(default_factory=list)  # ["%4"]
    operands: list[str] = field(default_factory=list)  # ["%0", "%1"]
    types: list[str] = field(default_factory=list)  # ["tensor<128x128xf32>"]
    text: str = ""  # source line, trimmed

    # Resolved loc(...) metadata as "file:line:col", when the compiler provided one. This is
    # the Level-1 lineage anchor (DESIGN-DOC section 7): operations derived from the same
    # source construct carry the same value, so `torch.aten.matmul` at line 3 can be traced
    # to everything it became. None for loc(unknown) and for locations we could not resolve
    # -- reporting an unresolved location would corrupt the anchor.
    source_loc: str | None = None

    # Filled in by the lineage engine in Stage 2; always present so the frontend can rely
    # on the key existing.
    lineage_key: str | None = None


@dataclass
class Stage:
    """One observable point in the compilation pipeline."""

    id: str  # "s01"
    index: int  # position in the pipeline, 0-based
    name: str  # machine name, "executable-targets"
    title: str  # human label, "Executable Targets"
    phase: str  # one of the PHASE_* constants
    language: str  # "mlir" | "llvm" | "asm" | "python" -- drives syntax highlighting
    source_path: str  # path relative to repo root, for provenance
    text: str  # the full IR, embedded so the frontend needs one fetch
    line_count: int = 0
    byte_size: int = 0
    op_count: int = 0
    # What the operations group into, most frequent first. The grouping differs by
    # language -- MLIR dialects, LLVM instruction classes, SIMD register widths for
    # assembly -- so histogram_label tells the UI what it is actually displaying rather
    # than forcing every language into the word "dialect".
    op_histogram: dict[str, int] = field(default_factory=dict)
    histogram_label: str = "Dialects"
    ops: list[Operation] = field(default_factory=list)
    description: str = ""  # what this stage does, shown in the UI
    # "phase" for an IREE pipeline phase dump, "pass" for a single pass snapshot recovered
    # from an --mlir-print-ir-after-all log.
    kind: str = "phase"
    # Comparison track. Diffs are only computed between stages sharing a track, because the
    # whole-module phase dumps, the extracted device kernel, and the per-pass snapshots of
    # one function are three different things and diffing across them would assert a
    # succession the compiler never performed.
    track: str = "module"
    # Populated for kind == "pass".
    pass_name: str | None = None  # "GenericVectorizationPass"
    pass_arg: str | None = None  # "iree-codegen-generic-vectorization"
    parent_stage: str | None = None  # phase stage these sub-stages sit under, for nesting
    # Set when the pipeline has a known discontinuity at this stage -- see PLAN.md "Known
    # gaps". Surfaced in the UI rather than hidden, so we never imply we captured a
    # transformation we did not.
    gap_note: str | None = None


@dataclass
class StageDiff:
    """Precomputed summary of what changed between two adjacent stages.

    Monaco renders the actual textual diff on the frontend; this is the *headline* -- the
    dialect-level and op-level deltas that tell the user whether a stage did anything
    interesting before they open it.
    """

    from_stage: str
    to_stage: str
    op_delta: int
    groups_added: list[str] = field(default_factory=list)  # dialects/classes newly present
    groups_removed: list[str] = field(default_factory=list)
    ops_added: list[str] = field(default_factory=list)  # op names newly present
    ops_removed: list[str] = field(default_factory=list)  # op names no longer present
    # True when nothing changed textually. Compiler Explorer's pass-dump parser tracks the
    # same flag (lib/parsers/llvm-pass-dump-parser.ts) because most passes change nothing,
    # and showing them all buries the ones that matter.
    ir_changed: bool = True
    summary: str = ""


@dataclass
class Evidence:
    """A single verifiable fact recovered from compiler output.

    Evidence is the source of truth for the Optimization Doctor (Stage 3) and the only
    thing the AI layer (Stage 4) is allowed to reason from -- see DESIGN-DOC section 4.6.
    Every instance must cite where it came from, because an unsourced claim is exactly what
    this project exists to avoid.
    """

    id: str
    kind: str  # "target" | "tiling" | "vectorization" | "instruction-selection"
    label: str
    value: str
    source_stage: str  # stage id this was read from
    source_detail: str = ""  # e.g. "translation_info attribute"
    status: str = "info"  # "success" | "missed" | "info"


@dataclass
class Artifact:
    compilation_id: str
    stages: list[Stage] = field(default_factory=list)
    diffs: list[StageDiff] = field(default_factory=list)
    evidence: list[Evidence] = field(default_factory=list)
    source: dict[str, Any] = field(default_factory=dict)  # original PyTorch program
    target: dict[str, Any] = field(default_factory=dict)  # backend, triple, cpu
    notes: list[str] = field(default_factory=list)  # honest caveats, shown in the UI
    # The Optimization Doctor's findings for this artifact (analyzer/diagnose.py). Baked in at
    # build time so the static site can show a diagnosis without a server running -- the
    # Sandbox's live /diagnose endpoint returns the identical shape.
    diagnosis: dict[str, Any] = field(default_factory=dict)
    artifact_version: str = ARTIFACT_VERSION

    def to_json(self, indent: int | None = None) -> str:
        return json.dumps(dataclasses.asdict(self), indent=indent)
