"""Run one model through several compiler configurations and explain the differences.

The output is the point: not just "A is 33x faster than B", but *which line of IR says why*.
Attributions are read out of the compiled artifacts -- vector widths, FMA counts, dispatch
counts -- and the prose is a template filled from those measured values. Nothing here infers
or guesses, for the same reason ingest/build.py quotes the compiler rather than interpreting
it: an unsourced claim is exactly what this project exists to avoid.
"""

from __future__ import annotations

import re
import shutil
import subprocess
import time
from dataclasses import dataclass, field
from pathlib import Path

import iree.turbine.aot as aot

from backend.measure.bench import BenchResult, benchmark_module, compare_timings
from backend.measure.variants import Dimension, Variant

# Signals we read out of the compiled output to explain a timing difference. Each is a fact
# the compiler emitted, not an interpretation of one.
_VECTOR_TYPE = re.compile(r"<(\d+) x (?:float|i\d+)>")
_FMA = re.compile(r"\bvfmadd\d+ps\b")
_DISPATCH = re.compile(r"hal\.executable private @(\S+)")
_NATIVE_VECTOR_SIZE = re.compile(r"native_vector_size\s*=\s*(\d+)")

# Stages compiled per variant. Deliberately few: a comparison needs the codegen result and
# the machine code, not all 41 stages. Keeps a variant to ~1-2s.
_COMPARE_STAGES = ("executable-configurations", "executable-targets")


@dataclass
class Attribution:
    metric: str
    value_a: str
    value_b: str
    source: str  # which file the two values were read from
    explains: str

    def as_dict(self) -> dict:
        return {
            "metric": self.metric,
            "value_a": self.value_a,
            "value_b": self.value_b,
            "source": self.source,
            "explains": self.explains,
        }


@dataclass
class VariantRun:
    variant: Variant
    output_dir: Path
    compile_seconds: float
    bench: BenchResult | None = None
    signals: dict = field(default_factory=dict)
    error: str | None = None

    def as_dict(self) -> dict:
        return {
            **self.variant.as_dict(),
            "output_dir": str(self.output_dir),
            "compile_seconds": round(self.compile_seconds, 2),
            "bench": self.bench.as_dict() if self.bench else None,
            "signals": self.signals,
            "error": self.error,
        }


def _tool(name: str) -> str:
    path = shutil.which(name)
    if path is None:
        raise RuntimeError(f"'{name}' not found on PATH; activate the venv.")
    return path


def _input_specs(example_inputs: tuple) -> list:
    """iree-run-module input descriptors for the traced example inputs.

    Values are fixed (1 for ids, 0 for the additive mask) so a benchmark is reproducible and
    so the mask means "attend everywhere" rather than something arbitrary.
    """
    specs = []
    for index, tensor in enumerate(example_inputs):
        shape = "x".join(str(d) for d in tensor.shape)
        dtype = {"torch.int64": "i64", "torch.float32": "f32"}.get(str(tensor.dtype), "f32")
        specs.append(f"{shape}x{dtype}={1 if index == 0 else 0}")
    return specs


def _read_signals(output_dir: Path) -> dict:
    """Facts about the compiled output, for attribution."""
    signals: dict = {}

    targets = output_dir / "ir_10_executable-targets.mlir"
    if targets.is_file():
        text = targets.read_text()
        widths = [int(w) for w in _VECTOR_TYPE.findall(text)]
        if widths:
            signals["max_vector_lanes"] = max(widths)
            signals["scalar_vector_ops"] = sum(1 for w in widths if w == 1)
            signals["wide_vector_ops"] = sum(1 for w in widths if w >= 8)
        native = _NATIVE_VECTOR_SIZE.search(text)
        if native:
            signals["native_vector_size_bytes"] = int(native.group(1))

    configurations = output_dir / "ir_09_executable-configurations.mlir"
    if configurations.is_file():
        text = configurations.read_text()
        signals["dispatch_count"] = len(set(_DISPATCH.findall(text)))

    asm = next((p for p in (output_dir / "llvm").glob("*.s")), None) if (output_dir / "llvm").is_dir() else None
    if asm:
        signals["fma_instructions"] = len(_FMA.findall(asm.read_text()))

    return signals


def _compile_variant(
    mlir_path: Path,
    variant: Variant,
    output_dir: Path,
    want_asm: bool,
) -> tuple[float, str | None]:
    """Compile the .vmfb plus the few stages a comparison needs. Returns (seconds, error)."""
    output_dir.mkdir(parents=True, exist_ok=True)
    started = time.monotonic()
    base = [
        _tool("iree-compile"),
        str(mlir_path),
        "--iree-hal-target-backends=llvm-cpu",
        *variant.compile_flags,
    ]

    vmfb = output_dir / "module.vmfb"
    cmd = list(base)
    if want_asm:
        llvm_dir = output_dir / "llvm"
        llvm_dir.mkdir(exist_ok=True)
        cmd.append(f"--iree-hal-dump-executable-intermediates-to={llvm_dir}")
    cmd += ["-o", str(vmfb)]

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        return time.monotonic() - started, (result.stderr or "").strip()[:600]

    for stage in _COMPARE_STAGES:
        index = {"executable-configurations": "09", "executable-targets": "10"}[stage]
        stage_cmd = base + [
            "--mlir-elide-elementsattrs-if-larger=16",
            f"--compile-to={stage}",
            "-o",
            str(output_dir / f"ir_{index}_{stage}.mlir"),
        ]
        subprocess.run(stage_cmd, capture_output=True, text=True)

    return time.monotonic() - started, None


def _attribute(a: VariantRun, b: VariantRun) -> list:
    """Explain a timing difference from the two runs' signals. Template-filled, never guessed."""
    attributions = []
    sa, sb = a.signals, b.signals

    if "max_vector_lanes" in sa and "max_vector_lanes" in sb and sa["max_vector_lanes"] != sb["max_vector_lanes"]:
        wide_a, wide_b = sa["max_vector_lanes"], sb["max_vector_lanes"]
        attributions.append(
            Attribution(
                metric="Widest vector",
                value_a=f"{wide_a} lanes",
                value_b=f"{wide_b} lanes",
                source="ir_10_executable-targets.mlir",
                explains=(
                    f"{a.variant.label} vectorised to {wide_a} lanes per instruction, "
                    f"{b.variant.label} to {wide_b}. A width of 1 is scalar code in vector "
                    f"syntax -- the arithmetic happens one element at a time."
                    if 1 in (wide_a, wide_b)
                    else f"{b.variant.label} packs {wide_b / wide_a:.0f}x more elements per instruction."
                ),
            )
        )

    if "native_vector_size_bytes" in sa and "native_vector_size_bytes" in sb and sa["native_vector_size_bytes"] != sb["native_vector_size_bytes"]:
        attributions.append(
            Attribution(
                metric="native_vector_size",
                value_a=f"{sa['native_vector_size_bytes']} bytes",
                value_b=f"{sb['native_vector_size_bytes']} bytes",
                source="hal.executable.variant target attribute",
                explains=(
                    "This is the register width the compiler believed it could use. It is the "
                    "root cause the vector widths follow from, stated by the compiler itself."
                ),
            )
        )

    if "fma_instructions" in sa and "fma_instructions" in sb and sa["fma_instructions"] != sb["fma_instructions"]:
        attributions.append(
            Attribution(
                metric="Fused multiply-adds",
                value_a=f"{sa['fma_instructions']} instructions",
                value_b=f"{sb['fma_instructions']} instructions",
                source="emitted assembly (*.s)",
                explains=(
                    "vfmadd*ps does a multiply and an add in one instruction on a vector "
                    "register. More of them means more arithmetic per cycle."
                ),
            )
        )

    if "dispatch_count" in sa and "dispatch_count" in sb and sa["dispatch_count"] != sb["dispatch_count"]:
        attributions.append(
            Attribution(
                metric="Dispatch count",
                value_a=str(sa["dispatch_count"]),
                value_b=str(sb["dispatch_count"]),
                source="ir_09_executable-configurations.mlir",
                explains=(
                    "Each dispatch is a separate kernel launch that reads its inputs from and "
                    "writes its outputs to memory. Fewer dispatches usually means less traffic."
                ),
            )
        )

    return attributions


def run_experiment(
    model_id: str,
    dimension: Dimension,
    output_root: Path,
    seq_len: int = 32,
    repetitions: int = 5,
    benchmark: bool = True,
) -> dict:
    """Compile and time every variant of `dimension`, then compare them pairwise."""
    from models.detect import detect
    from models.hf_wrapper import wrap

    detected = detect(model_id, seq_len=seq_len)
    module, example_inputs, model_info = wrap(detected)

    output_root = Path(output_root)
    output_root.mkdir(parents=True, exist_ok=True)

    # Export once and reuse: tracing is the slow part, and every variant compiles the same
    # program with different flags.
    mlir_path = output_root / "input.mlir"
    mlir_path.write_text(str(aot.export(module, *example_inputs).mlir_module))
    input_specs = _input_specs(example_inputs)

    runs = []
    for variant in dimension.variants:
        variant_dir = output_root / variant.id
        seconds, error = _compile_variant(mlir_path, variant, variant_dir, want_asm=True)
        run = VariantRun(variant=variant, output_dir=variant_dir, compile_seconds=seconds, error=error)
        if error is None:
            run.signals = _read_signals(variant_dir)
            if benchmark:
                try:
                    run.bench = benchmark_module(
                        variant_dir / "module.vmfb", input_specs, repetitions=repetitions
                    )
                except Exception as exc:  # a failed timing must not lose the compile result
                    run.error = f"benchmark failed: {exc}"
        runs.append(run)

    comparisons = []
    successful = [r for r in runs if r.error is None and r.bench]
    for baseline, candidate in zip(successful, successful[1:]):
        timing = compare_timings(baseline.bench, candidate.bench)
        comparisons.append(
            {
                "from": baseline.variant.id,
                "to": candidate.variant.id,
                **timing,
                "attributions": [a.as_dict() for a in _attribute(baseline, candidate)],
            }
        )

    # The input.mlir carries the model's weights inline and is only needed during the run.
    mlir_path.unlink(missing_ok=True)

    return {
        "experiment_id": f"{detected.slug}__{dimension.id}",
        "model_info": model_info,
        "dimension": dimension.as_dict(),
        "input_specs": input_specs,
        "variants": [r.as_dict() for r in runs],
        "comparisons": comparisons,
        "notes": _experiment_notes(runs),
    }


def _experiment_notes(runs: list) -> list:
    notes = [
        "Timings are medians over repeated runs on this machine; they are comparable to each "
        "other, not to timings from another machine.",
    ]
    if any(r.bench and not r.bench.reliable for r in runs):
        notes.append(
            "At least one variant was marked unreliable (high variance). Its number is shown "
            "but should not be quoted as a result."
        )
    if any(r.bench and r.bench.aslr_enabled for r in runs):
        notes.append("ASLR was enabled; the benchmark tool warns this adds unreproducible noise.")
    if any(r.error for r in runs):
        notes.append("At least one variant failed to compile or benchmark; see its error field.")
    return notes
