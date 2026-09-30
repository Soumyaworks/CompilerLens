#include "compilerlens/Checkpoint.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/SourceMgr.h"
int main(int argc, char **argv) {
  if (argc != 2) return 2;
  llvm::LLVMContext C;
  llvm::SMDiagnostic Error;
  auto M = llvm::parseIRFile(argv[1], Error, C);
  if (!M) return 1;
  std::string Before, After;
  llvm::raw_string_ostream BS(Before), AS(After);
  M->print(BS, nullptr);
  llvm::ModuleAnalysisManager AM;
  llvm::PassBuilder PB;
  PB.registerModuleAnalyses(AM);
  compilerlens::checkpoint(*M, AM, "before-optimization");
  compilerlens::checkpoint(*M, AM, "after-optimization");
  M->print(AS, nullptr);
  return Before == After ? 0 : 1;
}
