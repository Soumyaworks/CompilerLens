"""Line-based MLIR operation extraction.

This is deliberately a *heuristic textual* parser, not a real MLIR parser. We have no
bindings available (pip is unavailable -- see PLAN.md) and, more importantly, we do not
need semantic fidelity: the frontend shows the IR verbatim, and this parser only feeds the
stage summaries, dialect histograms, and the op index that lineage will later build on.

Where it is uncertain it under-reports rather than inventing operations, because a wrong
op count is worse than a slightly low one for a tool whose whole premise is trustworthy
compiler observability.
"""

from __future__ import annotations

import re

from .mlir_loc import collect_aliases, parse_source_loc, strip_locations

# "%4 = ", "%x, %y, %z = ", "%cst = ", "%device_0 = "
_RESULTS = re.compile(r"^((?:%[\w$.#-]+)(?:\s*,\s*%[\w$.#-]+)*)\s*=\s*(.*)$")

# A fully qualified op name: dialect.op, where the op part may itself contain dots
# ("iree_tensor_ext.dispatch.tensor.load").
_OP_NAME = re.compile(r"^([a-z_][\w]*(?:\.[a-zA-Z_$][\w$]*)+)")

# An attribute assignment inside a multi-line dictionary ("iree.abi.stub = true") looks
# exactly like a result-less operation, so we reject those explicitly.
_ATTR_ASSIGN = re.compile(r"^[\w.$]+\s*=")

_SSA = re.compile(r"%[\w$.#-]+")

# Aggregate types, plus bare scalars. The aggregate pattern stops at the first ">" so it
# mis-slices deeply nested types such as
# !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>>; that is acceptable here
# because these strings are only used as lineage hints, never re-parsed as types.
_TYPE_PATTERNS = [
    re.compile(r"!?[\w.]*\b(?:tensor|vector|memref)<[^<>]*>"),
    re.compile(r"!(?:torch|hal|util|stream|flow)\.[\w.]+"),
    re.compile(r"\b(?:[fi](?:8|16|32|64)|index|bf16)\b"),
]

# "128x128xf32" -- the shape signature is what actually lets us recognise the same
# computation after it has been renamed, outlined, and lowered.
_SHAPE = re.compile(r"\b\d+(?:x\d+)*x(?:[fi](?:8|16|32|64)|bf16|index)\b")

# Structural lines that carry no operation.
_SKIP_PREFIXES = ("//", "#", "^bb", "}", ")", "->", "{", "]", "\"")


def _extract_types(text: str) -> list[str]:
    found: list[str] = []
    for pattern in _TYPE_PATTERNS:
        for match in pattern.findall(text):
            if match not in found:
                found.append(match)
    return found


def shape_signature(text: str) -> list[str]:
    """Shape/element-type signatures in a line, e.g. ["128x128xf32"]."""
    out: list[str] = []
    for match in _SHAPE.findall(text):
        if match not in out:
            out.append(match)
    return out


# The generic MLIR trailer holding `dialect_resources` (large constants -- model weights,
# in practice) is delimited by a line consisting of exactly "{-#" through a matching "#-}".
# It is never operations, and a workload with real parameters embeds its weights there as a
# single line of hex that can run past 100KB (confirmed: 131,130 characters for a 128x128
# f32 tensor). That single line matches _OP_NAME (dialect_resources entries look exactly
# like "name.qualified.path: ..." to that regex) and, lacking any loc(...) to strip it back
# down, feeds the full blob into _extract_types' regexes -- which then re-attempt a match at
# every one of ~10^5 starting positions, each backtracking across the remaining hex run
# looking for "tensor"/"vector"/"memref" that is never there. That's the quadratic blowup
# that turned a sub-second build into multiple minutes. Truncating the trailer up front is
# the principled fix: this text was never operations to begin with.
_RESOURCE_TRAILER = re.compile(r"^\{-#\s*$", re.M)

# Defense in depth for any other pathologically long non-operation line the trailer skip
# doesn't anticipate: an MLIR op line, even with attributes, does not run past this in any
# dump we've seen (the largest legitimate one, a fused DWARF loc(), collapses to a short
# remainder once strip_locations trims the location -- see below). A line still this long
# after that trim is not worth attempting to type-extract.
_MAX_OP_LINE = 20_000


def parse_operations(ir_text: str, stage_id: str) -> list[dict]:
    """Extract operations from MLIR text.

    Returns plain dicts rather than Operation instances to keep this module free of schema
    imports; build.py does the conversion.
    """
    if trailer := _RESOURCE_TRAILER.search(ir_text):
        ir_text = ir_text[: trailer.start()]

    aliases = collect_aliases(ir_text)
    ops: list[dict] = []
    for lineno, raw in enumerate(ir_text.splitlines(), start=1):
        line = raw.strip()
        if not line or line.startswith(_SKIP_PREFIXES):
            continue

        results: list[str] = []
        remainder = line

        match_results = _RESULTS.match(line)
        if match_results:
            results = [r.strip() for r in match_results.group(1).split(",")]
            remainder = match_results.group(2).strip()
        elif _ATTR_ASSIGN.match(line):
            # "iree.abi.stub = true" inside a wrapped attribute dictionary.
            continue

        match_name = _OP_NAME.match(remainder)
        if not match_name:
            continue

        name = match_name.group(1)
        # A qualified name at the very start of an otherwise unstructured line is only an
        # operation if something delimits it -- otherwise we are looking at a fragment of a
        # wrapped type or attribute.
        tail = remainder[len(name) :]
        if tail and tail[0] not in " (<{[@%:,\"":
            continue

        # Strip the trailing loc(...) before extracting operands and types, so location
        # metadata does not pollute either. Fused DWARF locations in particular contain
        # hundreds of type-like tokens.
        remainder_no_loc = strip_locations(remainder) or remainder
        tail_no_loc = remainder_no_loc[len(name) :] if remainder_no_loc.startswith(name) else tail

        # Defense in depth: if the line is still enormous after stripping locations, it
        # almost certainly is not a real operation (see _RESOURCE_TRAILER above for the
        # known case). Record it with its name and line number -- still real, still
        # navigable -- but skip the expensive regex extraction rather than risk the same
        # near-quadratic scan on whatever produced it.
        if len(remainder_no_loc) > _MAX_OP_LINE:
            ops.append(
                {
                    "id": f"{stage_id}:op{lineno}",
                    "stage_id": stage_id,
                    "line": lineno,
                    "name": name,
                    "dialect": name.split(".", 1)[0],
                    "results": results,
                    "operands": [],
                    "types": [],
                    "text": f"{line[:200]}... [{len(line)} chars, not further parsed]",
                    "source_loc": parse_source_loc(line, aliases),
                }
            )
            continue

        operands = [s for s in _SSA.findall(tail_no_loc) if s not in results]
        ops.append(
            {
                "id": f"{stage_id}:op{lineno}",
                "stage_id": stage_id,
                "line": lineno,
                "name": name,
                "dialect": name.split(".", 1)[0],
                "results": results,
                "operands": operands,
                "types": _extract_types(remainder_no_loc),
                "text": line if len(line) <= 400 else line[:397] + "...",
                "source_loc": parse_source_loc(line, aliases),
            }
        )
    return ops


def dialect_histogram(ops: list[dict]) -> dict[str, int]:
    """Operation counts per dialect, most frequent first."""
    counts: dict[str, int] = {}
    for op in ops:
        counts[op["dialect"]] = counts.get(op["dialect"], 0) + 1
    return dict(sorted(counts.items(), key=lambda kv: (-kv[1], kv[0])))
