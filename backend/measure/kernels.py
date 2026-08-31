"""Per-kernel cost model: what each dispatch costs in arithmetic and in memory traffic.

**Why this is a model and not a measurement.** I tried timing individual dispatches with
`iree-benchmark-executable` first. It runs, but it is the wrong tool for this job:

  - Every `hal.executable.export` is `ordinal(0)` within its own executable, and the linked
    `.so` exposes them by a global ordinal the IR never states -- so mapping ordinal to kernel
    means guessing.
  - Workgroup counts are computed at runtime
    (`iree_tensor_ext.dispatch.workgroup_count_from_slice`), not declared, so there is no
    static value to pass to `--workgroup_count`.
  - Wrong guesses do not error. Probing all 12 ordinals with plausible bindings returned
    **0.0000 ns for 11 of them** -- the kernels returned without doing their work. A tool that
    silently reports zero for a matmul is a tool that will silently produce a wrong answer.

So this module derives cost from what the compiler *states* rather than from a benchmark I
cannot trust. IREE names its own kernels after their shapes
(`dispatch_13_batch_matmul_1x32x512x128_f32`), which is enough for FLOPs and bytes. Every
number here is labelled `modelled`, never `measured`, and the whole-model timing from
`bench.py` is the measured figure it sits beside.

That distinction is the point: a modelled share of arithmetic is genuinely useful, and calling
it a measurement would be exactly the overclaim this project exists to avoid.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field

_F32_BYTES = 4

# IREE's kernel names carry the shape: dispatch_13_batch_matmul_1x32x512x128_f32
_KERNEL_NAME = re.compile(r"(dispatch_\d+)_([a-z_]+?)_((?:\d+x)+\d+)(?:_[a-z0-9x]+)?$")
_ANY_DISPATCH = re.compile(r"@([A-Za-z_$][\w$]*dispatch_\d+_[a-z0-9_]+)")

# Fused multiply-add counts as two floating point operations.
_FLOPS_PER_FMA = 2


@dataclass
class KernelCost:
    name: str
    short_name: str
    kind: str  # matmul | attention | reduction | elementwise | transpose | other
    dims: list
    flops: int | None  # None when the shape does not determine it
    bytes_moved: int
    arithmetic_intensity: float | None  # FLOPs per byte
    bound_by: str  # "compute" | "memory" | "unknown"
    note: str = ""

    def as_dict(self) -> dict:
        return {
            "name": self.name,
            "short_name": self.short_name,
            "kind": self.kind,
            "dims": self.dims,
            "flops": self.flops,
            "bytes_moved": self.bytes_moved,
            "arithmetic_intensity": (
                round(self.arithmetic_intensity, 2) if self.arithmetic_intensity is not None else None
            ),
            "bound_by": self.bound_by,
            "note": self.note,
        }


@dataclass
class MachinePeak:
    """Theoretical peak, computed from what the benchmark tool reports about the host.

    Deliberately derived rather than hardcoded: the same code gives an honest roofline on a
    different machine, and the inputs are all things the tooling states about itself.
    """

    cores: int
    mhz: float
    vector_lanes: int  # native_vector_size / 4 for f32
    peak_gflops: float
    note: str = ""

    def as_dict(self) -> dict:
        return {
            "cores": self.cores,
            "mhz": self.mhz,
            "vector_lanes": self.vector_lanes,
            "peak_gflops": round(self.peak_gflops, 1),
            "note": self.note,
        }


def machine_peak(cores: int, mhz: float, native_vector_bytes: int) -> MachinePeak:
    lanes = max(native_vector_bytes // _F32_BYTES, 1)
    # cores x clock x lanes x 2 (an FMA is two FLOPs). One FMA per cycle per core is the
    # conservative assumption: superscalar cores can issue more, so this is a floor on peak,
    # which keeps any "percent of peak" figure from flattering the result.
    peak = cores * mhz * 1e6 * lanes * _FLOPS_PER_FMA / 1e9
    return MachinePeak(
        cores=cores,
        mhz=mhz,
        vector_lanes=lanes,
        peak_gflops=peak,
        note=(
            f"{cores} cores x {mhz:.0f} MHz x {lanes} f32 lanes x 2 (FMA), assuming one FMA "
            f"per cycle per core. A conservative floor -- real peak may be higher, so a "
            f"percent-of-peak figure computed from it will not flatter the result."
        ),
    )


def _classify(kind_words: str) -> str:
    for key in ("batch_matmul", "matmul"):
        if key in kind_words:
            return "matmul"
    for key in ("attention", "reduction", "transpose", "elementwise", "pack", "unpack", "copy"):
        if key in kind_words:
            return "transpose" if key == "transpose" else key
    return "other"


def _flops_and_bytes(kind: str, dims: list) -> tuple:
    """(flops, bytes, note). flops is None when the name does not determine it."""
    if kind == "matmul":
        if len(dims) == 4:  # B x M x K x N
            batch, m, k, n = dims
            flops = _FLOPS_PER_FMA * batch * m * k * n
            # Two operands in, one result out.
            moved = (batch * m * k + batch * k * n + batch * m * n) * _F32_BYTES
            return flops, moved, ""
        if len(dims) == 3:  # M x K x N
            m, k, n = dims
            return _FLOPS_PER_FMA * m * k * n, (m * k + k * n + m * n) * _F32_BYTES, ""

    elements = 1
    for d in dims:
        elements *= d

    if kind in {"elementwise", "transpose", "copy", "pack", "unpack"}:
        # Read once, write once. Arithmetic is negligible by definition for these.
        return None, elements * _F32_BYTES * 2, "memory-bound by construction: little arithmetic per byte"
    if kind == "reduction":
        return None, elements * _F32_BYTES, "reduces its input; output is much smaller"
    if kind == "attention":
        return None, elements * _F32_BYTES * 2, "shape does not determine FLOPs for a fused attention kernel"
    return None, elements * _F32_BYTES, ""


def parse_kernel(symbol: str) -> KernelCost | None:
    """Cost model for one dispatch, from its name. None if the name is not parseable."""
    short = re.search(r"(dispatch_\d+_[a-z0-9_]+)", symbol)
    if not short:
        return None
    match = _KERNEL_NAME.match(short.group(1))
    if not match:
        return KernelCost(
            name=symbol,
            short_name=short.group(1),
            kind="other",
            dims=[],
            flops=None,
            bytes_moved=0,
            arithmetic_intensity=None,
            bound_by="unknown",
            note="kernel name does not carry a shape, so no cost could be modelled",
        )

    _, kind_words, shape = match.groups()
    dims = [int(x) for x in shape.split("x")]
    kind = _classify(kind_words)
    flops, moved, note = _flops_and_bytes(kind, dims)

    intensity = (flops / moved) if (flops and moved) else None
    if intensity is None:
        bound_by = "memory" if kind in {"elementwise", "transpose", "copy", "reduction"} else "unknown"
    else:
        # Ridge point: below ~10 FLOPs/byte a kernel is limited by bandwidth on typical CPUs,
        # above it by arithmetic. A rule of thumb, labelled as one.
        bound_by = "compute" if intensity > 10 else "memory"

    return KernelCost(
        name=symbol,
        short_name=short.group(1),
        kind=kind,
        dims=dims,
        flops=flops,
        bytes_moved=moved,
        arithmetic_intensity=intensity,
        bound_by=bound_by,
        note=note,
    )


def analyse_kernels(ir_text: str, peak: MachinePeak | None = None) -> dict:
    """Model every dispatch in a codegen-stage dump, ranked by modelled arithmetic."""
    symbols = sorted(set(_ANY_DISPATCH.findall(ir_text)))
    kernels = [k for k in (parse_kernel(s) for s in symbols) if k is not None]
    if not kernels:
        return {}

    total_flops = sum(k.flops or 0 for k in kernels)
    total_bytes = sum(k.bytes_moved for k in kernels)

    ranked = []
    for kernel in sorted(kernels, key=lambda k: (-(k.flops or 0), -k.bytes_moved)):
        entry = kernel.as_dict()
        entry["flops_share"] = round(kernel.flops / total_flops, 4) if (kernel.flops and total_flops) else None
        entry["bytes_share"] = round(kernel.bytes_moved / total_bytes, 4) if total_bytes else None
        ranked.append(entry)

    memory_bound = [k for k in kernels if k.bound_by == "memory"]

    return {
        "basis": "modelled",  # never "measured" -- see the module docstring
        "kernels": ranked,
        "totals": {
            "kernel_count": len(kernels),
            "total_flops": total_flops,
            "total_bytes": total_bytes,
            "memory_bound_kernels": len(memory_bound),
            "arithmetic_intensity": round(total_flops / total_bytes, 2) if total_bytes else None,
        },
        "machine": peak.as_dict() if peak else None,
        "notes": [
            "FLOPs and bytes are DERIVED FROM KERNEL NAMES, which IREE writes to describe each "
            "dispatch's shape. They are a model of the work, not a measurement of it.",
            "Per-kernel wall-clock time is deliberately absent. iree-benchmark-executable needs "
            "workgroup counts that IREE computes at runtime and never states, and probing with "
            "guessed values returned 0.0000 ns for 11 of 12 kernels -- silently wrong rather "
            "than an error. The measured figure in this tool is whole-model time from bench.py.",
            "The compute/memory verdict uses a ~10 FLOPs-per-byte ridge point, a rule of thumb "
            "for CPUs rather than a property of this machine.",
        ],
    }


def roofline(model: dict, measured_ms: float | None) -> dict:
    """Achieved GFLOP/s against theoretical peak, when a measured whole-model time exists.

    Only whole-model, because only whole-model time is measured. Attributing this per kernel
    would require the per-kernel timings that could not be obtained honestly.
    """
    machine = model.get("machine")
    total_flops = (model.get("totals") or {}).get("total_flops")
    if not (machine and total_flops and measured_ms):
        return {}

    achieved_gflops = total_flops / (measured_ms / 1e3) / 1e9
    fraction = achieved_gflops / machine["peak_gflops"] if machine["peak_gflops"] else None

    return {
        "achieved_gflops": round(achieved_gflops, 2),
        "peak_gflops": machine["peak_gflops"],
        "fraction_of_peak": round(fraction, 4) if fraction else None,
        "basis": "modelled FLOPs over measured whole-model time",
        "note": (
            "The FLOP count is modelled from kernel shapes; the time is measured. So this is a "
            "sound order-of-magnitude figure and not a precise efficiency number. A low "
            "percentage on a small model is expected: fixed per-dispatch overhead dominates "
            "when there is little arithmetic to amortise it against."
        ),
    }
