"""Warm the HuggingFace cache so a demo can run offline.

Usage:
    python -m models.prefetch prajjwal1/bert-tiny distilgpt2
"""

from __future__ import annotations

import argparse

from huggingface_hub import snapshot_download

from models.detect import detect


def prefetch(model_id: str) -> None:
    detected = detect(model_id)
    print(f"{model_id} @ {detected.revision[:12]} ({detected.model_type})")
    snapshot_download(model_id, revision=detected.revision)
    print("  cached")


def main() -> None:
    parser = argparse.ArgumentParser(description="Pre-download models so later runs work offline.")
    parser.add_argument("model_ids", nargs="+", help="HuggingFace model ids")
    args = parser.parse_args()
    for model_id in args.model_ids:
        prefetch(model_id)


if __name__ == "__main__":
    main()
