"""LLVM IR and target-assembly extraction.

Same philosophy as mlir_parser: textual, heuristic, and honest about it. The frontend
displays these files verbatim; what we extract here drives the summaries and, for the
Optimization Doctor in Stage 3, the vectorisation evidence.
"""

from __future__ import annotations

import re

# "%5 = fmul <16 x float> %3, %4"  /  "store <16 x float> %x, ptr %y, align 64"
_LL_RESULT = re.compile(r"^(%[\w$.-]+)\s*=\s*(.*)$")
_LL_OPCODE = re.compile(r"^([a-z][a-z0-9_.]*)")
_LL_SSA = re.compile(r"%[\w$.-]+")
_LL_VECTOR_TYPE = re.compile(r"<(\d+) x ([\w*]+)>")

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


def _classify_ll(opcode: str) -> str:
    for name, opcodes in _LL_CLASSES:
        if opcode in opcodes:
            return name
    return "other"


def parse_llvm_ir(text: str, stage_id: str) -> list[dict]:
    """Extract instructions from LLVM IR (.ll) text."""
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
        ops.append(
            {
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
        )
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
