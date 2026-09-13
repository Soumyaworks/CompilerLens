"""LLVM IR and target-assembly extraction.

Same philosophy as mlir_parser: textual, heuristic, and honest about it. The frontend
displays these files verbatim; what we extract here drives the summaries and vectorisation
evidence.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Mapping

# "%5 = fmul <16 x float> %3, %4"  /  "store <16 x float> %x, ptr %y, align 64"
_LL_RESULT = re.compile(r"^(%[\w$.-]+)\s*=\s*(.*)$")
_LL_OPCODE = re.compile(r"^([a-z][a-z0-9_.]*)")
_LL_SSA = re.compile(r"%[\w$.-]+")
_LL_VECTOR_TYPE = re.compile(r"<(\d+) x ([\w*]+)>")
_LL_DBG_ATTACHMENT = re.compile(r"(?:^|[,\s])!dbg\s+!(\d+)\b")

# LLVM debug metadata is deliberately parsed as a small reference graph instead of with a
# single regex. A DILocation points at a scope, and that scope may reach its DIFile directly
# (DISubprogram) or through another scope (DILexicalBlock and friends).
_METADATA_DEF = re.compile(r"^!(\d+)\s*=\s*(?:distinct\s+)?!(\w+)\((.*)\)\s*$")
_METADATA_REF = re.compile(r"\b(file|scope|inlinedAt):\s*!(\d+)\b")
_METADATA_LINE = re.compile(r"\bline:\s*(\d+)\b")
_METADATA_STRING = re.compile(r'\b(filename|directory):\s*"((?:\\.|[^"\\])*)"')
_DISPATCH_SUFFIX = re.compile(r"(dispatch_\d+)\.mlir$")

# LLVM IR lines that are declarations or metadata rather than instructions.
_LL_SKIP = (
    ";",
    "!",
    "declare",
    "attributes",
    "source_filename",
    "target ",
    "@",
    "}",
    "{",
    "define",
)

# Coarse instruction classes, so the histogram stays readable. Order matters: the first
# matching class wins.
_LL_CLASSES: list[tuple[str, frozenset[str]]] = [
    ("memory", frozenset({"load", "store", "alloca", "getelementptr"})),
    ("float", frozenset({"fmul", "fadd", "fsub", "fdiv", "fneg", "fcmp", "fpext", "fptrunc"})),
    ("integer", frozenset({"add", "sub", "mul", "sdiv", "udiv", "and", "or", "xor", "shl",
                           "lshr", "ashr", "icmp", "zext", "sext", "trunc"})),
    ("control", frozenset({"br", "ret", "switch", "phi", "select", "unreachable"})),
    ("call", frozenset({"call", "invoke", "tail"})),
    ("vector", frozenset({"shufflevector", "extractelement", "insertelement", "extractvalue",
                          "insertvalue"})),
]

# Assembly: a mnemonic is indented and followed by whitespace or end of line.
_ASM_INSTR = re.compile(r"^([a-z][a-z0-9_.]*)(?:\s+(.*))?$")

# x86 SIMD register widths, which tell us the vector width the backend actually committed
# to -- %zmm is 512-bit, %ymm 256-bit, %xmm 128-bit.
_ASM_SIMD_REG = re.compile(r"%(zmm|ymm|xmm)\d+")


@dataclass(frozen=True)
class _DebugNode:
    kind: str
    line: int | None
    filename: str | None
    scope: str | None
    inlined_at: str | None


def _unescape_metadata_string(value: str) -> str:
    """Decode the small escape subset LLVM uses in file paths.

    LLVM also permits hexadecimal byte escapes. They are intentionally left untouched:
    such a filename will fail to match a dispatch dump and therefore remain unlinked,
    which is safer than decoding it incorrectly.
    """
    return value.replace(r'\"', '"').replace(r"\\", "\\")


def _parse_debug_metadata(text: str) -> tuple[dict[str, _DebugNode], dict[str, str]]:
    """Return debug nodes and metadata-id -> explicit file-id references."""
    nodes: dict[str, _DebugNode] = {}
    file_refs: dict[str, str] = {}
    for raw in text.splitlines():
        match = _METADATA_DEF.match(raw.strip())
        if not match:
            continue
        node_id, kind, payload = match.groups()
        refs = {name: target for name, target in _METADATA_REF.findall(payload)}
        strings = {
            name: _unescape_metadata_string(value)
            for name, value in _METADATA_STRING.findall(payload)
        }
        line_match = _METADATA_LINE.search(payload)
        nodes[node_id] = _DebugNode(
            kind=kind,
            line=int(line_match.group(1)) if line_match else None,
            filename=strings.get("filename"),
            scope=refs.get("scope"),
            inlined_at=refs.get("inlinedAt"),
        )
        if file_id := refs.get("file"):
            file_refs[node_id] = file_id
    return nodes, file_refs


def _scope_filename_with_files(
    node_id: str,
    nodes: Mapping[str, _DebugNode],
    file_refs: Mapping[str, str],
    seen: frozenset[str] = frozenset(),
) -> str | None:
    if node_id in seen:
        return None
    node = nodes.get(node_id)
    if node is None:
        return None
    if node.kind == "DIFile":
        return node.filename
    if file_id := file_refs.get(node_id):
        if filename := _scope_filename_with_files(file_id, nodes, file_refs, seen | {node_id}):
            return filename
    if node.scope:
        return _scope_filename_with_files(node.scope, nodes, file_refs, seen | {node_id})
    return None


def _dispatch_map_for_file(
    filename: str,
    dispatch_sources: Mapping[str, Mapping[int, str]],
) -> Mapping[int, str] | None:
    """Find a dispatch map by exact path or basename.

    Dump directories are often moved after compilation, so DIFile.directory may be stale.
    The generated dispatch basename is stable and unique within one compilation. Callers
    build this mapping from that compilation only, making basename matching precise here.
    """
    if filename in dispatch_sources:
        return dispatch_sources[filename]
    basename = filename.replace("\\", "/").rsplit("/", 1)[-1]
    if line_map := dispatch_sources.get(basename):
        return line_map
    # Older hand-authored examples shortened the generated dispatch filename. The numeric
    # dispatch identity is compiler-generated and unique within one module; build.py only
    # registers this alias when it is unique.
    if match := _DISPATCH_SUFFIX.search(basename):
        return dispatch_sources.get(match.group(1))
    return None


def _resolve_debug_source_loc(
    debug_id: str,
    nodes: Mapping[str, _DebugNode],
    file_refs: Mapping[str, str],
    dispatch_sources: Mapping[str, Mapping[int, str]],
    seen: frozenset[str] = frozenset(),
) -> str | None:
    """Resolve ``!dbg`` to an original MLIR source location, without guessing."""
    if debug_id in seen:
        return None
    node = nodes.get(debug_id)
    if node is None or node.kind != "DILocation":
        return None

    if node.line is not None and node.scope:
        filename = _scope_filename_with_files(node.scope, nodes, file_refs)
        if filename and (line_map := _dispatch_map_for_file(filename, dispatch_sources)):
            if source_loc := line_map.get(node.line):
                return source_loc

    # For an inlined runtime/helper instruction, the primary scope may name a C/C++ file;
    # inlinedAt is the compiler-recorded call site in the generated dispatch MLIR. Only use
    # it when the primary location did not resolve.
    if node.inlined_at:
        return _resolve_debug_source_loc(
            node.inlined_at,
            nodes,
            file_refs,
            dispatch_sources,
            seen | {debug_id},
        )
    return None


def _classify_ll(opcode: str) -> str:
    for name, opcodes in _LL_CLASSES:
        if opcode in opcodes:
            return name
    return "other"


def parse_llvm_ir(
    text: str,
    stage_id: str,
    dispatch_sources: Mapping[str, Mapping[int, str]] | None = None,
) -> list[dict]:
    """Extract instructions from LLVM IR (.ll) text.

    When dispatch source maps are supplied, resolve the compiler's exact debug chain:
    ``!dbg -> DILocation -> DI scope/file -> dispatch MLIR line -> Torch loc()``.
    Missing links stay unlocated.
    """
    debug_nodes, file_refs = _parse_debug_metadata(text) if dispatch_sources else ({}, {})
    ops: list[dict] = []
    for lineno, raw in enumerate(text.splitlines(), start=1):
        line = raw.strip()
        if not line or line.startswith(_LL_SKIP):
            continue

        results: list[str] = []
        remainder = line
        match_result = _LL_RESULT.match(line)
        if match_result:
            results = [match_result.group(1)]
            remainder = match_result.group(2).strip()

        match_opcode = _LL_OPCODE.match(remainder)
        if not match_opcode:
            continue
        opcode = match_opcode.group(1)

        # "tail call" and friends -- report the meaningful opcode, not the marker.
        if opcode in ("tail", "musttail", "notail"):
            follow = _LL_OPCODE.match(remainder[len(opcode) :].strip())
            if follow:
                opcode = follow.group(1)

        types = [f"<{n} x {t}>" for n, t in _LL_VECTOR_TYPE.findall(remainder)]
        op = {
            "id": f"{stage_id}:op{lineno}",
            "stage_id": stage_id,
            "line": lineno,
            "name": opcode,
            "dialect": _classify_ll(opcode),
            "results": results,
            "operands": [s for s in _LL_SSA.findall(remainder) if s not in results],
            "types": types,
            "text": line if len(line) <= 400 else line[:397] + "...",
        }
        if dispatch_sources and (debug_match := _LL_DBG_ATTACHMENT.search(line)):
            op["source_loc"] = _resolve_debug_source_loc(
                debug_match.group(1), debug_nodes, file_refs, dispatch_sources
            )
        ops.append(op)
    return ops


def parse_asm(text: str, stage_id: str) -> list[dict]:
    """Extract instructions from target assembly (.s) text.

    Only indented mnemonics count: directives start with "." at column 0 and labels end
    with ":", so requiring indentation cheaply excludes both.
    """
    ops: list[dict] = []
    for lineno, raw in enumerate(text.splitlines(), start=1):
        if not raw[:1].isspace():
            continue
        line = raw.strip()
        if not line or line.startswith((".", "#", "//")) or line.endswith(":"):
            continue

        match_instr = _ASM_INSTR.match(line)
        if not match_instr:
            continue
        mnemonic = match_instr.group(1)
        operand_text = match_instr.group(2) or ""
        simd = _ASM_SIMD_REG.findall(operand_text)
        ops.append(
            {
                "id": f"{stage_id}:op{lineno}",
                "stage_id": stage_id,
                "line": lineno,
                "name": mnemonic,
                # Group by SIMD register width when present, which makes vectorised code
                # immediately visible in the histogram.
                "dialect": f"simd-{simd[0]}" if simd else "scalar",
                "results": [],
                "operands": [o.strip() for o in operand_text.split(",") if o.strip()],
                "types": [],
                "text": line if len(line) <= 400 else line[:397] + "...",
            }
        )
    return ops


def vector_width_summary(ops: list[dict]) -> dict[str, int]:
    """Count LLVM vector types by lane count, e.g. {"<16 x float>": 949}.

    This is the direct evidence that vectorisation happened, and it is what Stage 3 cross
    references against the target's native_vector_size.
    """
    counts: dict[str, int] = {}
    for op in ops:
        for type_name in op["types"]:
            counts[type_name] = counts.get(type_name, 0) + 1
    return dict(sorted(counts.items(), key=lambda kv: -kv[1]))


def histogram(ops: list[dict], key: str = "name") -> dict[str, int]:
    counts: dict[str, int] = {}
    for op in ops:
        counts[op[key]] = counts.get(op[key], 0) + 1
    return dict(sorted(counts.items(), key=lambda kv: (-kv[1], kv[0])))
