"""Which kernels are standalone when they did not need to be?

An elementwise or transpose kernel does almost no arithmetic per byte it touches: it reads a
tensor, does one cheap operation, writes it back. As its own dispatch it pays a full round trip
to memory for that. Fused into a neighbouring compute kernel it would ride along in registers
and cost almost nothing.

Verified on prajjwal1/bert-tiny: three such dispatches survive as separate kernels
(dispatch_0_elementwise_32x128, dispatch_4_elementwise_transpose_32x2x64,
dispatch_8_elementwise_transpose_32x128), so this is a real observation about a real model.

IREE names its own kernels after what they contain, so this rule reads the compiler's labels
rather than inferring intent from op counts.
"""

from __future__ import annotations

import re

from .base import CONFIDENCE_HEURISTIC, CONFIDENCE_STRUCTURAL, SEVERITY_MISSED, Finding, Rule

_DISPATCH_NAME = re.compile(r"@([A-Za-z_$][\w$]*dispatch_\d+_[a-z0-9_]+)")

# Kernel-name fragments that mean "memory-bound, little arithmetic".
_MEMORY_BOUND = ("elementwise", "transpose", "copy", "broadcast", "pack", "unpack")

# Fragments that mean "this kernel does real arithmetic", i.e. a fusion target.
_COMPUTE = ("matmul", "conv", "attention", "reduction")


class MissedFusion(Rule):
    id = "missed-fusion"
    title = "Kernel fusion"
    what_it_looks_for = "memory-bound kernels running as their own dispatch"

    def check(self, artifact: dict) -> list:
        stage = self._codegen_stage(artifact)
        if stage is None:
            return []

        text = stage.get("text") or ""
        names = sorted(set(_DISPATCH_NAME.findall(text)))
        if not names:
            return []

        memory_bound = [n for n in names if any(k in n.lower() for k in _MEMORY_BOUND)]
        compute = [n for n in names if any(k in n.lower() for k in _COMPUTE)]
        if not memory_bound:
            return []

        findings = []
        for name in memory_bound:
            line, quote = self._locate(text, name)
            findings.append(
                Finding(
                    rule_id=self.id,
                    severity=SEVERITY_MISSED,
                    title=f"{self._short(name)} runs as its own kernel",
                    detail=(
                        f"{name} does little arithmetic per byte it moves, but it is a separate "
                        f"dispatch: it reads its input from memory and writes its output back. "
                        f"Fused into an adjacent compute kernel the same work would happen in "
                        f"registers. This model has {len(compute)} compute kernels it could "
                        f"potentially have fused into."
                    ),
                    stage_id=stage["id"],
                    stage_name=stage["name"],
                    confidence=CONFIDENCE_STRUCTURAL,
                    evidence=[quote] if quote else [],
                    line=line,
                    suggestion=(
                        "Fusion is decided at dispatch-creation. Compare this stage with "
                        "ir_05_dispatch-creation to see where the boundary was drawn."
                    ),
                )
            )

        # One summary finding when memory-bound kernels dominate -- the individual findings say
        # what, this says how much it matters overall.
        share = len(memory_bound) / len(names)
        if share > 0.3 and len(names) >= 4:
            findings.append(
                Finding(
                    rule_id=f"{self.id}-summary",
                    severity=SEVERITY_MISSED,
                    title=f"{len(memory_bound)} of {len(names)} kernels are memory-bound",
                    detail=(
                        f"{share * 100:.0f}% of this model's kernels mostly move data rather "
                        f"than compute on it. Each is a separate launch with its own read and "
                        f"write of memory, and for a small model that traffic can dominate the "
                        f"arithmetic."
                    ),
                    stage_id=stage["id"],
                    stage_name=stage["name"],
                    confidence=CONFIDENCE_HEURISTIC,
                    evidence=[f"memory-bound: {', '.join(self._short(n) for n in memory_bound)}"],
                    suggestion="Run the target-cpu and data-tiling experiments to see whether this traffic is actually the bottleneck.",
                )
            )
        return findings

    @staticmethod
    def _codegen_stage(artifact: dict) -> dict | None:
        for name in ("executable-sources", "executable-configurations", "hal"):
            for stage in artifact.get("stages", []):
                if stage.get("name") == name:
                    return stage
        return None

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
