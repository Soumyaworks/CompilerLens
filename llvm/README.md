# CompilerLens LLVM analysis

This directory contains CompilerLens's C++ analysis code. It uses the LLVM SDK to
read the LLVM IR and object files emitted by IREE and report the instructions and
source locations they contain. IREE performs model compilation and optimization;
this component inspects its output without changing the program.

## How it fits into a capture

1. The Python compiler runner exports the model and invokes IREE with debug information.
2. IREE writes LLVM snapshots, assembly listings, dispatch sources and object files
   into the saved run's `llvm/` directory.
3. `compilerlens/lineage.py` invokes the private `compilerlens-native` executable
   for each LLVM snapshot. The executable writes a JSON report and an LLVM display
   copy annotated with instruction IDs.
4. Python joins reported debug locations through captured dispatch MLIR to Torch
   source locations and model-module mappings. It separately reads assembly
   `.file`/`.loc` directives to associate assembly instructions with source locations.
5. The results populate `lineage.json` and the existing viewer artifact, supporting
   `inspect`, `trace`, and the browser's operation lineage views.

The repository's `llvm/` directory is source code. A saved run's `llvm/` directory
contains compiler output; its `native/` directory contains analyzer reports and
annotated display copies. Renaming the source directory does not move saved runs.

## Components

| Path | Responsibility |
|---|---|
| `lib/Lineage.cpp`, `include/compilerlens/Lineage.h` | Walk LLVM modules, functions, blocks and instructions; record instruction types, operands, memory effects, debug locations, inline frames and coverage counts. |
| `tools/main.cpp` | Standalone command-line driver: parse and verify IR, run the analysis, write reports/annotated IR, and query object sections and DWARF source frames. |
| `lib/Plugin.cpp` | Register the same analysis as `compilerlens-lineage` for a matching LLVM `opt` executable. |
| `include/compilerlens/Checkpoint.h`, `iree/` | Optional hook for reports before and after optimization inside a source-built IREE compiler. |
| `tests/` | Verify reports, source frames, dependencies, valid annotations, object lookups, error handling and preservation of LLVM IR. |
| `CMakeLists.txt` | Build the analysis library, executable, plugin and test driver; install the private executable. |

The pass returns `PreservedAnalyses::all()`. It reads compiler metadata and does not
instrument execution or optimize the model. Instruction IDs identify positions in
one snapshot; they do not prove identity across transformations. Source locations
can be missing or shared, and operand dependencies do not establish source ownership.

## Build and integration

Use the [CLI guide's build instructions](../docs/CLI.md#builddevelop-the-native-pass)
to configure `cmake -S llvm -B build/llvm` with the matching LLVM SDK. Build products
include `compilerlens-native` and `CompilerLensPasses.so`. The ordinary wheel bundles
the executable and runs it as a separate process; end users do not need an LLVM SDK.

The [optional IREE hook](iree/README.md) uses IREE's own LLVM build. Its small checkpoint
test is covered by CTest; a full source-built IREE integration has not been validated.

See the [project overview](../README.md), [CLI reference](../docs/CLI.md), and
[release checklist](../docs/RELEASING.md) for installation and release status.
