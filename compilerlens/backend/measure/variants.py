"""Named compiler configurations worth comparing, and the dimensions they belong to.

A "dimension" is one decision held under a microscope: everything else stays fixed, so a
timing difference between variants is attributable to that decision alone. Each variant
records a `hypothesis` up front -- when the measurement contradicts it, that is a finding
worth showing, not a bug to hide. The opt-level dimension does exactly this: it is included
*because* it turned out not to matter, which is as informative as the 33x that target-cpu
produces.
"""

from __future__ import annotations

from dataclasses import dataclass, field


@dataclass(frozen=True)
class Variant:
    id: str
    label: str
    hypothesis: str
    compile_flags: tuple = ()

    def as_dict(self) -> dict:
        return {
            "id": self.id,
            "label": self.label,
            "hypothesis": self.hypothesis,
            "compile_flags": list(self.compile_flags),
        }


@dataclass(frozen=True)
class Dimension:
    id: str
    label: str
    question: str  # what comparing these variants answers
    variants: tuple
    # What we already measured, so the UI can show whether a run reproduces it.
    known_result: str = ""

    def as_dict(self) -> dict:
        return {
            "id": self.id,
            "label": self.label,
            "question": self.question,
            "known_result": self.known_result,
            "variants": [v.as_dict() for v in self.variants],
        }


TARGET_CPU = Dimension(
    id="target-cpu",
    label="Target CPU",
    question="How much does telling the compiler which CPU it is targeting actually matter?",
    known_result="33x on prajjwal1/bert-tiny (13.2 ms generic vs 0.400 ms host)",
    variants=(
        Variant(
            id="cpu-generic",
            label="Generic x86-64",
            hypothesis=(
                "Without a named CPU the compiler cannot assume AVX-512, so the vectoriser "
                "should fall back to width-1 vectors -- scalar code in vector syntax."
            ),
            compile_flags=("--iree-llvmcpu-target-cpu=generic",),
        ),
        Variant(
            id="cpu-host",
            label="Host CPU (znver5)",
            hypothesis=(
                "With the host's feature set available the vectoriser should emit full-width "
                "512-bit vectors and fused multiply-adds."
            ),
            compile_flags=("--iree-llvmcpu-target-cpu=host",),
        ),
    ),
)

OPT_LEVEL = Dimension(
    id="opt-level",
    label="Optimization level",
    question="Does the global optimization level change anything measurable for this model?",
    known_result="No measurable difference on bert-tiny (O0 0.399, O2 0.513, O3 0.451 ms)",
    variants=(
        Variant("opt-O0", "O0", "Least optimization; expected slowest.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-level=O0")),
        Variant("opt-O2", "O2", "Standard optimization.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-level=O2")),
        Variant("opt-O3", "O3", "Most aggressive; expected fastest.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-level=O3")),
    ),
)

DATA_TILING = Dimension(
    id="data-tiling",
    label="Data tiling",
    question="Does packing tensors into cache-friendly layouts pay off at this size?",
    variants=(
        Variant("tiling-off", "Data tiling off",
                "Without packing, matmuls read memory in a less cache-friendly order.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-data-tiling=false")),
        Variant("tiling-on", "Data tiling on",
                "Packing should improve cache behaviour, though small tensors may not benefit.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-data-tiling=true")),
    ),
)

CONST_EVAL = Dimension(
    id="const-eval",
    label="Constant evaluation",
    question="Does folding constant subgraphs at compile time help at inference time?",
    variants=(
        Variant("consteval-off", "Const-eval off",
                "Constant subexpressions stay in the program and are recomputed each run.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-const-eval=false")),
        Variant("consteval-on", "Const-eval on",
                "Folding them at compile time should remove work from the hot path.",
                ("--iree-llvmcpu-target-cpu=host", "--iree-opt-const-eval=true")),
    ),
)

DIMENSIONS = {d.id: d for d in (TARGET_CPU, OPT_LEVEL, DATA_TILING, CONST_EVAL)}


def variant_by_id(variant_id: str) -> Variant:
    for dimension in DIMENSIONS.values():
        for variant in dimension.variants:
            if variant.id == variant_id:
                return variant
    known = sorted(v.id for d in DIMENSIONS.values() for v in d.variants)
    raise KeyError(f"unknown variant '{variant_id}'. Known: {', '.join(known)}")
