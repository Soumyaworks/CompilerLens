#include "compilerlens/Lineage.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;
namespace compilerlens {
namespace {
using IDs = DenseMap<const Instruction *, std::string>;
IDs identities(Module &M) {
  IDs Result;
  unsigned FIndex = 0;
  for (auto &F : M) {
    unsigned BIndex = 0;
    for (auto &B : F) {
      unsigned IIndex = 0;
      for (auto &I : B)
        Result[&I] = "f" + std::to_string(FIndex) + ":b" + std::to_string(BIndex) + ":i" + std::to_string(IIndex++);
      ++BIndex;
    }
    ++FIndex;
  }
  return Result;
}
json::Object frame(const DILocation &D) {
  auto *File = D.getFile();
  return json::Object{{"file", File ? File->getFilename().str() : ""},
    {"directory", File ? File->getDirectory().str() : ""},
    {"line", D.getLine()}, {"column", D.getColumn()},
    {"discriminator", D.getDiscriminator()}, {"implicit", D.isImplicitCode()},
    {"scope", D.getScope()->getSubprogram() ? D.getScope()->getSubprogram()->getName().str() : ""}};
}
class AnnotationWriter : public AssemblyAnnotationWriter {
  const IDs &Index;
public:
  explicit AnnotationWriter(const IDs &Index) : Index(Index) {}
  void emitInstructionAnnot(const Instruction *I, formatted_raw_ostream &OS) override {
    OS << "; compilerlens.id=" << Index.lookup(I) << "\n";
  }
};
}
json::Object analyze(Module &M) {
  const auto Index = identities(M);
  json::Array Functions, Instructions;
  int64_t Total = 0, Located = 0, LineZero = 0;
  for (auto &F : M) {
    int64_t FTotal = 0, FLocated = 0;
    unsigned BIndex = 0;
    for (auto &B : F) {
      for (auto &I : B) {
        ++Total; ++FTotal;
        std::string Type;
        raw_string_ostream TypeStream(Type);
        I.getType()->print(TypeStream);
        json::Array Operands, Frames;
        for (const Use &U : I.operands())
          if (auto *Operand = dyn_cast<Instruction>(U.get()))
            Operands.push_back(Index.lookup(Operand));
        std::string Status = "missing";
        if (auto D = I.getDebugLoc()) {
          if (D.getLine()) { ++Located; ++FLocated; Status = "located"; }
          else { ++LineZero; Status = "line_zero"; }
          SmallPtrSet<const DILocation *, 8> Seen;
          for (const DILocation *At = D.get(); At && Seen.insert(At).second; At = At->getInlinedAt())
            Frames.push_back(frame(*At));
        }
        json::Object Record{{"id", Index.lookup(&I)}, {"function", F.getName().str()},
          {"block", BIndex}, {"opcode", I.getOpcodeName()}, {"type", Type},
          {"reads_memory", I.mayReadFromMemory()}, {"writes_memory", I.mayWriteToMemory()},
          {"operands", std::move(Operands)}, {"frames", std::move(Frames)}, {"location_status", Status}};
        if (auto *Vector = dyn_cast<VectorType>(I.getType())) {
          Record["vector_min_lanes"] = Vector->getElementCount().getKnownMinValue();
          Record["vector_scalable"] = Vector->getElementCount().isScalable();
        }
        if (auto *Call = dyn_cast<CallBase>(&I))
          if (auto *Callee = Call->getCalledFunction()) Record["callee"] = Callee->getName().str();
        Instructions.push_back(std::move(Record));
      }
      ++BIndex;
    }
    if (!F.isDeclaration())
      Functions.push_back(json::Object{{"name", F.getName().str()}, {"instructions", FTotal},
        {"located", FLocated}, {"dispatch_name", F.getName().contains("dispatch_")}});
  }
  return json::Object{{"schema_version", 1}, {"pass_version", "0.2.0"}, {"llvm_version", LLVM_VERSION_STRING},
    {"module", M.getModuleIdentifier()}, {"instructions", std::move(Instructions)},
    {"functions", std::move(Functions)},
    {"coverage", json::Object{{"instructions", Total}, {"debug_locations", Located}, {"line_zero", LineZero}}}};
}
void printAnnotated(Module &M, raw_ostream &OS) {
  auto Index = identities(M);
  AnnotationWriter Writer(Index);
  M.print(OS, &Writer);
}
PreservedAnalyses LineagePass::run(Module &M, ModuleAnalysisManager &) {
  auto Report = analyze(M);
  if (Result) *Result = std::move(Report);
  else outs() << json::Value(std::move(Report)) << '\n';
  return PreservedAnalyses::all();
}
}
