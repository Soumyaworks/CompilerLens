"""Parse IREE/MLIR `--mlir-print-ir-after-all` logs into per-pass IR snapshots.

This is what closes the codegen gap described in PLAN.md. The log format is:

    // -----// IR Dump After GenericVectorizationPass (iree-codegen-generic-vectorization) //----- //
    <IR>

Two things make this harder than splitting on the header.

**Scope varies.** A nested pass prints only the operation it ran on, not the whole module,
so consecutive dumps are frequently different functions. Comparing dump N against dump N-1
regardless of scope produces meaningless diffs, so dumps are grouped by scope and
`changed` is computed only within a group.

**Most passes change nothing.** 946 dumps in the matmul log contain 571 distinct IR states;
the rest are passes that ran and did nothing. Compiler Explorer's LLVM pass-dump parser
carries the same `irChanged` flag for the same reason -- showing every pass buries the ones
that matter.

Standard library only.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field

from .mlir_loc import collect_aliases

_HEADER = re.compile(
    r'^// -----// IR Dump After (\S+?)(?: \(([^)]*)\))? //----- //$',
    re.M,
)

# Lines that carry no structural information when identifying a dump's scope.
_SCOPE_SKIP_PREFIXES = ('//', '#')


@dataclass
class PassDump:
    index: int  # position in the log, 0-based
    pass_name: str  # "GenericVectorizationPass"
    pass_arg: str | None  # "iree-codegen-generic-vectorization"
    scope: str  # normalized signature of the printed operation
    text: str
    changed: bool = True  # differs from the previous dump in the same scope
    aliases: dict[str, str] = field(default_factory=dict)

    @property
    def display_name(self) -> str:
        """Pass name without the C++ namespace noise and the redundant Pass suffix."""
        name = self.pass_name.rsplit('::', 1)[-1]
        return name[:-4] if name.endswith('Pass') and len(name) > 4 else name


def _scope_of(text: str) -> str:
    """Signature of the operation a dump was printed for.

    Uses the first structural line, skipping comments and `#loc`/attribute-alias
    definitions, then truncates: what matters is grouping dumps of the same function
    together, not preserving the full signature.
    """
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith(_SCOPE_SKIP_PREFIXES):
            continue
        return stripped[:120]
    return '<empty>'


def parse_pass_log(log_text: str) -> list[PassDump]:
    """Split a pass log into dumps, grouped and marked for change within each scope."""
    headers = list(_HEADER.finditer(log_text))
    dumps: list[PassDump] = []

    for position, header in enumerate(headers):
        body_start = header.end()
        body_end = headers[position + 1].start() if position + 1 < len(headers) else len(log_text)
        body = log_text[body_start:body_end].strip('\n')
        if not body.strip():
            continue
        dumps.append(
            PassDump(
                index=len(dumps),
                pass_name=header.group(1),
                pass_arg=header.group(2),
                scope=_scope_of(body),
                text=body,
                aliases=collect_aliases(body),
            )
        )

    # `changed` is per-scope: the previous dump of the *same* operation is the meaningful
    # comparison, not the previous dump in the log.
    last_text_by_scope: dict[str, str] = {}
    for dump in dumps:
        previous = last_text_by_scope.get(dump.scope)
        dump.changed = previous is None or previous != dump.text
        last_text_by_scope[dump.scope] = dump.text

    return dumps


def select_track(dumps: list[PassDump], scope_contains: str) -> list[PassDump]:
    """Dumps whose scope mentions `scope_contains`, in log order.

    Used to pull out a single function's pass history -- for the matmul example, the
    dispatch kernel, whose codegen is the sequence the pipeline never showed.
    """
    return [d for d in dumps if scope_contains in d.scope]


def summarize(dumps: list[PassDump]) -> dict[str, int]:
    """Counts for reporting what a log contained and what was filtered out."""
    return {
        'dumps': len(dumps),
        'changed': sum(1 for d in dumps if d.changed),
        'scopes': len({d.scope for d in dumps}),
        'passes': len({d.pass_name for d in dumps}),
    }
