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
  %7 = getelementptr i8, ptr %6, i64 512, !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !87
  %8 = getelementptr i8, ptr %.unpack21, i64 16, !dbg !88
  %9 = load ptr, ptr %8, align 8, !dbg !88
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 64) ], !dbg !88
  %10 = load i32, ptr %2, align 16, !dbg !89
  %11 = zext i32 %10 to i64, !dbg !89
  %12 = shl nuw nsw i64 %11, 3, !dbg !89
  %13 = and i64 %12, 34359738352, !dbg !89
  %14 = shl nuw nsw i64 %11, 6, !dbg !89
  %15 = and i64 %14, 64, !dbg !89
  br label %.preheader, !dbg !89

.preheader:                                       ; preds = %3, %780
  %16 = phi i1 [ true, %3 ], [ false, %780 ]
  %17 = phi i64 [ 0, %3 ], [ 8, %780 ]
  %18 = or disjoint i64 %17, %13
  %.idx91 = shl nuw nsw i64 %18, 9
  %19 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx91
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 512
  %21 = getelementptr inbounds nuw i8, ptr %19, i64 1024
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 1536
  %23 = getelementptr inbounds nuw i8, ptr %19, i64 2048
  %24 = getelementptr inbounds nuw i8, ptr %19, i64 2560
  %25 = getelementptr inbounds nuw i8, ptr %19, i64 3072
  %26 = getelementptr inbounds nuw i8, ptr %19, i64 3584
  %.idx = shl nuw nsw i64 %18, 9
  %27 = getelementptr i8, ptr %9, i64 %.idx
  %28 = or disjoint i64 %13, %17
  %29 = shl nuw nsw i64 %28, 9
  %30 = getelementptr i8, ptr %9, i64 %29
  %31 = getelementptr i8, ptr %30, i64 512
  %32 = or disjoint i64 %13, %17
  %33 = shl nuw nsw i64 %32, 9
  %34 = getelementptr i8, ptr %9, i64 %33
  %35 = getelementptr i8, ptr %34, i64 1024
  %36 = or disjoint i64 %13, %17
  %37 = shl nuw nsw i64 %36, 9
  %38 = getelementptr i8, ptr %9, i64 %37
  %39 = getelementptr i8, ptr %38, i64 1536
  %40 = or disjoint i64 %13, %17
  %41 = shl nuw nsw i64 %40, 9
  %42 = getelementptr i8, ptr %9, i64 %41
  %43 = getelementptr i8, ptr %42, i64 2048
  %44 = or disjoint i64 %13, %17
  %45 = shl nuw nsw i64 %44, 9
  %46 = getelementptr i8, ptr %9, i64 %45
  %47 = getelementptr i8, ptr %46, i64 2560
  %48 = or disjoint i64 %13, %17
  %49 = shl nuw nsw i64 %48, 9
  %50 = getelementptr i8, ptr %9, i64 %49
  %51 = getelementptr i8, ptr %50, i64 3072
  %52 = or disjoint i64 %13, %17
  %53 = shl nuw nsw i64 %52, 9
  %54 = getelementptr i8, ptr %9, i64 %53
  %55 = getelementptr i8, ptr %54, i64 3584
  br label %56, !dbg !89

56:                                               ; preds = %.preheader, %751
  %57 = phi i64 [ 0, %.preheader ], [ %778, %751 ]
  %58 = or disjoint i64 %57, %15, !dbg !89
  %invariant.gep = getelementptr [4 x i8], ptr %7, i64 %58, !dbg !89
  br label %59, !dbg !89

59:                                               ; preds = %56, %59
  %60 = phi [8 x <16 x float>] [ zeroinitializer, %56 ], [ %748, %59 ]
  %61 = phi i64 [ 0, %56 ], [ %749, %59 ]
  %.idx38 = shl nuw nsw i64 %61, 9, !dbg !89
  %gep = getelementptr i8, ptr %invariant.gep, i64 %.idx38, !dbg !89
  %62 = load <16 x float>, ptr %gep, align 64, !dbg !89
  %63 = or disjoint i64 %61, 1, !dbg !89
  %.idx39 = shl nuw nsw i64 %63, 9, !dbg !89
  %gep55 = getelementptr i8, ptr %invariant.gep, i64 %.idx39, !dbg !89
  %64 = load <16 x float>, ptr %gep55, align 64, !dbg !89
  %65 = or disjoint i64 %61, 2, !dbg !89
  %.idx40 = shl nuw nsw i64 %65, 9, !dbg !89
  %gep57 = getelementptr i8, ptr %invariant.gep, i64 %.idx40, !dbg !89
  %66 = load <16 x float>, ptr %gep57, align 64, !dbg !89
  %67 = or disjoint i64 %61, 3, !dbg !89
  %.idx41 = shl nuw nsw i64 %67, 9, !dbg !89
  %gep59 = getelementptr i8, ptr %invariant.gep, i64 %.idx41, !dbg !89
  %68 = load <16 x float>, ptr %gep59, align 64, !dbg !89
  %69 = or disjoint i64 %61, 4, !dbg !89
  %.idx42 = shl nuw nsw i64 %69, 9, !dbg !89
  %gep61 = getelementptr i8, ptr %invariant.gep, i64 %.idx42, !dbg !89
  %70 = load <16 x float>, ptr %gep61, align 64, !dbg !89
  %71 = or disjoint i64 %61, 5, !dbg !89
  %.idx43 = shl nuw nsw i64 %71, 9, !dbg !89
  %gep63 = getelementptr i8, ptr %invariant.gep, i64 %.idx43, !dbg !89
  %72 = load <16 x float>, ptr %gep63, align 64, !dbg !89
  %73 = or disjoint i64 %61, 6, !dbg !89
  %.idx44 = shl nuw nsw i64 %73, 9, !dbg !89
  %gep65 = getelementptr i8, ptr %invariant.gep, i64 %.idx44, !dbg !89
  %74 = load <16 x float>, ptr %gep65, align 64, !dbg !89
  %75 = or disjoint i64 %61, 7, !dbg !89
  %.idx45 = shl nuw nsw i64 %75, 9, !dbg !89
  %gep67 = getelementptr i8, ptr %invariant.gep, i64 %.idx45, !dbg !89
  %76 = load <16 x float>, ptr %gep67, align 64, !dbg !89
  %77 = or disjoint i64 %61, 8, !dbg !89
  %.idx46 = shl nuw nsw i64 %77, 9, !dbg !89
  %gep69 = getelementptr i8, ptr %invariant.gep, i64 %.idx46, !dbg !89
  %78 = load <16 x float>, ptr %gep69, align 64, !dbg !89
  %79 = or disjoint i64 %61, 9, !dbg !89
  %.idx47 = shl nuw nsw i64 %79, 9, !dbg !89
  %gep71 = getelementptr i8, ptr %invariant.gep, i64 %.idx47, !dbg !89
  %80 = load <16 x float>, ptr %gep71, align 64, !dbg !89
  %81 = or disjoint i64 %61, 10, !dbg !89
  %.idx48 = shl nuw nsw i64 %81, 9, !dbg !89
  %gep73 = getelementptr i8, ptr %invariant.gep, i64 %.idx48, !dbg !89
  %82 = load <16 x float>, ptr %gep73, align 64, !dbg !89
  %83 = or disjoint i64 %61, 11, !dbg !89
  %.idx49 = shl nuw nsw i64 %83, 9, !dbg !89
  %gep75 = getelementptr i8, ptr %invariant.gep, i64 %.idx49, !dbg !89
  %84 = load <16 x float>, ptr %gep75, align 64, !dbg !89
  %85 = or disjoint i64 %61, 12, !dbg !89
  %.idx50 = shl nuw nsw i64 %85, 9, !dbg !89
  %gep77 = getelementptr i8, ptr %invariant.gep, i64 %.idx50, !dbg !89
  %86 = load <16 x float>, ptr %gep77, align 64, !dbg !89
  %87 = or disjoint i64 %61, 13, !dbg !89
  %.idx51 = shl nuw nsw i64 %87, 9, !dbg !89
  %gep79 = getelementptr i8, ptr %invariant.gep, i64 %.idx51, !dbg !89
  %88 = load <16 x float>, ptr %gep79, align 64, !dbg !89
  %89 = or disjoint i64 %61, 14, !dbg !89
  %.idx52 = shl nuw nsw i64 %89, 9, !dbg !89
  %gep81 = getelementptr i8, ptr %invariant.gep, i64 %.idx52, !dbg !89
  %90 = load <16 x float>, ptr %gep81, align 64, !dbg !89
  %91 = or disjoint i64 %61, 15, !dbg !89
  %.idx53 = shl nuw nsw i64 %91, 9, !dbg !89
  %gep83 = getelementptr i8, ptr %invariant.gep, i64 %.idx53, !dbg !89
  %92 = load <16 x float>, ptr %gep83, align 64, !dbg !89
  %93 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %61
  %94 = load float, ptr %93, align 64
  %95 = insertelement <16 x float> poison, float %94, i64 0
  %96 = shufflevector <16 x float> %95, <16 x float> poison, <16 x i32> zeroinitializer
  %97 = extractvalue [8 x <16 x float>] %60, 0
  %98 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %96, <16 x float> %62, <16 x float> %97)
  %99 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %61
  %100 = load float, ptr %99, align 64
  %101 = insertelement <16 x float> poison, float %100, i64 0
  %102 = shufflevector <16 x float> %101, <16 x float> poison, <16 x i32> zeroinitializer
  %103 = extractvalue [8 x <16 x float>] %60, 1
  %104 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %102, <16 x float> %62, <16 x float> %103)
  %105 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %61
  %106 = load float, ptr %105, align 64
  %107 = insertelement <16 x float> poison, float %106, i64 0
  %108 = shufflevector <16 x float> %107, <16 x float> poison, <16 x i32> zeroinitializer
  %109 = extractvalue [8 x <16 x float>] %60, 2
  %110 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %108, <16 x float> %62, <16 x float> %109)
  %111 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %61
  %112 = load float, ptr %111, align 64
  %113 = insertelement <16 x float> poison, float %112, i64 0
  %114 = shufflevector <16 x float> %113, <16 x float> poison, <16 x i32> zeroinitializer
  %115 = extractvalue [8 x <16 x float>] %60, 3
  %116 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %114, <16 x float> %62, <16 x float> %115)
  %117 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %61
  %118 = load float, ptr %117, align 64
  %119 = insertelement <16 x float> poison, float %118, i64 0
  %120 = shufflevector <16 x float> %119, <16 x float> poison, <16 x i32> zeroinitializer
  %121 = extractvalue [8 x <16 x float>] %60, 4
  %122 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %120, <16 x float> %62, <16 x float> %121)
  %123 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %61
  %124 = load float, ptr %123, align 64
  %125 = insertelement <16 x float> poison, float %124, i64 0
  %126 = shufflevector <16 x float> %125, <16 x float> poison, <16 x i32> zeroinitializer
  %127 = extractvalue [8 x <16 x float>] %60, 5
  %128 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %126, <16 x float> %62, <16 x float> %127)
  %129 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %61
  %130 = load float, ptr %129, align 64
  %131 = insertelement <16 x float> poison, float %130, i64 0
  %132 = shufflevector <16 x float> %131, <16 x float> poison, <16 x i32> zeroinitializer
  %133 = extractvalue [8 x <16 x float>] %60, 6
  %134 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %132, <16 x float> %62, <16 x float> %133)
  %135 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %61
  %136 = load float, ptr %135, align 64
  %137 = insertelement <16 x float> poison, float %136, i64 0
  %138 = shufflevector <16 x float> %137, <16 x float> poison, <16 x i32> zeroinitializer
  %139 = extractvalue [8 x <16 x float>] %60, 7
  %140 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %138, <16 x float> %62, <16 x float> %139)
  %141 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %63
  %142 = load float, ptr %141, align 4
  %143 = insertelement <16 x float> poison, float %142, i64 0
  %144 = shufflevector <16 x float> %143, <16 x float> poison, <16 x i32> zeroinitializer
  %145 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %144, <16 x float> %64, <16 x float> %98)
  %146 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %63
  %147 = load float, ptr %146, align 4
  %148 = insertelement <16 x float> poison, float %147, i64 0
  %149 = shufflevector <16 x float> %148, <16 x float> poison, <16 x i32> zeroinitializer
  %150 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %149, <16 x float> %64, <16 x float> %104)
  %151 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %63
  %152 = load float, ptr %151, align 4
  %153 = insertelement <16 x float> poison, float %152, i64 0
  %154 = shufflevector <16 x float> %153, <16 x float> poison, <16 x i32> zeroinitializer
  %155 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %154, <16 x float> %64, <16 x float> %110)
  %156 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %63
  %157 = load float, ptr %156, align 4
  %158 = insertelement <16 x float> poison, float %157, i64 0
  %159 = shufflevector <16 x float> %158, <16 x float> poison, <16 x i32> zeroinitializer
  %160 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %159, <16 x float> %64, <16 x float> %116)
  %161 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %63
  %162 = load float, ptr %161, align 4
  %163 = insertelement <16 x float> poison, float %162, i64 0
  %164 = shufflevector <16 x float> %163, <16 x float> poison, <16 x i32> zeroinitializer
  %165 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %164, <16 x float> %64, <16 x float> %122)
  %166 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %63
  %167 = load float, ptr %166, align 4
  %168 = insertelement <16 x float> poison, float %167, i64 0
  %169 = shufflevector <16 x float> %168, <16 x float> poison, <16 x i32> zeroinitializer
  %170 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %169, <16 x float> %64, <16 x float> %128)
  %171 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %63
  %172 = load float, ptr %171, align 4
  %173 = insertelement <16 x float> poison, float %172, i64 0
  %174 = shufflevector <16 x float> %173, <16 x float> poison, <16 x i32> zeroinitializer
  %175 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %174, <16 x float> %64, <16 x float> %134)
  %176 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %63
  %177 = load float, ptr %176, align 4
  %178 = insertelement <16 x float> poison, float %177, i64 0
  %179 = shufflevector <16 x float> %178, <16 x float> poison, <16 x i32> zeroinitializer
  %180 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %179, <16 x float> %64, <16 x float> %140)
  %181 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %65
  %182 = load float, ptr %181, align 8
  %183 = insertelement <16 x float> poison, float %182, i64 0
  %184 = shufflevector <16 x float> %183, <16 x float> poison, <16 x i32> zeroinitializer
  %185 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %184, <16 x float> %66, <16 x float> %145)
  %186 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %65
  %187 = load float, ptr %186, align 8
  %188 = insertelement <16 x float> poison, float %187, i64 0
  %189 = shufflevector <16 x float> %188, <16 x float> poison, <16 x i32> zeroinitializer
  %190 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %189, <16 x float> %66, <16 x float> %150)
  %191 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %65
  %192 = load float, ptr %191, align 8
  %193 = insertelement <16 x float> poison, float %192, i64 0
  %194 = shufflevector <16 x float> %193, <16 x float> poison, <16 x i32> zeroinitializer
  %195 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %194, <16 x float> %66, <16 x float> %155)
  %196 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %65
  %197 = load float, ptr %196, align 8
  %198 = insertelement <16 x float> poison, float %197, i64 0
  %199 = shufflevector <16 x float> %198, <16 x float> poison, <16 x i32> zeroinitializer
  %200 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %199, <16 x float> %66, <16 x float> %160)
  %201 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %65
  %202 = load float, ptr %201, align 8
  %203 = insertelement <16 x float> poison, float %202, i64 0
  %204 = shufflevector <16 x float> %203, <16 x float> poison, <16 x i32> zeroinitializer
  %205 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %204, <16 x float> %66, <16 x float> %165)
  %206 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %65
  %207 = load float, ptr %206, align 8
  %208 = insertelement <16 x float> poison, float %207, i64 0
  %209 = shufflevector <16 x float> %208, <16 x float> poison, <16 x i32> zeroinitializer
  %210 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %209, <16 x float> %66, <16 x float> %170)
  %211 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %65
  %212 = load float, ptr %211, align 8
  %213 = insertelement <16 x float> poison, float %212, i64 0
  %214 = shufflevector <16 x float> %213, <16 x float> poison, <16 x i32> zeroinitializer
  %215 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %214, <16 x float> %66, <16 x float> %175)
  %216 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %65
  %217 = load float, ptr %216, align 8
  %218 = insertelement <16 x float> poison, float %217, i64 0
  %219 = shufflevector <16 x float> %218, <16 x float> poison, <16 x i32> zeroinitializer
  %220 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %219, <16 x float> %66, <16 x float> %180)
  %221 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %67
  %222 = load float, ptr %221, align 4
  %223 = insertelement <16 x float> poison, float %222, i64 0
  %224 = shufflevector <16 x float> %223, <16 x float> poison, <16 x i32> zeroinitializer
  %225 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %224, <16 x float> %68, <16 x float> %185)
  %226 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %67
  %227 = load float, ptr %226, align 4
  %228 = insertelement <16 x float> poison, float %227, i64 0
  %229 = shufflevector <16 x float> %228, <16 x float> poison, <16 x i32> zeroinitializer
  %230 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %229, <16 x float> %68, <16 x float> %190)
  %231 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %67
  %232 = load float, ptr %231, align 4
  %233 = insertelement <16 x float> poison, float %232, i64 0
  %234 = shufflevector <16 x float> %233, <16 x float> poison, <16 x i32> zeroinitializer
  %235 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %234, <16 x float> %68, <16 x float> %195)
  %236 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %67
  %237 = load float, ptr %236, align 4
  %238 = insertelement <16 x float> poison, float %237, i64 0
  %239 = shufflevector <16 x float> %238, <16 x float> poison, <16 x i32> zeroinitializer
  %240 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %239, <16 x float> %68, <16 x float> %200)
  %241 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %67
  %242 = load float, ptr %241, align 4
  %243 = insertelement <16 x float> poison, float %242, i64 0
  %244 = shufflevector <16 x float> %243, <16 x float> poison, <16 x i32> zeroinitializer
  %245 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %244, <16 x float> %68, <16 x float> %205)
  %246 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %67
  %247 = load float, ptr %246, align 4
  %248 = insertelement <16 x float> poison, float %247, i64 0
  %249 = shufflevector <16 x float> %248, <16 x float> poison, <16 x i32> zeroinitializer
  %250 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %249, <16 x float> %68, <16 x float> %210)
  %251 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %67
  %252 = load float, ptr %251, align 4
  %253 = insertelement <16 x float> poison, float %252, i64 0
  %254 = shufflevector <16 x float> %253, <16 x float> poison, <16 x i32> zeroinitializer
  %255 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %254, <16 x float> %68, <16 x float> %215)
  %256 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %67
  %257 = load float, ptr %256, align 4
  %258 = insertelement <16 x float> poison, float %257, i64 0
  %259 = shufflevector <16 x float> %258, <16 x float> poison, <16 x i32> zeroinitializer
  %260 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %259, <16 x float> %68, <16 x float> %220)
  %261 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %69
  %262 = load float, ptr %261, align 16
  %263 = insertelement <16 x float> poison, float %262, i64 0
  %264 = shufflevector <16 x float> %263, <16 x float> poison, <16 x i32> zeroinitializer
  %265 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %264, <16 x float> %70, <16 x float> %225)
  %266 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %69
  %267 = load float, ptr %266, align 16
  %268 = insertelement <16 x float> poison, float %267, i64 0
  %269 = shufflevector <16 x float> %268, <16 x float> poison, <16 x i32> zeroinitializer
  %270 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %269, <16 x float> %70, <16 x float> %230)
  %271 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %69
  %272 = load float, ptr %271, align 16
  %273 = insertelement <16 x float> poison, float %272, i64 0
  %274 = shufflevector <16 x float> %273, <16 x float> poison, <16 x i32> zeroinitializer
  %275 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %274, <16 x float> %70, <16 x float> %235)
  %276 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %69
  %277 = load float, ptr %276, align 16
  %278 = insertelement <16 x float> poison, float %277, i64 0
  %279 = shufflevector <16 x float> %278, <16 x float> poison, <16 x i32> zeroinitializer
  %280 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %279, <16 x float> %70, <16 x float> %240)
  %281 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %69
  %282 = load float, ptr %281, align 16
  %283 = insertelement <16 x float> poison, float %282, i64 0
  %284 = shufflevector <16 x float> %283, <16 x float> poison, <16 x i32> zeroinitializer
  %285 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %284, <16 x float> %70, <16 x float> %245)
  %286 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %69
  %287 = load float, ptr %286, align 16
  %288 = insertelement <16 x float> poison, float %287, i64 0
  %289 = shufflevector <16 x float> %288, <16 x float> poison, <16 x i32> zeroinitializer
  %290 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %289, <16 x float> %70, <16 x float> %250)
  %291 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %69
  %292 = load float, ptr %291, align 16
  %293 = insertelement <16 x float> poison, float %292, i64 0
  %294 = shufflevector <16 x float> %293, <16 x float> poison, <16 x i32> zeroinitializer
  %295 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %294, <16 x float> %70, <16 x float> %255)
  %296 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %69
  %297 = load float, ptr %296, align 16
  %298 = insertelement <16 x float> poison, float %297, i64 0
  %299 = shufflevector <16 x float> %298, <16 x float> poison, <16 x i32> zeroinitializer
  %300 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %299, <16 x float> %70, <16 x float> %260)
  %301 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %71
  %302 = load float, ptr %301, align 4
  %303 = insertelement <16 x float> poison, float %302, i64 0
  %304 = shufflevector <16 x float> %303, <16 x float> poison, <16 x i32> zeroinitializer
  %305 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %304, <16 x float> %72, <16 x float> %265)
  %306 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %71
  %307 = load float, ptr %306, align 4
  %308 = insertelement <16 x float> poison, float %307, i64 0
  %309 = shufflevector <16 x float> %308, <16 x float> poison, <16 x i32> zeroinitializer
  %310 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %309, <16 x float> %72, <16 x float> %270)
  %311 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %71
  %312 = load float, ptr %311, align 4
  %313 = insertelement <16 x float> poison, float %312, i64 0
  %314 = shufflevector <16 x float> %313, <16 x float> poison, <16 x i32> zeroinitializer
  %315 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %314, <16 x float> %72, <16 x float> %275)
  %316 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %71
  %317 = load float, ptr %316, align 4
  %318 = insertelement <16 x float> poison, float %317, i64 0
  %319 = shufflevector <16 x float> %318, <16 x float> poison, <16 x i32> zeroinitializer
  %320 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %319, <16 x float> %72, <16 x float> %280)
  %321 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %71
  %322 = load float, ptr %321, align 4
  %323 = insertelement <16 x float> poison, float %322, i64 0
  %324 = shufflevector <16 x float> %323, <16 x float> poison, <16 x i32> zeroinitializer
  %325 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %324, <16 x float> %72, <16 x float> %285)
  %326 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %71
  %327 = load float, ptr %326, align 4
  %328 = insertelement <16 x float> poison, float %327, i64 0
  %329 = shufflevector <16 x float> %328, <16 x float> poison, <16 x i32> zeroinitializer
  %330 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %329, <16 x float> %72, <16 x float> %290)
  %331 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %71
  %332 = load float, ptr %331, align 4
  %333 = insertelement <16 x float> poison, float %332, i64 0
  %334 = shufflevector <16 x float> %333, <16 x float> poison, <16 x i32> zeroinitializer
  %335 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %334, <16 x float> %72, <16 x float> %295)
  %336 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %71
  %337 = load float, ptr %336, align 4
  %338 = insertelement <16 x float> poison, float %337, i64 0
  %339 = shufflevector <16 x float> %338, <16 x float> poison, <16 x i32> zeroinitializer
  %340 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %339, <16 x float> %72, <16 x float> %300)
  %341 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %73
  %342 = load float, ptr %341, align 8
  %343 = insertelement <16 x float> poison, float %342, i64 0
  %344 = shufflevector <16 x float> %343, <16 x float> poison, <16 x i32> zeroinitializer
  %345 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %344, <16 x float> %74, <16 x float> %305)
  %346 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %73
  %347 = load float, ptr %346, align 8
  %348 = insertelement <16 x float> poison, float %347, i64 0
  %349 = shufflevector <16 x float> %348, <16 x float> poison, <16 x i32> zeroinitializer
  %350 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %349, <16 x float> %74, <16 x float> %310)
  %351 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %73
  %352 = load float, ptr %351, align 8
  %353 = insertelement <16 x float> poison, float %352, i64 0
  %354 = shufflevector <16 x float> %353, <16 x float> poison, <16 x i32> zeroinitializer
  %355 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %354, <16 x float> %74, <16 x float> %315)
  %356 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %73
  %357 = load float, ptr %356, align 8
  %358 = insertelement <16 x float> poison, float %357, i64 0
  %359 = shufflevector <16 x float> %358, <16 x float> poison, <16 x i32> zeroinitializer
  %360 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %359, <16 x float> %74, <16 x float> %320)
  %361 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %73
  %362 = load float, ptr %361, align 8
  %363 = insertelement <16 x float> poison, float %362, i64 0
  %364 = shufflevector <16 x float> %363, <16 x float> poison, <16 x i32> zeroinitializer
  %365 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %364, <16 x float> %74, <16 x float> %325)
  %366 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %73
  %367 = load float, ptr %366, align 8
  %368 = insertelement <16 x float> poison, float %367, i64 0
  %369 = shufflevector <16 x float> %368, <16 x float> poison, <16 x i32> zeroinitializer
  %370 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %369, <16 x float> %74, <16 x float> %330)
  %371 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %73
  %372 = load float, ptr %371, align 8
  %373 = insertelement <16 x float> poison, float %372, i64 0
  %374 = shufflevector <16 x float> %373, <16 x float> poison, <16 x i32> zeroinitializer
  %375 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %374, <16 x float> %74, <16 x float> %335)
  %376 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %73
  %377 = load float, ptr %376, align 8
  %378 = insertelement <16 x float> poison, float %377, i64 0
  %379 = shufflevector <16 x float> %378, <16 x float> poison, <16 x i32> zeroinitializer
  %380 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %379, <16 x float> %74, <16 x float> %340)
  %381 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %75
  %382 = load float, ptr %381, align 4
  %383 = insertelement <16 x float> poison, float %382, i64 0
  %384 = shufflevector <16 x float> %383, <16 x float> poison, <16 x i32> zeroinitializer
  %385 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %384, <16 x float> %76, <16 x float> %345)
  %386 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %75
  %387 = load float, ptr %386, align 4
  %388 = insertelement <16 x float> poison, float %387, i64 0
  %389 = shufflevector <16 x float> %388, <16 x float> poison, <16 x i32> zeroinitializer
  %390 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %389, <16 x float> %76, <16 x float> %350)
  %391 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %75
  %392 = load float, ptr %391, align 4
  %393 = insertelement <16 x float> poison, float %392, i64 0
  %394 = shufflevector <16 x float> %393, <16 x float> poison, <16 x i32> zeroinitializer
  %395 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %394, <16 x float> %76, <16 x float> %355)
  %396 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %75
  %397 = load float, ptr %396, align 4
  %398 = insertelement <16 x float> poison, float %397, i64 0
  %399 = shufflevector <16 x float> %398, <16 x float> poison, <16 x i32> zeroinitializer
  %400 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %399, <16 x float> %76, <16 x float> %360)
  %401 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %75
  %402 = load float, ptr %401, align 4
  %403 = insertelement <16 x float> poison, float %402, i64 0
  %404 = shufflevector <16 x float> %403, <16 x float> poison, <16 x i32> zeroinitializer
  %405 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %404, <16 x float> %76, <16 x float> %365)
  %406 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %75
  %407 = load float, ptr %406, align 4
  %408 = insertelement <16 x float> poison, float %407, i64 0
  %409 = shufflevector <16 x float> %408, <16 x float> poison, <16 x i32> zeroinitializer
  %410 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %409, <16 x float> %76, <16 x float> %370)
  %411 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %75
  %412 = load float, ptr %411, align 4
  %413 = insertelement <16 x float> poison, float %412, i64 0
  %414 = shufflevector <16 x float> %413, <16 x float> poison, <16 x i32> zeroinitializer
  %415 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %414, <16 x float> %76, <16 x float> %375)
  %416 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %75
  %417 = load float, ptr %416, align 4
  %418 = insertelement <16 x float> poison, float %417, i64 0
  %419 = shufflevector <16 x float> %418, <16 x float> poison, <16 x i32> zeroinitializer
  %420 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %419, <16 x float> %76, <16 x float> %380)
  %421 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %77
  %422 = load float, ptr %421, align 32
  %423 = insertelement <16 x float> poison, float %422, i64 0
  %424 = shufflevector <16 x float> %423, <16 x float> poison, <16 x i32> zeroinitializer
  %425 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %424, <16 x float> %78, <16 x float> %385)
  %426 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %77
  %427 = load float, ptr %426, align 32
  %428 = insertelement <16 x float> poison, float %427, i64 0
  %429 = shufflevector <16 x float> %428, <16 x float> poison, <16 x i32> zeroinitializer
  %430 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %429, <16 x float> %78, <16 x float> %390)
  %431 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %77
  %432 = load float, ptr %431, align 32
  %433 = insertelement <16 x float> poison, float %432, i64 0
  %434 = shufflevector <16 x float> %433, <16 x float> poison, <16 x i32> zeroinitializer
  %435 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %434, <16 x float> %78, <16 x float> %395)
  %436 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %77
  %437 = load float, ptr %436, align 32
  %438 = insertelement <16 x float> poison, float %437, i64 0
  %439 = shufflevector <16 x float> %438, <16 x float> poison, <16 x i32> zeroinitializer
  %440 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %439, <16 x float> %78, <16 x float> %400)
  %441 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %77
  %442 = load float, ptr %441, align 32
  %443 = insertelement <16 x float> poison, float %442, i64 0
  %444 = shufflevector <16 x float> %443, <16 x float> poison, <16 x i32> zeroinitializer
  %445 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %444, <16 x float> %78, <16 x float> %405)
  %446 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %77
  %447 = load float, ptr %446, align 32
  %448 = insertelement <16 x float> poison, float %447, i64 0
  %449 = shufflevector <16 x float> %448, <16 x float> poison, <16 x i32> zeroinitializer
  %450 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %449, <16 x float> %78, <16 x float> %410)
  %451 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %77
  %452 = load float, ptr %451, align 32
  %453 = insertelement <16 x float> poison, float %452, i64 0
  %454 = shufflevector <16 x float> %453, <16 x float> poison, <16 x i32> zeroinitializer
  %455 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %454, <16 x float> %78, <16 x float> %415)
  %456 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %77
  %457 = load float, ptr %456, align 32
  %458 = insertelement <16 x float> poison, float %457, i64 0
  %459 = shufflevector <16 x float> %458, <16 x float> poison, <16 x i32> zeroinitializer
  %460 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %459, <16 x float> %78, <16 x float> %420)
  %461 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %79
  %462 = load float, ptr %461, align 4
  %463 = insertelement <16 x float> poison, float %462, i64 0
  %464 = shufflevector <16 x float> %463, <16 x float> poison, <16 x i32> zeroinitializer
  %465 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %464, <16 x float> %80, <16 x float> %425)
  %466 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %79
  %467 = load float, ptr %466, align 4
  %468 = insertelement <16 x float> poison, float %467, i64 0
  %469 = shufflevector <16 x float> %468, <16 x float> poison, <16 x i32> zeroinitializer
  %470 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %469, <16 x float> %80, <16 x float> %430)
  %471 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %79
  %472 = load float, ptr %471, align 4
  %473 = insertelement <16 x float> poison, float %472, i64 0
  %474 = shufflevector <16 x float> %473, <16 x float> poison, <16 x i32> zeroinitializer
  %475 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %474, <16 x float> %80, <16 x float> %435)
  %476 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %79
  %477 = load float, ptr %476, align 4
  %478 = insertelement <16 x float> poison, float %477, i64 0
  %479 = shufflevector <16 x float> %478, <16 x float> poison, <16 x i32> zeroinitializer
  %480 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %479, <16 x float> %80, <16 x float> %440)
  %481 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %79
  %482 = load float, ptr %481, align 4
  %483 = insertelement <16 x float> poison, float %482, i64 0
  %484 = shufflevector <16 x float> %483, <16 x float> poison, <16 x i32> zeroinitializer
  %485 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %484, <16 x float> %80, <16 x float> %445)
  %486 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %79
  %487 = load float, ptr %486, align 4
  %488 = insertelement <16 x float> poison, float %487, i64 0
  %489 = shufflevector <16 x float> %488, <16 x float> poison, <16 x i32> zeroinitializer
  %490 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %489, <16 x float> %80, <16 x float> %450)
  %491 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %79
  %492 = load float, ptr %491, align 4
  %493 = insertelement <16 x float> poison, float %492, i64 0
  %494 = shufflevector <16 x float> %493, <16 x float> poison, <16 x i32> zeroinitializer
  %495 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %494, <16 x float> %80, <16 x float> %455)
  %496 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %79
  %497 = load float, ptr %496, align 4
  %498 = insertelement <16 x float> poison, float %497, i64 0
  %499 = shufflevector <16 x float> %498, <16 x float> poison, <16 x i32> zeroinitializer
  %500 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %499, <16 x float> %80, <16 x float> %460)
  %501 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %81
  %502 = load float, ptr %501, align 8
  %503 = insertelement <16 x float> poison, float %502, i64 0
  %504 = shufflevector <16 x float> %503, <16 x float> poison, <16 x i32> zeroinitializer
  %505 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %504, <16 x float> %82, <16 x float> %465)
  %506 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %81
  %507 = load float, ptr %506, align 8
  %508 = insertelement <16 x float> poison, float %507, i64 0
  %509 = shufflevector <16 x float> %508, <16 x float> poison, <16 x i32> zeroinitializer
  %510 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %509, <16 x float> %82, <16 x float> %470)
  %511 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %81
  %512 = load float, ptr %511, align 8
  %513 = insertelement <16 x float> poison, float %512, i64 0
  %514 = shufflevector <16 x float> %513, <16 x float> poison, <16 x i32> zeroinitializer
  %515 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %514, <16 x float> %82, <16 x float> %475)
  %516 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %81
  %517 = load float, ptr %516, align 8
  %518 = insertelement <16 x float> poison, float %517, i64 0
  %519 = shufflevector <16 x float> %518, <16 x float> poison, <16 x i32> zeroinitializer
  %520 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %519, <16 x float> %82, <16 x float> %480)
  %521 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %81
  %522 = load float, ptr %521, align 8
  %523 = insertelement <16 x float> poison, float %522, i64 0
  %524 = shufflevector <16 x float> %523, <16 x float> poison, <16 x i32> zeroinitializer
  %525 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %524, <16 x float> %82, <16 x float> %485)
  %526 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %81
  %527 = load float, ptr %526, align 8
  %528 = insertelement <16 x float> poison, float %527, i64 0
  %529 = shufflevector <16 x float> %528, <16 x float> poison, <16 x i32> zeroinitializer
  %530 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %529, <16 x float> %82, <16 x float> %490)
  %531 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %81
  %532 = load float, ptr %531, align 8
  %533 = insertelement <16 x float> poison, float %532, i64 0
  %534 = shufflevector <16 x float> %533, <16 x float> poison, <16 x i32> zeroinitializer
  %535 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %534, <16 x float> %82, <16 x float> %495)
  %536 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %81
  %537 = load float, ptr %536, align 8
  %538 = insertelement <16 x float> poison, float %537, i64 0
  %539 = shufflevector <16 x float> %538, <16 x float> poison, <16 x i32> zeroinitializer
  %540 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %539, <16 x float> %82, <16 x float> %500)
  %541 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %83
  %542 = load float, ptr %541, align 4
  %543 = insertelement <16 x float> poison, float %542, i64 0
  %544 = shufflevector <16 x float> %543, <16 x float> poison, <16 x i32> zeroinitializer
  %545 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %544, <16 x float> %84, <16 x float> %505)
  %546 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %83
  %547 = load float, ptr %546, align 4
  %548 = insertelement <16 x float> poison, float %547, i64 0
  %549 = shufflevector <16 x float> %548, <16 x float> poison, <16 x i32> zeroinitializer
  %550 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %549, <16 x float> %84, <16 x float> %510)
  %551 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %83
  %552 = load float, ptr %551, align 4
  %553 = insertelement <16 x float> poison, float %552, i64 0
  %554 = shufflevector <16 x float> %553, <16 x float> poison, <16 x i32> zeroinitializer
  %555 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %554, <16 x float> %84, <16 x float> %515)
  %556 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %83
  %557 = load float, ptr %556, align 4
  %558 = insertelement <16 x float> poison, float %557, i64 0
  %559 = shufflevector <16 x float> %558, <16 x float> poison, <16 x i32> zeroinitializer
  %560 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %559, <16 x float> %84, <16 x float> %520)
  %561 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %83
  %562 = load float, ptr %561, align 4
  %563 = insertelement <16 x float> poison, float %562, i64 0
  %564 = shufflevector <16 x float> %563, <16 x float> poison, <16 x i32> zeroinitializer
  %565 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %564, <16 x float> %84, <16 x float> %525)
  %566 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %83
  %567 = load float, ptr %566, align 4
  %568 = insertelement <16 x float> poison, float %567, i64 0
  %569 = shufflevector <16 x float> %568, <16 x float> poison, <16 x i32> zeroinitializer
  %570 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %569, <16 x float> %84, <16 x float> %530)
  %571 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %83
  %572 = load float, ptr %571, align 4
  %573 = insertelement <16 x float> poison, float %572, i64 0
  %574 = shufflevector <16 x float> %573, <16 x float> poison, <16 x i32> zeroinitializer
  %575 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %574, <16 x float> %84, <16 x float> %535)
  %576 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %83
  %577 = load float, ptr %576, align 4
  %578 = insertelement <16 x float> poison, float %577, i64 0
  %579 = shufflevector <16 x float> %578, <16 x float> poison, <16 x i32> zeroinitializer
  %580 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %579, <16 x float> %84, <16 x float> %540)
  %581 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %85
  %582 = load float, ptr %581, align 16
  %583 = insertelement <16 x float> poison, float %582, i64 0
  %584 = shufflevector <16 x float> %583, <16 x float> poison, <16 x i32> zeroinitializer
  %585 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %584, <16 x float> %86, <16 x float> %545)
  %586 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %85
  %587 = load float, ptr %586, align 16
  %588 = insertelement <16 x float> poison, float %587, i64 0
  %589 = shufflevector <16 x float> %588, <16 x float> poison, <16 x i32> zeroinitializer
  %590 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %589, <16 x float> %86, <16 x float> %550)
  %591 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %85
  %592 = load float, ptr %591, align 16
  %593 = insertelement <16 x float> poison, float %592, i64 0
  %594 = shufflevector <16 x float> %593, <16 x float> poison, <16 x i32> zeroinitializer
  %595 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %594, <16 x float> %86, <16 x float> %555)
  %596 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %85
  %597 = load float, ptr %596, align 16
  %598 = insertelement <16 x float> poison, float %597, i64 0
  %599 = shufflevector <16 x float> %598, <16 x float> poison, <16 x i32> zeroinitializer
  %600 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %599, <16 x float> %86, <16 x float> %560)
  %601 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %85
  %602 = load float, ptr %601, align 16
  %603 = insertelement <16 x float> poison, float %602, i64 0
  %604 = shufflevector <16 x float> %603, <16 x float> poison, <16 x i32> zeroinitializer
  %605 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %604, <16 x float> %86, <16 x float> %565)
  %606 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %85
  %607 = load float, ptr %606, align 16
  %608 = insertelement <16 x float> poison, float %607, i64 0
  %609 = shufflevector <16 x float> %608, <16 x float> poison, <16 x i32> zeroinitializer
  %610 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %609, <16 x float> %86, <16 x float> %570)
  %611 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %85
  %612 = load float, ptr %611, align 16
  %613 = insertelement <16 x float> poison, float %612, i64 0
  %614 = shufflevector <16 x float> %613, <16 x float> poison, <16 x i32> zeroinitializer
  %615 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %614, <16 x float> %86, <16 x float> %575)
  %616 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %85
  %617 = load float, ptr %616, align 16
  %618 = insertelement <16 x float> poison, float %617, i64 0
  %619 = shufflevector <16 x float> %618, <16 x float> poison, <16 x i32> zeroinitializer
  %620 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %619, <16 x float> %86, <16 x float> %580)
  %621 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %87
  %622 = load float, ptr %621, align 4
  %623 = insertelement <16 x float> poison, float %622, i64 0
  %624 = shufflevector <16 x float> %623, <16 x float> poison, <16 x i32> zeroinitializer
  %625 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %624, <16 x float> %88, <16 x float> %585)
  %626 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %87
  %627 = load float, ptr %626, align 4
  %628 = insertelement <16 x float> poison, float %627, i64 0
  %629 = shufflevector <16 x float> %628, <16 x float> poison, <16 x i32> zeroinitializer
  %630 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %629, <16 x float> %88, <16 x float> %590)
  %631 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %87
  %632 = load float, ptr %631, align 4
  %633 = insertelement <16 x float> poison, float %632, i64 0
  %634 = shufflevector <16 x float> %633, <16 x float> poison, <16 x i32> zeroinitializer
  %635 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %634, <16 x float> %88, <16 x float> %595)
  %636 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %87
  %637 = load float, ptr %636, align 4
  %638 = insertelement <16 x float> poison, float %637, i64 0
  %639 = shufflevector <16 x float> %638, <16 x float> poison, <16 x i32> zeroinitializer
  %640 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %639, <16 x float> %88, <16 x float> %600)
  %641 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %87
  %642 = load float, ptr %641, align 4
  %643 = insertelement <16 x float> poison, float %642, i64 0
  %644 = shufflevector <16 x float> %643, <16 x float> poison, <16 x i32> zeroinitializer
  %645 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %644, <16 x float> %88, <16 x float> %605)
  %646 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %87
  %647 = load float, ptr %646, align 4
  %648 = insertelement <16 x float> poison, float %647, i64 0
  %649 = shufflevector <16 x float> %648, <16 x float> poison, <16 x i32> zeroinitializer
  %650 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %649, <16 x float> %88, <16 x float> %610)
  %651 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %87
  %652 = load float, ptr %651, align 4
  %653 = insertelement <16 x float> poison, float %652, i64 0
  %654 = shufflevector <16 x float> %653, <16 x float> poison, <16 x i32> zeroinitializer
  %655 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %654, <16 x float> %88, <16 x float> %615)
  %656 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %87
  %657 = load float, ptr %656, align 4
  %658 = insertelement <16 x float> poison, float %657, i64 0
  %659 = shufflevector <16 x float> %658, <16 x float> poison, <16 x i32> zeroinitializer
  %660 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %659, <16 x float> %88, <16 x float> %620)
  %661 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %89
  %662 = load float, ptr %661, align 8
  %663 = insertelement <16 x float> poison, float %662, i64 0
  %664 = shufflevector <16 x float> %663, <16 x float> poison, <16 x i32> zeroinitializer
  %665 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %664, <16 x float> %90, <16 x float> %625)
  %666 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %89
  %667 = load float, ptr %666, align 8
  %668 = insertelement <16 x float> poison, float %667, i64 0
  %669 = shufflevector <16 x float> %668, <16 x float> poison, <16 x i32> zeroinitializer
  %670 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %669, <16 x float> %90, <16 x float> %630)
  %671 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %89
  %672 = load float, ptr %671, align 8
  %673 = insertelement <16 x float> poison, float %672, i64 0
  %674 = shufflevector <16 x float> %673, <16 x float> poison, <16 x i32> zeroinitializer
  %675 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %674, <16 x float> %90, <16 x float> %635)
  %676 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %89
  %677 = load float, ptr %676, align 8
  %678 = insertelement <16 x float> poison, float %677, i64 0
  %679 = shufflevector <16 x float> %678, <16 x float> poison, <16 x i32> zeroinitializer
  %680 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %679, <16 x float> %90, <16 x float> %640)
  %681 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %89
  %682 = load float, ptr %681, align 8
  %683 = insertelement <16 x float> poison, float %682, i64 0
  %684 = shufflevector <16 x float> %683, <16 x float> poison, <16 x i32> zeroinitializer
  %685 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %684, <16 x float> %90, <16 x float> %645)
  %686 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %89
  %687 = load float, ptr %686, align 8
  %688 = insertelement <16 x float> poison, float %687, i64 0
  %689 = shufflevector <16 x float> %688, <16 x float> poison, <16 x i32> zeroinitializer
  %690 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %689, <16 x float> %90, <16 x float> %650)
  %691 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %89
  %692 = load float, ptr %691, align 8
  %693 = insertelement <16 x float> poison, float %692, i64 0
  %694 = shufflevector <16 x float> %693, <16 x float> poison, <16 x i32> zeroinitializer
  %695 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %694, <16 x float> %90, <16 x float> %655)
  %696 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %89
  %697 = load float, ptr %696, align 8
  %698 = insertelement <16 x float> poison, float %697, i64 0
  %699 = shufflevector <16 x float> %698, <16 x float> poison, <16 x i32> zeroinitializer
  %700 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %699, <16 x float> %90, <16 x float> %660)
  %701 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %91
  %702 = load float, ptr %701, align 4
  %703 = insertelement <16 x float> poison, float %702, i64 0
  %704 = shufflevector <16 x float> %703, <16 x float> poison, <16 x i32> zeroinitializer
  %705 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %704, <16 x float> %92, <16 x float> %665)
  %706 = getelementptr inbounds nuw [4 x i8], ptr %20, i64 %91
  %707 = load float, ptr %706, align 4
  %708 = insertelement <16 x float> poison, float %707, i64 0
  %709 = shufflevector <16 x float> %708, <16 x float> poison, <16 x i32> zeroinitializer
  %710 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %709, <16 x float> %92, <16 x float> %670)
  %711 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %91
  %712 = load float, ptr %711, align 4
  %713 = insertelement <16 x float> poison, float %712, i64 0
  %714 = shufflevector <16 x float> %713, <16 x float> poison, <16 x i32> zeroinitializer
  %715 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %714, <16 x float> %92, <16 x float> %675)
  %716 = getelementptr inbounds nuw [4 x i8], ptr %22, i64 %91
  %717 = load float, ptr %716, align 4
  %718 = insertelement <16 x float> poison, float %717, i64 0
  %719 = shufflevector <16 x float> %718, <16 x float> poison, <16 x i32> zeroinitializer
  %720 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %719, <16 x float> %92, <16 x float> %680)
  %721 = getelementptr inbounds nuw [4 x i8], ptr %23, i64 %91
  %722 = load float, ptr %721, align 4
  %723 = insertelement <16 x float> poison, float %722, i64 0
  %724 = shufflevector <16 x float> %723, <16 x float> poison, <16 x i32> zeroinitializer
  %725 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %724, <16 x float> %92, <16 x float> %685)
  %726 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %91
  %727 = load float, ptr %726, align 4
  %728 = insertelement <16 x float> poison, float %727, i64 0
  %729 = shufflevector <16 x float> %728, <16 x float> poison, <16 x i32> zeroinitializer
  %730 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %729, <16 x float> %92, <16 x float> %690)
  %731 = getelementptr inbounds nuw [4 x i8], ptr %25, i64 %91
  %732 = load float, ptr %731, align 4
  %733 = insertelement <16 x float> poison, float %732, i64 0
  %734 = shufflevector <16 x float> %733, <16 x float> poison, <16 x i32> zeroinitializer
  %735 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %734, <16 x float> %92, <16 x float> %695)
  %736 = getelementptr inbounds nuw [4 x i8], ptr %26, i64 %91
  %737 = load float, ptr %736, align 4
  %738 = insertelement <16 x float> poison, float %737, i64 0
  %739 = shufflevector <16 x float> %738, <16 x float> poison, <16 x i32> zeroinitializer
  %740 = tail call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %739, <16 x float> %92, <16 x float> %700)
  %741 = insertvalue [8 x <16 x float>] poison, <16 x float> %705, 0
  %742 = insertvalue [8 x <16 x float>] %741, <16 x float> %710, 1
  %743 = insertvalue [8 x <16 x float>] %742, <16 x float> %715, 2
  %744 = insertvalue [8 x <16 x float>] %743, <16 x float> %720, 3
  %745 = insertvalue [8 x <16 x float>] %744, <16 x float> %725, 4
  %746 = insertvalue [8 x <16 x float>] %745, <16 x float> %730, 5
  %747 = insertvalue [8 x <16 x float>] %746, <16 x float> %735, 6
  %748 = insertvalue [8 x <16 x float>] %747, <16 x float> %740, 7
  %749 = add nuw nsw i64 %61, 16, !dbg !89
  %750 = icmp samesign ult i64 %61, 112, !dbg !89
  br i1 %750, label %59, label %751, !dbg !89

751:                                              ; preds = %59
  %752 = getelementptr [4 x i8], ptr %6, i64 %58, !dbg !90
  %753 = load <16 x float>, ptr %752, align 64, !dbg !90
  %754 = fadd contract <16 x float> %705, %753, !dbg !91
  %755 = fadd contract <16 x float> %710, %753, !dbg !91
  %756 = fadd contract <16 x float> %715, %753, !dbg !91
  %757 = fadd contract <16 x float> %720, %753, !dbg !91
  %758 = fadd contract <16 x float> %725, %753, !dbg !91
  %759 = fadd contract <16 x float> %730, %753, !dbg !91
  %760 = fadd contract <16 x float> %735, %753, !dbg !91
  %761 = fadd contract <16 x float> %740, %753, !dbg !91
  %.inv = fcmp ole <16 x float> %754, zeroinitializer, !dbg !92
  %762 = select <16 x i1> %.inv, <16 x float> zeroinitializer, <16 x float> %754, !dbg !92
  %.inv24 = fcmp ole <16 x float> %755, zeroinitializer, !dbg !92
  %763 = select <16 x i1> %.inv24, <16 x float> zeroinitializer, <16 x float> %755, !dbg !92
  %.inv25 = fcmp ole <16 x float> %756, zeroinitializer, !dbg !92
  %764 = select <16 x i1> %.inv25, <16 x float> zeroinitializer, <16 x float> %756, !dbg !92
  %.inv26 = fcmp ole <16 x float> %757, zeroinitializer, !dbg !92
  %765 = select <16 x i1> %.inv26, <16 x float> zeroinitializer, <16 x float> %757, !dbg !92
  %.inv27 = fcmp ole <16 x float> %758, zeroinitializer, !dbg !92
  %766 = select <16 x i1> %.inv27, <16 x float> zeroinitializer, <16 x float> %758, !dbg !92
  %.inv28 = fcmp ole <16 x float> %759, zeroinitializer, !dbg !92
  %767 = select <16 x i1> %.inv28, <16 x float> zeroinitializer, <16 x float> %759, !dbg !92
  %.inv29 = fcmp ole <16 x float> %760, zeroinitializer, !dbg !92
  %768 = select <16 x i1> %.inv29, <16 x float> zeroinitializer, <16 x float> %760, !dbg !92
  %.inv30 = fcmp ole <16 x float> %761, zeroinitializer, !dbg !92
  %769 = select <16 x i1> %.inv30, <16 x float> zeroinitializer, <16 x float> %761, !dbg !92
  %770 = getelementptr [4 x i8], ptr %27, i64 %58, !dbg !89
  store <16 x float> %762, ptr %770, align 64, !dbg !89
  %771 = getelementptr [4 x i8], ptr %31, i64 %58, !dbg !89
  store <16 x float> %763, ptr %771, align 64, !dbg !89
  %772 = getelementptr [4 x i8], ptr %35, i64 %58, !dbg !89
  store <16 x float> %764, ptr %772, align 64, !dbg !89
  %773 = getelementptr [4 x i8], ptr %39, i64 %58, !dbg !89
  store <16 x float> %765, ptr %773, align 64, !dbg !89
  %774 = getelementptr [4 x i8], ptr %43, i64 %58, !dbg !89
  store <16 x float> %766, ptr %774, align 64, !dbg !89
  %775 = getelementptr [4 x i8], ptr %47, i64 %58, !dbg !89
  store <16 x float> %767, ptr %775, align 64, !dbg !89
  %776 = getelementptr [4 x i8], ptr %51, i64 %58, !dbg !89
  store <16 x float> %768, ptr %776, align 64, !dbg !89
  %777 = getelementptr [4 x i8], ptr %55, i64 %58, !dbg !89
  store <16 x float> %769, ptr %777, align 64, !dbg !89
  %778 = add nuw nsw i64 %57, 16, !dbg !89
  %779 = icmp samesign ult i64 %57, 48, !dbg !89
  br i1 %779, label %56, label %780, !dbg !89

780:                                              ; preds = %751
  br i1 %16, label %.preheader, label %781, !dbg !89

781:                                              ; preds = %780
  ret i32 0, !dbg !93
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
  store i16 %36, ptr %2, align 4, !tbaa !94
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !96
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
  store i16 %37, ptr %2, align 4, !tbaa !94
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !96
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
  store volatile float %3, ptr %2, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !96
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
  store volatile float %5, ptr %3, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !96
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
  store volatile float %3, ptr %2, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !96
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
  store volatile float %16, ptr %3, align 4, !tbaa !96
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
  store volatile float %24, ptr %2, align 4, !tbaa !96
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
  br i1 %.not, label %21, label %8, !prof !98

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
  store volatile float 0x4600000000000000, ptr %3, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !96
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, 0x4600000000000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float 0x3A00000000000000, ptr %2, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !96
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
  %29 = load i64, ptr %28, align 8, !tbaa !99
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
  store volatile float %16, ptr %3, align 4, !tbaa !96
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
  store volatile float %23, ptr %2, align 4, !tbaa !96
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
  br i1 %or.cond99, label %.critedge, label %76, !prof !101

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !98

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
  br i1 %33, label %49, label %34, !prof !98

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
  store volatile float %48, ptr %5, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !96
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
  %85 = load double, ptr %84, align 8, !tbaa !102
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !105
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
  br i1 %104, label %105, label %115, !prof !106

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, 0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !96
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
  store volatile float %113, ptr %3, align 4, !tbaa !96
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !96
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
  %122 = load i64, ptr %121, align 8, !tbaa !99
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
  store volatile float %9, ptr %2, align 4, !tbaa !96
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
!85 = !DILocation(line: 12, column: 8, scope: !9)
!86 = !DILocation(line: 13, column: 8, scope: !9)
!87 = !DILocation(line: 14, column: 8, scope: !9)
!88 = !DILocation(line: 15, column: 8, scope: !9)
!89 = !DILocation(line: 21, column: 8, scope: !9)
!90 = !DILocation(line: 22, column: 8, scope: !9)
!91 = !DILocation(line: 24, column: 10, scope: !9)
!92 = !DILocation(line: 26, column: 10, scope: !9)
!93 = !DILocation(line: 30, column: 8, scope: !9)
!94 = !{!95, !95, i64 0}
!95 = !{!"short", !7, i64 0}
!96 = !{!97, !97, i64 0}
!97 = !{!"float", !7, i64 0}
!98 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!99 = !{!100, !100, i64 0}
!100 = !{!"long", !7, i64 0}
!101 = !{!"branch_weights", i32 4001, i32 4000000}
!102 = !{!103, !104, i64 0}
!103 = !{!"", !104, i64 0, !104, i64 8}
!104 = !{!"double", !7, i64 0}
!105 = !{!103, !104, i64 8}
!106 = !{!"branch_weights", !"expected", i32 1, i32 2000}
