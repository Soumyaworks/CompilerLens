"""Matmul workload: torch.matmul on two 128x128 f32 tensors, lowered through IREE to
llvm-cpu/znver5 (DESIGN-DOC Demo 1).

IREE's real pipeline is a tree, not a line: the host program (flow -> stream -> hal -> vm)
and the device kernel (executable-sources -> ... -> LLVM -> assembly) diverge after
dispatch creation. We present a single ordered list because a linear timeline is far easier
to navigate, but we keep IREE's own phase numbering for the phase dumps and append the
device-kernel track afterwards, with descriptions that say where it branched from. Ordering
that lies about the pipeline would undercut the point of the tool.
"""

from __future__ import annotations

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

_STAGES: list[StageSpec] = [
    StageSpec(
        "export_matmul.py",
        "pytorch-source",
        "PyTorch Source",
        PHASE_FRONTEND,
        "python",
        "The original model. torch.matmul on two 128x128 f32 tensors, exported through "
        "iree-turbine's AOT interface.",
        track="source",
    ),
    StageSpec(
        "mlir/ir_00_torch_input.mlir",
        "torch-input",
        "Torch Input",
        PHASE_FRONTEND,
        "mlir",
        "The model in the Torch dialect. The whole computation is still one operation: "
        "torch.aten.matmul on !torch.vtensor<[128,128],f32>. Every later stage's loc() "
        "metadata points back to line 3 of this file, which is what makes lineage possible.",
    ),
    StageSpec(
        "mlir/ir_01_input.mlir",
        "input",
        "IREE Input",
        PHASE_INPUT,
        "mlir",
        "Torch lowered into linalg, plus IREE's buffer ABI. This is where matmul first "
        "splits in two: a linalg.fill zeroes the accumulator and linalg.matmul does the "
        "contraction.",
    ),
    StageSpec(
        "mlir/ir_02_abi.mlir",
        "abi",
        "ABI",
        PHASE_INPUT,
        "mlir",
        "The public entry point and its coarse-fence async wrapper are materialised.",
    ),
    StageSpec(
        "mlir/ir_03_preprocessing.mlir",
        "preprocessing",
        "Preprocessing",
        PHASE_INPUT,
        "mlir",
        "Target-independent cleanup before the optimisation phases proper.",
    ),
    StageSpec(
        "mlir/ir_04_global-optimization.mlir",
        "global-optimization",
        "Global Optimization",
        PHASE_GLOBAL,
        "mlir",
        "Whole-program work: constant folding, canonicalisation, and layout decisions.",
    ),
    StageSpec(
        "mlir/ir_05_dispatch-creation.mlir",
        "dispatch-creation",
        "Dispatch Creation",
        PHASE_GLOBAL,
        "mlir",
        "Operations are grouped into dispatch regions -- the units IREE will later turn "
        "into separate device kernels. This is where fusion decisions get made.",
    ),
    StageSpec(
        "mlir/ir_06_flow.mlir",
        "flow",
        "Flow",
        PHASE_FLOW,
        "mlir",
        "Dispatch regions become flow.dispatch calls against outlined executables. The "
        "matmul is now a callee rather than inline IR.",
    ),
    StageSpec(
        "mlir/ir_07_stream.mlir",
        "stream",
        "Stream",
        PHASE_FLOW,
        "mlir",
        "Execution and memory are scheduled: allocations, timelines, and async resource "
        "lifetimes become explicit.",
    ),
    StageSpec(
        "mlir/ir_08_executable-sources.mlir",
        "executable-sources",
        "Executable Sources",
        PHASE_CODEGEN,
        "mlir",
        "Each executable is now a standalone module ready for target-specific codegen, "
        "still at linalg level.",
    ),
    StageSpec(
        "mlir/ir_09_executable-configurations.mlir",
        "executable-configurations",
        "Executable Configurations",
        PHASE_CODEGEN,
        "mlir",
        "The codegen strategy is chosen and attached to the IR. Look for translation_info "
        "(the pipeline: CPUDoubleTilingExpert) and lowering_config (the tile sizes). These "
        "attributes are the compiler stating its plan before carrying it out.",
    ),
    StageSpec(
        "mlir/ir_10_executable-targets.mlir",
        "executable-targets",
        "Executable Targets",
        PHASE_CODEGEN,
        "mlir",
        "The kernel after target codegen, now in the LLVM dialect and ready for LLVM "
        "proper. The tiling and vectorisation that got it here are the sub-stages listed "
        "above, recovered from the pass log.",
    ),
    StageSpec(
        "mlir/ir_11_hal.mlir",
        "hal",
        "HAL",
        PHASE_RUNTIME,
        "mlir",
        "The host program in the Hardware Abstraction Layer dialect: buffers, command "
        "buffers, and executable dispatches.",
    ),
    StageSpec(
        "mlir/ir_12_vm.mlir",
        "vm",
        "VM",
        PHASE_RUNTIME,
        "mlir",
        "The final host program as IREE VM bytecode operations -- what actually ships "
        "inside the .vmfb module.",
    ),
    StageSpec(
        "llvm/dispatch_0.mlir",
        "dispatch-kernel",
        "Dispatch Kernel (MLIR)",
        PHASE_LLVM,
        "mlir",
        "The device kernel track begins here. This is main$async_dispatch_0 as handed to "
        "the LLVM-CPU backend, branching off the Executable Targets phase above rather than "
        "following the VM stage before it. It is a self-contained module, which is what "
        "makes it replayable through iree-opt.",
        track="device",
    ),
    StageSpec(
        "llvm/dispatch_0.codegen.ll",
        "llvm-codegen",
        "LLVM IR (codegen)",
        PHASE_LLVM,
        "llvm",
        "LLVM IR straight out of the MLIR translation, before linking or optimisation.",
        track="device",
    ),
    StageSpec(
        "llvm/dispatch_0.linked.ll",
        "llvm-linked",
        "LLVM IR (linked)",
        PHASE_LLVM,
        "llvm",
        "After linking against IREE's device runtime library, which is why the module "
        "suddenly gains maths helpers such as __extendhfsf2.",
        track="device",
    ),
    StageSpec(
        "llvm/dispatch_0.optimized.ll",
        "llvm-optimized",
        "LLVM IR (optimized)",
        PHASE_LLVM,
        "llvm",
        "After the LLVM optimisation pipeline. The <16 x float> vector types here are the "
        "proof that vectorisation succeeded: 16 lanes of f32 is exactly the target's "
        "64-byte native vector size.",
        track="device",
    ),
    StageSpec(
        "llvm/dispatch_0.s",
        "target-asm",
        "x86-64 Assembly",
        PHASE_BINARY,
        "asm",
        "The emitted machine code for znver5. The 128 vfmadd231ps instructions are fused "
        "multiply-adds on 512-bit %zmm registers -- 16 f32 lanes each, matching the "
        "<16 x float> in the optimised LLVM IR and the 64-byte native_vector_size exactly. "
        "This is the matmul's inner loop, all the way down.",
        track="device",
    ),
]

# Per-pass snapshots recovered from --mlir-print-ir-after-all logs. These are what closed
# the codegen gap: the phase dumps jump from linalg.matmul straight to LLVM dialect, and
# these fill in every step between.
_PASS_TRACKS: list[PassTrackSpec] = [
    PassTrackSpec(
        log_path="passes/passes_stepA_torch_to_iree.txt",
        # The Torch-dialect entry function, before IREE's own pipeline takes over.
        scope_contains="!torch.vtensor",
        insert_after="torch-input",
        track="pass-torch",
        phase=PHASE_FRONTEND,
        description=(
            "Torch-to-linalg conversion, one pass at a time. ConvertTorchToLinalg is the "
            "step that matters: torch.aten.matmul becomes linalg.matmul plus a linalg.fill "
            "that zeroes the accumulator."
        ),
    ),
    PassTrackSpec(
        log_path="passes/passes_stepB_full_pipeline.txt",
        # The dispatch kernel function, whose codegen the phase dumps skipped entirely.
        scope_contains="dispatch_0_matmul",
        insert_after="executable-configurations",
        track="pass-kernel",
        phase=PHASE_CODEGEN,
        description=(
            "Device codegen for the matmul kernel, one pass at a time. This is the sequence "
            "the phase dumps skipped: tiling into loops, then vectorisation, then "
            "bufferization, then lowering to control flow."
        ),
    ),
]

WORKLOAD = WorkloadSpec(
    id="matmul",
    title="matmul",
    description="torch.matmul on two 128x128 f32 tensors -- lowering, tiling, vectorization.",
    dump_root="examples/matmul",
    source_entry="torch.matmul",
    stages=_STAGES,
    pass_tracks=_PASS_TRACKS,
)
