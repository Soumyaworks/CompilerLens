# CompilerLens

**Understand what your compiler did.**

An interactive explorer for AI compiler pipelines. Follow a PyTorch model from
`torch.matmul` down through MLIR, LLVM IR, and x86-64 assembly, with the compiler's own
optimisation decisions shown alongside the IR they produced.

See [`DESIGN-DOC.md`](DESIGN-DOC.md) for the product vision and [`PLAN.md`](PLAN.md) for the
staged implementation plan.

## Status

**Stage 1 complete: static pipeline explorer, Compiler-Explorer-style.**

- **Any model from the HuggingFace Hub, by id, with no code to write.** Two hand-written
  workloads — `matmul` (`torch.matmul`, 55 stages) and `linear_relu` (`relu(x @ weight + bias)`,
  59 stages) — plus however many downloaded models you compile, whose stage lists are
  generated from their dumps rather than written by hand. Currently checked in:
  `prajjwal1/bert-tiny`, `distilgpt2`, `sshleifer/tiny-gpt2`, and
  `hf-internal-testing/tiny-random-BertModel`. See "Compiling any model from HuggingFace".
- A **golden-layout workspace** per workload: a source pane plus independently addable,
  draggable, resizable, dockable panes, mirroring Compiler Explorer's own interaction model.
  Each stage pane carries its own searchable, phase-grouped stage picker (`tom-select`) and
  its own IR/Diff/loc() state — panes don't share selection.
- Monaco-based IR viewer with MLIR, LLVM IR, and x86 assembly syntax highlighting, plus a
  loc() metadata visibility toggle
- Track-aware stage-to-stage diff: only stages that are genuinely sequential get compared
- Compiler evidence (11 items for matmul, 12 for linear_relu — including a fused-epilogue
  item unique to linear_relu; 23 and 25 for the two downloaded models), each linked back to
  the stage it was read from; clicking a link opens a new stage pane on that stage
- `npm run verify` — 48 headless-browser assertions across the landing page, workspace,
  Optimization Doctor, kernel cost, and Sandbox; zero console errors

Lineage, the Optimization Doctor, and the AI explanation layer are Stages 2-4 in `PLAN.md`.
Both original pipeline gaps (missing `loc()` metadata, uncaptured codegen) are closed —
see "Known gaps" in `PLAN.md` for how. Operation lineage (`ingest/lineage.py`) is computed into
every artifact but has no UI yet — see "Operation lineage" below and `ARCHITECTURE-NOTES.md`
§10.5-H.

## Quick start

Requires Python 3.10+ and Node 20+.

**If `node`/`npm` are not found**, install Node without sudo via nvm:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm" && . "$NVM_DIR/nvm.sh"
nvm install 22
```

On a machine where nvm is already wired into `~/.bashrc`, opening a fresh terminal is enough;
otherwise run the `export`/`.` line above in the current shell.

```bash
cd CompilerLens/frontend
npm install                                       # first time only
npm run artifact     # dumps -> frontend/public/artifacts/*.json  (pure Python, no deps)
npm run dev           # starts Vite, prints a URL
```

Open the printed URL in a browser — `http://localhost:5173` if you're on the box directly,
or `http://<this-machine's-IP>:5173` from elsewhere (Vite is configured to listen on all
interfaces). Leave `npm run dev` running in its terminal; it live-reloads on file changes.
Ctrl-C stops it.

`npm run artifact` regenerates every workload's normalized artifact plus the landing page's
`index.json` from the dumps in `examples/` — both the vendored hand-written workloads and any
model compiled by `scripts/compile_hf_model.py`. Run it again whenever the ingest layer,
`examples/`, or the pass logs change; the running dev server picks up new artifacts on the
next browser refresh, no restart needed.

### Compile from the landing page

Start the API alongside Vite (with the project compiler environment active):

```bash
python -m backend.api.run_server
```

Select the magnifying-glass button next to **CompilerLens**, enter a Hugging Face model id,
and choose **Compile & open**. The full dump pipeline runs in the background, writes the
trimmed model dumps and normalized artifact, adds a card to the landing page, and opens its
workspace when complete. The small `hf-internal-testing/tiny-random-BertModel` is a good first
run. This requires the same IREE/PyTorch/Transformers environment as the command-line compiler.

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
4. **Any model from the HuggingFace Hub**, by id, with no code to write —
   see the next section.

## Compiling any model from HuggingFace

Nothing needs registering first. The model class, whether it is a causal decoder or a
bidirectional encoder, its vocabulary size and a pinned revision are all worked out from the
id (`models/detect.py`), so adding a model costs no code.

### End to end, with a small model

`hf-internal-testing/tiny-random-BertModel` is a good first try: real BERT architecture,
88K parameters, vocabulary of 1124, so the whole run takes about 25 seconds and 22 MB.

**Step 1 — check the model is understood** (~5s, no compiling):

```bash
cd CompilerLens
source .venv/bin/activate
python scripts/compile_hf_model.py hf-internal-testing/tiny-random-BertModel --dry-run
```

```
hf-internal-testing/tiny-random-BertModel
  revision    fc08ad9cc33be9aef4f55cc80e16ef5ae3d5981c
  type        bert (bidirectional encoder)
  vocab       1124
  seq_len     32
  output      .last_hidden_state
  detected by autoconfig
```

Always worth doing on an unfamiliar model — it tells you what was detected before you spend
minutes compiling, and it is where an unsupported architecture fails.

**Step 2 — compile and dump** (~25s):

```bash
python scripts/compile_hf_model.py hf-internal-testing/tiny-random-BertModel --seq-len 16
```

This downloads the model, traces it, runs `iree-compile` once per pipeline stage, dumps the
LLVM IR and assembly, captures per-pass snapshots, and writes `model_info.json` into
`examples/hf-internal-testing_tiny-random-BertModel/`.

**Step 3 — look at the operators.** Three greps show the same computation at three levels of
abstraction, which is the whole point of the tool:

```bash
DIR=examples/hf-internal-testing_tiny-random-BertModel

# what PyTorch actually executed (Torch dialect)
grep -oE "torch\.aten\.[a-z_.0-9]+" $DIR/mlir/ir_00_torch_input.mlir | sort | uniq -c | sort -rn

# after lowering to linalg
grep -oE "linalg\.[a-z_]+" $DIR/mlir/ir_01_input.mlir | sort | uniq -c | sort -rn

# the kernels IREE decided to generate -- named after what they contain
grep -oE 'dispatch_[0-9]+_[a-z0-9_]+' $DIR/mlir/ir_08_executable-sources.mlir | sort -u
```

For bert-tiny that last one gives `batch_matmul_1x32x128x128` (attention),
`batch_matmul_1x32x128x512` and `1x32x512x128` (the feed-forward 4x expansion),
`reduction_32x128` (LayerNorm and softmax) — the architecture, in the compiler's own labels.

**Step 4 — run the compiled binary.** Optional, but this is what proves the IR describes a
real program rather than merely parsing:

```bash
cd $DIR
iree-run-module --module="$(echo *.vmfb)" --device=local-task --function=main \
  --input="1x16xi64=1" --input="1x1x16x16xf32=0"
cd -
```

```
EXEC @main
result[0]: hal.buffer_view
1x16x32xf32=[[-2.2963 -0.454847 2.55626 ...
```

Those are real hidden states out of the compiled model. Note the second input's shape:
`1x1x16x16xf32` is the **4D float mask** — the same shape the wrapper builds, and the reason
any of this compiles (see "Caveats" below).

**Step 5 — view it in the browser:**

```bash
cd frontend
npm run artifact      # regenerates every artifact, including the new model
npm run dev           # prints a URL
```

The model appears on the landing page alongside `matmul` and `linear_relu`. Clicking it opens
the workspace with its stages, diffs, and evidence. `npm run artifact` is pure Python and
needs no network.

### The two entry points

`scripts/compile_hf_model.py` is the convenience wrapper: it writes the `model_info.json`
that makes `ingest` treat the directory as a workload, and prints the `npm run artifact`
reminder. Use it when you want the model on the website.

`python -m backend.compiler.runner --hf-model <id>` is the lower-level tool, taking the same
shape as `--example`. Use it when you just want dumps on disk:

```bash
python -m backend.compiler.runner --hf-model distilgpt2 --seq-len 16 \
  --layout flat --out experiments/runner_output/distilgpt2
```

`--layout flat` gives one flat directory (like the older `--example` runs); `--layout ingest`
gives the `mlir/ llvm/ passes/` split that `ingest` reads. It does *not* write
`model_info.json`, so a run this way stays off the website until you add one.

### Other useful flags

```bash
python scripts/compile_hf_model.py <id> --seq-len 16       # shorter sequence, smaller dumps
python scripts/compile_hf_model.py <id> --dry-run          # detect only
python scripts/compile_hf_model.py <id> --full             # no trimming (see below)
python scripts/compile_hf_model.py <id> --out-dir /tmp/x   # somewhere other than examples/
python scripts/compile_hf_model.py <id> --revision <sha>   # pin an exact commit
python -m models.prefetch <id> <id> ...                    # pre-download, for offline demos
```

### Models known to work

| Model | Params | Time | Notes |
|---|---|---|---|
| `hf-internal-testing/tiny-random-BertModel` | 88K | ~20s | smallest useful test; 30 MB of dumps, 28 MB artifact |
| `hf-internal-testing/tiny-random-DistilBertModel` | ~0.5M | ~25s | same, DistilBERT |
| `prajjwal1/bert-tiny` | 4.4M | ~15s | real pretrained weights; 10 kernels, 13 MB artifact |
| `prajjwal1/bert-mini` | 11M | ~30s | exercises the config-keys fallback |
| `sshleifer/tiny-gpt2` | 0.1M | ~10s | smallest decoder |
| `distilgpt2` | 82M | ~40s | real decoder; 473 MB of dumps, mostly the `.vmfb` |

Parameter count is a poor predictor of dump size: `tiny-random-BertModel` has 88K parameters
but 11 layers, so it generates *more* stages and operations — and a bigger artifact — than
`bert-tiny`'s 4.4M parameters in 2 layers. Layer count drives the IR; weights drive the
`.vmfb`.

## Measuring, diagnosing, and playing

Three capabilities on top of the viewer. They stack: the Doctor needs measurement to say
what something *cost*, and the Sandbox needs a live compiler to change anything.

### 1. Measure — every decision gets a number

```bash
source .venv/bin/activate
python -m backend.measure.cli --list                                    # what can be compared
python -m backend.measure.cli prajjwal1/bert-tiny --dimension target-cpu
```

A *dimension* is one compiler decision held under a microscope: everything else stays fixed,
so a timing difference is attributable to that decision alone. Measured on this machine:

```
  Generic x86-64             13.277 ms ±0.181  cv=1.4%
  Host CPU (znver5)           0.498 ms ±0.021  cv=4.2%
  cpu-generic → cpu-host: 26.66x faster.
    native_vector_size: 16 bytes → 64 bytes
      source: hal.executable.variant target attribute
    Fused multiply-adds: 0 → 661 instructions
      source: emitted assembly (*.s)
```

That is the tool doing what it exists for: not "the compiler chose a vector width" but
"choosing it was worth 26x, and here is the attribute that caused it."

**It also refuses to overclaim.** The `opt-level` dimension exists precisely because it turns
out not to matter:

```
  O0  0.410 ms  cv=5.6%   (unreliable)
  O2  0.431 ms  cv=41.2%  (unreliable)
  opt-O0 → opt-O2: No measurable difference (0.95x is within the 46.8% combined
    variance of the two runs). Treat with caution: at least one run was unreliable.
```

Guards, in `backend/measure/bench.py`: median over ≥5 repetitions, variance always reported,
`reliable: false` above 5% CV, and any ratio inside the noise floor reported as *no
difference* rather than a win.

### 2. Diagnose — the tool tells you what is wrong

```bash
python3 -c "
from analyzer.diagnose import diagnose_file
d = diagnose_file('frontend/public/artifacts/prajjwal1_bert-tiny.json')
print(d['summary']['headline'])
for f in d['findings']: print(f\"  [{f['severity']}] {f['title']}\")"
```

The diagnosis is also **baked into every artifact at build time** by `npm run artifact`, so the
static site shows it with no server running: open any workload and add the **Doctor** pane. The
Sandbox's live `POST /diagnose` returns the identical shape, which is why both share one
component.

`matmul` and `linear_relu` are diagnosed **clean — zero findings**. That is the point: the rules
do not fire on well-optimised code, so when they do fire on a real transformer it means
something. `npm run verify` asserts both halves of that.

On `prajjwal1/bert-tiny`, unprompted:

```
5 missed optimisation(s). Most significant: 166 single-lane vector operations.
  [missed] 166 single-lane vector operations
  [missed] dispatch_0_elementwise_ runs as its own kernel
  [missed] dispatch_4_elementwise_transpose_ runs as its own kernel
  [missed] dispatch_8_elementwise_transpose_ runs as its own kernel
  [info  ] 2 layout-only kernel(s)
```

Three rules, each verified to fire on a real model:

| Rule | Looks for | Why it matters |
|---|---|---|
| `missed-vectorization` | `vector<1xf32>` survivors, and widths below `native_vector_size` | a one-lane vector is scalar code in vector syntax |
| `missed-fusion` | memory-bound kernels running as their own dispatch | each pays a full memory round trip for almost no arithmetic |
| `layout-churn` | transpose/pack kernels with no arithmetic | pure data movement — sometimes worth it, which is why it is `info` |

Every `Finding` carries fields designed to stop it sounding more certain than it is:

- **`confidence`** — `measured` (timed both ways) / `structural` (the IR plainly shows it) /
  `heuristic` (this pattern usually means trouble). A heuristic finding must not look measured.
- **`measured_cost_ms`** — `null` until something actually timed it, rendered as
  "unmeasured" rather than as zero.
- **`evidence`** — the IR line, quoted verbatim, with a line number to jump to.

### 3. Play — the Sandbox

```bash
# terminal 1
source .venv/bin/activate && python -m backend.api.run_server

# terminal 2
cd frontend && npm run dev
```

Then open the app and click **Open the Compiler Sandbox →**. Pick a model, flip a flag, hit
Compile. Measured latency: **~1-3s for a compile**, because the Sandbox only compiles the
stage you are looking at rather than all 41. `Measure` and `Diagnose` are separate buttons
because they cost seconds and firing them on every flag change would make the UI feel broken.

Flipping `target-cpu` from `host` to `generic` in the browser, on bert-tiny:

| | host | generic |
|---|---|---|
| timing | 0.414 ms | 13.428 ms |
| `native_vector_size` | 64 bytes | 16 bytes |
| FMA instructions | 661 | 0 |

The flag list is **server-side allowlisted** (`ALLOWED_FLAGS` in `backend/api/app.py`).
Arbitrary flag passthrough would be a command-injection risk and would also let a user
produce dumps the rest of the pipeline cannot interpret.

The API is additive: the landing page and workspace still read static artifacts and work with
no server running. Only the Sandbox needs it, and it says so when the server is down.

### 4. Operation lineage — built, not yet exposed in the UI

`ingest/lineage.py` groups every operation across all 41 stages by the `loc()` metadata the
compiler itself attaches to it (`--mlir-print-debuginfo`), producing a map from one PyTorch
source line to every operation it became, in every stage:

```
torch-input:110   %39 = torch.aten.scaled_dot_product_attention %26, %32, ...
       ↓
       became 2,166 operations across 25 stages
       executable-targets   1,928 lines, starting at
                            @main$async_dispatch_9_attention_2x32x64x64x32
```

This is DESIGN-DOC section 4.2's operation lineage, at section 7's **Level 1** and only Level 1:
grouped by the `loc()` metadata the compiler itself attached, with no structural matching and no
inference. An operation the compiler did not locate is absent from the index rather than guessed
at — a highlight that pointed at the wrong line would be worse than no highlight.

On `prajjwal1/bert-tiny`: **257 source lines** anchored, **14,441 operations** indexed, 31 of
those lines reaching a codegen or assembly stage. Every artifact carries this in its `lineage`
field today.

**There is no UI for it yet.** An interactive hover (Compiler-Explorer-style: hover a source
line, every open pane highlights what it became) was built and then reverted — it caused
flickering that a hover-triggered fix couldn't explain, because it reproduced with the mouse
completely still. See `ARCHITECTURE-NOTES.md` §10.5-H for the failed fix attempts and what a
retry should do differently. The data is sound; only the frontend wiring is missing.

### 5. What each kernel costs

The **Kernel cost** pane ranks every dispatch by the arithmetic it performs:

```
  kernel                                    kind      MFLOP  share    AI  bound by
  dispatch_13_batch_matmul_1x32x512x128     matmul     4.19   40.0%  12.2  compute
  dispatch_14_batch_matmul_1x32x128x512     matmul     4.19   40.0%  12.2  compute
  dispatch_10_batch_matmul_1x32x128x128     matmul     1.05   10.0%  10.7  compute
  dispatch_9_attention_2x32x64x64x32        attention     —       —     —  unknown
  dispatch_1_reduction_32x128               reduction     —       —     —  memory

  10 kernels · 10.49 MFLOP · 68.1 MB moved · AI 0.15 · 5 memory-bound
  machine peak ≈ 818 GFLOP/s (8 cores × 3196 MHz × 16 lanes × 2)
```

The two feed-forward matmuls are **80% of all arithmetic**. Overall arithmetic intensity is
**0.15 FLOPs per byte**, which says this model is bandwidth-limited rather than compute-limited —
and against measured whole-model time it reaches about **2.6% of theoretical peak**, exactly what
you would expect when there is too little arithmetic to amortise per-dispatch overhead.

**These numbers are modelled, and labelled `modelled` everywhere they appear.** FLOPs and bytes
come from the shapes IREE writes into its own kernel names; the machine peak is derived from
`/proc/cpuinfo` and the target's `native_vector_size`.

I tried to measure per-kernel time first, with `iree-benchmark-executable`, and it does not work
honestly: every `hal.executable.export` is `ordinal(0)` within its own executable so the linked
`.so`'s global ordinals are a guess, and workgroup counts are computed at runtime rather than
declared. Probing all 12 ordinals with plausible bindings returned **0.0000 ns for 11 of them** —
the kernels returned without doing their work. A tool that silently reports zero for a matmul
would be worse than no tool, so per-kernel wall-clock is absent and the measured figure remains
whole-model time.

### The overclaim this fixed

`ingest/build.py` used to stamp `status: "success"` on every piece of evidence, including
tile sizes we had never verified. For a tool whose premise is that every claim is sourced,
that was the worst line in the codebase. Now an attribute in the IR is `info` — the compiler
*stating its plan* — and only two things earn `success`: a vector width that cross-checks
against the target's declared register size (two independent sources agreeing), and FMA
instructions counted in the emitted assembly (an outcome, not an intention). `matmul` went
from 11 "success" items to 2.

## Caveats and limitations

**Timings are comparable to each other, not across machines.** Every number in this README was
measured on one 8-core znver5 box with ASLR enabled. A median over 5 runs with the CV reported
is honest about its own precision; it is not a benchmark result you could publish.

**The Doctor's rules are pattern matches, not proofs.** They read the compiler's own output and
report what they see. `confidence` qualifies each finding, and no rule currently produces a
`measured` one — wiring `backend/measure` into `analyzer` per-finding is the next step, and
until then `measured_cost_ms` is honestly `null` rather than estimated.

**Per-kernel *timing* is not built, and cannot be done honestly with the current tooling.**
The cost *model* is built (see "What each kernel costs"), but wall-clock per kernel is not:
`iree-benchmark-executable` needs workgroup counts IREE computes at runtime and never states,
and probing with guessed values returned 0.0000 ns for 11 of 12 kernels rather than erroring.
So the tool reports modelled arithmetic per kernel and measured time for the whole model, and
says which is which.

**The Sandbox needs its API server; nothing else does.** The landing page and workspace read
static artifacts and work offline. The Sandbox says so plainly when the server is down rather
than failing obscurely.


**Only encoder-only and decoder-only text models.** Detection needs a model that takes
`input_ids` + `attention_mask` and returns `last_hidden_state` or `logits`. Everything else
is rejected up front, with a message saying why, rather than producing a dump set that looks
authoritative and describes the wrong computation:

- *Vision / audio models* — no `vocab_size` in the config, so no input ids can be built.
  `google/vit-base-patch16-224` fails at detection.
- *Encoder-decoder (seq2seq)* — T5, BART, Marian and friends need `decoder_input_ids`
  alongside `input_ids`, which the two-argument wrapper does not supply. `t5-small` is
  rejected by name.
- *Multimodal* — same reason, plus image inputs.

Supporting these means teaching `models/detect.py` the new input signature and giving
`models/hf_wrapper.py` a matching `forward`.

**The attention mask must be 4D and float, and that is not cosmetic.** Given the usual 2D
integer mask, transformers (>=5.x) builds the 4D one itself via `masking_utils.and_masks`,
seeded with `q_idx.new_ones((), dtype=torch.bool)`. That traces to a zero-rank `i1`
`torch.vtensor.literal`, which IREE's torch-to-iree legalization rejects outright — the
compile dies before the input phase, for *every* model, encoder or decoder. Passing a 4D
float mask makes transformers return it unchanged, skipping that machinery. Patching
`and_masks` is not a fix: the failure just moves to `torch.aten.__and__.Tensor` on broadcast
bool shapes, which is equally unsupported. If a future transformers release stops
short-circuiting on 4D masks, that legalization error is the symptom to look for.

**Shapes are static, and baked in at trace time.** `--seq-len 16` compiles a model that only
accepts 16 tokens; batch size is always 1. This is a property of ahead-of-time compilation,
not a bug — but it means the dumps describe one shape, and a different sequence length is a
different compile.

**We compile models; we do not benchmark them.** The pipeline produces IR, assembly, and a
runnable `.vmfb`, and `iree-run-module` will execute it (step 4 above). Nothing measures
performance or compares against eager PyTorch, so the evidence in the UI is about what the
compiler *decided*, never about how fast the result is.

**Real models produce large dumps, and the defaults trim them.** An exported model carries
every weight inline: bert-tiny's Torch-dialect dump is 35 MB, essentially all weight payload,
and an untrimmed pass trace reached **8.6 GB**. See "Trimmed by default" below for exactly
what is reduced and how to opt out. Trimming never changes which stages or operations exist.

**Weights are downloaded at a pinned revision, but the first run needs network.** Every run
resolves the model id to a concrete commit sha, so results are reproducible; the download is
cached afterwards. Run `python -m models.prefetch <ids>` ahead of a demo to be safe.

**Generated stage lists are honest about what they do not know.** A hand-written workload
(`ingest/workloads/matmul.py`) can describe its tile sizes because someone verified them. A
generated one only states what was read from the dumps, so its stage descriptions are more
generic. That is deliberate.

### Adding a model that isn't a plain text encoder/decoder

Detection covers models that take `input_ids` + `attention_mask` and expose either
`last_hidden_state` or `logits`. Anything else fails with an explicit message naming what
could not be determined. Extending it means teaching `models/detect.py` the new input
signature.

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
python -m pip install transformers          # only needed for compile_hf_model.py
```

Verify the install:
```bash
iree-compile --version
python -c "import torch, iree.turbine.aot as aot, iree.compiler as ic, iree.runtime as rt; print(torch.__version__)"
```

## Running the compiler runner

The runner takes a PyTorch module + example inputs and produces the dump set into an output
directory. The module comes either from `examples/` or from the HuggingFace Hub.

```bash
source .venv/bin/activate

# hand-written examples
python -m backend.compiler.runner --example matmul --out experiments/runner_output/matmul
python -m backend.compiler.runner --example mini_transformer --out experiments/runner_output/mini_transformer

# a downloaded model, same command shape
python -m backend.compiler.runner --hf-model prajjwal1/bert-tiny --out experiments/runner_output/bert_tiny
python -m backend.compiler.runner --hf-model sshleifer/tiny-gpt2 --seq-len 16 --out experiments/runner_output/tiny_gpt2
```

**Inputs:**
- `--example` — a hand-written workload: `matmul`, `linear_relu`, or `mini_transformer`
  (registry: `EXAMPLES` in `backend/compiler/runner.py`). Each lives in `examples/<name>.py`
  and exposes `build_module()` and `example_inputs()`.
- `--hf-model` — any HuggingFace model id. Not a registry, because these are not enumerable:
  the model class, causal-vs-encoder, vocab size and revision are all detected from the id.
- `--out` — output directory. Created if it doesn't exist.
- `--seq-len` — sequence length to trace `--hf-model` with (default 32).
- `--layout` — `flat` puts everything in one directory; `ingest` uses the `mlir/ llvm/ passes/`
  subdirectories that `ingest/` reads. Defaults to `flat` for `--example`, `ingest` for
  `--hf-model`.
- `--full` — **no trimming.** See below.

### Trimmed by default, `--full` for everything

A downloaded model's dumps are trimmed unless you pass `--full`, because untrimmed they are
enormous: the same `sshleifer/tiny-gpt2` run is **12 MB trimmed and 283 MB full**, and
bert-tiny's pass log alone reaches 8.6 GB. What trimming does, and what `--full` restores:

| | trimmed (default) | `--full` |
|---|---|---|
| Weight payload in `ir_00_torch_input.mlir` | stripped, with a note saying how much | inline (35 MB for bert-tiny) |
| Large constants in stage dumps | elided (`--mlir-elide-elementsattrs-if-larger=16`) | printed in full |
| Per-pass snapshots in `passes_stepB` | after 8 named codegen passes (200 dumps) | after every pass (3,318 dumps) |

Trimming never changes *which* stages exist or which operations are in them — the compiler
always reads the full module, and only the displayed copy is trimmed. Use `--full` when you
want the complete record; use the default when you want something you can open.

The hand-written examples are never trimmed: they are small enough not to need it.

**To add a new hand-written workload:** create `examples/<new_name>.py` exposing
`build_module()` / `example_inputs()`, then add it to the `EXAMPLES` dict. Downloaded models
need no such step.

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
├── scripts/
│   └── compile_hf_model.py     # one command: HF model id -> workload on the website
├── models/                     # acquiring a model from somewhere online
│   ├── detect.py                # infer class / causal / vocab / revision from an id
│   ├── hf_wrapper.py            # 4D-float-mask wrapper; explains why it must be 4D
│   └── prefetch.py              # warm the HF cache so a demo can run offline
├── backend/
│   └── compiler/
│       └── runner.py           # CompilerRunner: reusable dump-generation pipeline
├── ingest/                     # dumps -> artifact JSON (stdlib only; see Architecture)
│   └── workloads/
│       ├── matmul.py            # hand-written stage list
│       ├── linear_relu.py       # hand-written stage list
│       └── generated.py         # stage list derived from a downloaded model's dumps
├── examples/
│   ├── matmul.py                # torch.matmul(a, b)
│   ├── linear_relu.py           # relu(x @ w + b)
│   ├── mini_transformer.py      # small hand-built transformer encoder block
│   ├── matmul/, linear_relu/    # vendored dumps for the hand-written workloads
│   └── prajjwal1_bert-tiny/, distilgpt2/   # dumps from compile_hf_model.py
└── experiments/                # earlier hand-run exploration, kept as reference
```

`ingest/workloads/generated.py` exists because a downloaded model cannot be described by a
hand-written stage list. Measured on bert-tiny: it compiled to **10 dispatch kernels** with
non-contiguous names (`dispatch_0,1,2,3,4,8,9,10,13,14` — IREE numbers them before
deduplicating), and emitted **one** linked LLVM/asm module rather than one per kernel. The
hand-written specs assume `llvm/dispatch_0.s` and a `dispatch_0_matmul` pass scope, neither
of which exists for a real model, so the generated spec globs for what is actually on disk
and names the largest kernel as the representative one.

Offline demos: `python -m models.prefetch prajjwal1/bert-tiny distilgpt2` downloads
everything at pinned revisions ahead of time, after which no network is needed.

## What's next

- Implement lineage and transformation extraction (Stage 2 in `PLAN.md`) — classify what
  happened to an operation (Lowered / Fused / Vectorized / Eliminated) rather than reading
  diffs by hand. The artifact schema already reserves `lineage_key` for this.
- Capture structured optimization remarks (e.g. LLVM's `-Rpass=` family) as a more direct
  source of "why" evidence than diffing IR text.
- Broaden model detection beyond text encoders/decoders (vision, seq2seq), which currently
  fail fast rather than guessing.
- Decide what to commit from `examples/prajjwal1_bert-tiny/` and `examples/distilgpt2/`:
  the artifacts are 13 MB and 20 MB, but the dump directories are 161 MB and 473 MB,
  the latter dominated by a 457 MB `.vmfb`.
