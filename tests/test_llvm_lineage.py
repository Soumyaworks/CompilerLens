from __future__ import annotations

import unittest

from ingest.llvm_parser import parse_llvm_ir
from ingest.mlir_loc import source_locations_by_line


class MlirLineSourceMapTests(unittest.TestCase):
    def test_maps_direct_alias_and_structural_locations(self) -> None:
        text = """\
module {
  %0 = arith.constant 0 : index loc(#loc1)
  return loc("torch.mlir":12:7)
  %1 = arith.constant 1 : index loc(unknown)
}
#loc1 = loc("torch.mlir":9:3)
"""
        self.assertEqual(
            source_locations_by_line(text),
            {
                2: "torch.mlir:9:3",
                3: "torch.mlir:12:7",
            },
        )


class LlvmDebugLineageTests(unittest.TestCase):
    def test_resolves_location_through_subprogram_and_lexical_scope(self) -> None:
        llvm = """\
define void @kernel() !dbg !10 {
entry:
  %0 = load float, ptr %arg, !dbg !20
  ret void, !dbg !21
}
!1 = !DIFile(filename: "module_main$async_dispatch_2.mlir", directory: "/old/path")
!10 = distinct !DISubprogram(name: "kernel", scope: !1, file: !1, line: 1)
!11 = distinct !DILexicalBlock(scope: !10, file: !1, line: 40, column: 2)
!20 = !DILocation(line: 33, column: 8, scope: !11)
!21 = !DILocation(line: 34, column: 8, scope: !10)
"""
        dispatch_sources = {
            "module_main$async_dispatch_2.mlir": {
                33: "ir_00_torch_input.mlir:84:11",
                34: "ir_00_torch_input.mlir:85:4",
            }
        }

        ops = parse_llvm_ir(llvm, "llvm", dispatch_sources)

        load = next(op for op in ops if op["name"] == "load")
        ret = next(op for op in ops if op["name"] == "ret")
        self.assertEqual(load["line"], 3)
        self.assertEqual(load["source_loc"], "ir_00_torch_input.mlir:84:11")
        self.assertEqual(ret["line"], 4)
        self.assertEqual(ret["source_loc"], "ir_00_torch_input.mlir:85:4")

    def test_uses_recorded_inline_callsite_when_primary_file_is_not_a_dispatch(self) -> None:
        llvm = """\
define void @kernel() {
  call void @helper(), !dbg !30
}
!1 = !DIFile(filename: "runtime.cc", directory: ".")
!2 = !DIFile(filename: "module_main$async_dispatch_0.mlir", directory: "/old/path")
!10 = distinct !DISubprogram(name: "helper", scope: !1, file: !1, line: 1)
!11 = distinct !DISubprogram(name: "kernel", scope: !2, file: !2, line: 1)
!20 = !DILocation(line: 19, column: 8, scope: !11)
!30 = !DILocation(line: 50, column: 3, scope: !10, inlinedAt: !20)
"""
        ops = parse_llvm_ir(
            llvm,
            "llvm",
            {"module_main$async_dispatch_0.mlir": {19: "torch.mlir:75:10"}},
        )

        self.assertEqual(ops[0]["source_loc"], "torch.mlir:75:10")

    def test_matches_legacy_short_dispatch_filename_by_unique_dispatch_id(self) -> None:
        llvm = """\
define void @kernel() {
  ret void, !dbg !20
}
!1 = !DIFile(filename: "module_main$async_dispatch_0.mlir", directory: "/old/path")
!10 = distinct !DISubprogram(name: "kernel", scope: !1, file: !1, line: 1)
!20 = !DILocation(line: 19, column: 8, scope: !10)
"""
        ops = parse_llvm_ir(
            llvm,
            "llvm",
            {"dispatch_0": {19: "torch.mlir:3:10"}},
        )

        self.assertEqual(ops[0]["source_loc"], "torch.mlir:3:10")

    def test_leaves_incomplete_debug_chains_unlinked(self) -> None:
        llvm = """\
define void @kernel() {
  %0 = load float, ptr %arg, !dbg !20
  ret void, !dbg !99
}
!1 = !DIFile(filename: "module_main$async_dispatch_0.mlir", directory: ".")
!10 = distinct !DISubprogram(name: "kernel", scope: !1, file: !1, line: 1)
!20 = !DILocation(line: 400, column: 8, scope: !10)
"""
        ops = parse_llvm_ir(
            llvm,
            "llvm",
            {"module_main$async_dispatch_0.mlir": {19: "torch.mlir:75:10"}},
        )

        self.assertIsNone(ops[0].get("source_loc"))
        self.assertIsNone(ops[1].get("source_loc"))


if __name__ == "__main__":
    unittest.main()
