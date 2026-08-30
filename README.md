# CompilerLens

**Understand what your compiler did.**

An interactive explorer for AI compiler pipelines. Follow a PyTorch model from
`torch.matmul` down through MLIR, LLVM IR, and x86-64 assembly, with the compiler's own
optimisation decisions shown alongside the IR they produced.

See [`DESIGN-DOC.md`](DESIGN-DOC.md) for the product vision and [`PLAN.md`](PLAN.md) for the
staged implementation plan.

## Status

**Stage 1 complete: static pipeline explorer, Compiler-Explorer-style.**

- **Two workloads**, picked from a landing page rather than hardcoded: `matmul`
  (`torch.matmul`, 55 stages) and `linear_relu` (`relu(x @ weight + bias)`, 59 stages) —
  each with its own vendored dumps, stage list, and compiler evidence.
- A **golden-layout workspace** per workload: a source pane plus independently addable,
  draggable, resizable, dockable panes, mirroring Compiler Explorer's own interaction model.
  Each stage pane carries its own searchable, phase-grouped stage picker (`tom-select`) and
  its own IR/Diff/loc() state — panes don't share selection.
- Monaco-based IR viewer with MLIR, LLVM IR, and x86 assembly syntax highlighting, plus a
  loc() metadata visibility toggle
- Track-aware stage-to-stage diff: only stages that are genuinely sequential get compared
- Compiler evidence (11 items for matmul, 12 for linear_relu — including a fused-epilogue
  item unique to linear_relu), each linked back to the stage it was read from; clicking a
  link opens a new stage pane on that stage
- `npm run verify` — 27 headless-browser assertions across the landing page and workspace,
  zero console errors

Lineage, the Optimization Doctor, and the AI explanation layer are Stages 2-4 in `PLAN.md`.
Both original pipeline gaps (missing `loc()` metadata, uncaptured codegen) are closed —
see "Known gaps" in `PLAN.md` for how.

## Quick start

Requires Python 3.10+ and Node 20+. Both are already set up on this machine (Node 22 via
per-user `nvm`, wired into `~/.bashrc` — see "Environment notes" below for why).

```bash
cd /local/mnt/workspace/CompilerLens/frontend
npm install                                       # first time only
npm run artifact     # dumps -> frontend/public/artifacts/*.json  (pure Python, no deps)
npm run dev           # starts Vite, prints a URL
```

Open the printed URL in a browser — `http://localhost:5173` if you're on the box directly,
or `http://<this-machine's-IP>:5173` from elsewhere (Vite is configured to listen on all
interfaces). Leave `npm run dev` running in its terminal; it live-reloads on file changes.
Ctrl-C stops it.

**If `node`/`npm` aren't found:** open a fresh terminal (nvm loads from `~/.bashrc` on new
shells), or run `export NVM_DIR="$HOME/.nvm" && . "$NVM_DIR/nvm.sh"` in the current one.

`npm run artifact` regenerates every workload's normalized artifact (`matmul.json`,
`linear_relu.json`) plus the landing page's `index.json` from the vendored dumps in
`examples/`. Run it again whenever the ingest layer, `examples/`, or the pass logs change —
the running dev server picks up the new artifacts on next browser refresh, no restart
needed.

### Verifying

```bash
npm run verify       # headless browser checks + screenshots
```

Renders the app in Chromium and asserts the landing page, golden-layout workspace, stage
picker (search + phase grouping), diff worker, histogram, evidence-driven pane navigation,
add-pane, loc() toggle, and the second workload's distinct evidence all actually work — 27
checks, fails on any console error. Needs `npm run dev` already running in another terminal
(it hits `localhost:5173`), and a one-time browser install:

```bash
export PLAYWRIGHT_BROWSERS_PATH=/local/mnt/workspace/.playwright   # see note below
npx playwright install chromium
npm run verify
```

Screenshots land in `frontend/screenshots/` — e.g. `02-diff.png` is a pass-to-pass diff, and
`05-linear-relu.png` is the second workload's workspace with its fused-epilogue evidence.

## Architecture

**The artifact is the contract.** One normalized JSON document per workload sits between
the compiler and the UI; neither side knows anything else about the other.

```
compiler dumps ──► ingest (Python, stdlib only) ──► artifacts/<id>.json ──► frontend (React)
                                                              ▲
                                      Stage 5: POST /compile writes the same shape
```

This is why static and live compilation are the same code path: going live means adding a
process invocation in front of ingest, not rewriting the viewer.

```
ingest/
  schema.py         the frozen contract -- mirrored in frontend/src/api/artifact.ts
  mlir_parser.py    MLIR operation extraction
  mlir_loc.py        loc() parsing and stripping (aliases, fused DWARF locations)
  llvm_parser.py    LLVM IR + x86 assembly extraction
  pass_log.py        --mlir-print-ir-after-all log splitting and change detection
  workloads/         one module per workload: stage + pass-track definitions (order,
                      phases, descriptions), aggregated into a WORKLOADS registry
  build.py          CLI entrypoint: per-workload stage assembly, evidence extraction,
                      and the landing page's index.json

examples/
  matmul/           vendored deterministic fixtures (IREE dumps + pass logs)
  linear_relu/       a second workload, same fixture shape, its own fusion story

frontend/
  src/
    LandingPage.tsx       workload picker -- fetches artifacts/index.json
    Workspace.tsx         golden-layout host for one workload's artifact
    golden-layout/         the React <-> golden-layout bridge (component factories)
    panes/                 SourcePane / StagePane / EvidencePane / NotesPane
    widgets/StagePicker.tsx  tom-select stage picker, grouped by phase
    components/             IRViewer, SemanticDiff, StageStats, EvidencePanel
```

`ingest/` deliberately uses **only the Python standard library**, so it runs anywhere
without a virtualenv.

## The worked examples

`examples/matmul/` is `torch.matmul` on two 128x128 f32 tensors, lowered through IREE to
the `llvm-cpu` backend for `znver5`. The interesting thing it demonstrates is a complete,
independently corroborated optimisation story:

| Evidence | Source |
|---|---|
| `native_vector_size = 64` bytes | executable variant target |
| `translation_info<pipeline = CPUDoubleTilingExpert>` | `ir_09_executable-configurations.mlir` |
| `lowering_config<vector_common_parallel = [8, 16]>` | `ir_09_executable-configurations.mlir` |
| `<16 x float>` — 945 uses | `dispatch_0.optimized.ll` |
| 141 x `vfmadd231ps`/`vfmadd213ps` on `%zmm` with `{1to16}` | `dispatch_0.s` |

64 bytes ÷ 4 bytes per f32 = 16 lanes, which is exactly the `<16 x float>` in the LLVM IR
and exactly the `%zmm` width in the assembly. Three independent sources agree, so the claim
"vectorisation used the full register" is substantiated rather than asserted.

The pass-log sub-stages make the *path* to that vector width visible too: open a stage pane
and pick **GenericVectorization** (under Codegen) to watch `linalg.matmul` become
`vector.contract` in a single pass, then step forward to watch it lower all the way to
`vfmadd231ps`.

`examples/linear_relu/` is `relu(x @ weight + bias)` — the same lowering, but IREE fuses all
three PyTorch ops into one dispatch: the device kernel's `linalg.matmul` is followed by a
single `linalg.generic` whose body does the bias-add (`arith.addf`) and the relu
(`arith.cmpf` + `arith.select`), both in the matmul's own epilogue rather than as separate
kernels. That fusion is exactly the kind of missed-or-made optimisation this tool exists to
surface, and it's real, ingest-detected evidence — not asserted copy — sourced straight from
the dispatch kernel's MLIR.

## Known gaps — closed

Both original gaps were closed by Soumya's `matmul_debug_passes` regeneration:

1. **`loc()` metadata** now annotates nearly every operation in every MLIR stage, resolved
   into `Operation.source_loc` by `ingest/mlir_loc.py`. This is the anchor Stage 2 lineage
   will use. Toggle it on in the IR viewer (the `loc()` checkbox next to IR/Diff) — off by
   default because it makes the IR considerably harder to read.
2. **Codegen is no longer a black box.** A 946-dump `--mlir-print-ir-after-all` log
   (`passes/passes_stepB_full_pipeline.txt`) captures every pass that touched the matmul
   kernel; `ingest/pass_log.py` keeps the 31 that changed the IR and nests them under
   "Executable Configurations" in the pipeline. A second log does the same for the
   Torch-to-Linalg conversion.

See `PLAN.md` → "Known gaps" for the full account, including what's still a fallback (a
minority of operations still resolve to `source_loc: null` and need structural matching).

## Environment notes

The development machine had no `node`, `npm`, `pip`, or `sudo`. If you hit the same:

- Install Node per-user with [`nvm`](https://github.com/nvm-sh/nvm); no root needed. The
  installer appends sourcing to `~/.bashrc`, so new shells pick it up automatically.
- If `$HOME` is a quota-limited NFS volume, `npm` fails with `EINTEGRITY` or
  `errno -122` (`EDQUOT`). Point its cache at local disk:
  `npm config set cache /path/on/local/disk/.npm-cache`.
- Set `PLAYWRIGHT_BROWSERS_PATH` to local disk for the same reason.

## Team

Dead_Code_Society — Soumya (compiler pipeline, analysis) · Ananya (frontend, UX)
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
