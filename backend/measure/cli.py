"""Run a compiler experiment: one model, several configurations, measured.

    python -m backend.measure.cli prajjwal1/bert-tiny --dimension target-cpu
    python -m backend.measure.cli prajjwal1/bert-tiny --dimension opt-level --seq-len 16
    python -m backend.measure.cli <id> --dimension target-cpu --no-benchmark   # compile only
    python -m backend.measure.cli --list

Writes experiments/<experiment-id>/experiment.json, which `npm run artifact` turns into a
frontend artifact.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from backend.measure.compare import run_experiment  # noqa: E402
from backend.measure.variants import DIMENSIONS  # noqa: E402
from models.detect import UnsupportedModelError  # noqa: E402


def _print_dimensions() -> None:
    print("Available dimensions:\n")
    for dimension in DIMENSIONS.values():
        print(f"  {dimension.id}")
        print(f"    {dimension.question}")
        if dimension.known_result:
            print(f"    previously measured: {dimension.known_result}")
        for variant in dimension.variants:
            print(f"      - {variant.id:16} {' '.join(variant.compile_flags)}")
        print()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("model_id", nargs="?", help="HuggingFace model id")
    parser.add_argument("--dimension", choices=sorted(DIMENSIONS), help="which decision to isolate")
    parser.add_argument("--seq-len", type=int, default=32)
    parser.add_argument("--repetitions", type=int, default=5, help="benchmark repetitions (min 5 for a reliable median)")
    parser.add_argument("--no-benchmark", action="store_true", help="compile and read signals, skip timing")
    parser.add_argument("--out-dir", type=Path, default=None)
    parser.add_argument("--list", action="store_true", help="show the available dimensions and exit")
    args = parser.parse_args()

    if args.list:
        _print_dimensions()
        return 0
    if not args.model_id or not args.dimension:
        parser.error("model_id and --dimension are required (or use --list)")

    dimension = DIMENSIONS[args.dimension]
    out_dir = args.out_dir or (REPO_ROOT / "experiments" / f"{args.model_id.replace('/', '_')}__{dimension.id}")

    print(f"{args.model_id}  ·  dimension: {dimension.id}")
    print(f"  {dimension.question}")
    if dimension.known_result:
        print(f"  previously measured: {dimension.known_result}")
    print(f"  variants: {', '.join(v.id for v in dimension.variants)}\n")

    try:
        result = run_experiment(
            args.model_id,
            dimension,
            out_dir,
            seq_len=args.seq_len,
            repetitions=args.repetitions,
            benchmark=not args.no_benchmark,
        )
    except UnsupportedModelError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1

    for variant in result["variants"]:
        bench = variant["bench"]
        if variant["error"]:
            print(f"  {variant['label']:24} FAILED  {variant['error'][:70]}")
        elif bench:
            flag = "" if bench["reliable"] else "  (unreliable)"
            print(
                f"  {variant['label']:24} {bench['median_ms']:8.3f} ms "
                f"±{bench['stddev_ms']:.3f}  cv={bench['cv_percent']:.1f}%{flag}"
            )
        else:
            print(f"  {variant['label']:24} compiled in {variant['compile_seconds']:.1f}s (not benchmarked)")

    for comparison in result["comparisons"]:
        print(f"\n  {comparison['from']} → {comparison['to']}: {comparison['verdict']}")
        for attribution in comparison["attributions"]:
            print(f"    {attribution['metric']}: {attribution['value_a']} → {attribution['value_b']}")
            print(f"      {attribution['explains']}")
            print(f"      source: {attribution['source']}")

    out_path = out_dir / "experiment.json"
    out_path.write_text(json.dumps(result, indent=2))
    print(f"\nwrote {out_path}")
    print("next:  cd frontend && npm run artifact")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
