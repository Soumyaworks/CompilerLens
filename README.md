# CompilerLens

**SegFault_2026 AI Compiler Optimization Explorer**

CompilerLens is an interactive platform for understanding how AI models are
transformed by a compiler from high-level PyTorch code down to MLIR/LLVM and,
eventually, machine-level representations. Full product vision, scope, and
20-day plan: see [`DESIGN-DOC.md`](./DESIGN-DOC.md).

This README covers only what exists right now: a working PyTorch → MLIR →
LLVM → machine-code pipeline, and a reusable script (`backend/compiler/runner.py`)
that produces IR dumps at every stage of that pipeline for a given PyTorch
module.

## What's been done so far

1. **Toolchain validated end-to-end.** Confirmed we can take a PyTorch
   `nn.Module`, export it through `iree-turbine`, and compile it all the way
   through MLIR's `torch` → `linalg` → `flow` → `stream` → `hal` → `vm`
   dialects, down to real LLVM IR, x86-64 assembly, and an ELF object file.
2. **Three example workloads compiled and dumped:**
   - `matmul` — demonstrates lowering, tiling, and vectorization.
   - `linear_relu` (`relu(x @ w + b)`) — demonstrates **operator fusion**:
     the bias-add and ReLU get fused directly into the matmul's dispatch
     region as a single `linalg.generic`, rather than three separate ops.
   - `mini_transformer` — a small hand-built transformer encoder block
     (QKV projection, attention with softmax, residual + LayerNorm, MLP with
     ReLU) exercising a much richer operator mix (6 matmuls, a dedicated
     `linalg.softmax` op, reduction-based LayerNorm) than a single op alone.
     Even with this many ops, IREE still fuses everything into a **single**
     dispatch region — same as the two single-op examples.
3. **A reusable runner** (`backend/compiler/runner.py`) that automates the
   whole dump-generation process — no more hand-typing `iree-compile`/`iree-opt`
   commands per workload — and produces a per-operator count breakdown in
   `manifest.json`.

The API/website integration layer (serving these dumps dynamically to a
frontend) is being handled separately by Ananya and is not part of this
backend script.

## Prerequisites

- Linux, Python 3.10 or 3.11
- No GPU required — everything targets the CPU (`llvm-cpu` backend, host CPU
  features)
- No `sudo` / system packages required. If `python3 -m venv` fails on your
  machine with an `ensurepip` error (missing `python3.10-venv` apt package),
  skip the built-in `venv` module and use pip-installed `virtualenv` instead
  (see setup below) — this avoids needing sudo entirely.

## Setup

```bash
cd CompilerLens

# If `python3 -m venv .venv` fails with an ensurepip error, use this instead:
python3 -m pip install --user virtualenv
python3 -m virtualenv .venv

# Otherwise the stdlib venv works fine:
# python3 -m venv .venv

source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install torch --index-url https://download.pytorch.org/whl/cpu
python -m pip install iree-turbine
```

Verify the install:
```bash
iree-compile --version
python -c "import torch, iree.turbine.aot as aot, iree.compiler as ic, iree.runtime as rt; print(torch.__version__)"
```

## Running the compiler runner

The runner takes a PyTorch module + example inputs (defined in `examples/`)
and produces the full dump set into an output directory.

```bash
source .venv/bin/activate

python -m backend.compiler.runner --example matmul --out experiments/runner_output/matmul
python -m backend.compiler.runner --example linear_relu --out experiments/runner_output/linear_relu
python -m backend.compiler.runner --example mini_transformer --out experiments/runner_output/mini_transformer
```

**Inputs:**
- `--example` — name of a registered example workload: `matmul`, `linear_relu`,
  or `mini_transformer` (registry: `EXAMPLES` dict in `backend/compiler/runner.py`).
  Each example lives in `examples/<name>.py` and exposes `build_module()`
  (returns an `nn.Module`) and `example_inputs()` (returns the args tuple to
  trace it with).
- `--out` — output directory. Created if it doesn't exist.

**To add a new workload:** create `examples/<new_name>.py` with the same
`build_module()` / `example_inputs()` interface, then add it to the `EXAMPLES`
dict in `backend/compiler/runner.py`. No changes to the runner logic itself
are needed.

## What gets generated

For a run named `<name>` into `<out>/`:

| File(s) | What it is |
|---|---|
| `ir_00_torch_input.mlir` | The module exported to MLIR's `torch` dialect (the starting point) |
| `ir_01_input.mlir` … `ir_12_vm.mlir` | IR after each of the 12 named IREE pipeline stages (`input`, `abi`, `preprocessing`, `global-optimization`, `dispatch-creation`, `flow`, `stream`, `executable-sources`, `executable-configurations`, `executable-targets`, `hal`, `vm`) |
| `dumps/*.codegen.ll` / `.bc` | LLVM IR right after MLIR→LLVM translation, before LLVM's own optimizer runs |
| `dumps/*.optimized.ll` / `.bc` | LLVM IR after LLVM's optimization passes |
| `dumps/*.linked.ll` / `.bc` | LLVM IR after linking in runtime support code |
| `dumps/*.s` | Real x86-64 assembly (AT&T syntax), with source-line annotations |
| `dumps/*.o` | Real ELF object file (disassemble with `objdump -d`) |
| `dumps/*.so` | Final linked shared library |
| `<name>_compiled_host.vmfb` | The final compiled IREE binary |
| `step_a_iree_input.mlir` | Intermediate output of the torch→IREE-input lowering step |
| `passes_stepA_torch_to_iree.txt` | Every single MLIR pass boundary during torch-dialect lowering (dozens of dumps) |
| `ir_final_vm.mlir` | Final `vm`-dialect IR from the full instrumented pipeline |
| `passes_stepB_full_pipeline.txt` | Every single MLIR pass boundary from `linalg` through to `vm` (hundreds to ~1000 dumps, can be tens of MB) |
| `manifest.json` | Index of every file this run produced, the exact commands used, and an `"operators"` breakdown (counts of each `linalg.*`/`torch.*`/`arith.*`/`vector.*`/`scf.*` op found in `ir_08_executable-sources.mlir`) |

All stages/dumps carry `loc(...)` debug-info annotations pointing back to the
original source line, via `--mlir-print-debuginfo`.

### Flags used, and why

All dumps use this fixed flag set:
- `--iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu=host` — target
  the actual host CPU. Without `target-cpu=host`, IREE defaults to a generic
  CPU and vectorization silently degrades to `vector<1xf32>` (no real SIMD) —
  we hit this in practice comparing the two.
- `--mlir-print-debuginfo` — keep source-location info on every op through
  every stage.
- `--mlir-print-ir-after-all` (used only for the two `iree-opt` pass-trace
  steps) — dump IR after *every* pass, not just the 12 named checkpoints.
- The pass-trace is a **two-step** `iree-opt` run (`--torch-to-iree` first,
  then `--iree-transformation-pipeline` on its output) because `iree-opt`,
  unlike `iree-compile`, does not auto-detect and lower the `torch` input
  dialect — running the full pipeline directly on torch-dialect input fails
  with an unresolved-conversion error at VM-conversion time.

## Repository layout

```
CompilerLens/
├── DESIGN-DOC.md              # Full product design doc and 20-day plan
├── backend/
│   └── compiler/
│       └── runner.py          # CompilerRunner: reusable dump-generation pipeline
├── examples/
│   ├── matmul.py               # torch.matmul(a, b)
│   ├── linear_relu.py          # relu(x @ w + b)
│   └── mini_transformer.py     # small transformer encoder block (attention + MLP)
└── experiments/                # Hand-run exploration output (see below)
    ├── matmul_ir_dump/
    ├── matmul_llvm_dumps/
    ├── matmul_debug_passes/
    ├── linear_relu_dumps/
    └── runner_output/          # Output of backend/compiler/runner.py
```

The `experiments/*_dumps/` and `matmul_ir_dump/`/`matmul_llvm_dumps/` folders
are earlier, hand-run explorations kept as reference/ground-truth — they're
what `backend/compiler/runner.py` was built to reproduce programmatically.
`experiments/runner_output/` is the runner's own output and can be regenerated
at any time by re-running the commands above.

## What's next

Per `DESIGN-DOC.md`'s Week 1 plan, the next steps are:
- Draft the CompilerLens Artifact Schema (§6) — a JSON representation of
  stages/operations/transformations, informed by the real IR shapes seen in
  `matmul`, `linear_relu`, and `mini_transformer`. The `manifest.json`
  operator-count breakdown is a first, deliberately-rough step toward this,
  not the schema itself.
- Implement basic transformation extraction — parse the stage dumps to
  automatically classify what happened to an operation (Lowered / Fused /
  Vectorized / Eliminated), rather than `grep`-ing dumps by hand.
- Capture structured optimization remarks (e.g. LLVM's `-Rpass=` family) as a
  more direct source of "why" evidence than diffing IR text.
- Revisit real HuggingFace model downloads once the multi-op pattern proven
  by `mini_transformer` is solid — real models risk `torch.export` tracing
  failures from dynamic control flow (attention masking, KV-cache branches),
  which is why this round used a hand-built module instead.
