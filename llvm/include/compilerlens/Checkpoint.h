#pragma once
// Optional source-build hook. Uses the host IREE build's LLVM, never a foreign plugin.
#include "compilerlens/Lineage.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdlib>

namespace compilerlens {
inline void checkpoint(llvm::Module &M, llvm::ModuleAnalysisManager &AM,
                       llvm::StringRef Phase) {
  const char *Directory = std::getenv("COMPILERLENS_REPORT_DIR");
  if (!Directory || !*Directory) return;
  llvm::json::Object Report;
  llvm::ModulePassManager PM;
  PM.addPass(LineagePass(&Report));
  PM.run(M, AM);
  Report["checkpoint"] = Phase.str();
  if (auto EC = llvm::sys::fs::create_directories(Directory)) {
    llvm::errs() << "CompilerLens checkpoint: " << EC.message() << '\n';
    return;
  }
  llvm::SmallString<256> Pattern(Directory), Path;
  llvm::sys::path::append(Pattern, Phase + "-%%%%%%.json");
  int FD;
  if (auto EC = llvm::sys::fs::createUniqueFile(Pattern, FD, Path)) {
    llvm::errs() << "CompilerLens checkpoint: " << EC.message() << '\n';
    return;
  }
  llvm::raw_fd_ostream OS(FD, true);
  OS << llvm::json::Value(std::move(Report)) << '\n';
}
}
