source_filename = "fixture.mlir"
target triple = "x86_64-unknown-linux-gnu"
define i32 @dispatch_0(ptr %p, i32 %x) !dbg !4 {
entry:
  %v = load i32, ptr %p, !dbg !8
  %sum = add i32 %v, %x, !dbg !9
  store i32 %sum, ptr %p, !dbg !10
  ret i32 %sum
}
!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3}
!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "CompilerLens fixture", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "dispatch_0.mlir", directory: "/captured")
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = distinct !DISubprogram(name: "dispatch_0", scope: !1, file: !1, line: 1, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0)
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 18, column: 8, scope: !4)
!8 = !DILocation(line: 12, column: 4, scope: !4, inlinedAt: !7)
!9 = !DILocation(line: 0, scope: !4)
!10 = !DILocation(line: 20, column: 2, scope: !4)
