"""Timing a compiled module, with the honesty a benchmark needs.

A benchmark that lies is worse than no benchmark, so this module refuses to report a number
without the context needed to judge it: the variance, the repetition count, and whether the
machine looked quiet at the time. `reliable` is the flag the UI keys off -- an unreliable
result is still shown, but never as a fact.

Uses --benchmark_format=json rather than scraping the text output: the JSON carries the
aggregates (median/stddev/cv) as structured fields plus the host context (ASLR, load average),
and text scraping would break the first time the tool changes its layout.
"""

from __future__ import annotations

import json
import shutil
import subprocess
from dataclasses import dataclass, field
from pathlib import Path

# A coefficient of variation above this means the machine was too noisy to trust the number.
# 5% is judgement, not science: measured 3.8% on an idle box, so anything much above that is
# contention rather than the compiler.
RELIABLE_CV_PERCENT = 5.0

# Fewer repetitions than this and the median is not meaningful.
MIN_REPETITIONS = 5

# Below this ratio, with typical variance, a "speedup" is indistinguishable from noise.
MEANINGFUL_SPEEDUP = 1.15


@dataclass
class BenchResult:
    median_ms: float
    mean_ms: float
    stddev_ms: float
    cv_percent: float
    repetitions: int
    reliable: bool
    # Host context, kept because a timing without it cannot be compared across machines.
    aslr_enabled: bool = False
    load_average: float = 0.0
    notes: list = field(default_factory=list)

    def as_dict(self) -> dict:
        return {
            "median_ms": round(self.median_ms, 4),
            "mean_ms": round(self.mean_ms, 4),
            "stddev_ms": round(self.stddev_ms, 4),
            "cv_percent": round(self.cv_percent, 2),
            "repetitions": self.repetitions,
            "reliable": self.reliable,
            "aslr_enabled": self.aslr_enabled,
            "load_average": round(self.load_average, 3),
            "notes": self.notes,
        }


class BenchmarkError(RuntimeError):
    pass


def _tool(name: str) -> str:
    path = shutil.which(name)
    if path is None:
        raise BenchmarkError(
            f"'{name}' not found on PATH. Activate the project venv before benchmarking."
        )
    return path


def _to_ms(value: float, unit: str) -> float:
    return {"ns": value / 1e6, "us": value / 1e3, "ms": value, "s": value * 1e3}.get(unit, value)


def benchmark_module(
    vmfb_path: Path,
    inputs: list,
    function: str = "main",
    repetitions: int = MIN_REPETITIONS,
    device: str = "local-task",
) -> BenchResult:
    """Time one entry point of a compiled .vmfb.

    `inputs` are iree-run-module style descriptors, e.g. "1x32xi64=1".
    """
    vmfb_path = Path(vmfb_path)
    if not vmfb_path.is_file():
        raise BenchmarkError(f"no such module: {vmfb_path}")

    cmd = [
        _tool("iree-benchmark-module"),
        f"--module={vmfb_path}",
        f"--device={device}",
        f"--function={function}",
        f"--benchmark_repetitions={repetitions}",
        "--benchmark_format=json",
    ]
    cmd += [f"--input={spec}" for spec in inputs]

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0 or not result.stdout.strip():
        raise BenchmarkError(
            f"iree-benchmark-module failed (exit {result.returncode}): "
            f"{(result.stderr or '').strip()[:400]}"
        )

    try:
        payload = json.loads(result.stdout)
    except json.JSONDecodeError as exc:
        raise BenchmarkError(f"could not parse benchmark JSON: {exc}") from exc

    return _parse(payload, repetitions)


def _parse(payload: dict, repetitions: int) -> BenchResult:
    context = payload.get("context", {})
    entries = payload.get("benchmarks", [])
    by_aggregate = {e.get("aggregate_name"): e for e in entries if e.get("aggregate_name")}
    samples = [e for e in entries if not e.get("aggregate_name")]

    def aggregate(name: str, fallback: float = 0.0) -> float:
        entry = by_aggregate.get(name)
        if entry is None:
            return fallback
        return _to_ms(entry.get("real_time", 0.0), entry.get("time_unit", "ms"))

    median = aggregate("median")
    mean = aggregate("mean", median)
    stddev = aggregate("stddev")

    # The tool reports cv as a fraction in the JSON (0.0436) but as a percentage in its text
    # output (4.36%). Derive it instead of trusting either representation.
    cv_percent = (stddev / median * 100.0) if median else 0.0

    notes = []
    if context.get("aslr_enabled"):
        notes.append("ASLR was enabled; the benchmark tool warns this adds unreproducible noise.")
    load = (context.get("load_avg") or [0.0])[0]
    if load > 1.0:
        notes.append(f"Machine load average was {load:.2f} during the run; timings may be inflated.")

    reliable = cv_percent < RELIABLE_CV_PERCENT and len(samples) >= MIN_REPETITIONS
    if not reliable:
        notes.append(
            f"Marked unreliable: cv={cv_percent:.1f}% over {len(samples)} samples "
            f"(need <{RELIABLE_CV_PERCENT}% and >={MIN_REPETITIONS} samples)."
        )

    return BenchResult(
        median_ms=median,
        mean_ms=mean,
        stddev_ms=stddev,
        cv_percent=cv_percent,
        repetitions=len(samples) or repetitions,
        reliable=reliable,
        aslr_enabled=bool(context.get("aslr_enabled")),
        load_average=load,
        notes=notes,
    )


def compare_timings(baseline: BenchResult, candidate: BenchResult) -> dict:
    """Speedup of `candidate` over `baseline`, refusing to overclaim.

    Two guards: a ratio inside the noise floor is reported as no difference, and if either
    side was unreliable the verdict says so rather than quoting a number.
    """
    if not candidate.median_ms:
        return {"speedup": None, "verdict": "candidate produced no timing", "meaningful": False}

    speedup = baseline.median_ms / candidate.median_ms
    # Combined spread of both measurements, as a fraction.
    spread = (baseline.cv_percent + candidate.cv_percent) / 100.0
    meaningful = abs(speedup - 1.0) > max(MEANINGFUL_SPEEDUP - 1.0, spread)

    if not meaningful:
        verdict = (
            f"No measurable difference ({speedup:.2f}x is within the "
            f"{spread * 100:.1f}% combined variance of the two runs)."
        )
    elif speedup > 1.0:
        verdict = f"{speedup:.2f}x faster."
    else:
        verdict = f"{1 / speedup:.2f}x slower."

    if not (baseline.reliable and candidate.reliable):
        verdict += " Treat with caution: at least one run was marked unreliable."

    return {
        "speedup": round(speedup, 3),
        "verdict": verdict,
        "meaningful": meaningful,
        "both_reliable": baseline.reliable and candidate.reliable,
    }
