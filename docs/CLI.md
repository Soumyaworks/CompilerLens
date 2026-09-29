# CompilerLens CLI and native lineage

[Project overview](../README.md) · [LLVM component](../llvm/README.md) ·
[Release checklist](RELEASING.md)

The `feature/experiments-cli` branch provides a complete Python package, the existing viewer,
a standalone LLVM analyzer and a loadable LLVM New Pass Manager plugin. The packaged analyzer
runs on actual IREE output. Source attribution and LLVM def-use edges are separate relationships.

## Install from PyPI

For a fresh virtual environment, follow the [CLI quick start](../README.md#cli-quick-start).
Inside that environment, install the published package:

```bash
python -m pip install compilerlens==0.1.1 --index-url https://pypi.org/simple/ \
  --extra-index-url https://download.pytorch.org/whl/cpu
compilerlens doctor
compilerlens compile --example matmul --out runs/matmul --lineage required
compilerlens inspect runs/matmul
compilerlens view runs/matmul
```

This guide targets [version 0.1.1 on PyPI](https://pypi.org/project/compilerlens/0.1.1/).
See the [release checklist](RELEASING.md) for validation results and local wheel builds.
The repaired release wheel is `compilerlens-0.1.1-py3-none-manylinux_2_35_x86_64.whl`.
It bundles the existing React app,
Monaco workers, private native executable, LLVM license, zlib and zstd libraries/licenses.
End users do not need Node, CMake, `opt` or an LLVM SDK. Dependencies include the validated
PyTorch, Transformers, IREE compiler/runtime and Turbine versions in `pyproject.toml`.

The first wheel targets Linux x86-64 and was built/tested on glibc 2.35 with Python 3.10.
The build first produces a `linux_x86_64` wheel; auditwheel repair produces the tested
`manylinux_2_35_x86_64` wheel. macOS, Windows, ARM and older glibc
are not release targets. An LLVM 22 analyzer successfully parses the tested IREE 3.11.0
LLVM 23 development snapshots; arbitrary future IR compatibility is not promised.

## Capture parameters

| Argument | Default | Meaning |
|---|---|---|
| `MODEL_ID` / `--example NAME` / `--python FILE:FACTORY` | Choose one | HF model with a supported adapter, packaged example, or local Python factory |
| `--seq-len N` | 16, HF only | Static text length (including CLIP); not used by image-only ViT |
| `--revision REF` | Resolve main | Record a concrete HF commit; offline requires a cached ref or explicit cached SHA |
| `--offline` | false | Config and model loaders use cached resources only |
| `--cpu NAME` | host | IREE LLVM CPU target |
| `--out DIR` | Fresh timestamped directory | Refuse an existing directory |
| `--capture standard/full` | standard | Trim displayed constants and select pass snapshots, or capture full logs |
| `--seed N` | 0 | Seed generated weights/inputs; actual tensors are saved |
| `--lineage auto/required/off` | auto | Native analysis with explicit fallback, fail if unavailable/incompatible, or skip extra LLVM/assembly analysis |
| `--format text/json` | text | JSON stdout is reserved for the result; diagnostics use stderr |

```bash
compilerlens compile sshleifer/tiny-gpt2 --seq-len 8 --out runs/gpt2
compilerlens compile sshleifer/tiny-gpt2 --offline \
  --revision 5f91d94bd9cd7190a9f3216ff93cd1dd95f2c7be --out runs/gpt2-offline
compilerlens compile --example linear_relu --out runs/linear
compilerlens compile --python workload.py:build --out runs/local
compilerlens import examples/matmul --out runs/imported --lineage required
```

`build()` returns `(torch.nn.Module, tuple_of_example_tensors)`. The module is put in eval mode.
This explicitly executes local code. HF-only arguments are rejected for local/examples inputs.
The published examples are `matmul`, `linear_relu`, and `mini_transformer`.
This source branch additionally includes **unreleased** `tiny_vit` and `tiny_clip` demos:
random weights, synthetic tensors, and no model downloads. See the
[model compatibility section](../README.md#supported-model-architectures) for their exact scope
and source-webpage commands. ViT/CLIP captures on host/generic CPU write `verification.json`
with a PyTorch-vs-compiled numerical check; failure prevents a successful capture. This checks
one input sample, not prediction quality. The existing text-model workflow is unchanged.

### Validated HF checkpoints (unreleased)

| Checkpoint | Pinned revision | Captured task |
|---|---|---|
| `WinKawaks/vit-tiny-patch16-224` | `77d1485af66b34d4ed0fe95dbb0c60c7496f950b` | 224×224 image encoder, classification head/pooler excluded |
| `wkcn/TinyCLIP-ViT-8M-16-Text-3M-YFCC15M` | `a2a8c6eaa2549ad66eb7c31b85022bf58273a26c` | 224×224 image + 16 text tokens → embeddings/similarity |

Both pass CLI, Web Explore and Playground capture checks with the pinned toolchain in
`pyproject.toml`. Full captures include exact module-to-Torch mappings and compiler-recorded
LLVM/assembly source links. These are pretrained weights with synthetic inputs, not a
classification/retrieval quality evaluation or a guarantee for every checkpoint in the family.

Reproduce from the checkout (set `HF_HOME` to your preferred cache directory):

```bash
python scripts/validate_hf_models.py vit-tiny --out build/check-vit --lineage required
python scripts/validate_hf_models.py tinyclip --mode web --out build/check-clip --lineage required
# --mode playground checks the separate Playground API; --offline reuses cached weights.
```

Use fresh output directories. The validator reads [pinned profiles](../scripts/hf_checkpoints.json),
starts an isolated loopback API when needed, and saves `validation.json` with versions,
numerical results, coverage, elapsed time, peak child-process RSS and disk usage. For a wheel
environment, add `--installed --python /path/to/venv/bin/python`; it rejects source-package imports.
The optional **Pretrained model compatibility** GitHub workflow runs these real-download checks;
normal PR tests remain offline. A new manual workflow must reach the default branch before
GitHub exposes its Run workflow button.

Float32 verification uses `rtol=1e-3, atol=1e-4`, rejects non-finite/mismatched outputs, and
records per-output errors. The relative tolerance was checked against float64 on three ViT
samples to account for differences in floating-point reductions; the absolute floor stays strict.

The web limit remains **100M parameters**. Local full web captures used approximately 1.2 GiB
(ViT) and 3.1 GiB (TinyCLIP) peak process RSS, with about 0.5 GiB and 1.6 GiB of output respectively.
These are compilation measurements, not inference benchmarks or total-memory guarantees.
Standard `openai/clip-vit-base-patch32` has 151.3M parameters: a 200M cap would admit it, but its
compilation/resource behavior has not been validated here. The CLI has no web parameter cap.

A failed capture keeps `run.json` with its error and phase. Successful runs include:

```text
run.json                  resolved parameters, versions, tensor/file hashes, status
manifest.json             compiler commands and diagnostics
inputs/*.npy              actual tensor values (including decoder masks)
model_info.json
architecture.json         torch.export module ownership when available
source.py
mlir/, llvm/, passes/     captured stages, every dispatch, LLVM checkpoints, assembly/objects
_full/                    authoritative exports/resources retained for reproducibility
native/                   per-snapshot JSON and annotated LLVM display views
artifact.json             unchanged viewer schema 0.7
lineage.json               schema 1; origin sets, inline frames, def-use and coverage
index.json                viewer workload entry
```

Standard capture still retains the authoritative export and can be large for large models.
Full capture can produce very large pass logs. Runs are self-contained and can be moved.
Legacy imports without manifests use unique captured-file aliases and report gaps where
metadata is absent; they cannot recover information the compiler never emitted.

Current source uses `lineage` for the analysis module, pass, CLI output fields and sidecar.
The reader also accepts the older `provenance.json` sidecar from TestPyPI 0.1.0 runs.
Version 0.1.1 uses the new names. Version 0.1.0 retains its original names.

## Inspect, trace, compare and benchmark

```bash
compilerlens inspect runs/gpt2 --show architecture
compilerlens inspect runs/gpt2 --show stages
compilerlens inspect runs/gpt2 --show evidence
compilerlens inspect runs/gpt2 --show ops --stage torch-input
compilerlens inspect runs/gpt2 --show ops --stage torch-input --module transformer.h.0.mlp.c_fc
compilerlens inspect runs/gpt2 --show ir --stage llvm-optimized --lines 100:140
compilerlens trace runs/gpt2 --module transformer.h.0.mlp.c_fc --to asm
compilerlens trace runs/gpt2 --op s00:op3 --to llvm   # use an ID actually listed by inspect
compilerlens trace runs/imported --source torch-input:3:10 --to asm
compilerlens trace runs/imported --from-stage target-asm --line 106
compilerlens diff runs/gpt2 --from llvm-codegen --to llvm-optimized --mode semantic
compilerlens bench runs/gpt2 --workers 8 --repetitions 10
```

Stage IDs, module paths and operation IDs are discovered from the saved run. Native IDs
are qualified by stage in CLI output. Their identity is the snapshot's SHA-256 plus the
function/block/instruction ordinal, **not** a persistent identity across optimization.
Use `--format json` for complete structured records. Text output uses Rich tables/trees and
IR highlighting; piped output works without terminal color or an interactive pager.

Forward queries keep every explicit origin attached to matching records. Reverse queries
show unknown lineage explicitly. `.file`/`.loc` state resets on line zero, section changes
and function boundaries. Inline callsites are distinguished from primary debug locations.
A debug location is a source association; it does not prove one-to-one instruction ancestry.

Coverage separately counts debug locations, dispatch-resolved locations, Torch anchors and
exact model-module associations. Native reports retain per-function counts so runtime helpers
can be distinguished from dispatches. Count changes across snapshots do not identify a
specific pass as causing lineage loss. Semantic diffs compare operation counts, not equivalence.
Diffs reject unrelated tracks/modules.

Benchmarking passes actual saved NPY arrays to IREE and verifies their hashes. It reports
median, variance, worker count, host noise notes and reliability. Imported captures without
saved inputs cannot be benchmarked through this command.

### Object addresses

```bash
compilerlens inspect runs/matmul --show objects
compilerlens trace runs/matmul --object 'llvm/FILE.o' \
  --section '.text.FUNCTION' --address 0x100 --format json
```

Use the object path and nonempty executable section name from `--show objects`. IREE often
uses function sections and an empty `.text`. The address is a **section-relative byte offset**,
not an assembly display line, process address or file offset. Native LLVM DWARF lookup
returns recorded frames and joins them to the captured dispatch and Torch source where possible.

## Build/develop the native pass

For system prerequisites and the complete source installation, start with the
[README source steps](../README.md#installation-from-source). Miniconda installs the build tools,
LLVM SDK and Python dependencies in one user-local environment without sudo, then you build
our pass and generate viewer artifacts. The source environment replaces the separate venv.
The PyPI package provides the separate prebuilt installation path.

See the [LLVM component overview](../llvm/README.md) for the analysis flow and file layout.
Configure a fresh `build/llvm/` directory after the source-directory rename; CMake caches
contain absolute source paths and should not be moved from the previous build directory.

```bash
cmake -S llvm -B build/llvm -G Ninja \
  -DLLVM_DIR=/path/to/llvm/lib/cmake/llvm -DCMAKE_BUILD_TYPE=Release
cmake --build build/llvm --parallel 2
ctest --test-dir build/llvm --output-on-failure
/path/to/llvm/bin/opt -load-pass-plugin=build/llvm/CompilerLensPasses.so \
  -passes=compilerlens-lineage -disable-output run/llvm/FILE.optimized.ll
build/llvm/compilerlens-native --input run/llvm/FILE.optimized.ll \
  --output report.json --annotated-ir view.ll
```

The pass walks LLVM's real `Module`, `Instruction`, `DebugLoc` and `DILocation` APIs, recording
inline chains, scopes, discriminators, memory effects, vector types and operand instruction IDs.
It returns `PreservedAnalyses::all()`. CTest checks the standalone/plugin reports agree,
annotations parse, invalid IR fails, object lookups work and normalized IR is unchanged.

Use an LLVM 22 SDK matching `opt` for the tested plugin. The CMake project permits LLVM 23
for source-build development, which requires validation with that particular SDK. The plugin
ABI must match its host. `COMPILERLENS_NATIVE=/path/to/compilerlens-native` overrides the
private executable; `COMPILERLENS_WORKSPACE=/path` selects server storage. The README's Conda
build uses `build/llvm-conda/`; set `COMPILERLENS_NATIVE` to that build's executable as shown
there. These generic commands also work with a separately provisioned compatible SDK.

After building the analyzer, regenerate the source frontend's existing workloads with:

```bash
cd frontend
npm run artifact -- --lineage required
```

The artifact builder invokes the same native analysis as CLI captures and writes `native/`
reports and `lineage.json` beside each workload's dumps. It preserves the original LLVM IR.
The default mode is `auto` (native analysis with fallback); `--lineage off` skips native
analysis. The command prints each workload's lineage status. Source Web Explore uses
`COMPILERLENS_NATIVE` from the API terminal; the README selects the Conda build explicitly.
Both source and installed Web Explore use `auto` automatically, falling back if native
analysis is unavailable or fails. No lineage selection is needed in the webpage.

An optional [IREE source-build hook](../llvm/iree/README.md) brackets its actual optimization
pipeline, including O0. Its C++ hook is tested; the pinned source patch is supplied. A full
IREE source build has not been performed. The ordinary wheel uses emitted snapshots.
There is no assumed `iree-compile --load-pass-plugin` support.

## Build the wheel and verify

Install frontend dependencies with `npm ci` in `frontend`, and use Python with setuptools >=77.
After configuring the native build:

```bash
python scripts/build_release.py
python -m unittest discover -s tests -v
python -m pip install dist/compilerlens-0.1.1-py3-none-linux_x86_64.whl
python scripts/check_installed.py /path/to/installed/env/bin/python /path/to/run --browser
```

`build_release.py` builds/tests C++, installs private assets, bundles the unchanged application,
runs TypeScript checking and builds the wheel. It accepts `--cmake /path/to/cmake` and
`--llvm-dir /path/to/llvm/lib/cmake/llvm`. Source wheel builds require prepared assets;
`--assets-only` prepares them without building the wheel. Browser verification requires a
Playwright Chromium installation. Browser components and styling are unchanged.

On this workspace's LLVM SDK, configure using:

```bash
/pkg/qct/software/cmake/3.31.5/bin/cmake -S llvm -B build/llvm -G Ninja \
  -DLLVM_DIR=/pkg/qct/software/llvm/22.1.8/lib/cmake/llvm \
  -DCMAKE_C_COMPILER=/pkg/qct/software/llvm/22.1.8/bin/clang \
  -DCMAKE_CXX_COMPILER=/pkg/qct/software/llvm/22.1.8/bin/clang++ \
  -DCMAKE_CXX_FLAGS=--gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/11 \
  -DCMAKE_MAKE_PROGRAM=/pkg/qct/software/ninja/1.12.1/ninja \
  -DCOMPILERLENS_ZSTD_LIBRARY=/usr/lib/x86_64-linux-gnu/libzstd.so.1 \
  -DCMAKE_BUILD_TYPE=Release
python scripts/build_release.py --cmake /pkg/qct/software/cmake/3.31.5/bin/cmake
```
