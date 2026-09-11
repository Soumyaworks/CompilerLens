"""Linear+ReLU workload: relu(x @ weight + bias), lowered through IREE to llvm-cpu/znver5.

Structurally this mirrors matmul.py almost exactly -- same ir_00..ir_12 numbering, same
single dispatch, same pass-log pair, loc() throughout. The thing this workload demonstrates
that matmul cannot is operation fusion: the bias-add and relu are two separate torch ops
(torch.aten.add.Tensor
at line 9, torch.aten.relu at line 10) that IREE first fuses into a single linalg.generic
epilogue, then fuses *that* into the same dispatch as the matmul itself. All three PyTorch
ops end up as one kernel.
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
        "export_linear_relu.py",
        "pytorch-source",
        "PyTorch Source",
        PHASE_FRONTEND,
        "python",
        "The original model. relu(x @ weight + bias), a 128x128 linear layer followed by a "
        "bias add and a ReLU, exported through iree-turbine's AOT interface.",
        track="source",
    ),
    StageSpec(
        "mlir/ir_00_torch_input.mlir",
        "torch-input",
        "Torch Input",
        PHASE_FRONTEND,
        "mlir",
        "The model as three Torch-dialect operations: torch.aten.matmul (line 6), "
        "torch.aten.add.Tensor (line 9, the bias), torch.aten.relu (line 10). Every later "
        "stage's loc() metadata points back to one of these three lines.",
    ),
    StageSpec(
        "mlir/ir_01_input.mlir",
        "input",
        "IREE Input",
        PHASE_INPUT,
        "mlir",
        "Torch lowered into linalg, plus IREE's buffer ABI. The matmul becomes "
        "linalg.fill + linalg.matmul as usual, but the bias-add and relu each become their "
        "own linalg.generic -- three separate operations, not yet fused.",
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
        "Operations are grouped into dispatch regions. This is where the fusion decision "
        "gets made: the bias-add and relu generics are merged into one linalg.generic "
        "epilogue, and that epilogue is grouped into the same dispatch as the matmul.",
    ),
    StageSpec(
        "mlir/ir_06_flow.mlir",
        "flow",
        "Flow",
        PHASE_FLOW,
        "mlir",
        "The fused region becomes a single flow.dispatch call against one outlined "
        "executable -- three PyTorch ops, one dispatch.",
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
        "The executable is now a standalone module ready for target-specific codegen, "
        "still at linalg level.",
    ),
    StageSpec(
        "mlir/ir_09_executable-configurations.mlir",
        "executable-configurations",
        "Executable Configurations",
        PHASE_CODEGEN,
        "mlir",
        "The codegen strategy is chosen and attached to the IR: translation_info "
        "(CPUDoubleTilingExpert) and lowering_config (the tile sizes) -- the same pipeline "
        "matmul used, now covering the fused matmul+bias+relu kernel.",
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
        "The device kernel track begins here: main$async_dispatch_0, handed to the "
        "LLVM-CPU backend. Inside it, linalg.matmul is followed by one linalg.generic "
        "whose body does addf (the bias), then cmpf+select (the relu) -- the bias-add and "
        "relu fused into a single epilogue, in the same dispatch as the matmul.",
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
        "After the LLVM optimisation pipeline. Look for the vectorised compare/select "
        "sequence right after the fused-multiply-adds -- that is the relu, vectorised "
        "alongside the matmul it was fused with.",
        track="device",
    ),
    StageSpec(
        "llvm/dispatch_0.s",
        "target-asm",
        "x86-64 Assembly",
        PHASE_BINARY,
        "asm",
        "The emitted machine code for znver5: vfmadd instructions for the matmul followed "
        "by vector compare/blend instructions for the relu, all in one function -- three "
        "PyTorch operations compiled down to one fused loop nest.",
        track="device",
    ),
]

_PASS_TRACKS: list[PassTrackSpec] = [
    PassTrackSpec(
        log_path="passes/passes_stepA_torch_to_iree.txt",
        scope_contains="!torch.vtensor",
        insert_after="torch-input",
        track="pass-torch",
        phase=PHASE_FRONTEND,
        description=(
            "Torch-to-linalg conversion, one pass at a time. ConvertTorchToLinalg turns "
            "all three ops -- matmul, bias-add, relu -- into linalg at once, as three "
            "separate operations that later passes will fuse."
        ),
    ),
    PassTrackSpec(
        log_path="passes/passes_stepB_full_pipeline.txt",
        # IREE names the dispatch after the matmul it contains even though the fused
        # bias-add + relu ride along in the same kernel -- confirmed against the vendored
        # dump rather than assumed.
        scope_contains="dispatch_0_matmul",
        insert_after="executable-configurations",
        track="pass-kernel",
        phase=PHASE_CODEGEN,
        description=(
            "Device codegen for the fused matmul+bias+relu kernel, one pass at a time: "
            "tiling into loops, vectorisation (of the matmul and the relu together), "
            "bufferization, then lowering to control flow."
        ),
    ),
]

WORKLOAD = WorkloadSpec(
    id="linear_relu",
    title="linear_relu",
    description="relu(x @ weight + bias) -- operation fusion: three PyTorch ops become one dispatch.",
    dump_root="examples/linear_relu",
    source_entry="torch.relu(x @ weight + bias)",
    stages=_STAGES,
    pass_tracks=_PASS_TRACKS,
)
