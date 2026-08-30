; ModuleID = 'main$async_dispatch_0'
source_filename = "main$async_dispatch_0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-unknown-eabi-elf"

%iree_hal_executable_library_header_t = type { i32, ptr, i32, i32 }
%iree_hal_executable_dispatch_attrs_v0_t = type { i64, i16, i8, i8, i32, i32, i16, i16, i64, i64, i64, i64, i64 }
%iree_hal_executable_source_location_v0_t = type { i32, i32, ptr }
%iree_hal_executable_stage_location_table_v0_t = type { i32, ptr, ptr }
%iree_hal_executable_library_v0_t = type { ptr, %iree_hal_executable_import_table_v0_t, %iree_hal_executable_export_table_v0_t, %iree_hal_executable_constant_table_v0_t, %iree_hal_executable_source_file_table_v0_t }
%iree_hal_executable_import_table_v0_t = type { i32, ptr }
%iree_hal_executable_export_table_v0_t = type { i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%iree_hal_executable_constant_table_v0_t = type { i32 }
%iree_hal_executable_source_file_table_v0_t = type { i32, ptr }
%struct.exp2f_data = type { [32 x i64], double, [3 x double], double, double, [3 x double] }
%struct.powf_log2_data = type { [16 x %struct.anon], [5 x double] }
%struct.anon = type { double, double }

@0 = internal constant [22 x i8] c"main$async_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [1 x ptr] [ptr @"main$async_dispatch_0_matmul_128x128x128_f32"]
@iree_hal_executable_library_query_v0_attrs = internal constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [45 x i8] c"main$async_dispatch_0_matmul_128x128x128_f32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [1 x ptr] [ptr @1]
@2 = internal constant [40 x i8] c"dumps/module_main$async_dispatch_0.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [1 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 3, i32 39, ptr @2 }]
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = internal constant [1 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_source_locations" }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_0_matmul_128x128x128_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #0 !dbg !9 {
  %.elt20 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !85
  %.unpack21 = load ptr, ptr %.elt20, align 16, !dbg !85
  %4 = load ptr, ptr %.unpack21, align 8, !dbg !85
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !85
  %5 = getelementptr i8, ptr %.unpack21, i64 8, !dbg !86
  %6 = load ptr, ptr %5, align 8, !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !86
  %7 = getelementptr i8, ptr %.unpack21, i64 16, !dbg !87
  %8 = load ptr, ptr %7, align 8, !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !87
  %9 = load i32, ptr %2, align 16, !dbg !88
  %10 = zext i32 %9 to i64, !dbg !88
  %11 = shl nuw nsw i64 %10, 3, !dbg !88
  %12 = and i64 %11, 34359738352, !dbg !88
  %13 = shl nuw nsw i64 %10, 6, !dbg !88
  %14 = and i64 %13, 64, !dbg !88
  br label %.preheader, !dbg !88

.preheader:                                       ; preds = %3, %761
  %15 = phi i1 [ true, %3 ], [ false, %761 ]
  %16 = phi i64 [ 0, %3 ], [ 8, %761 ]
  %17 = or disjoint i64 %16, %12
  %.idx84 = shl nuw nsw i64 %17, 9
  %18 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx84
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 512
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 1024
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 1536
  %22 = getelementptr inbounds nuw i8, ptr %18, i64 2048
  %23 = getelementptr inbounds nuw i8, ptr %18, i64 2560
  %24 = getelementptr inbounds nuw i8, ptr %18, i64 3072
  %25 = getelementptr inbounds nuw i8, ptr %18, i64 3584
  %.idx = shl nuw nsw i64 %17, 9
  %26 = getelementptr i8, ptr %8, i64 %.idx
  %27 = or disjoint i64 %12, %16
  %28 = shl nuw nsw i64 %27, 9
  %29 = getelementptr i8, ptr %8, i64 %28
  %30 = getelementptr i8, ptr %29, i64 512
  %31 = or disjoint i64 %12, %16
  %32 = shl nuw nsw i64 %31, 9
  %33 = getelementptr i8, ptr %8, i64 %32
  %34 = getelementptr i8, ptr %33, i64 1024
  %35 = or disjoint i64 %12, %16
  %36 = shl nuw nsw i64 %35, 9
  %37 = getelementptr i8, ptr %8, i64 %36
  %38 = getelementptr i8, ptr %37, i64 1536
  %39 = or disjoint i64 %12, %16
  %40 = shl nuw nsw i64 %39, 9
  %41 = getelementptr i8, ptr %8, i64 %40
  %42 = getelementptr i8, ptr %41, i64 2048
  %43 = or disjoint i64 %12, %16
  %44 = shl nuw nsw i64 %43, 9
  %45 = getelementptr i8, ptr %8, i64 %44
  %46 = getelementptr i8, ptr %45, i64 2560
  %47 = or disjoint i64 %12, %16
  %48 = shl nuw nsw i64 %47, 9
  %49 = getelementptr i8, ptr %8, i64 %48
  %50 = getelementptr i8, ptr %49, i64 3072
  %51 = or disjoint i64 %12, %16
  %52 = shl nuw nsw i64 %51, 9
  %53 = getelementptr i8, ptr %8, i64 %52
  %54 = getelementptr i8, ptr %53, i64 3584
  br label %55, !dbg !88

55:                                               ; preds = %.preheader, %750
  %56 = phi i64 [ 0, %.preheader ], [ %759, %750 ]
  %57 = or disjoint i64 %56, %14, !dbg !88
  %invariant.gep = getelementptr [4 x i8], ptr %6, i64 %57, !dbg !88
  br label %58, !dbg !88

58:                                               ; preds = %55, %58
  %59 = phi [8 x <16 x float>] [ zeroinitializer, %55 ], [ %747, %58 ]
  %60 = phi i64 [ 0, %55 ], [ %748, %58 ]
  %.idx31 = shl nuw nsw i64 %60, 9, !dbg !88
  %gep = getelementptr i8, ptr %invariant.gep, i64 %.idx31, !dbg !88
  %61 = load <16 x float>, ptr %gep, align 64, !dbg !88
  %62 = or disjoint i64 %60, 1, !dbg !88
  %.idx32 = shl nuw nsw i64 %62, 9, !dbg !88
  %gep48 = getelementptr i8, ptr %invariant.gep, i64 %.idx32, !dbg !88
  %63 = load <16 x float>, ptr %gep48, align 64, !dbg !88
  %64 = or disjoint i64 %60, 2, !dbg !88
  %.idx33 = shl nuw nsw i64 %64, 9, !dbg !88
  %gep50 = getelementptr i8, ptr %invariant.gep, i64 %.idx33, !dbg !88
  %65 = load <16 x float>, ptr %gep50, align 64, !dbg !88
  %66 = or disjoint i64 %60, 3, !dbg !88
  %.idx34 = shl nuw nsw i64 %66, 9, !dbg !88
  %gep52 = getelementptr i8, ptr %invariant.gep, i64 %.idx34, !dbg !88
  %67 = load <16 x float>, ptr %gep52, align 64, !dbg !88
  %68 = or disjoint i64 %60, 4, !dbg !88
  %.idx35 = shl nuw nsw i64 %68, 9, !dbg !88
  %gep54 = getelementptr i8, ptr %invariant.gep, i64 %.idx35, !dbg !88
  %69 = load <16 x float>, ptr %gep54, align 64, !dbg !88
  %70 = or disjoint i64 %60, 5, !dbg !88
  %.idx36 = shl nuw nsw i64 %70, 9, !dbg !88
  %gep56 = getelementptr i8, ptr %invariant.gep, i64 %.idx36, !dbg !88
  %71 = load <16 x float>, ptr %gep56, align 64, !dbg !88
  %72 = or disjoint i64 %60, 6, !dbg !88
  %.idx37 = shl nuw nsw i64 %72, 9, !dbg !88
  %gep58 = getelementptr i8, ptr %invariant.gep, i64 %.idx37, !dbg !88
  %73 = load <16 x float>, ptr %gep58, align 64, !dbg !88
  %74 = or disjoint i64 %60, 7, !dbg !88
  %.idx38 = shl nuw nsw i64 %74, 9, !dbg !88
  %gep60 = getelementptr i8, ptr %invariant.gep, i64 %.idx38, !dbg !88
  %75 = load <16 x float>, ptr %gep60, align 64, !dbg !88
  %76 = or disjoint i64 %60, 8, !dbg !88
  %.idx39 = shl nuw nsw i64 %76, 9, !dbg !88
  %gep62 = getelementptr i8, ptr %invariant.gep, i64 %.idx39, !dbg !88
  %77 = load <16 x float>, ptr %gep62, align 64, !dbg !88
  %78 = or disjoint i64 %60, 9, !dbg !88
  %.idx40 = shl nuw nsw i64 %78, 9, !dbg !88
  %gep64 = getelementptr i8, ptr %invariant.gep, i64 %.idx40, !dbg !88
  %79 = load <16 x float>, ptr %gep64, align 64, !dbg !88
  %80 = or disjoint i64 %60, 10, !dbg !88
  %.idx41 = shl nuw nsw i64 %80, 9, !dbg !88
  %gep66 = getelementptr i8, ptr %invariant.gep, i64 %.idx41, !dbg !88
  %81 = load <16 x float>, ptr %gep66, align 64, !dbg !88
  %82 = or disjoint i64 %60, 11, !dbg !88
  %.idx42 = shl nuw nsw i64 %82, 9, !dbg !88
  %gep68 = getelementptr i8, ptr %invariant.gep, i64 %.idx42, !dbg !88
  %83 = load <16 x float>, ptr %gep68, align 64, !dbg !88
  %84 = or disjoint i64 %60, 12, !dbg !88
  %.idx43 = shl nuw nsw i64 %84, 9, !dbg !88
  %gep70 = getelementptr i8, ptr %invariant.gep, i64 %.idx43, !dbg !88
  %85 = load <16 x float>, ptr %gep70, align 64, !dbg !88
  %86 = or disjoint i64 %60, 13, !dbg !88
  %.idx44 = shl nuw nsw i64 %86, 9, !dbg !88
  %gep72 = getelementptr i8, ptr %invariant.gep, i64 %.idx44, !dbg !88
  %87 = load <16 x float>, ptr %gep72, align 64, !dbg !88
  %88 = or disjoint i64 %60, 14, !dbg !88
  %.idx45 = shl nuw nsw i64 %88, 9, !dbg !88
  %gep74 = getelementptr i8, ptr %invariant.gep, i64 %.idx45, !dbg !88
  %89 = load <16 x float>, ptr %gep74, align 64, !dbg !88
  %90 = or disjoint i64 %60, 15, !dbg !88
  %.idx46 = shl nuw nsw i64 %90, 9, !dbg !88
  %gep76 = getelementptr i8, ptr %invariant.gep, i64 %.idx46, !dbg !88
  %91 = load <16 x float>, ptr %gep76, align 64, !dbg !88
  %92 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %60
  %93 = load float, ptr %92, align 64
  %94 = insertelement <16 x float> poison, float %93, i64 0
  %95 = shufflevector <16 x float> %94, <16 x float> poison, <16 x i32> zeroinitializer
  %96 = extractvalue [8 x <16 x float>] %59, 0
  %97 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %95, <16 x float> %61, <16 x float> %96)
  %98 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %60
  %99 = load float, ptr %98, align 64
  %100 = insertelement <16 x float> poison, float %99, i64 0
  %101 = shufflevector <16 x float> %100, <16 x float> poison, <16 x i32> zeroinitializer
  %102 = extractvalue [8 x <16 x float>] %59, 1
  %103 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %101, <16 x float> %61, <16 x float> %102)
  %104 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %60
  %105 = load float, ptr %104, align 64
  %106 = insertelement <16 x float> poison, float %105, i64 0
  %107 = shufflevector <16 x float> %106, <16 x float> poison, <16 x i32> zeroinitializer
  %108 = extractvalue [8 x <16 x float>] %59, 2
  %109 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %107, <16 x float> %61, <16 x float> %108)
  %110 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %60
  %111 = load float, ptr %110, align 64
  %112 = insertelement <16 x float> poison, float %111, i64 0
  %113 = shufflevector <16 x float> %112, <16 x float> poison, <16 x i32> zeroinitializer
  %114 = extractvalue [8 x <16 x float>] %59, 3
  %115 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %113, <16 x float> %61, <16 x float> %114)
  %116 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %60
  %117 = load float, ptr %116, align 64
  %118 = insertelement <16 x float> poison, float %117, i64 0
  %119 = shufflevector <16 x float> %118, <16 x float> poison, <16 x i32> zeroinitializer
  %120 = extractvalue [8 x <16 x float>] %59, 4
  %121 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %119, <16 x float> %61, <16 x float> %120)
  %122 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %60
  %123 = load float, ptr %122, align 64
  %124 = insertelement <16 x float> poison, float %123, i64 0
  %125 = shufflevector <16 x float> %124, <16 x float> poison, <16 x i32> zeroinitializer
  %126 = extractvalue [8 x <16 x float>] %59, 5
  %127 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %125, <16 x float> %61, <16 x float> %126)
  %128 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %60
  %129 = load float, ptr %128, align 64
  %130 = insertelement <16 x float> poison, float %129, i64 0
  %131 = shufflevector <16 x float> %130, <16 x float> poison, <16 x i32> zeroinitializer
  %132 = extractvalue [8 x <16 x float>] %59, 6
  %133 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %131, <16 x float> %61, <16 x float> %132)
  %134 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %60
  %135 = load float, ptr %134, align 64
  %136 = insertelement <16 x float> poison, float %135, i64 0
  %137 = shufflevector <16 x float> %136, <16 x float> poison, <16 x i32> zeroinitializer
  %138 = extractvalue [8 x <16 x float>] %59, 7
  %139 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %137, <16 x float> %61, <16 x float> %138)
  %140 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %62
  %141 = load float, ptr %140, align 4
  %142 = insertelement <16 x float> poison, float %141, i64 0
  %143 = shufflevector <16 x float> %142, <16 x float> poison, <16 x i32> zeroinitializer
  %144 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %143, <16 x float> %63, <16 x float> %97)
  %145 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %62
  %146 = load float, ptr %145, align 4
  %147 = insertelement <16 x float> poison, float %146, i64 0
  %148 = shufflevector <16 x float> %147, <16 x float> poison, <16 x i32> zeroinitializer
  %149 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %148, <16 x float> %63, <16 x float> %103)
  %150 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %62
  %151 = load float, ptr %150, align 4
  %152 = insertelement <16 x float> poison, float %151, i64 0
  %153 = shufflevector <16 x float> %152, <16 x float> poison, <16 x i32> zeroinitializer
  %154 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %153, <16 x float> %63, <16 x float> %109)
  %155 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %62
  %156 = load float, ptr %155, align 4
  %157 = insertelement <16 x float> poison, float %156, i64 0
  %158 = shufflevector <16 x float> %157, <16 x float> poison, <16 x i32> zeroinitializer
  %159 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %158, <16 x float> %63, <16 x float> %115)
  %160 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %62
  %161 = load float, ptr %160, align 4
  %162 = insertelement <16 x float> poison, float %161, i64 0
  %163 = shufflevector <16 x float> %162, <16 x float> poison, <16 x i32> zeroinitializer
  %164 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %163, <16 x float> %63, <16 x float> %121)
  %165 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %62
  %166 = load float, ptr %165, align 4
  %167 = insertelement <16 x float> poison, float %166, i64 0
  %168 = shufflevector <16 x float> %167, <16 x float> poison, <16 x i32> zeroinitializer
  %169 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %168, <16 x float> %63, <16 x float> %127)
  %170 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %62
  %171 = load float, ptr %170, align 4
  %172 = insertelement <16 x float> poison, float %171, i64 0
  %173 = shufflevector <16 x float> %172, <16 x float> poison, <16 x i32> zeroinitializer
  %174 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %173, <16 x float> %63, <16 x float> %133)
  %175 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %62
  %176 = load float, ptr %175, align 4
  %177 = insertelement <16 x float> poison, float %176, i64 0
  %178 = shufflevector <16 x float> %177, <16 x float> poison, <16 x i32> zeroinitializer
  %179 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %178, <16 x float> %63, <16 x float> %139)
  %180 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %64
  %181 = load float, ptr %180, align 8
  %182 = insertelement <16 x float> poison, float %181, i64 0
  %183 = shufflevector <16 x float> %182, <16 x float> poison, <16 x i32> zeroinitializer
  %184 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %183, <16 x float> %65, <16 x float> %144)
  %185 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %64
  %186 = load float, ptr %185, align 8
  %187 = insertelement <16 x float> poison, float %186, i64 0
  %188 = shufflevector <16 x float> %187, <16 x float> poison, <16 x i32> zeroinitializer
  %189 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %188, <16 x float> %65, <16 x float> %149)
  %190 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %64
  %191 = load float, ptr %190, align 8
  %192 = insertelement <16 x float> poison, float %191, i64 0
  %193 = shufflevector <16 x float> %192, <16 x float> poison, <16 x i32> zeroinitializer
  %194 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %193, <16 x float> %65, <16 x float> %154)
  %195 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %64
  %196 = load float, ptr %195, align 8
  %197 = insertelement <16 x float> poison, float %196, i64 0
  %198 = shufflevector <16 x float> %197, <16 x float> poison, <16 x i32> zeroinitializer
  %199 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %198, <16 x float> %65, <16 x float> %159)
  %200 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %64
  %201 = load float, ptr %200, align 8
  %202 = insertelement <16 x float> poison, float %201, i64 0
  %203 = shufflevector <16 x float> %202, <16 x float> poison, <16 x i32> zeroinitializer
  %204 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %203, <16 x float> %65, <16 x float> %164)
  %205 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %64
  %206 = load float, ptr %205, align 8
  %207 = insertelement <16 x float> poison, float %206, i64 0
  %208 = shufflevector <16 x float> %207, <16 x float> poison, <16 x i32> zeroinitializer
  %209 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %208, <16 x float> %65, <16 x float> %169)
  %210 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %64
  %211 = load float, ptr %210, align 8
  %212 = insertelement <16 x float> poison, float %211, i64 0
  %213 = shufflevector <16 x float> %212, <16 x float> poison, <16 x i32> zeroinitializer
  %214 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %213, <16 x float> %65, <16 x float> %174)
  %215 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %64
  %216 = load float, ptr %215, align 8
  %217 = insertelement <16 x float> poison, float %216, i64 0
  %218 = shufflevector <16 x float> %217, <16 x float> poison, <16 x i32> zeroinitializer
  %219 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %218, <16 x float> %65, <16 x float> %179)
  %220 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %66
  %221 = load float, ptr %220, align 4
  %222 = insertelement <16 x float> poison, float %221, i64 0
  %223 = shufflevector <16 x float> %222, <16 x float> poison, <16 x i32> zeroinitializer
  %224 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %223, <16 x float> %67, <16 x float> %184)
  %225 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %66
  %226 = load float, ptr %225, align 4
  %227 = insertelement <16 x float> poison, float %226, i64 0
  %228 = shufflevector <16 x float> %227, <16 x float> poison, <16 x i32> zeroinitializer
  %229 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %228, <16 x float> %67, <16 x float> %189)
  %230 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %66
  %231 = load float, ptr %230, align 4
  %232 = insertelement <16 x float> poison, float %231, i64 0
  %233 = shufflevector <16 x float> %232, <16 x float> poison, <16 x i32> zeroinitializer
  %234 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %233, <16 x float> %67, <16 x float> %194)
  %235 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %66
  %236 = load float, ptr %235, align 4
  %237 = insertelement <16 x float> poison, float %236, i64 0
  %238 = shufflevector <16 x float> %237, <16 x float> poison, <16 x i32> zeroinitializer
  %239 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %238, <16 x float> %67, <16 x float> %199)
  %240 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %66
  %241 = load float, ptr %240, align 4
  %242 = insertelement <16 x float> poison, float %241, i64 0
  %243 = shufflevector <16 x float> %242, <16 x float> poison, <16 x i32> zeroinitializer
  %244 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %243, <16 x float> %67, <16 x float> %204)
  %245 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %66
  %246 = load float, ptr %245, align 4
  %247 = insertelement <16 x float> poison, float %246, i64 0
  %248 = shufflevector <16 x float> %247, <16 x float> poison, <16 x i32> zeroinitializer
  %249 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %248, <16 x float> %67, <16 x float> %209)
  %250 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %66
  %251 = load float, ptr %250, align 4
  %252 = insertelement <16 x float> poison, float %251, i64 0
  %253 = shufflevector <16 x float> %252, <16 x float> poison, <16 x i32> zeroinitializer
  %254 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %253, <16 x float> %67, <16 x float> %214)
  %255 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %66
  %256 = load float, ptr %255, align 4
  %257 = insertelement <16 x float> poison, float %256, i64 0
  %258 = shufflevector <16 x float> %257, <16 x float> poison, <16 x i32> zeroinitializer
  %259 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %258, <16 x float> %67, <16 x float> %219)
  %260 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %68
  %261 = load float, ptr %260, align 16
  %262 = insertelement <16 x float> poison, float %261, i64 0
  %263 = shufflevector <16 x float> %262, <16 x float> poison, <16 x i32> zeroinitializer
  %264 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %263, <16 x float> %69, <16 x float> %224)
  %265 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %68
  %266 = load float, ptr %265, align 16
  %267 = insertelement <16 x float> poison, float %266, i64 0
  %268 = shufflevector <16 x float> %267, <16 x float> poison, <16 x i32> zeroinitializer
  %269 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %268, <16 x float> %69, <16 x float> %229)
  %270 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %68
  %271 = load float, ptr %270, align 16
  %272 = insertelement <16 x float> poison, float %271, i64 0
  %273 = shufflevector <16 x float> %272, <16 x float> poison, <16 x i32> zeroinitializer
  %274 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %273, <16 x float> %69, <16 x float> %234)
  %275 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %68
  %276 = load float, ptr %275, align 16
  %277 = insertelement <16 x float> poison, float %276, i64 0
  %278 = shufflevector <16 x float> %277, <16 x float> poison, <16 x i32> zeroinitializer
  %279 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %278, <16 x float> %69, <16 x float> %239)
  %280 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %68
  %281 = load float, ptr %280, align 16
  %282 = insertelement <16 x float> poison, float %281, i64 0
  %283 = shufflevector <16 x float> %282, <16 x float> poison, <16 x i32> zeroinitializer
  %284 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %283, <16 x float> %69, <16 x float> %244)
  %285 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %68
  %286 = load float, ptr %285, align 16
  %287 = insertelement <16 x float> poison, float %286, i64 0
  %288 = shufflevector <16 x float> %287, <16 x float> poison, <16 x i32> zeroinitializer
  %289 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %288, <16 x float> %69, <16 x float> %249)
  %290 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %68
  %291 = load float, ptr %290, align 16
  %292 = insertelement <16 x float> poison, float %291, i64 0
  %293 = shufflevector <16 x float> %292, <16 x float> poison, <16 x i32> zeroinitializer
  %294 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %293, <16 x float> %69, <16 x float> %254)
  %295 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %68
  %296 = load float, ptr %295, align 16
  %297 = insertelement <16 x float> poison, float %296, i64 0
  %298 = shufflevector <16 x float> %297, <16 x float> poison, <16 x i32> zeroinitializer
  %299 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %298, <16 x float> %69, <16 x float> %259)
  %300 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %70
  %301 = load float, ptr %300, align 4
  %302 = insertelement <16 x float> poison, float %301, i64 0
  %303 = shufflevector <16 x float> %302, <16 x float> poison, <16 x i32> zeroinitializer
  %304 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %303, <16 x float> %71, <16 x float> %264)
  %305 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %70
  %306 = load float, ptr %305, align 4
  %307 = insertelement <16 x float> poison, float %306, i64 0
  %308 = shufflevector <16 x float> %307, <16 x float> poison, <16 x i32> zeroinitializer
  %309 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %308, <16 x float> %71, <16 x float> %269)
  %310 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %70
  %311 = load float, ptr %310, align 4
  %312 = insertelement <16 x float> poison, float %311, i64 0
  %313 = shufflevector <16 x float> %312, <16 x float> poison, <16 x i32> zeroinitializer
  %314 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %313, <16 x float> %71, <16 x float> %274)
  %315 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %70
  %316 = load float, ptr %315, align 4
  %317 = insertelement <16 x float> poison, float %316, i64 0
  %318 = shufflevector <16 x float> %317, <16 x float> poison, <16 x i32> zeroinitializer
  %319 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %318, <16 x float> %71, <16 x float> %279)
  %320 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %70
  %321 = load float, ptr %320, align 4
  %322 = insertelement <16 x float> poison, float %321, i64 0
  %323 = shufflevector <16 x float> %322, <16 x float> poison, <16 x i32> zeroinitializer
  %324 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %323, <16 x float> %71, <16 x float> %284)
  %325 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %70
  %326 = load float, ptr %325, align 4
  %327 = insertelement <16 x float> poison, float %326, i64 0
  %328 = shufflevector <16 x float> %327, <16 x float> poison, <16 x i32> zeroinitializer
  %329 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %328, <16 x float> %71, <16 x float> %289)
  %330 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %70
  %331 = load float, ptr %330, align 4
  %332 = insertelement <16 x float> poison, float %331, i64 0
  %333 = shufflevector <16 x float> %332, <16 x float> poison, <16 x i32> zeroinitializer
  %334 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %333, <16 x float> %71, <16 x float> %294)
  %335 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %70
  %336 = load float, ptr %335, align 4
  %337 = insertelement <16 x float> poison, float %336, i64 0
  %338 = shufflevector <16 x float> %337, <16 x float> poison, <16 x i32> zeroinitializer
  %339 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %338, <16 x float> %71, <16 x float> %299)
  %340 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %72
  %341 = load float, ptr %340, align 8
  %342 = insertelement <16 x float> poison, float %341, i64 0
  %343 = shufflevector <16 x float> %342, <16 x float> poison, <16 x i32> zeroinitializer
  %344 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %343, <16 x float> %73, <16 x float> %304)
  %345 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %72
  %346 = load float, ptr %345, align 8
  %347 = insertelement <16 x float> poison, float %346, i64 0
  %348 = shufflevector <16 x float> %347, <16 x float> poison, <16 x i32> zeroinitializer
  %349 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %348, <16 x float> %73, <16 x float> %309)
  %350 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %72
  %351 = load float, ptr %350, align 8
  %352 = insertelement <16 x float> poison, float %351, i64 0
  %353 = shufflevector <16 x float> %352, <16 x float> poison, <16 x i32> zeroinitializer
  %354 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %353, <16 x float> %73, <16 x float> %314)
  %355 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %72
  %356 = load float, ptr %355, align 8
  %357 = insertelement <16 x float> poison, float %356, i64 0
  %358 = shufflevector <16 x float> %357, <16 x float> poison, <16 x i32> zeroinitializer
  %359 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %358, <16 x float> %73, <16 x float> %319)
  %360 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %72
  %361 = load float, ptr %360, align 8
  %362 = insertelement <16 x float> poison, float %361, i64 0
  %363 = shufflevector <16 x float> %362, <16 x float> poison, <16 x i32> zeroinitializer
  %364 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %363, <16 x float> %73, <16 x float> %324)
  %365 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %72
  %366 = load float, ptr %365, align 8
  %367 = insertelement <16 x float> poison, float %366, i64 0
  %368 = shufflevector <16 x float> %367, <16 x float> poison, <16 x i32> zeroinitializer
  %369 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %368, <16 x float> %73, <16 x float> %329)
  %370 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %72
  %371 = load float, ptr %370, align 8
  %372 = insertelement <16 x float> poison, float %371, i64 0
  %373 = shufflevector <16 x float> %372, <16 x float> poison, <16 x i32> zeroinitializer
  %374 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %373, <16 x float> %73, <16 x float> %334)
  %375 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %72
  %376 = load float, ptr %375, align 8
  %377 = insertelement <16 x float> poison, float %376, i64 0
  %378 = shufflevector <16 x float> %377, <16 x float> poison, <16 x i32> zeroinitializer
  %379 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %378, <16 x float> %73, <16 x float> %339)
  %380 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %74
  %381 = load float, ptr %380, align 4
  %382 = insertelement <16 x float> poison, float %381, i64 0
  %383 = shufflevector <16 x float> %382, <16 x float> poison, <16 x i32> zeroinitializer
  %384 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %383, <16 x float> %75, <16 x float> %344)
  %385 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %74
  %386 = load float, ptr %385, align 4
  %387 = insertelement <16 x float> poison, float %386, i64 0
  %388 = shufflevector <16 x float> %387, <16 x float> poison, <16 x i32> zeroinitializer
  %389 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %388, <16 x float> %75, <16 x float> %349)
  %390 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %74
  %391 = load float, ptr %390, align 4
  %392 = insertelement <16 x float> poison, float %391, i64 0
  %393 = shufflevector <16 x float> %392, <16 x float> poison, <16 x i32> zeroinitializer
  %394 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %393, <16 x float> %75, <16 x float> %354)
  %395 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %74
  %396 = load float, ptr %395, align 4
  %397 = insertelement <16 x float> poison, float %396, i64 0
  %398 = shufflevector <16 x float> %397, <16 x float> poison, <16 x i32> zeroinitializer
  %399 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %398, <16 x float> %75, <16 x float> %359)
  %400 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %74
  %401 = load float, ptr %400, align 4
  %402 = insertelement <16 x float> poison, float %401, i64 0
  %403 = shufflevector <16 x float> %402, <16 x float> poison, <16 x i32> zeroinitializer
  %404 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %403, <16 x float> %75, <16 x float> %364)
  %405 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %74
  %406 = load float, ptr %405, align 4
  %407 = insertelement <16 x float> poison, float %406, i64 0
  %408 = shufflevector <16 x float> %407, <16 x float> poison, <16 x i32> zeroinitializer
  %409 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %408, <16 x float> %75, <16 x float> %369)
  %410 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %74
  %411 = load float, ptr %410, align 4
  %412 = insertelement <16 x float> poison, float %411, i64 0
  %413 = shufflevector <16 x float> %412, <16 x float> poison, <16 x i32> zeroinitializer
  %414 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %413, <16 x float> %75, <16 x float> %374)
  %415 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %74
  %416 = load float, ptr %415, align 4
  %417 = insertelement <16 x float> poison, float %416, i64 0
  %418 = shufflevector <16 x float> %417, <16 x float> poison, <16 x i32> zeroinitializer
  %419 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %418, <16 x float> %75, <16 x float> %379)
  %420 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %76
  %421 = load float, ptr %420, align 32
  %422 = insertelement <16 x float> poison, float %421, i64 0
  %423 = shufflevector <16 x float> %422, <16 x float> poison, <16 x i32> zeroinitializer
  %424 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %423, <16 x float> %77, <16 x float> %384)
  %425 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %76
  %426 = load float, ptr %425, align 32
  %427 = insertelement <16 x float> poison, float %426, i64 0
  %428 = shufflevector <16 x float> %427, <16 x float> poison, <16 x i32> zeroinitializer
  %429 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %428, <16 x float> %77, <16 x float> %389)
  %430 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %76
  %431 = load float, ptr %430, align 32
  %432 = insertelement <16 x float> poison, float %431, i64 0
  %433 = shufflevector <16 x float> %432, <16 x float> poison, <16 x i32> zeroinitializer
  %434 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %433, <16 x float> %77, <16 x float> %394)
  %435 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %76
  %436 = load float, ptr %435, align 32
  %437 = insertelement <16 x float> poison, float %436, i64 0
  %438 = shufflevector <16 x float> %437, <16 x float> poison, <16 x i32> zeroinitializer
  %439 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %438, <16 x float> %77, <16 x float> %399)
  %440 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %76
  %441 = load float, ptr %440, align 32
  %442 = insertelement <16 x float> poison, float %441, i64 0
  %443 = shufflevector <16 x float> %442, <16 x float> poison, <16 x i32> zeroinitializer
  %444 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %443, <16 x float> %77, <16 x float> %404)
  %445 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %76
  %446 = load float, ptr %445, align 32
  %447 = insertelement <16 x float> poison, float %446, i64 0
  %448 = shufflevector <16 x float> %447, <16 x float> poison, <16 x i32> zeroinitializer
  %449 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %448, <16 x float> %77, <16 x float> %409)
  %450 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %76
  %451 = load float, ptr %450, align 32
  %452 = insertelement <16 x float> poison, float %451, i64 0
  %453 = shufflevector <16 x float> %452, <16 x float> poison, <16 x i32> zeroinitializer
  %454 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %453, <16 x float> %77, <16 x float> %414)
  %455 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %76
  %456 = load float, ptr %455, align 32
  %457 = insertelement <16 x float> poison, float %456, i64 0
  %458 = shufflevector <16 x float> %457, <16 x float> poison, <16 x i32> zeroinitializer
  %459 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %458, <16 x float> %77, <16 x float> %419)
  %460 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %78
  %461 = load float, ptr %460, align 4
  %462 = insertelement <16 x float> poison, float %461, i64 0
  %463 = shufflevector <16 x float> %462, <16 x float> poison, <16 x i32> zeroinitializer
  %464 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %463, <16 x float> %79, <16 x float> %424)
  %465 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %78
  %466 = load float, ptr %465, align 4
  %467 = insertelement <16 x float> poison, float %466, i64 0
  %468 = shufflevector <16 x float> %467, <16 x float> poison, <16 x i32> zeroinitializer
  %469 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %468, <16 x float> %79, <16 x float> %429)
  %470 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %78
  %471 = load float, ptr %470, align 4
  %472 = insertelement <16 x float> poison, float %471, i64 0
  %473 = shufflevector <16 x float> %472, <16 x float> poison, <16 x i32> zeroinitializer
  %474 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %473, <16 x float> %79, <16 x float> %434)
  %475 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %78
  %476 = load float, ptr %475, align 4
  %477 = insertelement <16 x float> poison, float %476, i64 0
  %478 = shufflevector <16 x float> %477, <16 x float> poison, <16 x i32> zeroinitializer
  %479 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %478, <16 x float> %79, <16 x float> %439)
  %480 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %78
  %481 = load float, ptr %480, align 4
  %482 = insertelement <16 x float> poison, float %481, i64 0
  %483 = shufflevector <16 x float> %482, <16 x float> poison, <16 x i32> zeroinitializer
  %484 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %483, <16 x float> %79, <16 x float> %444)
  %485 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %78
  %486 = load float, ptr %485, align 4
  %487 = insertelement <16 x float> poison, float %486, i64 0
  %488 = shufflevector <16 x float> %487, <16 x float> poison, <16 x i32> zeroinitializer
  %489 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %488, <16 x float> %79, <16 x float> %449)
  %490 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %78
  %491 = load float, ptr %490, align 4
  %492 = insertelement <16 x float> poison, float %491, i64 0
  %493 = shufflevector <16 x float> %492, <16 x float> poison, <16 x i32> zeroinitializer
  %494 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %493, <16 x float> %79, <16 x float> %454)
  %495 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %78
  %496 = load float, ptr %495, align 4
  %497 = insertelement <16 x float> poison, float %496, i64 0
  %498 = shufflevector <16 x float> %497, <16 x float> poison, <16 x i32> zeroinitializer
  %499 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %498, <16 x float> %79, <16 x float> %459)
  %500 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %80
  %501 = load float, ptr %500, align 8
  %502 = insertelement <16 x float> poison, float %501, i64 0
  %503 = shufflevector <16 x float> %502, <16 x float> poison, <16 x i32> zeroinitializer
  %504 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %503, <16 x float> %81, <16 x float> %464)
  %505 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %80
  %506 = load float, ptr %505, align 8
  %507 = insertelement <16 x float> poison, float %506, i64 0
  %508 = shufflevector <16 x float> %507, <16 x float> poison, <16 x i32> zeroinitializer
  %509 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %508, <16 x float> %81, <16 x float> %469)
  %510 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %80
  %511 = load float, ptr %510, align 8
  %512 = insertelement <16 x float> poison, float %511, i64 0
  %513 = shufflevector <16 x float> %512, <16 x float> poison, <16 x i32> zeroinitializer
  %514 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %513, <16 x float> %81, <16 x float> %474)
  %515 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %80
  %516 = load float, ptr %515, align 8
  %517 = insertelement <16 x float> poison, float %516, i64 0
  %518 = shufflevector <16 x float> %517, <16 x float> poison, <16 x i32> zeroinitializer
  %519 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %518, <16 x float> %81, <16 x float> %479)
  %520 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %80
  %521 = load float, ptr %520, align 8
  %522 = insertelement <16 x float> poison, float %521, i64 0
  %523 = shufflevector <16 x float> %522, <16 x float> poison, <16 x i32> zeroinitializer
  %524 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %523, <16 x float> %81, <16 x float> %484)
  %525 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %80
  %526 = load float, ptr %525, align 8
  %527 = insertelement <16 x float> poison, float %526, i64 0
  %528 = shufflevector <16 x float> %527, <16 x float> poison, <16 x i32> zeroinitializer
  %529 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %528, <16 x float> %81, <16 x float> %489)
  %530 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %80
  %531 = load float, ptr %530, align 8
  %532 = insertelement <16 x float> poison, float %531, i64 0
  %533 = shufflevector <16 x float> %532, <16 x float> poison, <16 x i32> zeroinitializer
  %534 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %533, <16 x float> %81, <16 x float> %494)
  %535 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %80
  %536 = load float, ptr %535, align 8
  %537 = insertelement <16 x float> poison, float %536, i64 0
  %538 = shufflevector <16 x float> %537, <16 x float> poison, <16 x i32> zeroinitializer
  %539 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %538, <16 x float> %81, <16 x float> %499)
  %540 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %82
  %541 = load float, ptr %540, align 4
  %542 = insertelement <16 x float> poison, float %541, i64 0
  %543 = shufflevector <16 x float> %542, <16 x float> poison, <16 x i32> zeroinitializer
  %544 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %543, <16 x float> %83, <16 x float> %504)
  %545 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %82
  %546 = load float, ptr %545, align 4
  %547 = insertelement <16 x float> poison, float %546, i64 0
  %548 = shufflevector <16 x float> %547, <16 x float> poison, <16 x i32> zeroinitializer
  %549 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %548, <16 x float> %83, <16 x float> %509)
  %550 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %82
  %551 = load float, ptr %550, align 4
  %552 = insertelement <16 x float> poison, float %551, i64 0
  %553 = shufflevector <16 x float> %552, <16 x float> poison, <16 x i32> zeroinitializer
  %554 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %553, <16 x float> %83, <16 x float> %514)
  %555 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %82
  %556 = load float, ptr %555, align 4
  %557 = insertelement <16 x float> poison, float %556, i64 0
  %558 = shufflevector <16 x float> %557, <16 x float> poison, <16 x i32> zeroinitializer
  %559 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %558, <16 x float> %83, <16 x float> %519)
  %560 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %82
  %561 = load float, ptr %560, align 4
  %562 = insertelement <16 x float> poison, float %561, i64 0
  %563 = shufflevector <16 x float> %562, <16 x float> poison, <16 x i32> zeroinitializer
  %564 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %563, <16 x float> %83, <16 x float> %524)
  %565 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %82
  %566 = load float, ptr %565, align 4
  %567 = insertelement <16 x float> poison, float %566, i64 0
  %568 = shufflevector <16 x float> %567, <16 x float> poison, <16 x i32> zeroinitializer
  %569 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %568, <16 x float> %83, <16 x float> %529)
  %570 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %82
  %571 = load float, ptr %570, align 4
  %572 = insertelement <16 x float> poison, float %571, i64 0
  %573 = shufflevector <16 x float> %572, <16 x float> poison, <16 x i32> zeroinitializer
  %574 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %573, <16 x float> %83, <16 x float> %534)
  %575 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %82
  %576 = load float, ptr %575, align 4
  %577 = insertelement <16 x float> poison, float %576, i64 0
  %578 = shufflevector <16 x float> %577, <16 x float> poison, <16 x i32> zeroinitializer
  %579 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %578, <16 x float> %83, <16 x float> %539)
  %580 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %84
  %581 = load float, ptr %580, align 16
  %582 = insertelement <16 x float> poison, float %581, i64 0
  %583 = shufflevector <16 x float> %582, <16 x float> poison, <16 x i32> zeroinitializer
  %584 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %583, <16 x float> %85, <16 x float> %544)
  %585 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %84
  %586 = load float, ptr %585, align 16
  %587 = insertelement <16 x float> poison, float %586, i64 0
  %588 = shufflevector <16 x float> %587, <16 x float> poison, <16 x i32> zeroinitializer
  %589 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %588, <16 x float> %85, <16 x float> %549)
  %590 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %84
  %591 = load float, ptr %590, align 16
  %592 = insertelement <16 x float> poison, float %591, i64 0
  %593 = shufflevector <16 x float> %592, <16 x float> poison, <16 x i32> zeroinitializer
  %594 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %593, <16 x float> %85, <16 x float> %554)
  %595 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %84
  %596 = load float, ptr %595, align 16
  %597 = insertelement <16 x float> poison, float %596, i64 0
  %598 = shufflevector <16 x float> %597, <16 x float> poison, <16 x i32> zeroinitializer
  %599 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %598, <16 x float> %85, <16 x float> %559)
  %600 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %84
  %601 = load float, ptr %600, align 16
  %602 = insertelement <16 x float> poison, float %601, i64 0
  %603 = shufflevector <16 x float> %602, <16 x float> poison, <16 x i32> zeroinitializer
  %604 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %603, <16 x float> %85, <16 x float> %564)
  %605 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %84
  %606 = load float, ptr %605, align 16
  %607 = insertelement <16 x float> poison, float %606, i64 0
  %608 = shufflevector <16 x float> %607, <16 x float> poison, <16 x i32> zeroinitializer
  %609 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %608, <16 x float> %85, <16 x float> %569)
  %610 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %84
  %611 = load float, ptr %610, align 16
  %612 = insertelement <16 x float> poison, float %611, i64 0
  %613 = shufflevector <16 x float> %612, <16 x float> poison, <16 x i32> zeroinitializer
  %614 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %613, <16 x float> %85, <16 x float> %574)
  %615 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %84
  %616 = load float, ptr %615, align 16
  %617 = insertelement <16 x float> poison, float %616, i64 0
  %618 = shufflevector <16 x float> %617, <16 x float> poison, <16 x i32> zeroinitializer
  %619 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %618, <16 x float> %85, <16 x float> %579)
  %620 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %86
  %621 = load float, ptr %620, align 4
  %622 = insertelement <16 x float> poison, float %621, i64 0
  %623 = shufflevector <16 x float> %622, <16 x float> poison, <16 x i32> zeroinitializer
  %624 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %623, <16 x float> %87, <16 x float> %584)
  %625 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %86
  %626 = load float, ptr %625, align 4
  %627 = insertelement <16 x float> poison, float %626, i64 0
  %628 = shufflevector <16 x float> %627, <16 x float> poison, <16 x i32> zeroinitializer
  %629 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %628, <16 x float> %87, <16 x float> %589)
  %630 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %86
  %631 = load float, ptr %630, align 4
  %632 = insertelement <16 x float> poison, float %631, i64 0
  %633 = shufflevector <16 x float> %632, <16 x float> poison, <16 x i32> zeroinitializer
  %634 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %633, <16 x float> %87, <16 x float> %594)
  %635 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %86
  %636 = load float, ptr %635, align 4
  %637 = insertelement <16 x float> poison, float %636, i64 0
  %638 = shufflevector <16 x float> %637, <16 x float> poison, <16 x i32> zeroinitializer
  %639 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %638, <16 x float> %87, <16 x float> %599)
  %640 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %86
  %641 = load float, ptr %640, align 4
  %642 = insertelement <16 x float> poison, float %641, i64 0
  %643 = shufflevector <16 x float> %642, <16 x float> poison, <16 x i32> zeroinitializer
  %644 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %643, <16 x float> %87, <16 x float> %604)
  %645 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %86
  %646 = load float, ptr %645, align 4
  %647 = insertelement <16 x float> poison, float %646, i64 0
  %648 = shufflevector <16 x float> %647, <16 x float> poison, <16 x i32> zeroinitializer
  %649 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %648, <16 x float> %87, <16 x float> %609)
  %650 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %86
  %651 = load float, ptr %650, align 4
  %652 = insertelement <16 x float> poison, float %651, i64 0
  %653 = shufflevector <16 x float> %652, <16 x float> poison, <16 x i32> zeroinitializer
  %654 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %653, <16 x float> %87, <16 x float> %614)
  %655 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %86
  %656 = load float, ptr %655, align 4
  %657 = insertelement <16 x float> poison, float %656, i64 0
  %658 = shufflevector <16 x float> %657, <16 x float> poison, <16 x i32> zeroinitializer
  %659 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %658, <16 x float> %87, <16 x float> %619)
  %660 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %88
  %661 = load float, ptr %660, align 8
  %662 = insertelement <16 x float> poison, float %661, i64 0
  %663 = shufflevector <16 x float> %662, <16 x float> poison, <16 x i32> zeroinitializer
  %664 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %663, <16 x float> %89, <16 x float> %624)
  %665 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %88
  %666 = load float, ptr %665, align 8
  %667 = insertelement <16 x float> poison, float %666, i64 0
  %668 = shufflevector <16 x float> %667, <16 x float> poison, <16 x i32> zeroinitializer
  %669 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %668, <16 x float> %89, <16 x float> %629)
  %670 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %88
  %671 = load float, ptr %670, align 8
  %672 = insertelement <16 x float> poison, float %671, i64 0
  %673 = shufflevector <16 x float> %672, <16 x float> poison, <16 x i32> zeroinitializer
  %674 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %673, <16 x float> %89, <16 x float> %634)
  %675 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %88
  %676 = load float, ptr %675, align 8
  %677 = insertelement <16 x float> poison, float %676, i64 0
  %678 = shufflevector <16 x float> %677, <16 x float> poison, <16 x i32> zeroinitializer
  %679 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %678, <16 x float> %89, <16 x float> %639)
  %680 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %88
  %681 = load float, ptr %680, align 8
  %682 = insertelement <16 x float> poison, float %681, i64 0
  %683 = shufflevector <16 x float> %682, <16 x float> poison, <16 x i32> zeroinitializer
  %684 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %683, <16 x float> %89, <16 x float> %644)
  %685 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %88
  %686 = load float, ptr %685, align 8
  %687 = insertelement <16 x float> poison, float %686, i64 0
  %688 = shufflevector <16 x float> %687, <16 x float> poison, <16 x i32> zeroinitializer
  %689 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %688, <16 x float> %89, <16 x float> %649)
  %690 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %88
  %691 = load float, ptr %690, align 8
  %692 = insertelement <16 x float> poison, float %691, i64 0
  %693 = shufflevector <16 x float> %692, <16 x float> poison, <16 x i32> zeroinitializer
  %694 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %693, <16 x float> %89, <16 x float> %654)
  %695 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %88
  %696 = load float, ptr %695, align 8
  %697 = insertelement <16 x float> poison, float %696, i64 0
  %698 = shufflevector <16 x float> %697, <16 x float> poison, <16 x i32> zeroinitializer
  %699 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %698, <16 x float> %89, <16 x float> %659)
  %700 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %90
  %701 = load float, ptr %700, align 4
  %702 = insertelement <16 x float> poison, float %701, i64 0
  %703 = shufflevector <16 x float> %702, <16 x float> poison, <16 x i32> zeroinitializer
  %704 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %703, <16 x float> %91, <16 x float> %664)
  %705 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %90
  %706 = load float, ptr %705, align 4
  %707 = insertelement <16 x float> poison, float %706, i64 0
  %708 = shufflevector <16 x float> %707, <16 x float> poison, <16 x i32> zeroinitializer
  %709 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %708, <16 x float> %91, <16 x float> %669)
  %710 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %90
  %711 = load float, ptr %710, align 4
  %712 = insertelement <16 x float> poison, float %711, i64 0
  %713 = shufflevector <16 x float> %712, <16 x float> poison, <16 x i32> zeroinitializer
  %714 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %713, <16 x float> %91, <16 x float> %674)
  %715 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %90
  %716 = load float, ptr %715, align 4
  %717 = insertelement <16 x float> poison, float %716, i64 0
  %718 = shufflevector <16 x float> %717, <16 x float> poison, <16 x i32> zeroinitializer
  %719 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %718, <16 x float> %91, <16 x float> %679)
  %720 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %90
  %721 = load float, ptr %720, align 4
  %722 = insertelement <16 x float> poison, float %721, i64 0
  %723 = shufflevector <16 x float> %722, <16 x float> poison, <16 x i32> zeroinitializer
  %724 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %723, <16 x float> %91, <16 x float> %684)
  %725 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %90
  %726 = load float, ptr %725, align 4
  %727 = insertelement <16 x float> poison, float %726, i64 0
  %728 = shufflevector <16 x float> %727, <16 x float> poison, <16 x i32> zeroinitializer
  %729 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %728, <16 x float> %91, <16 x float> %689)
  %730 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %90
  %731 = load float, ptr %730, align 4
  %732 = insertelement <16 x float> poison, float %731, i64 0
  %733 = shufflevector <16 x float> %732, <16 x float> poison, <16 x i32> zeroinitializer
  %734 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %733, <16 x float> %91, <16 x float> %694)
  %735 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %90
  %736 = load float, ptr %735, align 4
  %737 = insertelement <16 x float> poison, float %736, i64 0
  %738 = shufflevector <16 x float> %737, <16 x float> poison, <16 x i32> zeroinitializer
  %739 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %738, <16 x float> %91, <16 x float> %699)
  %740 = insertvalue [8 x <16 x float>] poison, <16 x float> %704, 0
  %741 = insertvalue [8 x <16 x float>] %740, <16 x float> %709, 1
  %742 = insertvalue [8 x <16 x float>] %741, <16 x float> %714, 2
  %743 = insertvalue [8 x <16 x float>] %742, <16 x float> %719, 3
  %744 = insertvalue [8 x <16 x float>] %743, <16 x float> %724, 4
  %745 = insertvalue [8 x <16 x float>] %744, <16 x float> %729, 5
  %746 = insertvalue [8 x <16 x float>] %745, <16 x float> %734, 6
  %747 = insertvalue [8 x <16 x float>] %746, <16 x float> %739, 7
  %748 = add nuw nsw i64 %60, 16, !dbg !88
  %749 = icmp samesign ult i64 %60, 112, !dbg !88
  br i1 %749, label %58, label %750, !dbg !88

750:                                              ; preds = %58
  %751 = getelementptr [4 x i8], ptr %26, i64 %57, !dbg !88
  store <16 x float> %704, ptr %751, align 64, !dbg !88
  %752 = getelementptr [4 x i8], ptr %30, i64 %57, !dbg !88
  store <16 x float> %709, ptr %752, align 64, !dbg !88
  %753 = getelementptr [4 x i8], ptr %34, i64 %57, !dbg !88
  store <16 x float> %714, ptr %753, align 64, !dbg !88
  %754 = getelementptr [4 x i8], ptr %38, i64 %57, !dbg !88
  store <16 x float> %719, ptr %754, align 64, !dbg !88
  %755 = getelementptr [4 x i8], ptr %42, i64 %57, !dbg !88
  store <16 x float> %724, ptr %755, align 64, !dbg !88
  %756 = getelementptr [4 x i8], ptr %46, i64 %57, !dbg !88
  store <16 x float> %729, ptr %756, align 64, !dbg !88
  %757 = getelementptr [4 x i8], ptr %50, i64 %57, !dbg !88
  store <16 x float> %734, ptr %757, align 64, !dbg !88
  %758 = getelementptr [4 x i8], ptr %54, i64 %57, !dbg !88
  store <16 x float> %739, ptr %758, align 64, !dbg !88
  %759 = add nuw nsw i64 %56, 16, !dbg !88
  %760 = icmp samesign ult i64 %56, 48, !dbg !88
  br i1 %760, label %55, label %761, !dbg !88

761:                                              ; preds = %750
  br i1 %15, label %.preheader, label %762, !dbg !88

762:                                              ; preds = %761
  ret i32 0, !dbg !89
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fmuladd.v16f32(<16 x float>, <16 x float>, <16 x float>) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr readnone captures(none) %1) local_unnamed_addr #3 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #4 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %23, %15, %12, %9
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #4 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %30
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %30, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %34

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 23
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %30, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %30, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -126, i32 -127
  %24 = add nsw i32 %23, %13
  %25 = shl nsw i32 %24, 10
  %26 = lshr i32 %21, 13
  %27 = add nuw nsw i32 %26, 15360
  %28 = select i1 %22, i32 15360, i32 %27
  %29 = add nsw i32 %28, %25
  br label %30

30:                                               ; preds = %17, %12, %15, %1, %7
  %31 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %29, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %32 = or i32 %31, %6
  %33 = trunc i32 %32 to i16
  br label %34

34:                                               ; preds = %30, %9
  %35 = phi i16 [ %11, %9 ], [ %33, %30 ]
  ret i16 %35
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #4 {
  %2 = and i16 %0, 31744
  %3 = and i16 %0, 1023
  %4 = and i16 %0, -32768
  %5 = zext i16 %4 to i32
  %6 = shl nuw i32 %5, 16
  switch i16 %2, label %15 [
    i16 31744, label %7
    i16 0, label %23
  ]

7:                                                ; preds = %1
  %8 = icmp eq i16 %3, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %7
  %10 = or disjoint i32 %6, 2143289344
  %11 = bitcast i32 %10 to float
  br label %28

12:                                               ; preds = %7
  %13 = or disjoint i32 %6, 2139095040
  %14 = bitcast i32 %13 to float
  br label %28

15:                                               ; preds = %1
  %16 = zext nneg i16 %3 to i32
  %17 = zext nneg i16 %2 to i32
  %18 = add nuw nsw i32 %17, 114688
  %19 = or disjoint i32 %18, %16
  %20 = shl nuw nsw i32 %19, 13
  %21 = or disjoint i32 %20, %6
  %22 = bitcast i32 %21 to float
  br label %28

23:                                               ; preds = %1
  %24 = or disjoint i32 %6, 864026624
  %25 = uitofp nneg i16 %3 to float
  %26 = bitcast i32 %24 to float
  %27 = fmul float %25, %26
  br label %28

28:                                               ; preds = %9, %12, %15, %23
  %29 = phi float [ %11, %9 ], [ %14, %12 ], [ %22, %15 ], [ %27, %23 ]
  ret float %29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #4 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  ret float %30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #4 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2139095040
  %4 = and i32 %2, 8388607
  %5 = lshr i32 %2, 16
  %6 = and i32 %5, 32768
  switch i32 %3, label %12 [
    i32 2139095040, label %7
    i32 0, label %30
  ]

7:                                                ; preds = %1
  %8 = icmp eq i32 %4, 0
  br i1 %8, label %30, label %9

9:                                                ; preds = %7
  %10 = trunc nuw i32 %5 to i16
  %11 = or i16 %10, 32767
  br label %34

12:                                               ; preds = %1
  %13 = lshr exact i32 %3, 23
  %14 = icmp samesign ugt i32 %3, 1191182336
  br i1 %14, label %30, label %15

15:                                               ; preds = %12
  %16 = icmp samesign ult i32 %3, 947912704
  br i1 %16, label %30, label %17

17:                                               ; preds = %15
  %18 = and i32 %2, 8192
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 4095, i32 4096
  %21 = add nuw nsw i32 %20, %4
  %22 = icmp samesign ugt i32 %21, 8388607
  %23 = select i1 %22, i32 -126, i32 -127
  %24 = add nsw i32 %23, %13
  %25 = shl nsw i32 %24, 10
  %26 = lshr i32 %21, 13
  %27 = add nuw nsw i32 %26, 15360
  %28 = select i1 %22, i32 15360, i32 %27
  %29 = add nsw i32 %25, %28
  br label %30

30:                                               ; preds = %17, %15, %12, %7, %1
  %31 = phi i32 [ 31744, %7 ], [ %3, %1 ], [ %29, %17 ], [ 31744, %12 ], [ 0, %15 ]
  %32 = or i32 %31, %6
  %33 = trunc i32 %32 to i16
  br label %34

34:                                               ; preds = %9, %30
  %35 = phi i16 [ %11, %9 ], [ %33, %30 ]
  ret i16 %35
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #4 {
  %2 = alloca i16, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2139095040
  %5 = and i32 %3, 8388607
  %6 = lshr i32 %3, 16
  %7 = and i32 %6, 32768
  switch i32 %4, label %13 [
    i32 2139095040, label %8
    i32 0, label %31
  ]

8:                                                ; preds = %1
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %31, label %10

10:                                               ; preds = %8
  %11 = trunc nuw i32 %6 to i16
  %12 = or i16 %11, 32767
  br label %35

13:                                               ; preds = %1
  %14 = lshr exact i32 %4, 23
  %15 = icmp samesign ugt i32 %4, 1191182336
  br i1 %15, label %31, label %16

16:                                               ; preds = %13
  %17 = icmp samesign ult i32 %4, 947912704
  br i1 %17, label %31, label %18

18:                                               ; preds = %16
  %19 = and i32 %3, 8192
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 4095, i32 4096
  %22 = add nuw nsw i32 %21, %5
  %23 = icmp samesign ugt i32 %22, 8388607
  %24 = select i1 %23, i32 -126, i32 -127
  %25 = add nsw i32 %24, %14
  %26 = shl nsw i32 %25, 10
  %27 = lshr i32 %22, 13
  %28 = add nuw nsw i32 %27, 15360
  %29 = select i1 %23, i32 15360, i32 %28
  %30 = add nsw i32 %26, %29
  br label %31

31:                                               ; preds = %18, %16, %13, %8, %1
  %32 = phi i32 [ 31744, %8 ], [ %4, %1 ], [ %30, %18 ], [ 31744, %13 ], [ 0, %16 ]
  %33 = or i32 %32, %7
  %34 = trunc i32 %33 to i16
  br label %35

35:                                               ; preds = %10, %31
  %36 = phi i16 [ %12, %10 ], [ %34, %31 ]
  store i16 %36, ptr %2, align 4, !tbaa !90
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #4 {
  %2 = bitcast float %0 to i32
  %3 = trunc i32 %2 to i16
  %4 = and i16 %3, 31744
  %5 = and i16 %3, 1023
  %6 = shl i32 %2, 16
  %7 = and i32 %6, -2147483648
  switch i16 %4, label %16 [
    i16 31744, label %8
    i16 0, label %24
  ]

8:                                                ; preds = %1
  %9 = icmp eq i16 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %8
  %11 = or disjoint i32 %7, 2143289344
  %12 = bitcast i32 %11 to float
  br label %29

13:                                               ; preds = %8
  %14 = or disjoint i32 %7, 2139095040
  %15 = bitcast i32 %14 to float
  br label %29

16:                                               ; preds = %1
  %17 = and i32 %2, 1023
  %18 = and i32 %2, 31744
  %19 = add nuw nsw i32 %18, 114688
  %20 = or disjoint i32 %19, %17
  %21 = shl nuw nsw i32 %20, 13
  %22 = or disjoint i32 %21, %7
  %23 = bitcast i32 %22 to float
  br label %29

24:                                               ; preds = %1
  %25 = or disjoint i32 %7, 864026624
  %26 = uitofp nneg i16 %5 to float
  %27 = bitcast i32 %25 to float
  %28 = fmul nnan float %26, %27
  br label %29

29:                                               ; preds = %10, %13, %16, %24
  %30 = phi float [ %12, %10 ], [ %15, %13 ], [ %23, %16 ], [ %28, %24 ]
  %31 = fpext float %30 to double
  ret double %31
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #4 {
  %2 = alloca i16, align 4
  %3 = fptrunc double %0 to float
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %4 = bitcast float %3 to i32
  %5 = and i32 %4, 2139095040
  %6 = and i32 %4, 8388607
  %7 = lshr i32 %4, 16
  %8 = and i32 %7, 32768
  switch i32 %5, label %14 [
    i32 2139095040, label %9
    i32 0, label %32
  ]

9:                                                ; preds = %1
  %10 = icmp eq i32 %6, 0
  br i1 %10, label %32, label %11

11:                                               ; preds = %9
  %12 = trunc nuw i32 %7 to i16
  %13 = or i16 %12, 32767
  br label %36

14:                                               ; preds = %1
  %15 = lshr exact i32 %5, 23
  %16 = icmp samesign ugt i32 %5, 1191182336
  br i1 %16, label %32, label %17

17:                                               ; preds = %14
  %18 = icmp samesign ult i32 %5, 947912704
  br i1 %18, label %32, label %19

19:                                               ; preds = %17
  %20 = and i32 %4, 8192
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 4095, i32 4096
  %23 = add nuw nsw i32 %22, %6
  %24 = icmp samesign ugt i32 %23, 8388607
  %25 = select i1 %24, i32 -126, i32 -127
  %26 = add nsw i32 %25, %15
  %27 = shl nsw i32 %26, 10
  %28 = lshr i32 %23, 13
  %29 = add nuw nsw i32 %28, 15360
  %30 = select i1 %24, i32 15360, i32 %29
  %31 = add nsw i32 %27, %30
  br label %32

32:                                               ; preds = %19, %17, %14, %9, %1
  %33 = phi i32 [ 31744, %9 ], [ %5, %1 ], [ %31, %19 ], [ 31744, %14 ], [ 0, %17 ]
  %34 = or i32 %33, %8
  %35 = trunc i32 %34 to i16
  br label %36

36:                                               ; preds = %11, %32
  %37 = phi i16 [ %13, %11 ], [ %35, %32 ]
  store i16 %37, ptr %2, align 4, !tbaa !90
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #4 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #6

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #7 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x4600000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #8 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x3A00000000000000, float 0xBA00000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x3A00000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %26, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %23

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %26, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %17 = icmp slt i32 %4, 0
  %18 = ashr i32 -8388608, %7
  %19 = select i1 %17, i32 0, i32 %12
  %20 = add nuw i32 %19, %4
  %21 = and i32 %20, %18
  %22 = bitcast i32 %21 to float
  br label %26

23:                                               ; preds = %9
  %24 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %24, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %.not = icmp sgt i32 %4, -1
  br i1 %.not, label %25, label %26

25:                                               ; preds = %23
  %.not18 = icmp eq i32 %4, 0
  %spec.select = select i1 %.not18, float %0, float 1.000000e+00
  br label %26

26:                                               ; preds = %25, %23, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %22, %15 ], [ -0.000000e+00, %23 ], [ %spec.select, %25 ]
  ret float %.0
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @expf(float noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = fpext float %0 to double
  %5 = bitcast float %0 to i32
  %6 = lshr i32 %5, 20
  %7 = and i32 %6, 2047
  %.not = icmp samesign ult i32 %7, 1067
  br i1 %.not, label %21, label %8, !prof !94

8:                                                ; preds = %1
  %9 = fcmp oeq float %0, 0xFFF0000000000000
  br i1 %9, label %39, label %10

10:                                               ; preds = %8
  %.not34 = icmp samesign ult i32 %7, 2040
  br i1 %.not34, label %13, label %11

11:                                               ; preds = %10
  %12 = fadd float %0, %0
  br label %39

13:                                               ; preds = %10
  %14 = fcmp ogt float %0, 0x40562E42E0000000
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float 0x4600000000000000, ptr %3, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, 0x4600000000000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float 0x3A00000000000000, ptr %2, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %20 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3, 0x3A00000000000000
  br label %39

21:                                               ; preds = %17, %1
  %22 = fmul double %4, 0x40471547652B82FE
  %23 = fadd double %22, 0x4338000000000000
  %24 = bitcast double %23 to i64
  %25 = fadd double %23, 0xC338000000000000
  %26 = fsub double %22, %25
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds nuw [8 x i8], ptr @__exp2f_data, i64 %27
  %29 = load i64, ptr %28, align 8, !tbaa !95
  %30 = shl i64 %24, 47
  %31 = add i64 %29, %30
  %32 = bitcast i64 %31 to double
  %33 = tail call double @llvm.fmuladd.f64(double %26, double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3)
  %34 = fmul double %26, %26
  %35 = tail call double @llvm.fmuladd.f64(double %26, double 0x3F962E42FF0C52D6, double 1.000000e+00)
  %36 = tail call double @llvm.fmuladd.f64(double %33, double %34, double %35)
  %37 = fmul double %36, %32
  %38 = fptrunc double %37 to float
  br label %39

39:                                               ; preds = %21, %19, %15, %11, %8
  %.0 = phi float [ %12, %11 ], [ %16, %15 ], [ %20, %19 ], [ %38, %21 ], [ 0.000000e+00, %8 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = add nsw i32 %6, -127
  %8 = icmp samesign ugt i32 %6, 149
  br i1 %8, label %27, label %9

9:                                                ; preds = %1
  %10 = icmp samesign ugt i32 %6, 126
  br i1 %10, label %11, label %22

11:                                               ; preds = %9
  %12 = lshr i32 8388607, %7
  %13 = and i32 %12, %4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %27, label %15

15:                                               ; preds = %11
  %16 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %16, ptr %3, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %.not1819 = icmp slt i32 %4, 0
  %17 = ashr i32 -8388608, %7
  %18 = select i1 %.not1819, i32 %12, i32 0
  %19 = add nsw i32 %18, %4
  %20 = and i32 %19, %17
  %21 = bitcast i32 %20 to float
  br label %27

22:                                               ; preds = %9
  %23 = fadd float %0, 0x4770000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %23, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %24 = icmp sgt i32 %4, -1
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %.not = fcmp oeq float %0, 0.000000e+00
  br i1 %.not, label %27, label %26

26:                                               ; preds = %25
  br label %27

27:                                               ; preds = %26, %25, %22, %15, %11, %1
  %.0 = phi float [ %0, %1 ], [ %0, %11 ], [ %21, %15 ], [ -1.000000e+00, %26 ], [ %0, %25 ], [ 0.000000e+00, %22 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #7 {
  %4 = fpext float %0 to double
  %5 = fpext float %1 to double
  %6 = fmul double %4, %5
  %7 = fpext float %2 to double
  %8 = fadd double %6, %7
  %9 = bitcast double %8 to i64
  %10 = and i64 %9, 536870911
  %11 = icmp ne i64 %10, 268435456
  %12 = and i64 %9, 9218868437227405312
  %13 = icmp eq i64 %12, 9218868437227405312
  %or.cond = or i1 %11, %13
  br i1 %or.cond, label %31, label %14

14:                                               ; preds = %3
  %15 = fsub double %8, %6
  %16 = fcmp oeq double %15, %7
  %17 = fsub double %8, %7
  %18 = fcmp oeq double %17, %6
  %or.cond44 = and i1 %16, %18
  br i1 %or.cond44, label %31, label %19

19:                                               ; preds = %14
  %20 = icmp slt i64 %9, 0
  %21 = fcmp uge double %6, %7
  %22 = xor i1 %21, %20
  %23 = fsub double %6, %8
  %24 = fadd double %23, %7
  %25 = fsub double %7, %8
  %26 = fadd double %6, %25
  %.038 = select i1 %22, double %24, double %26
  %27 = fcmp uge double %.038, 0.000000e+00
  %28 = xor i1 %20, %27
  %29 = or disjoint i64 %9, 1
  %30 = add nsw i64 %9, -1
  %.sroa.0.0.in = select i1 %28, i64 %29, i64 %30
  %.sroa.0.0 = bitcast i64 %.sroa.0.0.in to double
  br label %31

31:                                               ; preds = %3, %14, %19
  %.0.in = phi double [ %.sroa.0.0, %19 ], [ %8, %14 ], [ %8, %3 ]
  %.0 = fptrunc double %.0.in to float
  ret float %.0
}

; Function Attrs: inlinehint nofree norecurse nosync nounwind memory(none)
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = bitcast float %1 to i32
  %7 = lshr i32 %6, 23
  %8 = and i32 %7, 255
  %9 = and i32 %3, -2147483648
  %10 = shl i32 %6, 1
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %2
  %13 = tail call float @llvm.fabs.f32(float %1)
  %14 = bitcast float %13 to i32
  %15 = icmp samesign ugt i32 %14, 2139095040
  %16 = icmp eq i32 %5, 255
  %or.cond = or i1 %15, %16
  br i1 %or.cond, label %17, label %20

17:                                               ; preds = %12, %2
  %18 = fmul float %0, %1
  %19 = fdiv float %18, %18
  br label %83

20:                                               ; preds = %12
  %21 = shl i32 %3, 1
  %.not = icmp ugt i32 %21, %10
  br i1 %.not, label %25, label %22

22:                                               ; preds = %20
  %23 = icmp eq i32 %21, %10
  %24 = fmul float %0, 0.000000e+00
  %spec.select = select i1 %23, float %24, float %0
  br label %83

25:                                               ; preds = %20
  %.not81 = icmp eq i32 %5, 0
  br i1 %.not81, label %26, label %34

26:                                               ; preds = %25
  %27 = shl i32 %3, 9
  %28 = icmp sgt i32 %27, -1
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %26, %.lr.ph
  %.06586 = phi i32 [ %30, %.lr.ph ], [ %27, %26 ]
  %.07085 = phi i32 [ %29, %.lr.ph ], [ 0, %26 ]
  %29 = add nsw i32 %.07085, -1
  %30 = shl nuw i32 %.06586, 1
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %26
  %.070.lcssa = phi i32 [ 0, %26 ], [ %29, %.lr.ph ]
  %32 = sub i32 1, %.070.lcssa
  %33 = shl i32 %3, %32
  br label %37

34:                                               ; preds = %25
  %35 = and i32 %3, 8388607
  %36 = or disjoint i32 %35, 8388608
  br label %37

37:                                               ; preds = %34, %._crit_edge
  %.171 = phi i32 [ %5, %34 ], [ %.070.lcssa, %._crit_edge ]
  %.0 = phi i32 [ %36, %34 ], [ %33, %._crit_edge ]
  %.not82 = icmp eq i32 %8, 0
  br i1 %.not82, label %38, label %46

38:                                               ; preds = %37
  %39 = shl i32 %6, 9
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %.lr.ph90, label %._crit_edge91

.lr.ph90:                                         ; preds = %38, %.lr.ph90
  %.16688 = phi i32 [ %42, %.lr.ph90 ], [ %39, %38 ]
  %.06887 = phi i32 [ %41, %.lr.ph90 ], [ 0, %38 ]
  %41 = add nsw i32 %.06887, -1
  %42 = shl nuw i32 %.16688, 1
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %.lr.ph90, label %._crit_edge91

._crit_edge91:                                    ; preds = %.lr.ph90, %38
  %.068.lcssa = phi i32 [ 0, %38 ], [ %41, %.lr.ph90 ]
  %44 = sub i32 1, %.068.lcssa
  %45 = shl i32 %6, %44
  br label %49

46:                                               ; preds = %37
  %47 = and i32 %6, 8388607
  %48 = or disjoint i32 %47, 8388608
  br label %49

49:                                               ; preds = %46, %._crit_edge91
  %.sroa.0.0.in = phi i32 [ %48, %46 ], [ %45, %._crit_edge91 ]
  %.169 = phi i32 [ %8, %46 ], [ %.068.lcssa, %._crit_edge91 ]
  %50 = icmp sgt i32 %.171, %.169
  br i1 %50, label %.lr.ph96, label %._crit_edge97

.lr.ph96:                                         ; preds = %49, %57
  %.194 = phi i32 [ %58, %57 ], [ %.0, %49 ]
  %.27293 = phi i32 [ %59, %57 ], [ %.171, %49 ]
  %51 = sub i32 %.194, %.sroa.0.0.in
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %53, label %57

53:                                               ; preds = %.lr.ph96
  %54 = icmp eq i32 %51, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %53
  %56 = fmul float %0, 0.000000e+00
  br label %83

57:                                               ; preds = %53, %.lr.ph96
  %.2 = phi i32 [ %.194, %.lr.ph96 ], [ %51, %53 ]
  %58 = shl i32 %.2, 1
  %59 = add nsw i32 %.27293, -1
  %60 = icmp sgt i32 %59, %.169
  br i1 %60, label %.lr.ph96, label %._crit_edge97

._crit_edge97:                                    ; preds = %57, %49
  %.272.lcssa = phi i32 [ %.171, %49 ], [ %.169, %57 ]
  %.1.lcssa = phi i32 [ %.0, %49 ], [ %58, %57 ]
  %61 = sub i32 %.1.lcssa, %.sroa.0.0.in
  %62 = icmp sgt i32 %61, -1
  br i1 %62, label %63, label %67

63:                                               ; preds = %._crit_edge97
  %64 = icmp eq i32 %61, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %63
  %66 = fmul float %0, 0.000000e+00
  br label %83

67:                                               ; preds = %63, %._crit_edge97
  %.3 = phi i32 [ %.1.lcssa, %._crit_edge97 ], [ %61, %63 ]
  %68 = icmp ult i32 %.3, 8388608
  br i1 %68, label %.lr.ph103, label %._crit_edge104

.lr.ph103:                                        ; preds = %67, %.lr.ph103
  %.4101 = phi i32 [ %69, %.lr.ph103 ], [ %.3, %67 ]
  %.373100 = phi i32 [ %70, %.lr.ph103 ], [ %.272.lcssa, %67 ]
  %69 = shl nuw nsw i32 %.4101, 1
  %70 = add nsw i32 %.373100, -1
  %71 = icmp samesign ult i32 %.4101, 4194304
  br i1 %71, label %.lr.ph103, label %._crit_edge104

._crit_edge104:                                   ; preds = %.lr.ph103, %67
  %.373.lcssa = phi i32 [ %.272.lcssa, %67 ], [ %70, %.lr.ph103 ]
  %.4.lcssa = phi i32 [ %.3, %67 ], [ %69, %.lr.ph103 ]
  %72 = icmp sgt i32 %.373.lcssa, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %._crit_edge104
  %74 = add i32 %.4.lcssa, -8388608
  %75 = shl i32 %.373.lcssa, 23
  %76 = or i32 %74, %75
  br label %80

77:                                               ; preds = %._crit_edge104
  %78 = sub i32 1, %.373.lcssa
  %79 = lshr i32 %.4.lcssa, %78
  br label %80

80:                                               ; preds = %77, %73
  %.5 = phi i32 [ %76, %73 ], [ %79, %77 ]
  %81 = or i32 %.5, %9
  %82 = bitcast i32 %81 to float
  br label %83

83:                                               ; preds = %80, %65, %55, %22, %17
  %.067 = phi float [ %19, %17 ], [ %56, %55 ], [ %66, %65 ], [ %82, %80 ], [ %spec.select, %22 ]
  ret float %.067
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #6

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #10 {
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %trunc = trunc i32 %4 to i8
  switch i8 %trunc, label %13 [
    i8 0, label %5
    i8 -1, label %19
  ]

5:                                                ; preds = %2
  %6 = fcmp une float %0, 0.000000e+00
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = fmul float %0, 0x43F0000000000000
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #11
  %10 = load i32, ptr %1, align 4, !tbaa !5
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !5
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !5
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, 0x47E0000000000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %scalbnf.exit

8:                                                ; preds = %4
  %9 = fmul float %5, 0x47E0000000000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select.i = add nsw i32 %10, -254
  br label %scalbnf.exit

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %scalbnf.exit

13:                                               ; preds = %11
  %14 = fmul float %0, 0x3990000000000000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %scalbnf.exit

17:                                               ; preds = %13
  %18 = fmul float %14, 0x3990000000000000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1.i = add nuw nsw i32 %19, 204
  br label %scalbnf.exit

scalbnf.exit:                                     ; preds = %4, %8, %11, %13, %17
  %.018.i = phi i32 [ %spec.store.select.i, %8 ], [ %6, %4 ], [ %spec.store.select1.i, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0.i = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %20 = shl nsw i32 %.018.i, 23
  %21 = add nsw i32 %20, 1065353216
  %22 = bitcast i32 %21 to float
  %23 = fmul float %.0.i, %22
  ret float %23
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = icmp sgt i32 %1, 127
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = fmul float %0, 0x47E0000000000000
  %6 = add nsw i32 %1, -127
  %7 = icmp samesign ugt i32 %1, 254
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = fmul float %5, 0x47E0000000000000
  %10 = tail call i32 @llvm.umin.i32(i32 %1, i32 381)
  %spec.store.select = add nsw i32 %10, -254
  br label %20

11:                                               ; preds = %2
  %12 = icmp slt i32 %1, -126
  br i1 %12, label %13, label %20

13:                                               ; preds = %11
  %14 = fmul float %0, 0x3990000000000000
  %15 = add nuw nsw i32 %1, 102
  %16 = icmp samesign ult i32 %1, -228
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = fmul float %14, 0x3990000000000000
  %19 = tail call i32 @llvm.umax.i32(i32 %1, i32 -330)
  %spec.store.select1 = add nuw nsw i32 %19, 204
  br label %20

20:                                               ; preds = %17, %13, %11, %8, %4
  %.018 = phi i32 [ %spec.store.select, %8 ], [ %6, %4 ], [ %spec.store.select1, %17 ], [ %15, %13 ], [ %1, %11 ]
  %.0 = phi float [ %9, %8 ], [ %5, %4 ], [ %18, %17 ], [ %14, %13 ], [ %0, %11 ]
  %21 = shl nsw i32 %.018, 23
  %22 = add nsw i32 %21, 1065353216
  %23 = bitcast i32 %22 to float
  %24 = fmul float %.0, %23
  ret float %24
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #6

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #6

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #8 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = bitcast float %0 to i32
  %7 = bitcast float %1 to i32
  %8 = add i32 %6, -2139095040
  %9 = icmp ult i32 %8, -2130706432
  %.pre = shl i32 %7, 1
  %10 = add i32 %.pre, 16777216
  %11 = icmp ult i32 %10, 16777217
  %or.cond99 = or i1 %9, %11
  br i1 %or.cond99, label %.critedge, label %76, !prof !97

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !94

14:                                               ; preds = %.critedge
  %15 = icmp eq i32 %.pre, 0
  %16 = icmp eq i32 %6, 1065353216
  %or.cond70 = or i1 %16, %15
  br i1 %or.cond70, label %134, label %17

17:                                               ; preds = %14
  %18 = shl i32 %6, 1
  %19 = icmp ugt i32 %18, -16777216
  %20 = icmp samesign ugt i32 %.pre, -16777216
  %or.cond = or i1 %19, %20
  br i1 %or.cond, label %21, label %23

21:                                               ; preds = %17
  %22 = fadd float %0, %1
  br label %134

23:                                               ; preds = %17
  %24 = icmp eq i32 %18, 2130706432
  br i1 %24, label %134, label %25

25:                                               ; preds = %23
  %26 = icmp ult i32 %18, 2130706432
  %27 = icmp slt i32 %7, 0
  %28 = xor i1 %26, %27
  %29 = fmul float %1, %1
  %spec.select71 = select i1 %28, float 0.000000e+00, float %29
  br label %134

30:                                               ; preds = %.critedge
  %31 = shl i32 %6, 1
  %32 = add i32 %31, -1
  %33 = icmp ult i32 %32, -16777217
  br i1 %33, label %49, label %34, !prof !94

34:                                               ; preds = %30
  %35 = fmul float %0, %0
  %.not66 = icmp sgt i32 %6, -1
  br i1 %.not66, label %checkint.exit.thread, label %36

36:                                               ; preds = %34
  %37 = lshr i32 %7, 23
  %38 = and i32 %37, 255
  %39 = add nsw i32 %38, -151
  %or.cond92 = icmp ult i32 %39, -24
  br i1 %or.cond92, label %checkint.exit.thread, label %40

40:                                               ; preds = %36
  %41 = sub nuw nsw i32 150, %38
  %42 = shl nuw nsw i32 1, %41
  %43 = add nsw i32 %42, -1
  %44 = and i32 %43, %7
  %.not.i = icmp ne i32 %44, 0
  %45 = and i32 %42, %7
  %.not9.i = icmp eq i32 %45, 0
  %or.cond93 = or i1 %.not9.i, %.not.i
  %46 = fneg float %35
  %spec.select = select i1 %or.cond93, float %35, float %46
  br label %checkint.exit.thread

checkint.exit.thread:                             ; preds = %40, %36, %34
  %.057 = phi float [ %35, %34 ], [ %35, %36 ], [ %spec.select, %40 ]
  %.not67 = icmp sgt i32 %7, -1
  br i1 %.not67, label %134, label %47

47:                                               ; preds = %checkint.exit.thread
  %48 = fdiv float 1.000000e+00, %.057
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store volatile float %48, ptr %5, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  br label %134

49:                                               ; preds = %30
  %.not64 = icmp sgt i32 %6, -1
  br i1 %.not64, label %69, label %50

50:                                               ; preds = %49
  %51 = lshr i32 %7, 23
  %52 = and i32 %51, 255
  %53 = icmp samesign ult i32 %52, 127
  br i1 %53, label %.thread, label %54

54:                                               ; preds = %50
  %55 = icmp samesign ugt i32 %52, 150
  br i1 %55, label %checkint.exit76.thread85, label %56

56:                                               ; preds = %54
  %57 = sub nuw nsw i32 150, %52
  %58 = shl nuw nsw i32 1, %57
  %59 = add nsw i32 %58, -1
  %60 = and i32 %59, %7
  %.not.i72 = icmp eq i32 %60, 0
  br i1 %.not.i72, label %61, label %.thread

61:                                               ; preds = %56
  %62 = and i32 %58, %7
  %.not9.i74 = icmp eq i32 %62, 0
  br i1 %.not9.i74, label %checkint.exit76.thread85, label %65

.thread:                                          ; preds = %56, %50
  %63 = fsub float %0, %0
  %64 = fdiv float %63, %63
  br label %134

checkint.exit76.thread85:                         ; preds = %61, %54
  br label %65

65:                                               ; preds = %checkint.exit76.thread85, %61
  %66 = phi i32 [ 0, %checkint.exit76.thread85 ], [ 65536, %61 ]
  %67 = tail call float @llvm.fabs.f32(float %0)
  %68 = bitcast float %67 to i32
  br label %69

69:                                               ; preds = %65, %49
  %.154 = phi i32 [ %68, %65 ], [ %6, %49 ]
  %.151 = phi i32 [ %66, %65 ], [ 0, %49 ]
  %70 = icmp ult i32 %.154, 8388608
  br i1 %70, label %71, label %76

71:                                               ; preds = %69
  %72 = fmul float %0, 0x4160000000000000
  %73 = tail call float @llvm.fabs.f32(float %72)
  %74 = bitcast float %73 to i32
  %75 = add nsw i32 %74, -192937984
  br label %76

76:                                               ; preds = %71, %69, %2
  %.053 = phi i32 [ %75, %71 ], [ %.154, %69 ], [ %6, %2 ]
  %.050 = phi i32 [ %.151, %71 ], [ %.151, %69 ], [ 0, %2 ]
  %77 = add i32 %.053, -1060306944
  %78 = lshr i32 %77, 19
  %79 = and i32 %78, 15
  %80 = and i32 %77, -8388608
  %81 = sub i32 %.053, %80
  %82 = ashr i32 %77, 23
  %83 = zext nneg i32 %79 to i64
  %84 = getelementptr inbounds nuw [16 x i8], ptr @__powf_log2_data, i64 %83
  %85 = load double, ptr %84, align 8, !tbaa !98
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !101
  %88 = bitcast i32 %81 to float
  %89 = fpext float %88 to double
  %90 = tail call double @llvm.fmuladd.f64(double %89, double %85, double -1.000000e+00)
  %91 = sitofp i32 %82 to double
  %92 = fadd double %87, %91
  %93 = fmul double %90, %90
  %94 = tail call double @llvm.fmuladd.f64(double %90, double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A)
  %95 = tail call double @llvm.fmuladd.f64(double %90, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8)
  %96 = fmul double %93, %93
  %97 = tail call double @llvm.fmuladd.f64(double %90, double 0x3FF71547652AB82B, double %92)
  %98 = tail call double @llvm.fmuladd.f64(double %95, double %93, double %97)
  %99 = tail call double @llvm.fmuladd.f64(double %94, double %96, double %98)
  %100 = fpext float %1 to double
  %101 = fmul double %99, %100
  %102 = bitcast double %101 to i64
  %103 = and i64 %102, 9223231299366420480
  %104 = icmp samesign ugt i64 %103, 4638426141214900224
  br i1 %104, label %105, label %115, !prof !102

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, 0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  %109 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, 0x4600000000000000
  br label %134

110:                                              ; preds = %105
  %111 = fcmp ugt double %101, -1.500000e+02
  br i1 %111, label %115, label %112

112:                                              ; preds = %110
  %.not.i.i5 = icmp eq i32 %.050, 0
  %113 = select i1 %.not.i.i5, float 0x3A00000000000000, float 0xBA00000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %113, ptr %3, align 4, !tbaa !92
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %114 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6, 0x3A00000000000000
  br label %134

115:                                              ; preds = %110, %76
  %116 = fadd double %101, 0x42E8000000000000
  %117 = bitcast double %116 to i64
  %118 = fadd double %116, 0xC2E8000000000000
  %119 = fsub double %101, %118
  %120 = and i64 %117, 31
  %121 = getelementptr inbounds nuw [8 x i8], ptr @__exp2f_data, i64 %120
  %122 = load i64, ptr %121, align 8, !tbaa !95
  %123 = zext nneg i32 %.050 to i64
  %124 = add i64 %117, %123
  %125 = shl i64 %124, 47
  %126 = add i64 %122, %125
  %127 = bitcast i64 %126 to double
  %128 = tail call double @llvm.fmuladd.f64(double %119, double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3)
  %129 = fmul double %119, %119
  %130 = tail call double @llvm.fmuladd.f64(double %119, double 0x3FE62E42FF0C52D6, double 1.000000e+00)
  %131 = tail call double @llvm.fmuladd.f64(double %128, double %129, double %130)
  %132 = fmul double %131, %127
  %133 = fptrunc double %132 to float
  br label %134

134:                                              ; preds = %115, %112, %107, %.thread, %47, %checkint.exit.thread, %25, %23, %21, %14
  %.0 = phi float [ %22, %21 ], [ 1.000000e+00, %14 ], [ 1.000000e+00, %23 ], [ %.0..0..0..0..0..0..0..0..0..0..i, %47 ], [ %.057, %checkint.exit.thread ], [ %109, %107 ], [ %114, %112 ], [ %133, %115 ], [ %spec.select71, %25 ], [ %64, %.thread ]
  ret float %.0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #7 {
  %2 = bitcast float %0 to i32
  %3 = and i32 %2, 2130706432
  %4 = icmp samesign ugt i32 %3, 1249902592
  br i1 %4, label %13, label %5

5:                                                ; preds = %1
  %.not = icmp sgt i32 %2, -1
  %6 = fadd float %0, 0xC160000000000000
  %7 = fadd float %6, 0x4160000000000000
  %8 = fadd float %0, 0x4160000000000000
  %9 = fadd float %8, 0xC160000000000000
  %.0 = select i1 %.not, float %9, float %7
  %10 = fcmp oeq float %.0, 0.000000e+00
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = select i1 %.not, float 0.000000e+00, float -0.000000e+00
  br label %13

13:                                               ; preds = %11, %5, %1
  %.010 = phi float [ %12, %11 ], [ %0, %1 ], [ %.0, %5 ]
  ret float %.010
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @roundf(float noundef %0) local_unnamed_addr #8 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = icmp samesign ugt i32 %5, 149
  br i1 %6, label %26, label %7

7:                                                ; preds = %1
  %spec.select = tail call float @llvm.fabs.f32(float %0)
  %8 = icmp samesign ult i32 %5, 126
  %9 = fadd float %spec.select, 0x4160000000000000
  br i1 %8, label %10, label %12

10:                                               ; preds = %7
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %9, ptr %2, align 4, !tbaa !92
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %11 = fmul float %0, 0.000000e+00
  br label %26

12:                                               ; preds = %7
  %13 = fadd float %9, 0xC160000000000000
  %14 = fsub float %13, %spec.select
  %15 = fcmp ogt float %14, 5.000000e-01
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = fadd float %spec.select, %14
  %18 = fadd float %17, -1.000000e+00
  br label %24

19:                                               ; preds = %12
  %20 = fcmp ugt float %14, -5.000000e-01
  %21 = fadd float %spec.select, %14
  br i1 %20, label %24, label %22

22:                                               ; preds = %19
  %23 = fadd float %21, 1.000000e+00
  br label %24

24:                                               ; preds = %22, %19, %16
  %.0 = phi float [ %18, %16 ], [ %23, %22 ], [ %21, %19 ]
  %25 = fneg float %.0
  %.not26 = icmp slt i32 %3, 0
  %spec.select25 = select i1 %.not26, float %25, float %.0
  br label %26

26:                                               ; preds = %24, %10, %1
  %.020 = phi float [ %11, %10 ], [ %spec.select25, %24 ], [ %0, %1 ]
  ret float %.020
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "nonlazybind" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #8 = { inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite) }
attributes #9 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #10 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #11 = { inlinehint }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4}
!llvm.errno.tbaa = !{!5}

!0 = distinct !DICompileUnit(language: DW_LANG_C17, file: !1, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "module_main$async_dispatch_0.mlir", directory: "dumps")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !DISubprogram(name: "main$async_dispatch_0_matmul_128x128x128_f32", linkageName: "main$async_dispatch_0_matmul_128x128x128_f32", scope: !1, file: !1, line: 1, type: !10, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!10 = !DISubroutineType(cc: DW_CC_normal, types: !11)
!11 = !{!12, !13, !44, !73}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_environment_v0_t", baseType: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_environment_v0_t", scope: !17, file: !17, line: 246, size: 768, elements: !18)
!17 = !DIFile(filename: "runtime/src/iree/hal/local/executable_library.h", directory: ".")
!18 = !{!19, !27, !30, !33, !35}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, scope: !17, file: !17, line: 227, baseType: !23, size: 2048, elements: !25)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", baseType: !24)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{!26}
!26 = !DISubrange(count: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "import_thunk", baseType: !28, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "import_funcs", baseType: !31, size: 64, offset: 128)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "import_contexts", baseType: !34, size: 64, offset: 192)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "processor", baseType: !36, offset: 256)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_processor_v0_t", scope: !17, file: !17, line: 227, size: 512, elements: !37)
!37 = !{!38}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "data", baseType: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, scope: !17, file: !17, line: 227, baseType: !40, size: 512, elements: !42)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", baseType: !41)
!41 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !{!43}
!43 = !DISubrange(count: 8)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_dispatch_state_v0_t", baseType: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_dispatch_state_v0_t", scope: !17, file: !17, line: 275, size: 384, elements: !48)
!48 = !{!49, !50, !51, !54, !55, !56, !57, !58, !61, !62, !63, !68}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_x", baseType: !23, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_y", baseType: !23, size: 32, offset: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_z", baseType: !52, size: 16, offset: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", baseType: !53)
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "constant_count", baseType: !52, size: 16, offset: 80)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_x", baseType: !23, size: 32, offset: 96)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_y", baseType: !23, size: 32, offset: 128)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_z", baseType: !52, size: 16, offset: 160)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "max_concurrency", baseType: !59, size: 8, offset: 176)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", baseType: !60)
!60 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "binding_count", baseType: !59, size: 8, offset: 184)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !20, size: 64, offset: 192)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "binding_ptrs", baseType: !64, size: 64, offset: 256)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, scope: !17, file: !17, line: 227, baseType: !67, size: 4096, elements: !25)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "binding_lengths", baseType: !69, size: 64, offset: 320)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, scope: !17, file: !17, line: 227, baseType: !72, size: 4096, elements: !25)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", baseType: !40)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_workgroup_state_v0_t", baseType: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_workgroup_state_v0_t", scope: !17, file: !17, line: 321, size: 256, elements: !77)
!77 = !{!78, !79, !80, !81, !82, !83, !84}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_x", baseType: !23, size: 32)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_y", baseType: !23, size: 32, offset: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_z", baseType: !52, size: 16, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", baseType: !52, size: 16, offset: 80)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "processor_id", baseType: !23, size: 32, offset: 96)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory", baseType: !28, size: 64, offset: 128)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory_size", baseType: !23, size: 32, offset: 192)
!85 = !DILocation(line: 11, column: 8, scope: !9)
!86 = !DILocation(line: 12, column: 8, scope: !9)
!87 = !DILocation(line: 13, column: 8, scope: !9)
!88 = !DILocation(line: 18, column: 8, scope: !9)
!89 = !DILocation(line: 20, column: 8, scope: !9)
!90 = !{!91, !91, i64 0}
!91 = !{!"short", !7, i64 0}
!92 = !{!93, !93, i64 0}
!93 = !{!"float", !7, i64 0}
!94 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!95 = !{!96, !96, i64 0}
!96 = !{!"long", !7, i64 0}
!97 = !{!"branch_weights", i32 4001, i32 4000000}
!98 = !{!99, !100, i64 0}
!99 = !{!"", !100, i64 0, !100, i64 8}
!100 = !{!"double", !7, i64 0}
!101 = !{!99, !100, i64 8}
!102 = !{!"branch_weights", !"expected", i32 1, i32 2000}
