"""Kernels that exist only to move data into a different shape.

DESIGN-DOC section 4.5's third category: "unnecessary memory/layout conversion". A transpose or
pack kernel with no arithmetic in it is pure overhead -- it produces no new values, it just
rearranges existing ones so a later kernel can read them in the order it wants. Sometimes that
is the right trade (a matmul on a well-packed operand can more than repay it) and sometimes it
is a layout decision that could have been made earlier for free.

The rule reports it as `info` rather than `missed` for exactly that reason: the presence of a
layout kernel is a fact, whether it was worth it is a measurement. Marking it "missed" would be
the kind of overclaim this project exists to avoid.
"""

from __future__ import annotations

import re

from .base import CONFIDENCE_STRUCTURAL, SEVERITY_INFO, Finding, Rule

_DISPATCH_NAME = re.compile(r"@([A-Za-z_$][\w$]*dispatch_\d+_[a-z0-9_]+)")
_LAYOUT_ONLY = ("transpose", "pack", "unpack", "copy")
_ARITHMETIC = ("matmul", "conv", "attention", "reduction", "add", "mul", "exp", "div")


class LayoutChurn(Rule):
    id = "layout-churn"
    title = "Layout conversion"
    what_it_looks_for = "kernels whose only job is rearranging memory"

    def check(self, artifact: dict) -> list:
        stage = self._codegen_stage(artifact)
        if stage is None:
            return []

        text = stage.get("text") or ""
        names = sorted(set(_DISPATCH_NAME.findall(text)))
        pure_layout = [
            n
            for n in names
            if any(k in n.lower() for k in _LAYOUT_ONLY)
            and not any(k in n.lower() for k in _ARITHMETIC)
        ]
        if not pure_layout:
            return []

        total_bytes = self._estimate_bytes(pure_layout)
        line, quote = self._locate(text, pure_layout[0])

        detail = (
            f"{len(pure_layout)} kernel(s) do no arithmetic -- they read a tensor and write it "
            f"back in a different order so a later kernel can consume it. "
        )
        if total_bytes:
            detail += (
                f"Their shapes imply roughly {total_bytes / 1024:.0f} KiB moved per inference "
                f"purely to change layout. "
            )
        detail += (
            "This is not automatically waste: packing an operand can pay for itself in the "
            "matmul that follows. Whether it did here is a question for measurement, which is "
            "why this is reported as information rather than a fault."
        )

        return [
            Finding(
                rule_id=self.id,
                severity=SEVERITY_INFO,
                title=f"{len(pure_layout)} layout-only kernel(s)",
                detail=detail,
                stage_id=stage["id"],
                stage_name=stage["name"],
                confidence=CONFIDENCE_STRUCTURAL,
                evidence=([quote] if quote else []) + [", ".join(self._short(n) for n in pure_layout)],
                line=line,
                suggestion=(
                    "Run the data-tiling experiment: it toggles the packing decision that "
                    "creates most of these kernels, and measures whether it paid."
                ),
            )
        ]

    @staticmethod
    def _codegen_stage(artifact: dict) -> dict | None:
        for name in ("executable-sources", "executable-configurations", "hal"):
            for stage in artifact.get("stages", []):
                if stage.get("name") == name:
                    return stage
        return None

    @staticmethod
    def _estimate_bytes(names: list) -> int:
        """Bytes moved, from the shapes IREE puts in the kernel names (f32 assumed)."""
        total = 0
        for name in names:
            dims = re.search(r"_(\d+(?:x\d+)+)_", name)
            if not dims:
                continue
            elements = 1
            for part in dims.group(1).split("x"):
                elements *= int(part)
            total += elements * 4 * 2  # read + write
        return total

    @staticmethod
    def _short(name: str) -> str:
        match = re.search(r"(dispatch_\d+_[a-z_]+)", name)
        return match.group(1) if match else name

    @staticmethod
    def _locate(text: str, name: str) -> tuple:
        for index, line in enumerate(text.splitlines(), start=1):
            if name in line:
                return index, line.strip()[:220]
        return None, None
