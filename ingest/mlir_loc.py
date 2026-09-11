"""MLIR location metadata: parsing it, and stripping it for display.

The regenerated dumps carry `loc(...)` on nearly every operation, which is what makes
Level-1 lineage possible: an operation in a late stage still names
the line of `ir_00_torch_input.mlir` it came from. It also makes the IR considerably harder
to read, so the viewer can strip it -- Compiler Explorer's opt-pipeline view has the same
`filterDebugInfo` option for the same reason.

Three location forms appear in these dumps and all must be handled:

    loc("ir_00_torch_input.mlir":3:10)     direct
    loc(#loc2)                             alias, defined by a `#loc2 = loc(...)` line
    loc(unknown)                           no location
    loc(fused<#llvm.di_subprogram<...>>[...])   DWARF debug info, several KB on one line

Standard library only.
"""

from __future__ import annotations

import re

# `#loc2 = loc("file":3:10)` preamble/trailer lines that define aliases.
_ALIAS_DEF = re.compile(r'^#(loc[\w]*)\s*=\s*loc\((.*)\)\s*$')

# The payload of a direct location: "file":line:col
_FILE_LINE_COL = re.compile(r'^"([^"]*)":(\d+):(\d+)$')


def _find_balanced(text: str, start: int) -> int:
    """Index just past the ')' matching the '(' at `start`.

    Tracks quotes because fused DWARF locations embed parentheses and brackets inside
    string attributes, where a naive depth counter would terminate early. Returns -1 if
    unbalanced.
    """
    depth = 0
    in_string = False
    index = start
    while index < len(text):
        char = text[index]
        if in_string:
            if char == '\\':
                index += 2
                continue
            if char == '"':
                in_string = False
        elif char == '"':
            in_string = True
        elif char == '(':
            depth += 1
        elif char == ')':
            depth -= 1
            if depth == 0:
                return index + 1
        index += 1
    return -1


def _loc_spans(line: str) -> list[tuple[int, int]]:
    """Spans of every `loc(...)` occurrence in a line, outermost only."""
    spans: list[tuple[int, int]] = []
    search_from = 0
    while True:
        found = line.find('loc(', search_from)
        if found == -1:
            return spans
        # Must be a standalone token, not the tail of an identifier such as `myloc(`.
        if found > 0 and (line[found - 1].isalnum() or line[found - 1] in '_.$'):
            search_from = found + 4
            continue
        end = _find_balanced(line, found + 3)
        if end == -1:
            return spans
        spans.append((found, end))
        search_from = end


def collect_aliases(text: str) -> dict[str, str]:
    """Map alias name -> location payload, from `#locN = loc(...)` lines."""
    aliases: dict[str, str] = {}
    for line in text.splitlines():
        match = _ALIAS_DEF.match(line.strip())
        if match:
            aliases[match.group(1)] = match.group(2).strip()
    return aliases


def resolve(payload: str, aliases: dict[str, str], _depth: int = 0) -> str:
    """Follow `#locN` indirection to a concrete payload."""
    payload = payload.strip()
    if _depth > 8:  # cycle guard; malformed input should not hang the build
        return payload
    if payload.startswith('#'):
        target = aliases.get(payload[1:])
        if target is not None:
            return resolve(target, aliases, _depth + 1)
    return payload


def parse_source_loc(line: str, aliases: dict[str, str]) -> str | None:
    """The source location for an operation line, as "file:line:col".

    Returns None for `loc(unknown)`, for absent locations, and for fused DWARF locations
    whose payload has no single source position -- reporting a location we did not actually
    resolve would corrupt the lineage anchor, which is the one thing this must not do.
    """
    spans = _loc_spans(line)
    if not spans:
        return None

    # The operation's own location is the last one on the line; earlier ones belong to
    # nested attributes or block arguments.
    start, end = spans[-1]
    payload = resolve(line[start + 4 : end - 1], aliases)

    match = _FILE_LINE_COL.match(payload)
    if match:
        return f'{match.group(1)}:{match.group(2)}:{match.group(3)}'

    # Fused locations still embed a trailing ["file":line:col]; use it when present.
    trailing = re.search(r'\["([^"]*)":(\d+):(\d+)\]\s*$', payload)
    if trailing:
        return f'{trailing.group(1)}:{trailing.group(2)}:{trailing.group(3)}'
    return None


def strip_locations(text: str) -> str:
    """Remove `loc(...)` suffixes and alias-definition lines, for readable display.

    Purely presentational -- the artifact always keeps the original text as well, so the
    unfiltered IR remains available and authoritative.
    """
    out: list[str] = []
    for line in text.splitlines():
        if _ALIAS_DEF.match(line.strip()):
            continue
        spans = _loc_spans(line)
        if spans:
            # Remove right-to-left so earlier offsets stay valid.
            for start, end in reversed(spans):
                line = line[:start] + line[end:]
            line = line.rstrip()
            # A line that held nothing but a location is dropped entirely.
            if not line.strip():
                continue
        out.append(line)
    return '\n'.join(out)
