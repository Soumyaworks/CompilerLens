"""Lineage: which operations, in which stages, came from one line of the original program.

DESIGN-DOC section 4.2 (Operation Lineage) and section 7's Level 1 -- explicit identifiers.
This is Level 1 and only Level 1: it groups by the `loc()` metadata the compiler itself
attached, and does no structural matching or guessing. If the compiler did not say where an
operation came from, that operation is simply absent from the index.

That restraint is the feature. A lineage that silently guessed would produce a highlight that
looks authoritative and points at the wrong line, which is worse than no highlight.

What makes it possible: `--mlir-print-debuginfo` puts a `loc()` on every operation through
every stage, and `mlir_loc.py` resolves those (including `#loc` aliases and fused locations)
into a `source_loc` on each parsed operation. Measured on prajjwal1/bert-tiny: 7,798 operations
carry a resolved location, covering 98 distinct source lines, and the busiest single line
(`torch.aten.scaled_dot_product_attention`) has 2,035 descendants across 12 stages.

Stdlib only, like the rest of ingest/.
"""

from __future__ import annotations

import re
from collections import defaultdict

# A resolved source_loc looks like "<path>:110:11". The path is uninteresting here -- every
# location in an artifact refers to the same Torch-input file -- but the line is what a hover
# needs, and the column distinguishes two operations written on one line.
_LOC_TAIL = re.compile(r":(\d+):(\d+)$")

# The stage whose text the line numbers refer to. Everything downstream traces back to it.
_ANCHOR_STAGE = "torch-input"


def _split_loc(source_loc: str) -> tuple | None:
    match = _LOC_TAIL.search(source_loc)
    if not match:
        return None
    return int(match.group(1)), int(match.group(2))


def build_lineage(stages: list) -> dict:
    """Index from anchor-stage line number to every operation derived from it.

    Shape, keyed by line number as a string so it survives JSON:

        {
          "anchor_stage": "torch-input",
          "lines": {
            "110": {
              "source_text": "%39 = torch.aten.scaled_dot_product_attention ...",
              "total_ops": 2035,
              "stage_count": 12,
              "stages": {"s23": [171, 172, 180], ...},   # stage id -> 1-based line numbers
              "op_names": {"linalg.generic": 44, ...}      # what it became, most common first
            },
            ...
          }
        }

    `stages` values are line numbers rather than operation ids because the consumer is a text
    editor: highlighting means "these lines", and carrying ids would make the frontend do a
    second lookup for no benefit.
    """
    anchor = next((s for s in stages if s.name == _ANCHOR_STAGE), None)
    anchor_lines = (anchor.text or "").splitlines() if anchor else []

    # line -> stage_id -> [line numbers in that stage]
    hits: dict = defaultdict(lambda: defaultdict(list))
    # line -> op name -> count
    op_names: dict = defaultdict(lambda: defaultdict(int))

    for stage in stages:
        for op in stage.ops:
            if not op.source_loc:
                continue
            parsed = _split_loc(op.source_loc)
            if parsed is None:
                continue
            source_line = parsed[0]
            hits[source_line][stage.id].append(op.line)
            op_names[source_line][op.name] += 1

    # The anchor stage's own operations carry no source_loc -- they *are* the source, so nothing
    # points back at them. Without this, the index has no entry for the anchor stage itself and
    # the pane the user is hovering cannot highlight the line under their cursor.
    if anchor is not None:
        for op in anchor.ops:
            if op.line in hits:
                hits[op.line][anchor.id].append(op.line)

    lines: dict = {}
    for source_line, by_stage in hits.items():
        total = sum(len(v) for v in by_stage.values())
        source_text = (
            anchor_lines[source_line - 1].strip() if 0 < source_line <= len(anchor_lines) else ""
        )
        lines[str(source_line)] = {
            "source_text": source_text[:200],
            "total_ops": total,
            "stage_count": len(by_stage),
            # Sorted and de-duplicated: a stage can have several operations on one line, and
            # the consumer wants a set of lines to highlight.
            "stages": {stage_id: sorted(set(op_lines)) for stage_id, op_lines in by_stage.items()},
            "op_names": dict(
                sorted(op_names[source_line].items(), key=lambda kv: (-kv[1], kv[0]))[:12]
            ),
        }

    return {
        "anchor_stage": _ANCHOR_STAGE,
        "level": 1,
        "lines": lines,
        "summary": {
            "source_lines_covered": len(lines),
            "total_anchored_ops": sum(v["total_ops"] for v in lines.values()),
        },
        "notes": [
            "Level 1 lineage (DESIGN-DOC section 7): grouped by the loc() metadata the compiler "
            "attached, with no structural matching and no inference. Operations the compiler did "
            "not locate are absent rather than guessed at.",
            f"Line numbers are positions in the '{_ANCHOR_STAGE}' stage, which is the anchor "
            f"every later stage's loc() points back to.",
        ],
    }
