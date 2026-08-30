#!/usr/bin/env python3
"""Compile a model from the HuggingFace Hub into a CompilerLens workload.

    python scripts/compile_hf_model.py prajjwal1/bert-tiny
    python scripts/compile_hf_model.py distilgpt2 --seq-len 16
    python scripts/compile_hf_model.py some-org/some-model --dry-run

Nothing needs registering first: the model class, whether it is causal, its vocab size and
a pinned revision are all worked out from the id (models/detect.py). On success the dump
directory contains a model_info.json, which is what makes ingest pick the model up as a
workload -- so the next step is just `npm run artifact` from frontend/.

Run from the repo root with the venv active.
"""

from __future__ import annotations

import argparse
import json
import shutil
import sys
import time
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))

from backend.compiler.runner import (  # noqa: E402
    TRIM_CODEGEN_PASSES,
    TRIM_ELIDE_ATTRS,
    CompilerRunner,
    RunConfig,
)
from models.detect import UnsupportedModelError, detect  # noqa: E402
from models.hf_wrapper import wrap, wrapper_source  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("model_id", help="HuggingFace model id, e.g. prajjwal1/bert-tiny")
    parser.add_argument("--revision", default=None, help="pin a specific commit (default: current main sha)")
    parser.add_argument("--seq-len", type=int, default=32, help="sequence length to trace with (default: 32)")
    parser.add_argument("--out-dir", type=Path, default=None, help="destination (default: examples/<slug>)")
    parser.add_argument("--dry-run", action="store_true", help="detect and report, then stop before compiling")
    parser.add_argument(
        "--full",
        action="store_true",
        help="no trimming: keep weight payloads inline and print IR after every pass. This is "
        "the complete dump set, and it is large -- bert-tiny's pass log alone reaches 8.6 GB.",
    )
    args = parser.parse_args()

    try:
        detected = detect(args.model_id, revision=args.revision, seq_len=args.seq_len)
    except UnsupportedModelError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1

    print(f"{detected.model_id}")
    print(f"  revision    {detected.revision}")
    print(f"  type        {detected.model_type} ({'causal decoder' if detected.causal else 'bidirectional encoder'})")
    print(f"  vocab       {detected.vocab_size}")
    print(f"  seq_len     {detected.seq_len}")
    print(f"  output      .{detected.output_attr}")
    print(f"  detected by {detected.detected_via}")

    if args.dry_run:
        print("\n--dry-run: stopping before compile.")
        return 0

    out_dir = args.out_dir or (REPO_ROOT / "examples" / detected.slug)

    print("\nloading model...")
    try:
        module, example_inputs, model_info = wrap(detected)
    except Exception as exc:
        print(f"error: could not load/wrap '{detected.model_id}': {exc}", file=sys.stderr)
        return 1
    print(f"  {model_info['param_count'] / 1e6:.1f}M parameters")

    config = RunConfig(
        layout="ingest",
        elide_attrs_larger_than=None if args.full else TRIM_ELIDE_ATTRS,
        pass_log_after=() if args.full else TRIM_CODEGEN_PASSES,
    )
    runner = CompilerRunner(config)

    print(f"\ncompiling into {out_dir.relative_to(REPO_ROOT) if out_dir.is_relative_to(REPO_ROOT) else out_dir} ...")
    started = time.monotonic()
    result = runner.run(module, example_inputs, name=detected.slug, output_dir=out_dir, model_info=model_info)
    elapsed = time.monotonic() - started

    # The source stage the generated spec shows. Written after the run so a failed compile
    # does not leave a directory that looks complete.
    (out_dir / "source.py").write_text(wrapper_source(detected))

    # The untrimmed module the compiler read. Only useful during the run; keeping it would
    # double the directory size for no benefit to the viewer.
    full_dir = out_dir / "_full"
    if full_dir.is_dir():
        shutil.rmtree(full_dir)

    manifest = json.loads(result.manifest_path.read_text())
    errors = manifest.get("errors", [])

    print(f"\n{len(result.files)} files in {elapsed:.0f}s")
    if manifest.get("total_dispatches") is not None:
        print(f"  dispatches  {manifest['total_dispatches']} total, {manifest['unique_dispatches']} unique")
    print(f"  size        {_dir_size_mb(out_dir):.0f} MB")

    if errors:
        print(f"\n{len(errors)} stage(s) failed -- the manifest records each one:", file=sys.stderr)
        for err in errors:
            first_line = (err.get("stderr") or "").strip().splitlines()
            print(f"  {err['stage']}: {first_line[0] if first_line else 'no stderr'}", file=sys.stderr)
        print("\nPartial dumps were kept. model_info.json was NOT written, so ingest will "
              "skip this directory until the failure is resolved.", file=sys.stderr)
        return 1

    # Written last, and only on full success: its presence is what tells ingest this directory
    # is a usable workload.
    (out_dir / "model_info.json").write_text(json.dumps(model_info, indent=2))

    print("\nnext:")
    print("  cd frontend && npm run artifact    # regenerates artifacts/, including this model")
    return 0


def _dir_size_mb(path: Path) -> float:
    return sum(p.stat().st_size for p in path.rglob("*") if p.is_file()) / 1e6


if __name__ == "__main__":
    raise SystemExit(main())
