# Optional IREE source-build hook

The release analyzes emitted LLVM snapshots in its private native process. A matching LLVM
`opt` can also load `CompilerLensPasses.so`. Neither requires an IREE rebuild.

For reporting **inside** IREE, `Checkpoint.h` runs the same New Pass Manager pass and writes
JSON only when `COMPILERLENS_REPORT_DIR` is set. `LLVMIRPasses.patch` targets IREE commit
`e4a3b0405d7d23554da26403658d0e8c3c5ecf25` (compiler wheel 3.11.0). It brackets the actual
optimization block, so O0 also produces before/after reports. Unique filenames avoid
parallel dispatch collisions. Reports include module and checkpoint; instruction IDs remain
local to each snapshot.

1. In a checkout of that IREE commit, check/apply `LLVMIRPasses.patch` with `git apply --check`
   and `git apply`.
2. After the `iree_compiler_plugins_target_LLVMCPU_LLVMIRPasses` target is created in its CMakeLists,
   include this directory's `CompilerLens.cmake` using an absolute path. Adjust the target
   name if your IREE build uses a different target naming convention.
3. Reconfigure and build IREE with its own pinned LLVM. Never link the LLVM 22 plugin into
   the LLVM 23 IREE binary.
4. Set `COMPILERLENS_REPORT_DIR=/absolute/path/checkpoints` for the source-built
   `iree-compile` process.

The hook itself is compiled and executed by our native CTest, with before/after reporting
and unchanged IR verified. The patch is checked against the pinned source file. A full
source-built IREE integration is optional and has **not** been built in this workspace;
there is no configured IREE source/build tree here. The installed CLI uses the fully tested
snapshot integration. This is checkpoint coverage reporting, not per-pass loss attribution.
