# CompilerLens — Implementation Plan

Companion to `DESIGN-DOC.md`. That document describes *what* we are building and why.
This one describes *how we get there*, in the order we will actually do it.

## Guiding principle

**The artifact is the contract.**

Everything flows through one normalized JSON document. The ingest layer's only job is to
turn compiler output into that document; the frontend's only job is to render it. Neither
side knows anything about the other. This is DESIGN-DOC §6, and it is the decision that
lets us swap IREE for another compiler, or static dumps for live compilation, without
touching the UI.

```
compiler dumps ──► ingest (Python, zero deps) ──► artifact.json ──► frontend (React)
                                                        ▲
                                     later: FastAPI /compile writes the same shape
```

Consequence: **static and dynamic modes are the same code path.** Going live later means
adding a process invocation in front of ingest, not rewriting the viewer. That is the whole
reason we start static.

## Stage 1 — Static pipeline explorer  ✅ done

Goal: select a compilation stage, read its IR, diff it against the previous stage.

- [x] Vendor Soumya's IREE dumps into `examples/matmul/` as deterministic fixtures
- [x] `ingest/` — parse MLIR + LLVM IR + asm into `artifact.json`
- [x] Freeze artifact schema v0.1
- [x] `frontend/` — React + TS + Vite + Monaco
- [x] Pipeline sidebar, grouped by phase, with per-pass sub-stages nested under their phase
- [x] IR viewer with MLIR/LLVM/asm syntax highlighting and a loc() visibility toggle
- [x] Stage-to-stage diff (Monaco diff editor), track-aware so it never compares unrelated views
- [x] `npm run verify` — headless Chromium checks, 33 assertions, zero console errors

Exit criterion met: `npm run dev`, click through PyTorch → Torch → (pass-by-pass
Torch-to-Linalg) → Flow → Stream → Executable Configurations → (pass-by-pass codegen,
including the vectorization step) → HAL → VM → device kernel → LLVM → x86 asm, and diff any
adjacent pair within a track.

## Stage 2 — Operation lineage  ← next up

Goal: click `matmul`, see it across all stages (DESIGN-DOC §4.2).

The regenerated dumps (`matmul_debug_passes`) closed the lineage gap: every operation in
`Operation.source_loc` carries a resolved `"ir_00_torch_input.mlir":line:col"`, so Level-1
lineage (DESIGN-DOC §7) is now the primary mechanism rather than a fallback. `188` LLVM-dialect
ops in `Executable Targets` alone trace back to `torch.aten.matmul` at `3:10`.

What Level-1 gives for free: every operation sharing a `source_loc` is provably part of the
same lineage chain, across every phase *and* every pass sub-stage, with no matching
heuristics involved. What it does not give: the *classification* of the edge (lowered vs.
fused vs. tiled) -- that still needs Level 2/3 rules, now applied within an already-correct
grouping rather than used to build the grouping itself:

| From | To | Classification |
|---|---|---|
| `torch.aten.matmul` | `linalg.matmul` + `linalg.fill` | lowered + split |
| `linalg.matmul` | `scf.forall` / `scf.for` nest | tiled |
| `linalg.matmul` (tiled) | `vector.contract` | vectorized (at `GenericVectorizationPass`) |
| `vector.contract` | `llvm.fmul`/`llvm.intr.fmuladd` | lowered to LLVM |
| `linalg.fill` | `ub.poison` / folded init | fused into the vectorized loop |

Because the demo workloads are fixed and small, hand-authored classification rules for
these edges are honest and sufficient. DESIGN-DOC §7 already says the goal is reliable
lineage for the supported workloads, not general semantic equivalence.

Fallback: a handful of operations still show `source_loc: null` (`loc(unknown)`, or fused
DWARF locations we deliberately don't resolve into a fake source position -- see
`ingest/mlir_loc.py`). Those still need structural matching (name + operand/result types +
shape signature), so Level 2 isn't going away, just shrinking to the minority case.

## Stage 3 — Semantic diff + Optimization Doctor

Goal: explain the transformation, not just show it (DESIGN-DOC §4.4, §4.5).

Evidence already recoverable from the existing dumps — no new compiler work needed:

| Evidence | Source | Value |
|---|---|---|
| Tiling strategy | `ir_09` `translation_info` | `CPUDoubleTilingExpert` |
| Tile sizes | `ir_09` `lowering_config` | `cache_parallel = [16, 64]` |
| Vector width | `optimized.ll` | `<16 x float>` (949 uses) |
| FMA selection | `dispatch_0.s` | 128 × `vfmadd231ps` |
| Target | `dispatch_0.mlir` | `znver5`, `native_vector_size = 64` |

`native_vector_size = 64` bytes ÷ 4 bytes/f32 = 16 floats, which is exactly the
`<16 x float>` in the LLVM IR. That chain — target capability → compiler decision →
emitted instruction — is a complete, verifiable success story for one optimization, and
it is the strongest thing in the demo.

## Stage 4 — AI explanation

Grounded strictly in the Stage 3 evidence JSON (DESIGN-DOC §4.6). The LLM receives
evidence and never raw IR alone, so it interprets compiler facts rather than guessing at
compiler behaviour. No AI work starts before Stage 3 evidence exists.

## Stage 5 — Live compilation

FastAPI `POST /compile` shells out to `iree-compile`, writes dumps to a temp dir, runs the
identical ingest layer, returns the identical artifact shape. Frontend changes: none,
beyond swapping a static fetch for a POST.

## Known gaps in the current dumps

Both were closed by Soumya's `matmul_debug_passes` regeneration (vendored into
`examples/matmul/`) and are recorded here for history.

**1. No `loc()` metadata.** Closed. The regenerated MLIR dumps carry `loc("ir_00_torch_input.mlir":L:C)` on nearly every operation, resolved by `ingest/mlir_loc.py` (including the `#locN` alias form and fused DWARF locations) into `Operation.source_loc`. This is the Level-1 lineage anchor Stage 2 will match on.

**2. Codegen was a black box.** Closed. `passes_stepB_full_pipeline.txt` is a 946-dump `--mlir-print-ir-after-all` log; `ingest/pass_log.py` extracts the 86 dumps scoped to the matmul kernel function, keeps the 31 that actually changed the IR, and inserts them as nested sub-stages after "Executable Configurations" in the pipeline. `GenericVectorizationPass` is the single pass where `linalg.matmul` becomes `vector.contract` -- the exact transformation DESIGN-DOC §4.4 uses as its worked example, now fully visible pass-by-pass. A second log, `passes_stepA_torch_to_iree.txt`, does the same for the Torch→Linalg conversion (`ConvertTorchToLinalg` is where `torch.aten.matmul` becomes `linalg.matmul` + `linalg.fill`).

Both pass logs are large (the stepB log is 9.4 MB) and mostly redundant -- 60% of dumps change nothing, because most passes in a 229-pass pipeline don't touch every function. `ingest/build.py` keeps only the changed dumps and records what was hidden in the artifact's `notes`, following Compiler Explorer's `irChanged` convention (`lib/parsers/llvm-pass-dump-parser.ts`).


## Environment notes

This machine had no `node`, `npm`, `pip`, `ensurepip`, or `sudo`; network access works.

- Node installed per-user via `nvm` (`~/.nvm`), Node 22. Requires `. ~/.nvm/nvm.sh`.
- **Ingest deliberately uses only the Python 3.10 standard library**, since `pip` cannot
  install anything here. This is a real constraint, but also a good one — it keeps the
  ingest layer trivially runnable on any machine, including Soumya's.
- FastAPI (Stage 5) will need `pip` bootstrapped via `get-pip.py`. Deferred until needed.

## Repository layout

Follows DESIGN-DOC §11, minus the parts we have not reached.

```
CompilerLens/
├── DESIGN-DOC.md
├── PLAN.md
├── ingest/                 # dumps → artifact.json  (stdlib only)
│   ├── schema.py           # artifact dataclasses — the frozen contract
│   ├── mlir_parser.py      # MLIR op extraction
│   ├── mlir_loc.py         # loc() parsing + stripping (aliases, fused DWARF)
│   ├── llvm_parser.py      # LLVM IR + asm extraction
│   ├── pass_log.py         # --mlir-print-ir-after-all log splitting + change detection
│   ├── pipeline.py         # phase stages, pass-track specs, ordering, gap notes
│   └── build.py            # CLI entrypoint, evidence extraction, stage assembly
├── examples/matmul/        # vendored deterministic fixtures
│   ├── mlir/               # 14 IREE phase dumps, now with loc() metadata
│   ├── llvm/               # dispatch MLIR, 3× .ll, x86 .s
│   └── passes/             # 2 --mlir-print-ir-after-all logs (977 dumps total)
└── frontend/               # React + TS + Vite + Monaco
    ├── src/api/locations.ts    # client-side loc() stripping (mirrors mlir_loc.py)
    └── scripts/verify.mjs      # headless Chromium verification, 33 checks
```
