"""Did vectorisation actually happen, and at what width?

A `vector<1xf32>` is the tell. It parses as a vector type and reads like success, but one lane
is scalar arithmetic wearing vector syntax -- the compiler emitted the shape of vectorised code
without the benefit. Verified on prajjwal1/bert-tiny: 157 such ops survive alongside 5,098
genuinely wide ones, so this fires on real models rather than only on contrived ones.

The rule also compares the achieved width against `native_vector_size`, which the compiler
states about the target. Reaching only half the register width is a real, quotable shortfall.
"""

from __future__ import annotations

import re

from .base import (
    CONFIDENCE_STRUCTURAL,
    SEVERITY_MISSED,
    SEVERITY_SUBOPTIMAL,
    Finding,
    Rule,
)

# Only float element types count. An i64/index vector of width 1 is address or loop-counter
# arithmetic, not data math -- flagging those would be a false positive, and bert-tiny has 5 of
# them next to 166 genuine vector<1xf32> data operations.
_VECTOR_TYPE = re.compile(r"vector<(\d+)x(f32|f16|bf16)>")
_LLVM_VECTOR = re.compile(r"<(\d+) x (float|half|bfloat)>")
_NATIVE_VECTOR_SIZE = re.compile(r"native_vector_size\s*=\s*(\d+)")

_BYTES_PER_ELEMENT = {"f32": 4, "float": 4, "f16": 2, "half": 2, "bf16": 2, "bfloat": 2}

# Below this share of the register width, the vectoriser left real performance unclaimed.
_UNDERUSE_THRESHOLD = 0.5


class MissedVectorization(Rule):
    id = "missed-vectorization"
    title = "Vectorisation width"
    what_it_looks_for = "width-1 vectors, and vector widths well below the target's registers"

    def check(self, artifact: dict) -> list:
        findings = []
        native_bytes = self._native_vector_size(artifact)

        # The same scalar leftovers appear in executable-targets and again in every LLVM stage
        # (codegen/linked/optimized), which is one fact reported four times. Diagnose the
        # optimized LLVM IR when present -- it is the last word on what vectorisation achieved --
        # and otherwise the MLIR codegen result.
        for stage in self._stages_to_check(artifact):
            text = stage.get("text") or ""
            if not text:
                continue

            pattern = _LLVM_VECTOR if stage["language"] == "llvm" else _VECTOR_TYPE
            matches = [(int(w), t) for w, t in pattern.findall(text)]
            if not matches:
                continue

            scalar = [(w, t) for w, t in matches if w == 1]
            widest = max(w for w, _ in matches)

            if scalar and len(scalar) >= 8:
                line, quote = self._first_occurrence(text, pattern, want_width=1)
                findings.append(
                    Finding(
                        rule_id=self.id,
                        severity=SEVERITY_MISSED,
                        title=f"{len(scalar)} single-lane vector operations",
                        detail=(
                            f"{len(scalar)} operations use a 1-element vector type in "
                            f"{stage['title']}. A one-lane vector is scalar arithmetic in "
                            f"vector syntax: the code looks vectorised but processes one "
                            f"element per instruction. The widest vector in this stage is "
                            f"{widest} lanes, so the vectoriser succeeded elsewhere and left "
                            f"these behind."
                        ),
                        stage_id=stage["id"],
                        stage_name=stage["name"],
                        confidence=CONFIDENCE_STRUCTURAL,
                        evidence=[quote] if quote else [],
                        line=line,
                        suggestion=(
                            "Check the shapes feeding these operations -- a dimension of 1, or "
                            "one not divisible by the vector width, commonly forces this."
                        ),
                    )
                )

            if native_bytes:
                element_bytes = _BYTES_PER_ELEMENT.get(
                    next((t for w, t in matches if w == widest), "f32"), 4
                )
                achievable = native_bytes // element_bytes
                if achievable and widest < achievable * _UNDERUSE_THRESHOLD:
                    line, quote = self._first_occurrence(text, pattern, want_width=widest)
                    findings.append(
                        Finding(
                            rule_id=self.id,
                            severity=SEVERITY_SUBOPTIMAL,
                            title=f"Vectors reach {widest} of {achievable} available lanes",
                            detail=(
                                f"The target reports native_vector_size = {native_bytes} bytes, "
                                f"which holds {achievable} elements of this type. The widest "
                                f"vector emitted in {stage['title']} is {widest} lanes, so "
                                f"roughly {100 - widest / achievable * 100:.0f}% of each "
                                f"register goes unused."
                            ),
                            stage_id=stage["id"],
                            stage_name=stage["name"],
                            confidence=CONFIDENCE_STRUCTURAL,
                            evidence=[quote] if quote else [],
                            line=line,
                            suggestion=(
                                "Confirm the target CPU is set: --iree-llvmcpu-target-cpu=host. "
                                "A generic target cannot assume wide registers exist."
                            ),
                        )
                    )
        return findings

    @staticmethod
    def _stages_to_check(artifact: dict) -> list:
        """One representative stage per level, so a single fact is reported once.

        Prefers the optimized LLVM IR (the final word on vectorisation) and the MLIR codegen
        result (where the vector types are still readable as MLIR).
        """
        by_name = {s.get("name"): s for s in artifact.get("stages", [])}
        preferred = ("llvm-optimized", "executable-targets")
        chosen = [by_name[name] for name in preferred if name in by_name]
        if chosen:
            return chosen
        return [
            s
            for s in artifact.get("stages", [])
            if s.get("language") in {"mlir", "llvm"} and s.get("kind") == "phase"
        ][-1:]

    @staticmethod
    def _native_vector_size(artifact: dict) -> int | None:
        for stage in artifact.get("stages", []):
            match = _NATIVE_VECTOR_SIZE.search(stage.get("text") or "")
            if match:
                return int(match.group(1))
        return None

    @staticmethod
    def _first_occurrence(text: str, pattern: re.Pattern, want_width: int) -> tuple:
        for index, line in enumerate(text.splitlines(), start=1):
            for width, _type in pattern.findall(line):
                if int(width) == want_width:
                    return index, line.strip()[:220]
        return None, None
