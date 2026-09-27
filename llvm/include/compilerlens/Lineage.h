#pragma once
#include "llvm/IR/PassManager.h"
#include "llvm/Support/JSON.h"
#include <string>
namespace compilerlens {
llvm::json::Object analyze(llvm::Module &M);
void printAnnotated(llvm::Module &M, llvm::raw_ostream &OS);
class LineagePass : public llvm::PassInfoMixin<LineagePass> {
  llvm::json::Object *Result;
public:
  explicit LineagePass(llvm::json::Object *Result = nullptr) : Result(Result) {}
  llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &);
  static bool isRequired() { return true; }
};
}
