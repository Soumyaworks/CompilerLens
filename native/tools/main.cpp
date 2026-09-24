#include "compilerlens/Provenance.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/DebugInfo/DWARF/DWARFContext.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Object/ObjectFile.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;
static cl::opt<std::string> Input("input", cl::desc("LLVM textual IR or bitcode"));
static cl::opt<std::string> Output("output", cl::init("-"), cl::desc("JSON output path"));
static cl::opt<std::string> Annotated("annotated-ir", cl::desc("Annotated LLVM display view"));
static cl::opt<std::string> Object("object", cl::desc("Object file for DWARF lookup"));
static cl::opt<bool> ListSections("list-sections", cl::desc("List object sections without an address lookup"));
static cl::opt<std::string> Section("section", cl::desc("Object section name"));
static cl::opt<std::string> Address("address", cl::desc("Section-relative offset (decimal or 0xhex)"));
static bool DiagnosticFailure = false;
static void diagnose(const DiagnosticInfo *DI, void *) {
  DiagnosticPrinterRawOStream Printer(errs());
  DI->print(Printer); errs() << '\n';
  if (DI->getSeverity() == DS_Error || DI->getSeverity() == DS_Warning) DiagnosticFailure = true;
}
static Expected<json::Object> objectReport() {
  auto Binary = object::createBinary(Object);
  if (!Binary) return Binary.takeError();
  auto *Obj = dyn_cast<object::ObjectFile>(Binary->getBinary());
  if (!Obj) return createStringError(inconvertibleErrorCode(), "Expected an object file");
  if (ListSections) {
    json::Array Sections;
    for (auto S : Obj->sections()) {
      auto Name = S.getName();
      if (!Name) return Name.takeError();
      Sections.push_back(json::Object{{"name", Name->str()}, {"size", S.getSize()},
                                     {"address", S.getAddress()}, {"executable", S.isText()}});
    }
    return json::Object{{"schema_version", 1}, {"object", Object.getValue()}, {"sections", std::move(Sections)}};
  }
  uint64_t Offset = 0;
  if (Address.empty() || StringRef(Address).getAsInteger(0, Offset))
    return createStringError(inconvertibleErrorCode(), "Invalid section-relative address");
  for (auto S : Obj->sections()) {
    auto Name = S.getName();
    if (!Name) return Name.takeError();
    if (*Name != Section) continue;
    if (Offset >= S.getSize()) return createStringError(inconvertibleErrorCode(), "Address outside section");
    auto DW = DWARFContext::create(*Obj);
    DILineInfoSpecifier Spec(DILineInfoSpecifier::FileLineInfoKind::AbsoluteFilePath,
                            DILineInfoSpecifier::FunctionNameKind::LinkageName);
    auto Info = DW->getInliningInfoForAddress({S.getAddress() + Offset, S.getIndex()}, Spec);
    json::Array Frames;
    for (uint32_t I = 0; I < Info.getNumberOfFrames(); ++I) {
      auto &F = Info.getFrame(I);
      Frames.push_back(json::Object{{"file", F.FileName}, {"line", F.Line}, {"column", F.Column},
        {"function", F.FunctionName}});
    }
    return json::Object{{"schema_version", 1}, {"llvm_version", LLVM_VERSION_STRING},
      {"object", Object.getValue()}, {"section", Section.getValue()}, {"offset", Offset},
      {"frames", std::move(Frames)}};
  }
  return createStringError(inconvertibleErrorCode(), "Unknown object section");
}
int main(int argc, char **argv) {
  InitLLVM Init(argc, argv);
  cl::SetVersionPrinter([](raw_ostream &OS) {
    OS << "compilerlens-native 0.1.0 LLVM " << LLVM_VERSION_STRING << " protocol 1\n";
  });
  cl::ParseCommandLineOptions(argc, argv, "CompilerLens native provenance analyzer\n");
  json::Object Report;
  if (!Object.empty()) {
    if (!Input.empty() || (!ListSections && Section.empty())) { errs() << "--object requires --section and no --input\n"; return 2; }
    auto Result = objectReport();
    if (!Result) { errs() << toString(Result.takeError()) << '\n'; return 1; }
    Report = std::move(*Result);
  } else {
    if (Input.empty()) { errs() << "--input is required\n"; return 2; }
    LLVMContext Context;
    Context.setDiagnosticHandlerCallBack(diagnose);
    SMDiagnostic Error;
    auto M = parseIRFile(Input, Error, Context);
    if (!M) { Error.print(argv[0], errs()); return 1; }
    if (DiagnosticFailure || verifyModule(*M, &errs())) return 1;
    LoopAnalysisManager LAM;
    FunctionAnalysisManager FAM;
    CGSCCAnalysisManager CGAM;
    ModuleAnalysisManager MAM;
    PassBuilder PB;
    PB.registerModuleAnalyses(MAM); PB.registerCGSCCAnalyses(CGAM);
    PB.registerFunctionAnalyses(FAM); PB.registerLoopAnalyses(LAM);
    PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);
    ModulePassManager MPM;
    MPM.addPass(compilerlens::ProvenancePass(&Report));
    MPM.run(*M, MAM);
    if (!Annotated.empty()) {
      std::error_code EC;
      raw_fd_ostream OS(Annotated, EC);
      if (EC) { errs() << EC.message() << '\n'; return 1; }
      compilerlens::printAnnotated(*M, OS);
    }
  }
  std::error_code EC;
  raw_fd_ostream OS(Output, EC);
  if (EC) { errs() << EC.message() << '\n'; return 1; }
  OS << json::Value(std::move(Report)) << '\n';
  return 0;
}
