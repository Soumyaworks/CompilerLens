"""Lineage: which operations, in which stages, came from one line of the original program.

This is explicit-identifier lineage: it groups by the `loc()` metadata the compiler itself
attached and does no structural matching or guessing. If the compiler did not say where an
operation came from, that operation is absent from the index.

That restraint is the feature. A lineage that silently guessed would produce a highlight that
looks authoritative and points at the wrong line, which is worse than no highlight.

What makes it possible: `--mlir-print-debuginfo` puts a `loc()` on every operation through
every stage, and `mlir_loc.py` resolves those (including `#loc` aliases and fused locations)
into a `source_loc` on each parsed operation. Measured on prajjwal1/bert-tiny: 7,798 operations
carry a resolved location, covering 98 distinct source lines, and the busiest single line
(`torch.aten.scaled_dot_product_attention`) has 2,035 descendants across 12 stages.

On top of that raw index, `_hops_for_line` walks consecutive *phase* checkpoints and reports
the operation-name/count aggregate this line has at each one. It used to also classify each
step as Created/Modified/Lowered/Fused/Split/Eliminated, inferring a specific compiler
mechanism from nothing but a count delta -- verified wrong on real data (GPT-2's layer_norm:
"Fused" at the codegen -> hal boundary, when what actually happened is the dispatch became an
opaque hal.executable and the two leftover ops were incidental HAL bookkeeping, not layer_norm
at all). A count going up or down is real, observed evidence; which of split/fuse/lower/modify
produced it is not something a count alone can support, so this only reports "carried"
(exact same name-set and count -- the one claim a count actually proves) or "changed" (it
didn't), plus the counts and names themselves. Still Level 1: names and counts already
extracted during parsing, never operand/result/region matching (that would be Level 2), and
still scoped per comparison track for the same reason `StageDiff` is (build.py) -- module and
device-kernel tracks are two different views of the program, not a succession of one into the
other, so a count difference across that boundary would be an artifact of scope, not of
compilation.

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

# Mirrors analyzer/rules/base.py's confidence vocabulary without importing it -- lineage.py
# stays a self-contained, stdlib-only module, and the words matter more than sharing the
# constant: a "structural" hop is read straight off parsed names/counts, "heuristic" is
# inferred from absence, and "definitional" needs no evidence because it isn't a claim.
_STRUCTURAL = "structural"
_HEURISTIC = "heuristic"
_DEFINITIONAL = "definitional"

_MAX_NAMES_IN_DETAIL = 6


def _split_loc(source_loc: str) -> tuple | None:
    match = _LOC_TAIL.search(source_loc)
    if not match:
        return None
    return int(match.group(1)), int(match.group(2))


def _name_list(names: dict) -> str:
    """The names in `names`, already sorted rarest-first by `_by_rarity` -- least frequent
    (and therefore most identifying: a lone `math.rsqrt` says far more about what this line
    does than four more `arith.constant`s) shown first, with an honest `+N more` instead of
    silently dropping names once the display limit is hit.
    """
    ordered = list(names)
    shown = ordered[:_MAX_NAMES_IN_DETAIL]
    remaining = len(ordered) - len(shown)
    label = ", ".join(shown)
    return f"{label}, +{remaining} more" if remaining > 0 else label


def _by_rarity(counts: dict) -> dict:
    """Same (name -> count) data, ordered least-frequent-first.

    This is the single ordering both `_name_list`'s one-line detail and the frontend's op-name
    chips read (`hop.op_names` is emitted in this order) -- one sort, not two independently
    written ones that can drift, per the earlier `sourceLineNum < 3` lesson.
    """
    return dict(sorted(counts.items(), key=lambda kv: (kv[1], kv[0])))


def _classify(prev_names: dict, curr_names: dict) -> tuple:
    """One hop's (change, confidence, detail), from the op-name/count aggregate on each side.

    Only claims what a count/name-set comparison can actually prove: that nothing changed
    ("carried"), or that something did ("changed"). Earlier versions tried to name *which*
    compiler mechanism produced a count delta (split/fused/lowered/modified) -- dropped after
    finding a real case where that guessed wrong (see module docstring): a count drop at a
    codegen -> hal boundary read as "Fused" when the real story was the dispatch going opaque,
    not fusion. The names and counts are still shown in full; this just stops narrating them.
    """
    prev_total = sum(prev_names.values())
    curr_total = sum(curr_names.values())
    curr_label = _name_list(curr_names)

    if set(prev_names) == set(curr_names) and prev_total == curr_total:
        return "carried", _STRUCTURAL, f"Unchanged: still {curr_total} op(s) ({curr_label})."
    return (
        "changed",
        _STRUCTURAL,
        f"{curr_total} operation(s) here now (was {prev_total}): {curr_label}.",
    )


def _hops_for_line(
    hit_stage_ids: dict,
    stage_names: dict,
    by_id: dict,
    phase_track_order: dict,
    pass_children: dict,
) -> list:
    """The classified, phase-only trace for one source line -- see module docstring."""

    def pass_count(stage_id: str) -> int:
        # `Stage.parent_stage` holds the parent's machine *name*, not its id, so
        # `pass_children` is keyed by name too -- look the phase stage's name up first.
        parent_name = by_id[stage_id].name
        return sum(
            len(hit_stage_ids.get(child, ())) for child in pass_children.get(parent_name, ())
        )

    phase_hits = sorted(
        (sid for sid in hit_stage_ids if by_id[sid].kind == "phase"),
        key=lambda sid: by_id[sid].index,
    )

    hops: list = []
    prev_sid: str | None = None
    for sid in phase_hits:
        stage = by_id[sid]
        names = _by_rarity(stage_names[sid])
        total = sum(names.values())

        if prev_sid is None:
            hops.append(
                {
                    "kind": "origin",
                    "stage_id": sid,
                    "from_stage": None,
                    "change": "created",
                    "confidence": _DEFINITIONAL,
                    "from_count": None,
                    "to_count": total,
                    "op_names": names,
                    "detail": f"Origin: {total} operation(s) at this line ({_name_list(names)}).",
                    "pass_count": pass_count(sid),
                }
            )
        else:
            prev_stage = by_id[prev_sid]
            prev_names = _by_rarity(stage_names[prev_sid])
            if stage.track != prev_stage.track:
                # A track boundary is a change of *view* (e.g. whole-module vs. one extracted
                # device kernel), not a compilation step -- comparing counts across it would
                # claim a transformation the compiler never performed. Same guard build.py uses
                # before computing a StageDiff.
                hops.append(
                    {
                        "kind": "track-change",
                        "stage_id": sid,
                        "from_stage": prev_sid,
                        "change": "track-change",
                        "confidence": _DEFINITIONAL,
                        "from_count": sum(prev_names.values()),
                        "to_count": total,
                        "op_names": names,
                        "detail": (
                            f"Switched from the '{prev_stage.track}' track to the "
                            f"'{stage.track}' track -- a different view of the program, not a "
                            f"direct transformation between these two points."
                        ),
                        "pass_count": pass_count(sid),
                    }
                )
            else:
                change, confidence, detail = _classify(prev_names, names)
                hops.append(
                    {
                        "kind": "transition",
                        "stage_id": sid,
                        "from_stage": prev_sid,
                        "change": change,
                        "confidence": confidence,
                        "from_count": sum(prev_names.values()),
                        "to_count": total,
                        "op_names": names,
                        "detail": detail,
                        "pass_count": pass_count(sid),
                    }
                )
        prev_sid = sid

    if phase_hits:
        last_stage = by_id[phase_hits[-1]]
        track_list = phase_track_order.get(last_stage.track, [])
        position = track_list.index(last_stage.id) if last_stage.id in track_list else -1
        next_stage = by_id[track_list[position + 1]] if 0 <= position + 1 < len(track_list) else None
        if next_stage is not None and next_stage.id not in hit_stage_ids and next_stage.op_count > 0:
            hops.append(
                {
                    "kind": "elimination",
                    "stage_id": next_stage.id,
                    "from_stage": phase_hits[-1],
                    "change": "untraceable",
                    "confidence": _HEURISTIC,
                    "from_count": sum(dict(stage_names[phase_hits[-1]]).values()),
                    "to_count": 0,
                    "op_names": {},
                    "detail": (
                        f"No operations trace back to this line from '{next_stage.title}' "
                        f"onward in the '{next_stage.track}' track, though that stage still "
                        f"has {next_stage.op_count} operations from other lines. Absence, not "
                        f"a claim about why -- this could be a real removal, or just a place "
                        f"loc() metadata stopped surviving."
                    ),
                    "pass_count": 0,
                }
            )

    return hops


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
              "op_names": {"linalg.generic": 44, ...},     # what it became, most common first
              "hops": [ ... ]                               # classified phase-to-phase trace
            },
            ...
          }
        }

    `stages` values are line numbers rather than operation ids because the consumer is a text
    editor: highlighting means "these lines", and carrying ids would make the frontend do a
    second lookup for no benefit. `hops` is additive and phase-only (see module docstring) --
    nothing about `stages` or its consumers changes.
    """
    anchor = next((s for s in stages if s.name == _ANCHOR_STAGE), None)
    anchor_lines = (anchor.text or "").splitlines() if anchor else []
    by_id = {s.id: s for s in stages}

    # line -> stage_id -> [line numbers in that stage]
    hits: dict = defaultdict(lambda: defaultdict(list))
    # line -> stage_id -> {op_name: count}  -- what the hop classifier compares
    stage_names: dict = defaultdict(lambda: defaultdict(lambda: defaultdict(int)))
    # line -> op name -> count (aggregated across every stage; unchanged, existing consumer)
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
            stage_names[source_line][stage.id][op.name] += 1
            op_names[source_line][op.name] += 1

    # The anchor stage's own operations carry no source_loc -- they *are* the source, so nothing
    # points back at them. Without this, the index has no entry for the anchor stage itself and
    # the pane the user is hovering cannot highlight the line under their cursor.
    if anchor is not None:
        for op in anchor.ops:
            if op.line in hits:
                hits[op.line][anchor.id].append(op.line)
                stage_names[op.line][anchor.id][op.name] += 1

    # Phase-kind stages, grouped by track and index-ordered, so the hop classifier can find
    # "the next phase checkpoint in this same track" without rescanning every line.
    phase_track_order: dict = defaultdict(list)
    for stage in sorted(stages, key=lambda s: s.index):
        if stage.kind == "phase":
            phase_track_order[stage.track].append(stage.id)

    # Pass-kind stages (individual --mlir-print-ir-after-all snapshots) nested under the phase
    # stage they ran within, so a hop can report "+N pass snapshots" without listing them.
    pass_children: dict = defaultdict(list)
    for stage in stages:
        if stage.kind == "pass" and stage.parent_stage:
            pass_children[stage.parent_stage].append(stage.id)

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
            "hops": _hops_for_line(
                by_stage, stage_names[source_line], by_id, phase_track_order, pass_children
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
            "Level 1 lineage: grouped by the loc() metadata the compiler "
            "attached, with no structural matching and no inference. Operations the compiler did "
            "not locate are absent rather than guessed at.",
            f"Line numbers are positions in the '{_ANCHOR_STAGE}' stage, which is the anchor "
            f"every later stage's loc() points back to.",
            "`hops` reports the operation-name/count aggregate at this line, phase by phase -- "
            "still Level 1, not per-instance def/use tracking. Each hop is only ever `carried` "
            "(exact same name-set and count as the previous phase) or `changed` (it wasn't); "
            "it does not name which compiler mechanism produced a change, since a count delta "
            "alone cannot support that claim -- see ingest/lineage.py's module docstring for "
            "the case that showed this (a real GPT-2 layer_norm) where a naive count-based "
            "guess called an opaque-compilation event 'fusion'. `untraceable` marks absence in "
            "the next same-track phase stage and is marked heuristic -- it is not a claim about "
            "why the trace stops there.",
        ],
    }
