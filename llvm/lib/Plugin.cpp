#include "compilerlens/Lineage.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"
extern "C" LLVM_ATTRIBUTE_WEAK llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "CompilerLensPasses", "0.1.1", [](llvm::PassBuilder &PB) {
    PB.registerPipelineParsingCallback([](llvm::StringRef Name, llvm::ModulePassManager &MPM,
                                         llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
      if (Name != "compilerlens-lineage") return false;
      MPM.addPass(compilerlens::LineagePass());
      return true;
    });
  }};
}
