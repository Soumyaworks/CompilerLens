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
