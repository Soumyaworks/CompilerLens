"""Build a WorkloadSpec by inspecting a dump directory, for models nobody hand-registered.

The hand-written specs (matmul.py, linear_relu.py) can name every file they expect because
their workload is fixed. A downloaded model cannot be treated that way: the dumps differ per
model, and in ways that break the hand-written assumptions.

What a real model's dumps actually look like, measured on prajjwal1/bert-tiny:

  - **Many dispatches, non-contiguous.** bert-tiny produced 10 kernels named
    main$async_dispatch_{0,1,2,3,4,8,9,10,13,14} -- IREE numbers them before deduplicating,
    so the surviving numbers have gaps. Anything that assumes `dispatch_0` exists, or that
    the numbers run 0..n, is wrong.
  - **One linked LLVM module, not one per dispatch.** The .codegen.ll/.linked.ll/
    .optimized.ll/.s files are emitted once for the whole module
    (module_linked_embedded_elf_x86_64.*), not per kernel like the single-dispatch examples.

So this module globs for what is really there and names the stages accordingly. Where a fact
is unknown for a generated workload -- which tile sizes were chosen, whether vectorisation
succeeded -- the description says nothing rather than repeating a claim that happens to be
true for matmul. The whole point of the tool is that shown facts are sourced.

Stdlib only, like the rest of ingest/.
"""

from __future__ import annotations

import json
from pathlib import Path

from .base import (
    PHASE_BINARY,
    PHASE_CODEGEN,
    PHASE_FLOW,
    PHASE_FRONTEND,
    PHASE_GLOBAL,
    PHASE_INPUT,
    PHASE_LLVM,
    PHASE_RUNTIME,
    PassTrackSpec,
    StageSpec,
    WorkloadSpec,
)

# The phase-dump stages, in pipeline order. Shared with what the hand-written specs describe,
# so wording stays consistent across workloads; only the file names are data here.
_PHASE_STAGES: list[tuple[str, str, str, str, str]] = [
    ("ir_00_torch_input.mlir", "torch-input", "Torch Input", PHASE_FRONTEND,
     "The model in the Torch dialect, straight out of iree-turbine's AOT export. Later "
     "stages' loc() metadata points back into this file, which is what makes lineage "
     "possible."),
    ("ir_01_input.mlir", "input", "IREE Input", PHASE_INPUT,
     "Torch lowered into linalg, plus IREE's buffer ABI. Named ops such as linalg.matmul "
     "appear here for the first time."),
    ("ir_02_abi.mlir", "abi", "ABI", PHASE_INPUT,
     "The public entry point and its coarse-fence async wrapper are materialised."),
    ("ir_03_preprocessing.mlir", "preprocessing", "Preprocessing", PHASE_INPUT,
     "Target-independent cleanup before the optimisation phases proper."),
    ("ir_04_global-optimization.mlir", "global-optimization", "Global Optimization", PHASE_GLOBAL,
     "Whole-program work: constant folding, canonicalisation, and layout decisions."),
    ("ir_05_dispatch-creation.mlir", "dispatch-creation", "Dispatch Creation", PHASE_GLOBAL,
     "Operations are grouped into dispatch regions -- the units IREE will turn into "
     "separate device kernels. This is where fusion decisions get made."),
    ("ir_06_flow.mlir", "flow", "Flow", PHASE_FLOW,
     "Dispatch regions become flow.dispatch calls against outlined executables."),
    ("ir_07_stream.mlir", "stream", "Stream", PHASE_FLOW,
     "Execution and memory are scheduled: allocations, timelines, and async resource "
     "lifetimes become explicit."),
    ("ir_08_executable-sources.mlir", "executable-sources", "Executable Sources", PHASE_CODEGEN,
     "Every executable as a standalone module ready for target-specific codegen, still at "
     "linalg level."),
    ("ir_09_executable-configurations.mlir", "executable-configurations", "Executable Configurations", PHASE_CODEGEN,
     "The codegen strategy is chosen and attached to the IR. translation_info names the "
     "pipeline and lowering_config carries the tile sizes -- the compiler stating its plan "
     "before carrying it out."),
    ("ir_10_executable-targets.mlir", "executable-targets", "Executable Targets", PHASE_CODEGEN,
     "The kernels after target codegen, now in the LLVM dialect."),
    ("ir_11_hal.mlir", "hal", "HAL", PHASE_RUNTIME,
     "The host program in the Hardware Abstraction Layer dialect: buffers, command buffers, "
     "and executable dispatches."),
    ("ir_12_vm.mlir", "vm", "VM", PHASE_RUNTIME,
     "The final host program as IREE VM bytecode operations -- what ships inside the .vmfb."),
]

# (glob, name, title, phase, language, description)
_LLVM_STAGES: list[tuple[str, str, str, str, str, str]] = [
    ("*.codegen.ll", "llvm-codegen", "LLVM IR (codegen)", PHASE_LLVM, "llvm",
     "LLVM IR straight out of the MLIR translation, before linking or optimisation."),
    ("*.linked.ll", "llvm-linked", "LLVM IR (linked)", PHASE_LLVM, "llvm",
     "After linking against IREE's device runtime library."),
    ("*.optimized.ll", "llvm-optimized", "LLVM IR (optimized)", PHASE_LLVM, "llvm",
     "After the LLVM optimisation pipeline. Vector types here show the width vectorisation "
     "actually achieved."),
    ("*.s", "target-asm", "Target Assembly", PHASE_BINARY, "asm",
     "The emitted machine code. SIMD instruction widths here are the ground truth for what "
     "the compiler produced."),
]


def _dispatch_kernels(llvm_dir: Path) -> list[Path]:
    """Per-dispatch kernel MLIR files, largest first.

    Largest is a reasonable proxy for most interesting: for a transformer the biggest kernel
    is a matmul/attention dispatch rather than a reshape or elementwise fixup.
    """
    kernels = [p for p in llvm_dir.glob("*dispatch_*.mlir") if p.is_file()]
    return sorted(kernels, key=lambda p: p.stat().st_size, reverse=True)


def _dispatch_scope(kernel_path: Path) -> str:
    """A substring selecting this kernel's dumps out of an interleaved pass log.

    The file is named like `module_main$async_dispatch_3.mlir`; the pass log labels the same
    function `main$async_dispatch_3`, so strip the `module_` prefix the dump writer adds.
    """
    stem = kernel_path.stem
    return stem[len("module_"):] if stem.startswith("module_") else stem


def spec_from_dump_dir(dump_root: Path, model_info: dict) -> WorkloadSpec:
    dump_root = Path(dump_root)
    mlir_dir, llvm_dir, passes_dir = dump_root / "mlir", dump_root / "llvm", dump_root / "passes"

    model_id = model_info.get("model_id", dump_root.name)
    params = model_info.get("param_count")
    param_text = f"{params / 1e6:.1f}M parameters" if params else "unknown size"
    kind = "causal decoder" if model_info.get("causal") else "bidirectional encoder"
    seq_len = model_info.get("seq_len")

    stages: list[StageSpec] = []

    if (dump_root / "source.py").is_file():
        stages.append(
            StageSpec(
                "source.py",
                "pytorch-source",
                "PyTorch Source",
                PHASE_FRONTEND,
                "python",
                f"{model_id}: a {kind}, {param_text}, exported through iree-turbine's AOT "
                f"interface with a sequence length of {seq_len}. The attention mask is built "
                f"as a 4D float tensor -- see the comment in the source for why that is "
                f"required rather than incidental.",
                track="source",
            )
        )

    for filename, name, title, phase, description in _PHASE_STAGES:
        if (mlir_dir / filename).is_file():
            stages.append(StageSpec(f"mlir/{filename}", name, title, phase, "mlir", description))

    kernels = _dispatch_kernels(llvm_dir)
    if kernels:
        chosen = kernels[0]
        stages.append(
            StageSpec(
                f"llvm/{chosen.name}",
                "dispatch-kernel",
                "Dispatch Kernel (MLIR)",
                PHASE_LLVM,
                "mlir",
                f"The device kernel track begins here. This model compiled to "
                f"{len(kernels)} dispatch kernels; shown is {_dispatch_scope(chosen)}, the "
                f"largest. It branches off the Executable Targets phase rather than "
                f"following the VM stage before it.",
                track="device",
            )
        )

    for pattern, name, title, phase, language, description in _LLVM_STAGES:
        matches = sorted(llvm_dir.glob(pattern)) if llvm_dir.is_dir() else []
        if not matches:
            continue
        # One linked module covers every dispatch, so take the largest match and say so.
        chosen_llvm = max(matches, key=lambda p: p.stat().st_size)
        note = "" if len(matches) == 1 else f" ({len(matches)} such files were emitted; this is the largest.)"
        stages.append(
            StageSpec(
                f"llvm/{chosen_llvm.name}",
                name,
                title,
                phase,
                language,
                description + note,
                track="device",
            )
        )

    pass_tracks: list[PassTrackSpec] = []
    step_a = passes_dir / "passes_stepA_torch_to_iree.txt"
    if step_a.is_file():
        pass_tracks.append(
            PassTrackSpec(
                log_path="passes/passes_stepA_torch_to_iree.txt",
                scope_contains="!torch.vtensor",
                insert_after="torch-input",
                track="pass-torch",
                phase=PHASE_FRONTEND,
                description="Torch-to-linalg conversion, one pass at a time.",
            )
        )

    step_b = passes_dir / "passes_stepB_full_pipeline.txt"
    if step_b.is_file() and kernels:
        pass_tracks.append(
            PassTrackSpec(
                log_path="passes/passes_stepB_full_pipeline.txt",
                # Derived from the kernel we actually chose above, so this resolves instead
                # of pointing at a dispatch name that does not exist for this model.
                scope_contains=_dispatch_scope(kernels[0]),
                insert_after="executable-configurations",
                track="pass-kernel",
                phase=PHASE_CODEGEN,
                description=(
                    "Device codegen for this kernel, one pass at a time: the tiling, "
                    "vectorisation, and bufferization steps the phase dumps skip over."
                ),
            )
        )

    return WorkloadSpec(
        id=dump_root.name,
        title=model_id,
        description=f"{model_id} -- {kind}, {param_text}, compiled from the HuggingFace Hub.",
        dump_root=str(dump_root),
        source_entry=model_id,
        stages=stages,
        pass_tracks=pass_tracks,
    )


def discover(examples_root: Path) -> dict[str, WorkloadSpec]:
    """Every downloaded-model dump directory under `examples_root`.

    A directory qualifies by containing a model_info.json, which compile_hf_model.py writes
    on a successful run. Malformed ones are skipped rather than crashing the whole build --
    one bad directory should not stop the other workloads' artifacts from being produced.
    """
    examples_root = Path(examples_root)
    if not examples_root.is_dir():
        return {}

    specs: dict[str, WorkloadSpec] = {}
    for info_path in sorted(examples_root.glob("*/model_info.json")):
        try:
            model_info = json.loads(info_path.read_text())
            spec = spec_from_dump_dir(info_path.parent, model_info)
        except (OSError, ValueError):
            continue
        if spec.stages:
            specs[spec.id] = spec
    return specs
