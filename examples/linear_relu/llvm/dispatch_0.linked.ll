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
%iree_hal_executable_dispatch_state_v0_t = type { i32, i32, i16, i16, i32, i32, i16, i8, i8, ptr, ptr, ptr }
%iree_hal_executable_workgroup_state_v0_t = type { i32, i32, i16, i16, i32, ptr, i32 }

@0 = private constant [22 x i8] c"main$async_dispatch_0\00", align 1
@iree_hal_executable_library_query_v0_header = private constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = private constant [1 x ptr] [ptr @"main$async_dispatch_0_matmul_128x128x128_f32"]
@iree_hal_executable_library_query_v0_attrs = private constant [1 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = private constant [45 x i8] c"main$async_dispatch_0_matmul_128x128x128_f32\00", align 1
@iree_hal_executable_library_query_v0_names = private constant [1 x ptr] [ptr @1]
@2 = private constant [40 x i8] c"dumps/module_main$async_dispatch_0.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = private constant [1 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 3, i32 39, ptr @2 }]
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = private constant [1 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_matmul_128x128x128_f32_stage_source_locations" }]
@iree_hal_executable_library_query_v0 = private constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 1, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = hidden local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = hidden local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

define internal i32 @"main$async_dispatch_0_matmul_128x128x128_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !9 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !85
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !85
  %6 = load ptr, ptr %5, align 8, !dbg !85
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !85
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !86
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !86
  %9 = getelementptr ptr, ptr %8, i32 1, !dbg !86
  %10 = load ptr, ptr %9, align 8, !dbg !86
  %11 = getelementptr float, ptr %10, i64 128, !dbg !86
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !86
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !87
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !87
  %14 = getelementptr ptr, ptr %13, i32 1, !dbg !87
  %15 = load ptr, ptr %14, align 8, !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !87
  %16 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !88
  %17 = extractvalue %iree_hal_executable_dispatch_state_v0_t %16, 10, !dbg !88
  %18 = getelementptr ptr, ptr %17, i32 2, !dbg !88
  %19 = load ptr, ptr %18, align 8, !dbg !88
  call void @llvm.assume(i1 true) [ "align"(ptr %19, i64 64) ], !dbg !88
  %20 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !89
  %21 = extractvalue %iree_hal_executable_workgroup_state_v0_t %20, 0, !dbg !89
  %22 = zext i32 %21 to i64, !dbg !89
  %23 = sdiv i64 %22, 2, !dbg !89
  %24 = mul i64 %23, 2, !dbg !89
  %25 = icmp ne i64 %22, %24, !dbg !89
  %26 = icmp slt i64 %22, 0, !dbg !89
  %27 = and i1 %25, %26, !dbg !89
  %28 = add i64 %23, -1, !dbg !89
  %29 = select i1 %27, i64 %28, i64 %23, !dbg !89
  %30 = srem i64 %22, 2, !dbg !89
  %31 = icmp slt i64 %30, 0, !dbg !89
  %32 = add nsw i64 %30, 2, !dbg !89
  %33 = select i1 %31, i64 %32, i64 %30, !dbg !89
  %34 = mul nsw i64 %29, 16, !dbg !89
  %35 = mul nsw i64 %33, 64, !dbg !89
  br label %36, !dbg !89

36:                                               ; preds = %1004, %3
  %37 = phi i64 [ %1005, %1004 ], [ 0, %3 ], !dbg !89
  %38 = icmp slt i64 %37, 16, !dbg !89
  br i1 %38, label %39, label %1006, !dbg !89

39:                                               ; preds = %929, %36
  %40 = phi i64 [ %1003, %929 ], [ 0, %36 ], !dbg !89
  %41 = icmp slt i64 %40, 64, !dbg !89
  br i1 %41, label %42, label %1004, !dbg !89

42:                                               ; preds = %39
  %43 = add i64 %40, %35, !dbg !89
  br label %44, !dbg !89

44:                                               ; preds = %48, %42
  %45 = phi i64 [ %928, %48 ], [ 0, %42 ], !dbg !89
  %46 = phi [8 x <16 x float>] [ %927, %48 ], [ zeroinitializer, %42 ], !dbg !89
  %47 = icmp slt i64 %45, 128, !dbg !89
  br i1 %47, label %48, label %929, !dbg !89

48:                                               ; preds = %44
  %49 = mul i64 %45, 128, !dbg !89
  %50 = add i64 %49, %43, !dbg !89
  %51 = getelementptr float, ptr %11, i64 %50, !dbg !89
  %52 = load <16 x float>, ptr %51, align 4, !dbg !89
  %53 = add i64 %45, 1, !dbg !89
  %54 = mul i64 %53, 128, !dbg !89
  %55 = add i64 %54, %43, !dbg !89
  %56 = getelementptr float, ptr %11, i64 %55, !dbg !89
  %57 = load <16 x float>, ptr %56, align 4, !dbg !89
  %58 = add i64 %45, 2, !dbg !89
  %59 = mul i64 %58, 128, !dbg !89
  %60 = add i64 %59, %43, !dbg !89
  %61 = getelementptr float, ptr %11, i64 %60, !dbg !89
  %62 = load <16 x float>, ptr %61, align 4, !dbg !89
  %63 = add i64 %45, 3, !dbg !89
  %64 = mul i64 %63, 128, !dbg !89
  %65 = add i64 %64, %43, !dbg !89
  %66 = getelementptr float, ptr %11, i64 %65, !dbg !89
  %67 = load <16 x float>, ptr %66, align 4, !dbg !89
  %68 = add i64 %45, 4, !dbg !89
  %69 = mul i64 %68, 128, !dbg !89
  %70 = add i64 %69, %43, !dbg !89
  %71 = getelementptr float, ptr %11, i64 %70, !dbg !89
  %72 = load <16 x float>, ptr %71, align 4, !dbg !89
  %73 = add i64 %45, 5, !dbg !89
  %74 = mul i64 %73, 128, !dbg !89
  %75 = add i64 %74, %43, !dbg !89
  %76 = getelementptr float, ptr %11, i64 %75, !dbg !89
  %77 = load <16 x float>, ptr %76, align 4, !dbg !89
  %78 = add i64 %45, 6, !dbg !89
  %79 = mul i64 %78, 128, !dbg !89
  %80 = add i64 %79, %43, !dbg !89
  %81 = getelementptr float, ptr %11, i64 %80, !dbg !89
  %82 = load <16 x float>, ptr %81, align 4, !dbg !89
  %83 = add i64 %45, 7, !dbg !89
  %84 = mul i64 %83, 128, !dbg !89
  %85 = add i64 %84, %43, !dbg !89
  %86 = getelementptr float, ptr %11, i64 %85, !dbg !89
  %87 = load <16 x float>, ptr %86, align 4, !dbg !89
  %88 = add i64 %45, 8, !dbg !89
  %89 = mul i64 %88, 128, !dbg !89
  %90 = add i64 %89, %43, !dbg !89
  %91 = getelementptr float, ptr %11, i64 %90, !dbg !89
  %92 = load <16 x float>, ptr %91, align 4, !dbg !89
  %93 = add i64 %45, 9, !dbg !89
  %94 = mul i64 %93, 128, !dbg !89
  %95 = add i64 %94, %43, !dbg !89
  %96 = getelementptr float, ptr %11, i64 %95, !dbg !89
  %97 = load <16 x float>, ptr %96, align 4, !dbg !89
  %98 = add i64 %45, 10, !dbg !89
  %99 = mul i64 %98, 128, !dbg !89
  %100 = add i64 %99, %43, !dbg !89
  %101 = getelementptr float, ptr %11, i64 %100, !dbg !89
  %102 = load <16 x float>, ptr %101, align 4, !dbg !89
  %103 = add i64 %45, 11, !dbg !89
  %104 = mul i64 %103, 128, !dbg !89
  %105 = add i64 %104, %43, !dbg !89
  %106 = getelementptr float, ptr %11, i64 %105, !dbg !89
  %107 = load <16 x float>, ptr %106, align 4, !dbg !89
  %108 = add i64 %45, 12, !dbg !89
  %109 = mul i64 %108, 128, !dbg !89
  %110 = add i64 %109, %43, !dbg !89
  %111 = getelementptr float, ptr %11, i64 %110, !dbg !89
  %112 = load <16 x float>, ptr %111, align 4, !dbg !89
  %113 = add i64 %45, 13, !dbg !89
  %114 = mul i64 %113, 128, !dbg !89
  %115 = add i64 %114, %43, !dbg !89
  %116 = getelementptr float, ptr %11, i64 %115, !dbg !89
  %117 = load <16 x float>, ptr %116, align 4, !dbg !89
  %118 = add i64 %45, 14, !dbg !89
  %119 = mul i64 %118, 128, !dbg !89
  %120 = add i64 %119, %43, !dbg !89
  %121 = getelementptr float, ptr %11, i64 %120, !dbg !89
  %122 = load <16 x float>, ptr %121, align 4, !dbg !89
  %123 = add i64 %45, 15, !dbg !89
  %124 = mul i64 %123, 128, !dbg !89
  %125 = add i64 %124, %43, !dbg !89
  %126 = getelementptr float, ptr %11, i64 %125, !dbg !89
  %127 = load <16 x float>, ptr %126, align 4, !dbg !89
  %128 = add i64 %37, %34
  %129 = mul nuw nsw i64 %128, 128
  %130 = add nuw nsw i64 %129, %45
  %131 = getelementptr inbounds nuw float, ptr %6, i64 %130
  %132 = load float, ptr %131, align 4
  %133 = insertelement <16 x float> poison, float %132, i32 0
  %134 = shufflevector <16 x float> %133, <16 x float> poison, <16 x i32> zeroinitializer
  %135 = extractvalue [8 x <16 x float>] %46, 0
  %136 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %134, <16 x float> %52, <16 x float> %135)
  %137 = add i64 %128, 1
  %138 = mul nuw nsw i64 %137, 128
  %139 = add nuw nsw i64 %138, %45
  %140 = getelementptr inbounds nuw float, ptr %6, i64 %139
  %141 = load float, ptr %140, align 4
  %142 = insertelement <16 x float> poison, float %141, i32 0
  %143 = shufflevector <16 x float> %142, <16 x float> poison, <16 x i32> zeroinitializer
  %144 = extractvalue [8 x <16 x float>] %46, 1
  %145 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %143, <16 x float> %52, <16 x float> %144)
  %146 = add i64 %128, 2
  %147 = mul nuw nsw i64 %146, 128
  %148 = add nuw nsw i64 %147, %45
  %149 = getelementptr inbounds nuw float, ptr %6, i64 %148
  %150 = load float, ptr %149, align 4
  %151 = insertelement <16 x float> poison, float %150, i32 0
  %152 = shufflevector <16 x float> %151, <16 x float> poison, <16 x i32> zeroinitializer
  %153 = extractvalue [8 x <16 x float>] %46, 2
  %154 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %152, <16 x float> %52, <16 x float> %153)
  %155 = add i64 %128, 3
  %156 = mul nuw nsw i64 %155, 128
  %157 = add nuw nsw i64 %156, %45
  %158 = getelementptr inbounds nuw float, ptr %6, i64 %157
  %159 = load float, ptr %158, align 4
  %160 = insertelement <16 x float> poison, float %159, i32 0
  %161 = shufflevector <16 x float> %160, <16 x float> poison, <16 x i32> zeroinitializer
  %162 = extractvalue [8 x <16 x float>] %46, 3
  %163 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %161, <16 x float> %52, <16 x float> %162)
  %164 = add i64 %128, 4
  %165 = mul nuw nsw i64 %164, 128
  %166 = add nuw nsw i64 %165, %45
  %167 = getelementptr inbounds nuw float, ptr %6, i64 %166
  %168 = load float, ptr %167, align 4
  %169 = insertelement <16 x float> poison, float %168, i32 0
  %170 = shufflevector <16 x float> %169, <16 x float> poison, <16 x i32> zeroinitializer
  %171 = extractvalue [8 x <16 x float>] %46, 4
  %172 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %170, <16 x float> %52, <16 x float> %171)
  %173 = add i64 %128, 5
  %174 = mul nuw nsw i64 %173, 128
  %175 = add nuw nsw i64 %174, %45
  %176 = getelementptr inbounds nuw float, ptr %6, i64 %175
  %177 = load float, ptr %176, align 4
  %178 = insertelement <16 x float> poison, float %177, i32 0
  %179 = shufflevector <16 x float> %178, <16 x float> poison, <16 x i32> zeroinitializer
  %180 = extractvalue [8 x <16 x float>] %46, 5
  %181 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %179, <16 x float> %52, <16 x float> %180)
  %182 = add i64 %128, 6
  %183 = mul nuw nsw i64 %182, 128
  %184 = add nuw nsw i64 %183, %45
  %185 = getelementptr inbounds nuw float, ptr %6, i64 %184
  %186 = load float, ptr %185, align 4
  %187 = insertelement <16 x float> poison, float %186, i32 0
  %188 = shufflevector <16 x float> %187, <16 x float> poison, <16 x i32> zeroinitializer
  %189 = extractvalue [8 x <16 x float>] %46, 6
  %190 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %188, <16 x float> %52, <16 x float> %189)
  %191 = add i64 %128, 7
  %192 = mul nuw nsw i64 %191, 128
  %193 = add nuw nsw i64 %192, %45
  %194 = getelementptr inbounds nuw float, ptr %6, i64 %193
  %195 = load float, ptr %194, align 4
  %196 = insertelement <16 x float> poison, float %195, i32 0
  %197 = shufflevector <16 x float> %196, <16 x float> poison, <16 x i32> zeroinitializer
  %198 = extractvalue [8 x <16 x float>] %46, 7
  %199 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %197, <16 x float> %52, <16 x float> %198)
  %200 = add nuw nsw i64 %129, %53
  %201 = getelementptr inbounds nuw float, ptr %6, i64 %200
  %202 = load float, ptr %201, align 4
  %203 = insertelement <16 x float> poison, float %202, i32 0
  %204 = shufflevector <16 x float> %203, <16 x float> poison, <16 x i32> zeroinitializer
  %205 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %204, <16 x float> %57, <16 x float> %136)
  %206 = add nuw nsw i64 %138, %53
  %207 = getelementptr inbounds nuw float, ptr %6, i64 %206
  %208 = load float, ptr %207, align 4
  %209 = insertelement <16 x float> poison, float %208, i32 0
  %210 = shufflevector <16 x float> %209, <16 x float> poison, <16 x i32> zeroinitializer
  %211 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %210, <16 x float> %57, <16 x float> %145)
  %212 = add nuw nsw i64 %147, %53
  %213 = getelementptr inbounds nuw float, ptr %6, i64 %212
  %214 = load float, ptr %213, align 4
  %215 = insertelement <16 x float> poison, float %214, i32 0
  %216 = shufflevector <16 x float> %215, <16 x float> poison, <16 x i32> zeroinitializer
  %217 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %216, <16 x float> %57, <16 x float> %154)
  %218 = add nuw nsw i64 %156, %53
  %219 = getelementptr inbounds nuw float, ptr %6, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = insertelement <16 x float> poison, float %220, i32 0
  %222 = shufflevector <16 x float> %221, <16 x float> poison, <16 x i32> zeroinitializer
  %223 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %222, <16 x float> %57, <16 x float> %163)
  %224 = add nuw nsw i64 %165, %53
  %225 = getelementptr inbounds nuw float, ptr %6, i64 %224
  %226 = load float, ptr %225, align 4
  %227 = insertelement <16 x float> poison, float %226, i32 0
  %228 = shufflevector <16 x float> %227, <16 x float> poison, <16 x i32> zeroinitializer
  %229 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %228, <16 x float> %57, <16 x float> %172)
  %230 = add nuw nsw i64 %174, %53
  %231 = getelementptr inbounds nuw float, ptr %6, i64 %230
  %232 = load float, ptr %231, align 4
  %233 = insertelement <16 x float> poison, float %232, i32 0
  %234 = shufflevector <16 x float> %233, <16 x float> poison, <16 x i32> zeroinitializer
  %235 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %234, <16 x float> %57, <16 x float> %181)
  %236 = add nuw nsw i64 %183, %53
  %237 = getelementptr inbounds nuw float, ptr %6, i64 %236
  %238 = load float, ptr %237, align 4
  %239 = insertelement <16 x float> poison, float %238, i32 0
  %240 = shufflevector <16 x float> %239, <16 x float> poison, <16 x i32> zeroinitializer
  %241 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %240, <16 x float> %57, <16 x float> %190)
  %242 = add nuw nsw i64 %192, %53
  %243 = getelementptr inbounds nuw float, ptr %6, i64 %242
  %244 = load float, ptr %243, align 4
  %245 = insertelement <16 x float> poison, float %244, i32 0
  %246 = shufflevector <16 x float> %245, <16 x float> poison, <16 x i32> zeroinitializer
  %247 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %246, <16 x float> %57, <16 x float> %199)
  %248 = add nuw nsw i64 %129, %58
  %249 = getelementptr inbounds nuw float, ptr %6, i64 %248
  %250 = load float, ptr %249, align 4
  %251 = insertelement <16 x float> poison, float %250, i32 0
  %252 = shufflevector <16 x float> %251, <16 x float> poison, <16 x i32> zeroinitializer
  %253 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %252, <16 x float> %62, <16 x float> %205)
  %254 = add nuw nsw i64 %138, %58
  %255 = getelementptr inbounds nuw float, ptr %6, i64 %254
  %256 = load float, ptr %255, align 4
  %257 = insertelement <16 x float> poison, float %256, i32 0
  %258 = shufflevector <16 x float> %257, <16 x float> poison, <16 x i32> zeroinitializer
  %259 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %258, <16 x float> %62, <16 x float> %211)
  %260 = add nuw nsw i64 %147, %58
  %261 = getelementptr inbounds nuw float, ptr %6, i64 %260
  %262 = load float, ptr %261, align 4
  %263 = insertelement <16 x float> poison, float %262, i32 0
  %264 = shufflevector <16 x float> %263, <16 x float> poison, <16 x i32> zeroinitializer
  %265 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %264, <16 x float> %62, <16 x float> %217)
  %266 = add nuw nsw i64 %156, %58
  %267 = getelementptr inbounds nuw float, ptr %6, i64 %266
  %268 = load float, ptr %267, align 4
  %269 = insertelement <16 x float> poison, float %268, i32 0
  %270 = shufflevector <16 x float> %269, <16 x float> poison, <16 x i32> zeroinitializer
  %271 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %270, <16 x float> %62, <16 x float> %223)
  %272 = add nuw nsw i64 %165, %58
  %273 = getelementptr inbounds nuw float, ptr %6, i64 %272
  %274 = load float, ptr %273, align 4
  %275 = insertelement <16 x float> poison, float %274, i32 0
  %276 = shufflevector <16 x float> %275, <16 x float> poison, <16 x i32> zeroinitializer
  %277 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %276, <16 x float> %62, <16 x float> %229)
  %278 = add nuw nsw i64 %174, %58
  %279 = getelementptr inbounds nuw float, ptr %6, i64 %278
  %280 = load float, ptr %279, align 4
  %281 = insertelement <16 x float> poison, float %280, i32 0
  %282 = shufflevector <16 x float> %281, <16 x float> poison, <16 x i32> zeroinitializer
  %283 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %282, <16 x float> %62, <16 x float> %235)
  %284 = add nuw nsw i64 %183, %58
  %285 = getelementptr inbounds nuw float, ptr %6, i64 %284
  %286 = load float, ptr %285, align 4
  %287 = insertelement <16 x float> poison, float %286, i32 0
  %288 = shufflevector <16 x float> %287, <16 x float> poison, <16 x i32> zeroinitializer
  %289 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %288, <16 x float> %62, <16 x float> %241)
  %290 = add nuw nsw i64 %192, %58
  %291 = getelementptr inbounds nuw float, ptr %6, i64 %290
  %292 = load float, ptr %291, align 4
  %293 = insertelement <16 x float> poison, float %292, i32 0
  %294 = shufflevector <16 x float> %293, <16 x float> poison, <16 x i32> zeroinitializer
  %295 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %294, <16 x float> %62, <16 x float> %247)
  %296 = add nuw nsw i64 %129, %63
  %297 = getelementptr inbounds nuw float, ptr %6, i64 %296
  %298 = load float, ptr %297, align 4
  %299 = insertelement <16 x float> poison, float %298, i32 0
  %300 = shufflevector <16 x float> %299, <16 x float> poison, <16 x i32> zeroinitializer
  %301 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %300, <16 x float> %67, <16 x float> %253)
  %302 = add nuw nsw i64 %138, %63
  %303 = getelementptr inbounds nuw float, ptr %6, i64 %302
  %304 = load float, ptr %303, align 4
  %305 = insertelement <16 x float> poison, float %304, i32 0
  %306 = shufflevector <16 x float> %305, <16 x float> poison, <16 x i32> zeroinitializer
  %307 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %306, <16 x float> %67, <16 x float> %259)
  %308 = add nuw nsw i64 %147, %63
  %309 = getelementptr inbounds nuw float, ptr %6, i64 %308
  %310 = load float, ptr %309, align 4
  %311 = insertelement <16 x float> poison, float %310, i32 0
  %312 = shufflevector <16 x float> %311, <16 x float> poison, <16 x i32> zeroinitializer
  %313 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %312, <16 x float> %67, <16 x float> %265)
  %314 = add nuw nsw i64 %156, %63
  %315 = getelementptr inbounds nuw float, ptr %6, i64 %314
  %316 = load float, ptr %315, align 4
  %317 = insertelement <16 x float> poison, float %316, i32 0
  %318 = shufflevector <16 x float> %317, <16 x float> poison, <16 x i32> zeroinitializer
  %319 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %318, <16 x float> %67, <16 x float> %271)
  %320 = add nuw nsw i64 %165, %63
  %321 = getelementptr inbounds nuw float, ptr %6, i64 %320
  %322 = load float, ptr %321, align 4
  %323 = insertelement <16 x float> poison, float %322, i32 0
  %324 = shufflevector <16 x float> %323, <16 x float> poison, <16 x i32> zeroinitializer
  %325 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %324, <16 x float> %67, <16 x float> %277)
  %326 = add nuw nsw i64 %174, %63
  %327 = getelementptr inbounds nuw float, ptr %6, i64 %326
  %328 = load float, ptr %327, align 4
  %329 = insertelement <16 x float> poison, float %328, i32 0
  %330 = shufflevector <16 x float> %329, <16 x float> poison, <16 x i32> zeroinitializer
  %331 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %330, <16 x float> %67, <16 x float> %283)
  %332 = add nuw nsw i64 %183, %63
  %333 = getelementptr inbounds nuw float, ptr %6, i64 %332
  %334 = load float, ptr %333, align 4
  %335 = insertelement <16 x float> poison, float %334, i32 0
  %336 = shufflevector <16 x float> %335, <16 x float> poison, <16 x i32> zeroinitializer
  %337 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %336, <16 x float> %67, <16 x float> %289)
  %338 = add nuw nsw i64 %192, %63
  %339 = getelementptr inbounds nuw float, ptr %6, i64 %338
  %340 = load float, ptr %339, align 4
  %341 = insertelement <16 x float> poison, float %340, i32 0
  %342 = shufflevector <16 x float> %341, <16 x float> poison, <16 x i32> zeroinitializer
  %343 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %342, <16 x float> %67, <16 x float> %295)
  %344 = add nuw nsw i64 %129, %68
  %345 = getelementptr inbounds nuw float, ptr %6, i64 %344
  %346 = load float, ptr %345, align 4
  %347 = insertelement <16 x float> poison, float %346, i32 0
  %348 = shufflevector <16 x float> %347, <16 x float> poison, <16 x i32> zeroinitializer
  %349 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %348, <16 x float> %72, <16 x float> %301)
  %350 = add nuw nsw i64 %138, %68
  %351 = getelementptr inbounds nuw float, ptr %6, i64 %350
  %352 = load float, ptr %351, align 4
  %353 = insertelement <16 x float> poison, float %352, i32 0
  %354 = shufflevector <16 x float> %353, <16 x float> poison, <16 x i32> zeroinitializer
  %355 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %354, <16 x float> %72, <16 x float> %307)
  %356 = add nuw nsw i64 %147, %68
  %357 = getelementptr inbounds nuw float, ptr %6, i64 %356
  %358 = load float, ptr %357, align 4
  %359 = insertelement <16 x float> poison, float %358, i32 0
  %360 = shufflevector <16 x float> %359, <16 x float> poison, <16 x i32> zeroinitializer
  %361 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %360, <16 x float> %72, <16 x float> %313)
  %362 = add nuw nsw i64 %156, %68
  %363 = getelementptr inbounds nuw float, ptr %6, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = insertelement <16 x float> poison, float %364, i32 0
  %366 = shufflevector <16 x float> %365, <16 x float> poison, <16 x i32> zeroinitializer
  %367 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %366, <16 x float> %72, <16 x float> %319)
  %368 = add nuw nsw i64 %165, %68
  %369 = getelementptr inbounds nuw float, ptr %6, i64 %368
  %370 = load float, ptr %369, align 4
  %371 = insertelement <16 x float> poison, float %370, i32 0
  %372 = shufflevector <16 x float> %371, <16 x float> poison, <16 x i32> zeroinitializer
  %373 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %372, <16 x float> %72, <16 x float> %325)
  %374 = add nuw nsw i64 %174, %68
  %375 = getelementptr inbounds nuw float, ptr %6, i64 %374
  %376 = load float, ptr %375, align 4
  %377 = insertelement <16 x float> poison, float %376, i32 0
  %378 = shufflevector <16 x float> %377, <16 x float> poison, <16 x i32> zeroinitializer
  %379 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %378, <16 x float> %72, <16 x float> %331)
  %380 = add nuw nsw i64 %183, %68
  %381 = getelementptr inbounds nuw float, ptr %6, i64 %380
  %382 = load float, ptr %381, align 4
  %383 = insertelement <16 x float> poison, float %382, i32 0
  %384 = shufflevector <16 x float> %383, <16 x float> poison, <16 x i32> zeroinitializer
  %385 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %384, <16 x float> %72, <16 x float> %337)
  %386 = add nuw nsw i64 %192, %68
  %387 = getelementptr inbounds nuw float, ptr %6, i64 %386
  %388 = load float, ptr %387, align 4
  %389 = insertelement <16 x float> poison, float %388, i32 0
  %390 = shufflevector <16 x float> %389, <16 x float> poison, <16 x i32> zeroinitializer
  %391 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %390, <16 x float> %72, <16 x float> %343)
  %392 = add nuw nsw i64 %129, %73
  %393 = getelementptr inbounds nuw float, ptr %6, i64 %392
  %394 = load float, ptr %393, align 4
  %395 = insertelement <16 x float> poison, float %394, i32 0
  %396 = shufflevector <16 x float> %395, <16 x float> poison, <16 x i32> zeroinitializer
  %397 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %396, <16 x float> %77, <16 x float> %349)
  %398 = add nuw nsw i64 %138, %73
  %399 = getelementptr inbounds nuw float, ptr %6, i64 %398
  %400 = load float, ptr %399, align 4
  %401 = insertelement <16 x float> poison, float %400, i32 0
  %402 = shufflevector <16 x float> %401, <16 x float> poison, <16 x i32> zeroinitializer
  %403 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %402, <16 x float> %77, <16 x float> %355)
  %404 = add nuw nsw i64 %147, %73
  %405 = getelementptr inbounds nuw float, ptr %6, i64 %404
  %406 = load float, ptr %405, align 4
  %407 = insertelement <16 x float> poison, float %406, i32 0
  %408 = shufflevector <16 x float> %407, <16 x float> poison, <16 x i32> zeroinitializer
  %409 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %408, <16 x float> %77, <16 x float> %361)
  %410 = add nuw nsw i64 %156, %73
  %411 = getelementptr inbounds nuw float, ptr %6, i64 %410
  %412 = load float, ptr %411, align 4
  %413 = insertelement <16 x float> poison, float %412, i32 0
  %414 = shufflevector <16 x float> %413, <16 x float> poison, <16 x i32> zeroinitializer
  %415 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %414, <16 x float> %77, <16 x float> %367)
  %416 = add nuw nsw i64 %165, %73
  %417 = getelementptr inbounds nuw float, ptr %6, i64 %416
  %418 = load float, ptr %417, align 4
  %419 = insertelement <16 x float> poison, float %418, i32 0
  %420 = shufflevector <16 x float> %419, <16 x float> poison, <16 x i32> zeroinitializer
  %421 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %420, <16 x float> %77, <16 x float> %373)
  %422 = add nuw nsw i64 %174, %73
  %423 = getelementptr inbounds nuw float, ptr %6, i64 %422
  %424 = load float, ptr %423, align 4
  %425 = insertelement <16 x float> poison, float %424, i32 0
  %426 = shufflevector <16 x float> %425, <16 x float> poison, <16 x i32> zeroinitializer
  %427 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %426, <16 x float> %77, <16 x float> %379)
  %428 = add nuw nsw i64 %183, %73
  %429 = getelementptr inbounds nuw float, ptr %6, i64 %428
  %430 = load float, ptr %429, align 4
  %431 = insertelement <16 x float> poison, float %430, i32 0
  %432 = shufflevector <16 x float> %431, <16 x float> poison, <16 x i32> zeroinitializer
  %433 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %432, <16 x float> %77, <16 x float> %385)
  %434 = add nuw nsw i64 %192, %73
  %435 = getelementptr inbounds nuw float, ptr %6, i64 %434
  %436 = load float, ptr %435, align 4
  %437 = insertelement <16 x float> poison, float %436, i32 0
  %438 = shufflevector <16 x float> %437, <16 x float> poison, <16 x i32> zeroinitializer
  %439 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %438, <16 x float> %77, <16 x float> %391)
  %440 = add nuw nsw i64 %129, %78
  %441 = getelementptr inbounds nuw float, ptr %6, i64 %440
  %442 = load float, ptr %441, align 4
  %443 = insertelement <16 x float> poison, float %442, i32 0
  %444 = shufflevector <16 x float> %443, <16 x float> poison, <16 x i32> zeroinitializer
  %445 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %444, <16 x float> %82, <16 x float> %397)
  %446 = add nuw nsw i64 %138, %78
  %447 = getelementptr inbounds nuw float, ptr %6, i64 %446
  %448 = load float, ptr %447, align 4
  %449 = insertelement <16 x float> poison, float %448, i32 0
  %450 = shufflevector <16 x float> %449, <16 x float> poison, <16 x i32> zeroinitializer
  %451 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %450, <16 x float> %82, <16 x float> %403)
  %452 = add nuw nsw i64 %147, %78
  %453 = getelementptr inbounds nuw float, ptr %6, i64 %452
  %454 = load float, ptr %453, align 4
  %455 = insertelement <16 x float> poison, float %454, i32 0
  %456 = shufflevector <16 x float> %455, <16 x float> poison, <16 x i32> zeroinitializer
  %457 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %456, <16 x float> %82, <16 x float> %409)
  %458 = add nuw nsw i64 %156, %78
  %459 = getelementptr inbounds nuw float, ptr %6, i64 %458
  %460 = load float, ptr %459, align 4
  %461 = insertelement <16 x float> poison, float %460, i32 0
  %462 = shufflevector <16 x float> %461, <16 x float> poison, <16 x i32> zeroinitializer
  %463 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %462, <16 x float> %82, <16 x float> %415)
  %464 = add nuw nsw i64 %165, %78
  %465 = getelementptr inbounds nuw float, ptr %6, i64 %464
  %466 = load float, ptr %465, align 4
  %467 = insertelement <16 x float> poison, float %466, i32 0
  %468 = shufflevector <16 x float> %467, <16 x float> poison, <16 x i32> zeroinitializer
  %469 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %468, <16 x float> %82, <16 x float> %421)
  %470 = add nuw nsw i64 %174, %78
  %471 = getelementptr inbounds nuw float, ptr %6, i64 %470
  %472 = load float, ptr %471, align 4
  %473 = insertelement <16 x float> poison, float %472, i32 0
  %474 = shufflevector <16 x float> %473, <16 x float> poison, <16 x i32> zeroinitializer
  %475 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %474, <16 x float> %82, <16 x float> %427)
  %476 = add nuw nsw i64 %183, %78
  %477 = getelementptr inbounds nuw float, ptr %6, i64 %476
  %478 = load float, ptr %477, align 4
  %479 = insertelement <16 x float> poison, float %478, i32 0
  %480 = shufflevector <16 x float> %479, <16 x float> poison, <16 x i32> zeroinitializer
  %481 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %480, <16 x float> %82, <16 x float> %433)
  %482 = add nuw nsw i64 %192, %78
  %483 = getelementptr inbounds nuw float, ptr %6, i64 %482
  %484 = load float, ptr %483, align 4
  %485 = insertelement <16 x float> poison, float %484, i32 0
  %486 = shufflevector <16 x float> %485, <16 x float> poison, <16 x i32> zeroinitializer
  %487 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %486, <16 x float> %82, <16 x float> %439)
  %488 = add nuw nsw i64 %129, %83
  %489 = getelementptr inbounds nuw float, ptr %6, i64 %488
  %490 = load float, ptr %489, align 4
  %491 = insertelement <16 x float> poison, float %490, i32 0
  %492 = shufflevector <16 x float> %491, <16 x float> poison, <16 x i32> zeroinitializer
  %493 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %492, <16 x float> %87, <16 x float> %445)
  %494 = add nuw nsw i64 %138, %83
  %495 = getelementptr inbounds nuw float, ptr %6, i64 %494
  %496 = load float, ptr %495, align 4
  %497 = insertelement <16 x float> poison, float %496, i32 0
  %498 = shufflevector <16 x float> %497, <16 x float> poison, <16 x i32> zeroinitializer
  %499 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %498, <16 x float> %87, <16 x float> %451)
  %500 = add nuw nsw i64 %147, %83
  %501 = getelementptr inbounds nuw float, ptr %6, i64 %500
  %502 = load float, ptr %501, align 4
  %503 = insertelement <16 x float> poison, float %502, i32 0
  %504 = shufflevector <16 x float> %503, <16 x float> poison, <16 x i32> zeroinitializer
  %505 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %504, <16 x float> %87, <16 x float> %457)
  %506 = add nuw nsw i64 %156, %83
  %507 = getelementptr inbounds nuw float, ptr %6, i64 %506
  %508 = load float, ptr %507, align 4
  %509 = insertelement <16 x float> poison, float %508, i32 0
  %510 = shufflevector <16 x float> %509, <16 x float> poison, <16 x i32> zeroinitializer
  %511 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %510, <16 x float> %87, <16 x float> %463)
  %512 = add nuw nsw i64 %165, %83
  %513 = getelementptr inbounds nuw float, ptr %6, i64 %512
  %514 = load float, ptr %513, align 4
  %515 = insertelement <16 x float> poison, float %514, i32 0
  %516 = shufflevector <16 x float> %515, <16 x float> poison, <16 x i32> zeroinitializer
  %517 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %516, <16 x float> %87, <16 x float> %469)
  %518 = add nuw nsw i64 %174, %83
  %519 = getelementptr inbounds nuw float, ptr %6, i64 %518
  %520 = load float, ptr %519, align 4
  %521 = insertelement <16 x float> poison, float %520, i32 0
  %522 = shufflevector <16 x float> %521, <16 x float> poison, <16 x i32> zeroinitializer
  %523 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %522, <16 x float> %87, <16 x float> %475)
  %524 = add nuw nsw i64 %183, %83
  %525 = getelementptr inbounds nuw float, ptr %6, i64 %524
  %526 = load float, ptr %525, align 4
  %527 = insertelement <16 x float> poison, float %526, i32 0
  %528 = shufflevector <16 x float> %527, <16 x float> poison, <16 x i32> zeroinitializer
  %529 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %528, <16 x float> %87, <16 x float> %481)
  %530 = add nuw nsw i64 %192, %83
  %531 = getelementptr inbounds nuw float, ptr %6, i64 %530
  %532 = load float, ptr %531, align 4
  %533 = insertelement <16 x float> poison, float %532, i32 0
  %534 = shufflevector <16 x float> %533, <16 x float> poison, <16 x i32> zeroinitializer
  %535 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %534, <16 x float> %87, <16 x float> %487)
  %536 = add nuw nsw i64 %129, %88
  %537 = getelementptr inbounds nuw float, ptr %6, i64 %536
  %538 = load float, ptr %537, align 4
  %539 = insertelement <16 x float> poison, float %538, i32 0
  %540 = shufflevector <16 x float> %539, <16 x float> poison, <16 x i32> zeroinitializer
  %541 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %540, <16 x float> %92, <16 x float> %493)
  %542 = add nuw nsw i64 %138, %88
  %543 = getelementptr inbounds nuw float, ptr %6, i64 %542
  %544 = load float, ptr %543, align 4
  %545 = insertelement <16 x float> poison, float %544, i32 0
  %546 = shufflevector <16 x float> %545, <16 x float> poison, <16 x i32> zeroinitializer
  %547 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %546, <16 x float> %92, <16 x float> %499)
  %548 = add nuw nsw i64 %147, %88
  %549 = getelementptr inbounds nuw float, ptr %6, i64 %548
  %550 = load float, ptr %549, align 4
  %551 = insertelement <16 x float> poison, float %550, i32 0
  %552 = shufflevector <16 x float> %551, <16 x float> poison, <16 x i32> zeroinitializer
  %553 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %552, <16 x float> %92, <16 x float> %505)
  %554 = add nuw nsw i64 %156, %88
  %555 = getelementptr inbounds nuw float, ptr %6, i64 %554
  %556 = load float, ptr %555, align 4
  %557 = insertelement <16 x float> poison, float %556, i32 0
  %558 = shufflevector <16 x float> %557, <16 x float> poison, <16 x i32> zeroinitializer
  %559 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %558, <16 x float> %92, <16 x float> %511)
  %560 = add nuw nsw i64 %165, %88
  %561 = getelementptr inbounds nuw float, ptr %6, i64 %560
  %562 = load float, ptr %561, align 4
  %563 = insertelement <16 x float> poison, float %562, i32 0
  %564 = shufflevector <16 x float> %563, <16 x float> poison, <16 x i32> zeroinitializer
  %565 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %564, <16 x float> %92, <16 x float> %517)
  %566 = add nuw nsw i64 %174, %88
  %567 = getelementptr inbounds nuw float, ptr %6, i64 %566
  %568 = load float, ptr %567, align 4
  %569 = insertelement <16 x float> poison, float %568, i32 0
  %570 = shufflevector <16 x float> %569, <16 x float> poison, <16 x i32> zeroinitializer
  %571 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %570, <16 x float> %92, <16 x float> %523)
  %572 = add nuw nsw i64 %183, %88
  %573 = getelementptr inbounds nuw float, ptr %6, i64 %572
  %574 = load float, ptr %573, align 4
  %575 = insertelement <16 x float> poison, float %574, i32 0
  %576 = shufflevector <16 x float> %575, <16 x float> poison, <16 x i32> zeroinitializer
  %577 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %576, <16 x float> %92, <16 x float> %529)
  %578 = add nuw nsw i64 %192, %88
  %579 = getelementptr inbounds nuw float, ptr %6, i64 %578
  %580 = load float, ptr %579, align 4
  %581 = insertelement <16 x float> poison, float %580, i32 0
  %582 = shufflevector <16 x float> %581, <16 x float> poison, <16 x i32> zeroinitializer
  %583 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %582, <16 x float> %92, <16 x float> %535)
  %584 = add nuw nsw i64 %129, %93
  %585 = getelementptr inbounds nuw float, ptr %6, i64 %584
  %586 = load float, ptr %585, align 4
  %587 = insertelement <16 x float> poison, float %586, i32 0
  %588 = shufflevector <16 x float> %587, <16 x float> poison, <16 x i32> zeroinitializer
  %589 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %588, <16 x float> %97, <16 x float> %541)
  %590 = add nuw nsw i64 %138, %93
  %591 = getelementptr inbounds nuw float, ptr %6, i64 %590
  %592 = load float, ptr %591, align 4
  %593 = insertelement <16 x float> poison, float %592, i32 0
  %594 = shufflevector <16 x float> %593, <16 x float> poison, <16 x i32> zeroinitializer
  %595 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %594, <16 x float> %97, <16 x float> %547)
  %596 = add nuw nsw i64 %147, %93
  %597 = getelementptr inbounds nuw float, ptr %6, i64 %596
  %598 = load float, ptr %597, align 4
  %599 = insertelement <16 x float> poison, float %598, i32 0
  %600 = shufflevector <16 x float> %599, <16 x float> poison, <16 x i32> zeroinitializer
  %601 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %600, <16 x float> %97, <16 x float> %553)
  %602 = add nuw nsw i64 %156, %93
  %603 = getelementptr inbounds nuw float, ptr %6, i64 %602
  %604 = load float, ptr %603, align 4
  %605 = insertelement <16 x float> poison, float %604, i32 0
  %606 = shufflevector <16 x float> %605, <16 x float> poison, <16 x i32> zeroinitializer
  %607 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %606, <16 x float> %97, <16 x float> %559)
  %608 = add nuw nsw i64 %165, %93
  %609 = getelementptr inbounds nuw float, ptr %6, i64 %608
  %610 = load float, ptr %609, align 4
  %611 = insertelement <16 x float> poison, float %610, i32 0
  %612 = shufflevector <16 x float> %611, <16 x float> poison, <16 x i32> zeroinitializer
  %613 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %612, <16 x float> %97, <16 x float> %565)
  %614 = add nuw nsw i64 %174, %93
  %615 = getelementptr inbounds nuw float, ptr %6, i64 %614
  %616 = load float, ptr %615, align 4
  %617 = insertelement <16 x float> poison, float %616, i32 0
  %618 = shufflevector <16 x float> %617, <16 x float> poison, <16 x i32> zeroinitializer
  %619 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %618, <16 x float> %97, <16 x float> %571)
  %620 = add nuw nsw i64 %183, %93
  %621 = getelementptr inbounds nuw float, ptr %6, i64 %620
  %622 = load float, ptr %621, align 4
  %623 = insertelement <16 x float> poison, float %622, i32 0
  %624 = shufflevector <16 x float> %623, <16 x float> poison, <16 x i32> zeroinitializer
  %625 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %624, <16 x float> %97, <16 x float> %577)
  %626 = add nuw nsw i64 %192, %93
  %627 = getelementptr inbounds nuw float, ptr %6, i64 %626
  %628 = load float, ptr %627, align 4
  %629 = insertelement <16 x float> poison, float %628, i32 0
  %630 = shufflevector <16 x float> %629, <16 x float> poison, <16 x i32> zeroinitializer
  %631 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %630, <16 x float> %97, <16 x float> %583)
  %632 = add nuw nsw i64 %129, %98
  %633 = getelementptr inbounds nuw float, ptr %6, i64 %632
  %634 = load float, ptr %633, align 4
  %635 = insertelement <16 x float> poison, float %634, i32 0
  %636 = shufflevector <16 x float> %635, <16 x float> poison, <16 x i32> zeroinitializer
  %637 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %636, <16 x float> %102, <16 x float> %589)
  %638 = add nuw nsw i64 %138, %98
  %639 = getelementptr inbounds nuw float, ptr %6, i64 %638
  %640 = load float, ptr %639, align 4
  %641 = insertelement <16 x float> poison, float %640, i32 0
  %642 = shufflevector <16 x float> %641, <16 x float> poison, <16 x i32> zeroinitializer
  %643 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %642, <16 x float> %102, <16 x float> %595)
  %644 = add nuw nsw i64 %147, %98
  %645 = getelementptr inbounds nuw float, ptr %6, i64 %644
  %646 = load float, ptr %645, align 4
  %647 = insertelement <16 x float> poison, float %646, i32 0
  %648 = shufflevector <16 x float> %647, <16 x float> poison, <16 x i32> zeroinitializer
  %649 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %648, <16 x float> %102, <16 x float> %601)
  %650 = add nuw nsw i64 %156, %98
  %651 = getelementptr inbounds nuw float, ptr %6, i64 %650
  %652 = load float, ptr %651, align 4
  %653 = insertelement <16 x float> poison, float %652, i32 0
  %654 = shufflevector <16 x float> %653, <16 x float> poison, <16 x i32> zeroinitializer
  %655 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %654, <16 x float> %102, <16 x float> %607)
  %656 = add nuw nsw i64 %165, %98
  %657 = getelementptr inbounds nuw float, ptr %6, i64 %656
  %658 = load float, ptr %657, align 4
  %659 = insertelement <16 x float> poison, float %658, i32 0
  %660 = shufflevector <16 x float> %659, <16 x float> poison, <16 x i32> zeroinitializer
  %661 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %660, <16 x float> %102, <16 x float> %613)
  %662 = add nuw nsw i64 %174, %98
  %663 = getelementptr inbounds nuw float, ptr %6, i64 %662
  %664 = load float, ptr %663, align 4
  %665 = insertelement <16 x float> poison, float %664, i32 0
  %666 = shufflevector <16 x float> %665, <16 x float> poison, <16 x i32> zeroinitializer
  %667 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %666, <16 x float> %102, <16 x float> %619)
  %668 = add nuw nsw i64 %183, %98
  %669 = getelementptr inbounds nuw float, ptr %6, i64 %668
  %670 = load float, ptr %669, align 4
  %671 = insertelement <16 x float> poison, float %670, i32 0
  %672 = shufflevector <16 x float> %671, <16 x float> poison, <16 x i32> zeroinitializer
  %673 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %672, <16 x float> %102, <16 x float> %625)
  %674 = add nuw nsw i64 %192, %98
  %675 = getelementptr inbounds nuw float, ptr %6, i64 %674
  %676 = load float, ptr %675, align 4
  %677 = insertelement <16 x float> poison, float %676, i32 0
  %678 = shufflevector <16 x float> %677, <16 x float> poison, <16 x i32> zeroinitializer
  %679 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %678, <16 x float> %102, <16 x float> %631)
  %680 = add nuw nsw i64 %129, %103
  %681 = getelementptr inbounds nuw float, ptr %6, i64 %680
  %682 = load float, ptr %681, align 4
  %683 = insertelement <16 x float> poison, float %682, i32 0
  %684 = shufflevector <16 x float> %683, <16 x float> poison, <16 x i32> zeroinitializer
  %685 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %684, <16 x float> %107, <16 x float> %637)
  %686 = add nuw nsw i64 %138, %103
  %687 = getelementptr inbounds nuw float, ptr %6, i64 %686
  %688 = load float, ptr %687, align 4
  %689 = insertelement <16 x float> poison, float %688, i32 0
  %690 = shufflevector <16 x float> %689, <16 x float> poison, <16 x i32> zeroinitializer
  %691 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %690, <16 x float> %107, <16 x float> %643)
  %692 = add nuw nsw i64 %147, %103
  %693 = getelementptr inbounds nuw float, ptr %6, i64 %692
  %694 = load float, ptr %693, align 4
  %695 = insertelement <16 x float> poison, float %694, i32 0
  %696 = shufflevector <16 x float> %695, <16 x float> poison, <16 x i32> zeroinitializer
  %697 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %696, <16 x float> %107, <16 x float> %649)
  %698 = add nuw nsw i64 %156, %103
  %699 = getelementptr inbounds nuw float, ptr %6, i64 %698
  %700 = load float, ptr %699, align 4
  %701 = insertelement <16 x float> poison, float %700, i32 0
  %702 = shufflevector <16 x float> %701, <16 x float> poison, <16 x i32> zeroinitializer
  %703 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %702, <16 x float> %107, <16 x float> %655)
  %704 = add nuw nsw i64 %165, %103
  %705 = getelementptr inbounds nuw float, ptr %6, i64 %704
  %706 = load float, ptr %705, align 4
  %707 = insertelement <16 x float> poison, float %706, i32 0
  %708 = shufflevector <16 x float> %707, <16 x float> poison, <16 x i32> zeroinitializer
  %709 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %708, <16 x float> %107, <16 x float> %661)
  %710 = add nuw nsw i64 %174, %103
  %711 = getelementptr inbounds nuw float, ptr %6, i64 %710
  %712 = load float, ptr %711, align 4
  %713 = insertelement <16 x float> poison, float %712, i32 0
  %714 = shufflevector <16 x float> %713, <16 x float> poison, <16 x i32> zeroinitializer
  %715 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %714, <16 x float> %107, <16 x float> %667)
  %716 = add nuw nsw i64 %183, %103
  %717 = getelementptr inbounds nuw float, ptr %6, i64 %716
  %718 = load float, ptr %717, align 4
  %719 = insertelement <16 x float> poison, float %718, i32 0
  %720 = shufflevector <16 x float> %719, <16 x float> poison, <16 x i32> zeroinitializer
  %721 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %720, <16 x float> %107, <16 x float> %673)
  %722 = add nuw nsw i64 %192, %103
  %723 = getelementptr inbounds nuw float, ptr %6, i64 %722
  %724 = load float, ptr %723, align 4
  %725 = insertelement <16 x float> poison, float %724, i32 0
  %726 = shufflevector <16 x float> %725, <16 x float> poison, <16 x i32> zeroinitializer
  %727 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %726, <16 x float> %107, <16 x float> %679)
  %728 = add nuw nsw i64 %129, %108
  %729 = getelementptr inbounds nuw float, ptr %6, i64 %728
  %730 = load float, ptr %729, align 4
  %731 = insertelement <16 x float> poison, float %730, i32 0
  %732 = shufflevector <16 x float> %731, <16 x float> poison, <16 x i32> zeroinitializer
  %733 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %732, <16 x float> %112, <16 x float> %685)
  %734 = add nuw nsw i64 %138, %108
  %735 = getelementptr inbounds nuw float, ptr %6, i64 %734
  %736 = load float, ptr %735, align 4
  %737 = insertelement <16 x float> poison, float %736, i32 0
  %738 = shufflevector <16 x float> %737, <16 x float> poison, <16 x i32> zeroinitializer
  %739 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %738, <16 x float> %112, <16 x float> %691)
  %740 = add nuw nsw i64 %147, %108
  %741 = getelementptr inbounds nuw float, ptr %6, i64 %740
  %742 = load float, ptr %741, align 4
  %743 = insertelement <16 x float> poison, float %742, i32 0
  %744 = shufflevector <16 x float> %743, <16 x float> poison, <16 x i32> zeroinitializer
  %745 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %744, <16 x float> %112, <16 x float> %697)
  %746 = add nuw nsw i64 %156, %108
  %747 = getelementptr inbounds nuw float, ptr %6, i64 %746
  %748 = load float, ptr %747, align 4
  %749 = insertelement <16 x float> poison, float %748, i32 0
  %750 = shufflevector <16 x float> %749, <16 x float> poison, <16 x i32> zeroinitializer
  %751 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %750, <16 x float> %112, <16 x float> %703)
  %752 = add nuw nsw i64 %165, %108
  %753 = getelementptr inbounds nuw float, ptr %6, i64 %752
  %754 = load float, ptr %753, align 4
  %755 = insertelement <16 x float> poison, float %754, i32 0
  %756 = shufflevector <16 x float> %755, <16 x float> poison, <16 x i32> zeroinitializer
  %757 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %756, <16 x float> %112, <16 x float> %709)
  %758 = add nuw nsw i64 %174, %108
  %759 = getelementptr inbounds nuw float, ptr %6, i64 %758
  %760 = load float, ptr %759, align 4
  %761 = insertelement <16 x float> poison, float %760, i32 0
  %762 = shufflevector <16 x float> %761, <16 x float> poison, <16 x i32> zeroinitializer
  %763 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %762, <16 x float> %112, <16 x float> %715)
  %764 = add nuw nsw i64 %183, %108
  %765 = getelementptr inbounds nuw float, ptr %6, i64 %764
  %766 = load float, ptr %765, align 4
  %767 = insertelement <16 x float> poison, float %766, i32 0
  %768 = shufflevector <16 x float> %767, <16 x float> poison, <16 x i32> zeroinitializer
  %769 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %768, <16 x float> %112, <16 x float> %721)
  %770 = add nuw nsw i64 %192, %108
  %771 = getelementptr inbounds nuw float, ptr %6, i64 %770
  %772 = load float, ptr %771, align 4
  %773 = insertelement <16 x float> poison, float %772, i32 0
  %774 = shufflevector <16 x float> %773, <16 x float> poison, <16 x i32> zeroinitializer
  %775 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %774, <16 x float> %112, <16 x float> %727)
  %776 = add nuw nsw i64 %129, %113
  %777 = getelementptr inbounds nuw float, ptr %6, i64 %776
  %778 = load float, ptr %777, align 4
  %779 = insertelement <16 x float> poison, float %778, i32 0
  %780 = shufflevector <16 x float> %779, <16 x float> poison, <16 x i32> zeroinitializer
  %781 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %780, <16 x float> %117, <16 x float> %733)
  %782 = add nuw nsw i64 %138, %113
  %783 = getelementptr inbounds nuw float, ptr %6, i64 %782
  %784 = load float, ptr %783, align 4
  %785 = insertelement <16 x float> poison, float %784, i32 0
  %786 = shufflevector <16 x float> %785, <16 x float> poison, <16 x i32> zeroinitializer
  %787 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %786, <16 x float> %117, <16 x float> %739)
  %788 = add nuw nsw i64 %147, %113
  %789 = getelementptr inbounds nuw float, ptr %6, i64 %788
  %790 = load float, ptr %789, align 4
  %791 = insertelement <16 x float> poison, float %790, i32 0
  %792 = shufflevector <16 x float> %791, <16 x float> poison, <16 x i32> zeroinitializer
  %793 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %792, <16 x float> %117, <16 x float> %745)
  %794 = add nuw nsw i64 %156, %113
  %795 = getelementptr inbounds nuw float, ptr %6, i64 %794
  %796 = load float, ptr %795, align 4
  %797 = insertelement <16 x float> poison, float %796, i32 0
  %798 = shufflevector <16 x float> %797, <16 x float> poison, <16 x i32> zeroinitializer
  %799 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %798, <16 x float> %117, <16 x float> %751)
  %800 = add nuw nsw i64 %165, %113
  %801 = getelementptr inbounds nuw float, ptr %6, i64 %800
  %802 = load float, ptr %801, align 4
  %803 = insertelement <16 x float> poison, float %802, i32 0
  %804 = shufflevector <16 x float> %803, <16 x float> poison, <16 x i32> zeroinitializer
  %805 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %804, <16 x float> %117, <16 x float> %757)
  %806 = add nuw nsw i64 %174, %113
  %807 = getelementptr inbounds nuw float, ptr %6, i64 %806
  %808 = load float, ptr %807, align 4
  %809 = insertelement <16 x float> poison, float %808, i32 0
  %810 = shufflevector <16 x float> %809, <16 x float> poison, <16 x i32> zeroinitializer
  %811 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %810, <16 x float> %117, <16 x float> %763)
  %812 = add nuw nsw i64 %183, %113
  %813 = getelementptr inbounds nuw float, ptr %6, i64 %812
  %814 = load float, ptr %813, align 4
  %815 = insertelement <16 x float> poison, float %814, i32 0
  %816 = shufflevector <16 x float> %815, <16 x float> poison, <16 x i32> zeroinitializer
  %817 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %816, <16 x float> %117, <16 x float> %769)
  %818 = add nuw nsw i64 %192, %113
  %819 = getelementptr inbounds nuw float, ptr %6, i64 %818
  %820 = load float, ptr %819, align 4
  %821 = insertelement <16 x float> poison, float %820, i32 0
  %822 = shufflevector <16 x float> %821, <16 x float> poison, <16 x i32> zeroinitializer
  %823 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %822, <16 x float> %117, <16 x float> %775)
  %824 = add nuw nsw i64 %129, %118
  %825 = getelementptr inbounds nuw float, ptr %6, i64 %824
  %826 = load float, ptr %825, align 4
  %827 = insertelement <16 x float> poison, float %826, i32 0
  %828 = shufflevector <16 x float> %827, <16 x float> poison, <16 x i32> zeroinitializer
  %829 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %828, <16 x float> %122, <16 x float> %781)
  %830 = add nuw nsw i64 %138, %118
  %831 = getelementptr inbounds nuw float, ptr %6, i64 %830
  %832 = load float, ptr %831, align 4
  %833 = insertelement <16 x float> poison, float %832, i32 0
  %834 = shufflevector <16 x float> %833, <16 x float> poison, <16 x i32> zeroinitializer
  %835 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %834, <16 x float> %122, <16 x float> %787)
  %836 = add nuw nsw i64 %147, %118
  %837 = getelementptr inbounds nuw float, ptr %6, i64 %836
  %838 = load float, ptr %837, align 4
  %839 = insertelement <16 x float> poison, float %838, i32 0
  %840 = shufflevector <16 x float> %839, <16 x float> poison, <16 x i32> zeroinitializer
  %841 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %840, <16 x float> %122, <16 x float> %793)
  %842 = add nuw nsw i64 %156, %118
  %843 = getelementptr inbounds nuw float, ptr %6, i64 %842
  %844 = load float, ptr %843, align 4
  %845 = insertelement <16 x float> poison, float %844, i32 0
  %846 = shufflevector <16 x float> %845, <16 x float> poison, <16 x i32> zeroinitializer
  %847 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %846, <16 x float> %122, <16 x float> %799)
  %848 = add nuw nsw i64 %165, %118
  %849 = getelementptr inbounds nuw float, ptr %6, i64 %848
  %850 = load float, ptr %849, align 4
  %851 = insertelement <16 x float> poison, float %850, i32 0
  %852 = shufflevector <16 x float> %851, <16 x float> poison, <16 x i32> zeroinitializer
  %853 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %852, <16 x float> %122, <16 x float> %805)
  %854 = add nuw nsw i64 %174, %118
  %855 = getelementptr inbounds nuw float, ptr %6, i64 %854
  %856 = load float, ptr %855, align 4
  %857 = insertelement <16 x float> poison, float %856, i32 0
  %858 = shufflevector <16 x float> %857, <16 x float> poison, <16 x i32> zeroinitializer
  %859 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %858, <16 x float> %122, <16 x float> %811)
  %860 = add nuw nsw i64 %183, %118
  %861 = getelementptr inbounds nuw float, ptr %6, i64 %860
  %862 = load float, ptr %861, align 4
  %863 = insertelement <16 x float> poison, float %862, i32 0
  %864 = shufflevector <16 x float> %863, <16 x float> poison, <16 x i32> zeroinitializer
  %865 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %864, <16 x float> %122, <16 x float> %817)
  %866 = add nuw nsw i64 %192, %118
  %867 = getelementptr inbounds nuw float, ptr %6, i64 %866
  %868 = load float, ptr %867, align 4
  %869 = insertelement <16 x float> poison, float %868, i32 0
  %870 = shufflevector <16 x float> %869, <16 x float> poison, <16 x i32> zeroinitializer
  %871 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %870, <16 x float> %122, <16 x float> %823)
  %872 = add nuw nsw i64 %129, %123
  %873 = getelementptr inbounds nuw float, ptr %6, i64 %872
  %874 = load float, ptr %873, align 4
  %875 = insertelement <16 x float> poison, float %874, i32 0
  %876 = shufflevector <16 x float> %875, <16 x float> poison, <16 x i32> zeroinitializer
  %877 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %876, <16 x float> %127, <16 x float> %829)
  %878 = add nuw nsw i64 %138, %123
  %879 = getelementptr inbounds nuw float, ptr %6, i64 %878
  %880 = load float, ptr %879, align 4
  %881 = insertelement <16 x float> poison, float %880, i32 0
  %882 = shufflevector <16 x float> %881, <16 x float> poison, <16 x i32> zeroinitializer
  %883 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %882, <16 x float> %127, <16 x float> %835)
  %884 = add nuw nsw i64 %147, %123
  %885 = getelementptr inbounds nuw float, ptr %6, i64 %884
  %886 = load float, ptr %885, align 4
  %887 = insertelement <16 x float> poison, float %886, i32 0
  %888 = shufflevector <16 x float> %887, <16 x float> poison, <16 x i32> zeroinitializer
  %889 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %888, <16 x float> %127, <16 x float> %841)
  %890 = add nuw nsw i64 %156, %123
  %891 = getelementptr inbounds nuw float, ptr %6, i64 %890
  %892 = load float, ptr %891, align 4
  %893 = insertelement <16 x float> poison, float %892, i32 0
  %894 = shufflevector <16 x float> %893, <16 x float> poison, <16 x i32> zeroinitializer
  %895 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %894, <16 x float> %127, <16 x float> %847)
  %896 = add nuw nsw i64 %165, %123
  %897 = getelementptr inbounds nuw float, ptr %6, i64 %896
  %898 = load float, ptr %897, align 4
  %899 = insertelement <16 x float> poison, float %898, i32 0
  %900 = shufflevector <16 x float> %899, <16 x float> poison, <16 x i32> zeroinitializer
  %901 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %900, <16 x float> %127, <16 x float> %853)
  %902 = add nuw nsw i64 %174, %123
  %903 = getelementptr inbounds nuw float, ptr %6, i64 %902
  %904 = load float, ptr %903, align 4
  %905 = insertelement <16 x float> poison, float %904, i32 0
  %906 = shufflevector <16 x float> %905, <16 x float> poison, <16 x i32> zeroinitializer
  %907 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %906, <16 x float> %127, <16 x float> %859)
  %908 = add nuw nsw i64 %183, %123
  %909 = getelementptr inbounds nuw float, ptr %6, i64 %908
  %910 = load float, ptr %909, align 4
  %911 = insertelement <16 x float> poison, float %910, i32 0
  %912 = shufflevector <16 x float> %911, <16 x float> poison, <16 x i32> zeroinitializer
  %913 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %912, <16 x float> %127, <16 x float> %865)
  %914 = add nuw nsw i64 %192, %123
  %915 = getelementptr inbounds nuw float, ptr %6, i64 %914
  %916 = load float, ptr %915, align 4
  %917 = insertelement <16 x float> poison, float %916, i32 0
  %918 = shufflevector <16 x float> %917, <16 x float> poison, <16 x i32> zeroinitializer
  %919 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %918, <16 x float> %127, <16 x float> %871)
  %920 = insertvalue [8 x <16 x float>] poison, <16 x float> %877, 0
  %921 = insertvalue [8 x <16 x float>] %920, <16 x float> %883, 1
  %922 = insertvalue [8 x <16 x float>] %921, <16 x float> %889, 2
  %923 = insertvalue [8 x <16 x float>] %922, <16 x float> %895, 3
  %924 = insertvalue [8 x <16 x float>] %923, <16 x float> %901, 4
  %925 = insertvalue [8 x <16 x float>] %924, <16 x float> %907, 5
  %926 = insertvalue [8 x <16 x float>] %925, <16 x float> %913, 6
  %927 = insertvalue [8 x <16 x float>] %926, <16 x float> %919, 7
  %928 = add i64 %45, 16, !dbg !89
  br label %44, !dbg !89

929:                                              ; preds = %44
  %930 = getelementptr float, ptr %15, i64 %43, !dbg !90
  %931 = load <16 x float>, ptr %930, align 4, !dbg !90
  %932 = extractvalue [8 x <16 x float>] %46, 0, !dbg !91
  %933 = fadd contract <16 x float> %932, %931, !dbg !91
  %934 = extractvalue [8 x <16 x float>] %46, 1, !dbg !91
  %935 = fadd contract <16 x float> %934, %931, !dbg !91
  %936 = extractvalue [8 x <16 x float>] %46, 2, !dbg !91
  %937 = fadd contract <16 x float> %936, %931, !dbg !91
  %938 = extractvalue [8 x <16 x float>] %46, 3, !dbg !91
  %939 = fadd contract <16 x float> %938, %931, !dbg !91
  %940 = extractvalue [8 x <16 x float>] %46, 4, !dbg !91
  %941 = fadd contract <16 x float> %940, %931, !dbg !91
  %942 = extractvalue [8 x <16 x float>] %46, 5, !dbg !91
  %943 = fadd contract <16 x float> %942, %931, !dbg !91
  %944 = extractvalue [8 x <16 x float>] %46, 6, !dbg !91
  %945 = fadd contract <16 x float> %944, %931, !dbg !91
  %946 = extractvalue [8 x <16 x float>] %46, 7, !dbg !91
  %947 = fadd contract <16 x float> %946, %931, !dbg !91
  %948 = fcmp ugt <16 x float> %933, zeroinitializer, !dbg !92
  %949 = fcmp ugt <16 x float> %935, zeroinitializer, !dbg !92
  %950 = fcmp ugt <16 x float> %937, zeroinitializer, !dbg !92
  %951 = fcmp ugt <16 x float> %939, zeroinitializer, !dbg !92
  %952 = fcmp ugt <16 x float> %941, zeroinitializer, !dbg !92
  %953 = fcmp ugt <16 x float> %943, zeroinitializer, !dbg !92
  %954 = fcmp ugt <16 x float> %945, zeroinitializer, !dbg !92
  %955 = fcmp ugt <16 x float> %947, zeroinitializer, !dbg !92
  %956 = select <16 x i1> %948, <16 x float> %933, <16 x float> zeroinitializer, !dbg !93
  %957 = select <16 x i1> %949, <16 x float> %935, <16 x float> zeroinitializer, !dbg !93
  %958 = select <16 x i1> %950, <16 x float> %937, <16 x float> zeroinitializer, !dbg !93
  %959 = select <16 x i1> %951, <16 x float> %939, <16 x float> zeroinitializer, !dbg !93
  %960 = select <16 x i1> %952, <16 x float> %941, <16 x float> zeroinitializer, !dbg !93
  %961 = select <16 x i1> %953, <16 x float> %943, <16 x float> zeroinitializer, !dbg !93
  %962 = select <16 x i1> %954, <16 x float> %945, <16 x float> zeroinitializer, !dbg !93
  %963 = select <16 x i1> %955, <16 x float> %947, <16 x float> zeroinitializer, !dbg !93
  %964 = add i64 %34, %37, !dbg !89
  %965 = mul i64 %964, 128, !dbg !89
  %966 = add i64 %965, %43, !dbg !89
  %967 = getelementptr float, ptr %19, i64 %966, !dbg !89
  store <16 x float> %956, ptr %967, align 4, !dbg !89
  %968 = add i64 %37, 1, !dbg !89
  %969 = add i64 %34, %968, !dbg !89
  %970 = mul i64 %969, 128, !dbg !89
  %971 = add i64 %970, %43, !dbg !89
  %972 = getelementptr float, ptr %19, i64 %971, !dbg !89
  store <16 x float> %957, ptr %972, align 4, !dbg !89
  %973 = add i64 %37, 2, !dbg !89
  %974 = add i64 %34, %973, !dbg !89
  %975 = mul i64 %974, 128, !dbg !89
  %976 = add i64 %975, %43, !dbg !89
  %977 = getelementptr float, ptr %19, i64 %976, !dbg !89
  store <16 x float> %958, ptr %977, align 4, !dbg !89
  %978 = add i64 %37, 3, !dbg !89
  %979 = add i64 %34, %978, !dbg !89
  %980 = mul i64 %979, 128, !dbg !89
  %981 = add i64 %980, %43, !dbg !89
  %982 = getelementptr float, ptr %19, i64 %981, !dbg !89
  store <16 x float> %959, ptr %982, align 4, !dbg !89
  %983 = add i64 %37, 4, !dbg !89
  %984 = add i64 %34, %983, !dbg !89
  %985 = mul i64 %984, 128, !dbg !89
  %986 = add i64 %985, %43, !dbg !89
  %987 = getelementptr float, ptr %19, i64 %986, !dbg !89
  store <16 x float> %960, ptr %987, align 4, !dbg !89
  %988 = add i64 %37, 5, !dbg !89
  %989 = add i64 %34, %988, !dbg !89
  %990 = mul i64 %989, 128, !dbg !89
  %991 = add i64 %990, %43, !dbg !89
  %992 = getelementptr float, ptr %19, i64 %991, !dbg !89
  store <16 x float> %961, ptr %992, align 4, !dbg !89
  %993 = add i64 %37, 6, !dbg !89
  %994 = add i64 %34, %993, !dbg !89
  %995 = mul i64 %994, 128, !dbg !89
  %996 = add i64 %995, %43, !dbg !89
  %997 = getelementptr float, ptr %19, i64 %996, !dbg !89
  store <16 x float> %962, ptr %997, align 4, !dbg !89
  %998 = add i64 %37, 7, !dbg !89
  %999 = add i64 %34, %998, !dbg !89
  %1000 = mul i64 %999, 128, !dbg !89
  %1001 = add i64 %1000, %43, !dbg !89
  %1002 = getelementptr float, ptr %19, i64 %1001, !dbg !89
  store <16 x float> %963, ptr %1002, align 4, !dbg !89
  %1003 = add i64 %40, 16, !dbg !89
  br label %39, !dbg !89

1004:                                             ; preds = %39
  %1005 = add i64 %37, 8, !dbg !89
  br label %36, !dbg !89

1006:                                             ; preds = %36
  ret i32 0, !dbg !94
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fmuladd.v16f32(<16 x float>, <16 x float>, <16 x float>) #2

; Function Attrs: uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr %1) #3 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #4 {
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
define hidden signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #4 {
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
  %26 = add nsw i32 %25, 15360
  %27 = lshr i32 %21, 13
  %28 = select i1 %22, i32 0, i32 %27
  %29 = add nuw nsw i32 %26, %28
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
define hidden float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #4 {
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
define hidden float @__extendhfsf2(float noundef %0) local_unnamed_addr #4 {
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
define hidden signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #4 {
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
define hidden float @__truncsfhf2(float noundef %0) local_unnamed_addr #4 {
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
  %30 = add nsw i32 %29, %26
  br label %31

31:                                               ; preds = %18, %16, %13, %8, %1
  %32 = phi i32 [ 31744, %8 ], [ %4, %1 ], [ %30, %18 ], [ 31744, %13 ], [ 0, %16 ]
  %33 = or i32 %32, %7
  %34 = trunc i32 %33 to i16
  br label %35

35:                                               ; preds = %10, %31
  %36 = phi i16 [ %12, %10 ], [ %34, %31 ]
  store i16 %36, ptr %2, align 4, !tbaa !95
  %37 = load float, ptr %2, align 4, !tbaa !97
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %37
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden double @__extendhfdf2(float noundef %0) local_unnamed_addr #4 {
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
define hidden float @__truncdfhf2(double noundef %0) local_unnamed_addr #4 {
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
  store i16 %37, ptr %2, align 4, !tbaa !95
  %38 = load float, ptr %2, align 4, !tbaa !97
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #4 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #6

; Function Attrs: inlinehint
define hidden noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #7 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @__math_oflowf(i32 noundef %0) local_unnamed_addr #7 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x4600000000000000) #7
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #7 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !97
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !97
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint
define hidden float @__math_uflowf(i32 noundef %0) local_unnamed_addr #7 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x3A00000000000000) #7
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @ceilf(float noundef %0) local_unnamed_addr #7 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !97
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
  store volatile float %24, ptr %2, align 4, !tbaa !97
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

; Function Attrs: inlinehint
define hidden float @expf(float noundef %0) local_unnamed_addr #7 {
  %2 = fpext float %0 to double
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 20
  %5 = and i32 %4, 2047
  %.not = icmp samesign ult i32 %5, 1067
  br i1 %.not, label %19, label %6, !prof !99

6:                                                ; preds = %1
  %7 = fcmp oeq float %0, 0xFFF0000000000000
  br i1 %7, label %42, label %8

8:                                                ; preds = %6
  %.not34 = icmp samesign ult i32 %5, 2040
  br i1 %.not34, label %11, label %9

9:                                                ; preds = %8
  %10 = fadd float %0, %0
  br label %42

11:                                               ; preds = %8
  %12 = fcmp ogt float %0, 0x40562E42E0000000
  br i1 %12, label %13, label %15

13:                                               ; preds = %11
  %14 = tail call float @__math_oflowf(i32 noundef 0) #7
  br label %42

15:                                               ; preds = %11
  %16 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = tail call float @__math_uflowf(i32 noundef 0) #7
  br label %42

19:                                               ; preds = %15, %1
  %20 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 296), align 8, !tbaa !100
  %21 = fmul double %20, %2
  %22 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 288), align 8, !tbaa !103
  %23 = fadd double %21, %22
  %24 = bitcast double %23 to i64
  %25 = fsub double %23, %22
  %26 = fsub double %21, %25
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %27
  %29 = load i64, ptr %28, align 8, !tbaa !104
  %30 = shl i64 %24, 47
  %31 = add i64 %30, %29
  %32 = bitcast i64 %31 to double
  %33 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 304), align 8, !tbaa !106
  %34 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 312), align 8, !tbaa !106
  %35 = tail call double @llvm.fmuladd.f64(double %33, double %26, double %34)
  %36 = fmul double %26, %26
  %37 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 320), align 8, !tbaa !106
  %38 = tail call double @llvm.fmuladd.f64(double %37, double %26, double 1.000000e+00)
  %39 = tail call double @llvm.fmuladd.f64(double %35, double %36, double %38)
  %40 = fmul double %39, %32
  %41 = fptrunc double %40 to float
  br label %42

42:                                               ; preds = %19, %17, %13, %9, %6
  %.0 = phi float [ %10, %9 ], [ %14, %13 ], [ %18, %17 ], [ %41, %19 ], [ 0.000000e+00, %6 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetround() local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #7 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden float @floorf(float noundef %0) local_unnamed_addr #7 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !97
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
  store volatile float %23, ptr %2, align 4, !tbaa !97
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

; Function Attrs: inlinehint
define hidden float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #7 {
  %4 = alloca float, align 4
  %5 = fpext float %0 to double
  %6 = fpext float %1 to double
  %7 = fmul double %5, %6
  %8 = fpext float %2 to double
  %9 = fadd double %7, %8
  %10 = bitcast double %9 to i64
  %11 = lshr i64 %10, 52
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = and i32 %12, 2047
  %14 = and i64 %10, 536870911
  %15 = icmp ne i64 %14, 268435456
  %16 = icmp eq i32 %13, 2047
  %or.cond = select i1 %15, i1 true, i1 %16
  br i1 %or.cond, label %24, label %17

17:                                               ; preds = %3
  %18 = fsub double %9, %7
  %19 = fcmp oeq double %18, %8
  %20 = fsub double %9, %8
  %21 = fcmp oeq double %20, %7
  %or.cond44 = and i1 %19, %21
  br i1 %or.cond44, label %24, label %22

22:                                               ; preds = %17
  %23 = tail call i32 @fegetround() #7
  %.not = icmp eq i32 %23, 0
  br i1 %.not, label %34, label %24

24:                                               ; preds = %22, %17, %3
  %25 = add nsw i32 %13, -874
  %or.cond3 = icmp ult i32 %25, 23
  br i1 %or.cond3, label %26, label %46

26:                                               ; preds = %24
  %27 = tail call i32 @fetestexcept(i32 noundef 32) #7
  %.not41 = icmp eq i32 %27, 0
  br i1 %.not41, label %46, label %28

28:                                               ; preds = %26
  %29 = tail call i32 @feclearexcept(i32 noundef 32) #7
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %2, ptr %4, align 4, !tbaa !97
  %.0..0..0..0.5 = load volatile float, ptr %4, align 4, !tbaa !97
  %30 = fpext float %.0..0..0..0.5 to double
  %31 = fadd double %7, %30
  %32 = tail call i32 @fetestexcept(i32 noundef 32) #7
  %.not42 = icmp eq i32 %32, 0
  %. = select i1 %.not42, i32 32, i32 16
  %33 = tail call i32 @feraiseexcept(i32 noundef %.) #7
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %46

34:                                               ; preds = %22
  %35 = icmp slt i64 %10, 0
  %36 = fcmp uge double %7, %8
  %37 = xor i1 %36, %35
  %38 = fsub double %7, %9
  %39 = fadd double %38, %8
  %40 = fsub double %8, %9
  %41 = fadd double %7, %40
  %.038 = select i1 %37, double %39, double %41
  %42 = fcmp uge double %.038, 0.000000e+00
  %43 = xor i1 %35, %42
  %44 = or disjoint i64 %10, 1
  %45 = add nsw i64 %10, -1
  %.sroa.0.0.in = select i1 %43, i64 %44, i64 %45
  %.sroa.0.0 = bitcast i64 %.sroa.0.0.in to double
  br label %46

46:                                               ; preds = %34, %28, %26, %24
  %.0.in = phi double [ %.sroa.0.0, %34 ], [ %31, %28 ], [ %9, %26 ], [ %9, %24 ]
  %.0 = fptrunc double %.0.in to float
  ret float %.0
}

; Function Attrs: inlinehint
define hidden float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #7 {
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

.lr.ph:                                           ; preds = %.lr.ph, %26
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

.lr.ph90:                                         ; preds = %.lr.ph90, %38
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

.lr.ph96:                                         ; preds = %57, %49
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

.lr.ph103:                                        ; preds = %.lr.ph103, %67
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #6

; Function Attrs: inlinehint
define hidden float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #7 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #7
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

; Function Attrs: inlinehint
define hidden float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = tail call float @scalbnf(float noundef %0, i32 noundef %1) #7
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #7 {
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #6

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #6

; Function Attrs: inlinehint
define hidden float @powf(float noundef %0, float noundef %1) local_unnamed_addr #7 {
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = bitcast float %1 to i32
  %6 = add i32 %4, -2139095040
  %7 = icmp ult i32 %6, -2130706432
  %.pre = shl i32 %5, 1
  %8 = add i32 %.pre, 16777216
  %9 = icmp ult i32 %8, 16777217
  %or.cond99 = or i1 %7, %9
  br i1 %or.cond99, label %.critedge, label %73, !prof !107

.critedge:                                        ; preds = %2
  %10 = add i32 %.pre, -1
  %11 = icmp ult i32 %10, -16777217
  br i1 %11, label %28, label %12, !prof !99

12:                                               ; preds = %.critedge
  %13 = icmp eq i32 %.pre, 0
  %14 = icmp eq i32 %4, 1065353216
  %or.cond70 = or i1 %14, %13
  br i1 %or.cond70, label %138, label %15

15:                                               ; preds = %12
  %16 = shl i32 %4, 1
  %17 = icmp ugt i32 %16, -16777216
  %18 = icmp samesign ugt i32 %.pre, -16777216
  %or.cond = or i1 %17, %18
  br i1 %or.cond, label %19, label %21

19:                                               ; preds = %15
  %20 = fadd float %0, %1
  br label %138

21:                                               ; preds = %15
  %22 = icmp eq i32 %16, 2130706432
  br i1 %22, label %138, label %23

23:                                               ; preds = %21
  %24 = icmp ult i32 %16, 2130706432
  %25 = icmp slt i32 %5, 0
  %26 = xor i1 %24, %25
  %27 = fmul float %1, %1
  %spec.select71 = select i1 %26, float 0.000000e+00, float %27
  br label %138

28:                                               ; preds = %.critedge
  %29 = shl i32 %4, 1
  %30 = add i32 %29, -1
  %31 = icmp ult i32 %30, -16777217
  br i1 %31, label %47, label %32, !prof !99

32:                                               ; preds = %28
  %33 = fmul float %0, %0
  %.not66 = icmp sgt i32 %4, -1
  br i1 %.not66, label %checkint.exit.thread, label %34

34:                                               ; preds = %32
  %35 = lshr i32 %5, 23
  %36 = and i32 %35, 255
  %37 = add nsw i32 %36, -151
  %or.cond92 = icmp ult i32 %37, -24
  br i1 %or.cond92, label %checkint.exit.thread, label %38

38:                                               ; preds = %34
  %39 = sub nuw nsw i32 150, %36
  %40 = shl nuw nsw i32 1, %39
  %41 = add nsw i32 %40, -1
  %42 = and i32 %41, %5
  %.not.i = icmp ne i32 %42, 0
  %43 = and i32 %40, %5
  %.not9.i = icmp eq i32 %43, 0
  %or.cond93 = or i1 %.not9.i, %.not.i
  %44 = fneg float %33
  %spec.select = select i1 %or.cond93, float %33, float %44
  br label %checkint.exit.thread

checkint.exit.thread:                             ; preds = %38, %34, %32
  %.057 = phi float [ %33, %32 ], [ %33, %34 ], [ %spec.select, %38 ]
  %.not67 = icmp sgt i32 %5, -1
  br i1 %.not67, label %138, label %45

45:                                               ; preds = %checkint.exit.thread
  %46 = fdiv float 1.000000e+00, %.057
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %46, ptr %3, align 4, !tbaa !97
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !97
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  br label %138

47:                                               ; preds = %28
  %.not64 = icmp sgt i32 %4, -1
  br i1 %.not64, label %66, label %48

48:                                               ; preds = %47
  %49 = lshr i32 %5, 23
  %50 = and i32 %49, 255
  %51 = icmp samesign ult i32 %50, 127
  br i1 %51, label %.thread, label %52

52:                                               ; preds = %48
  %53 = icmp samesign ugt i32 %50, 150
  br i1 %53, label %checkint.exit76.thread85, label %54

54:                                               ; preds = %52
  %55 = sub nuw nsw i32 150, %50
  %56 = shl nuw nsw i32 1, %55
  %57 = add nsw i32 %56, -1
  %58 = and i32 %57, %5
  %.not.i72 = icmp eq i32 %58, 0
  br i1 %.not.i72, label %59, label %.thread

59:                                               ; preds = %54
  %60 = and i32 %56, %5
  %.not9.i74 = icmp eq i32 %60, 0
  br i1 %.not9.i74, label %checkint.exit76.thread85, label %62

.thread:                                          ; preds = %54, %48
  %61 = tail call float @__math_invalidf(float noundef %0) #7
  br label %138

checkint.exit76.thread85:                         ; preds = %59, %52
  br label %62

62:                                               ; preds = %checkint.exit76.thread85, %59
  %63 = phi i32 [ 0, %checkint.exit76.thread85 ], [ 65536, %59 ]
  %64 = tail call float @llvm.fabs.f32(float %0)
  %65 = bitcast float %64 to i32
  br label %66

66:                                               ; preds = %62, %47
  %.154 = phi i32 [ %65, %62 ], [ %4, %47 ]
  %.151 = phi i32 [ %63, %62 ], [ 0, %47 ]
  %67 = icmp ult i32 %.154, 8388608
  br i1 %67, label %68, label %73

68:                                               ; preds = %66
  %69 = fmul float %0, 0x4160000000000000
  %70 = tail call float @llvm.fabs.f32(float %69)
  %71 = bitcast float %70 to i32
  %72 = add nsw i32 %71, -192937984
  br label %73

73:                                               ; preds = %68, %66, %2
  %.053 = phi i32 [ %72, %68 ], [ %.154, %66 ], [ %4, %2 ]
  %.050 = phi i32 [ %.151, %68 ], [ %.151, %66 ], [ 0, %2 ]
  %74 = add i32 %.053, -1060306944
  %75 = lshr i32 %74, 19
  %76 = and i32 %75, 15
  %77 = and i32 %74, -8388608
  %78 = sub i32 %.053, %77
  %79 = ashr i32 %74, 23
  %80 = zext nneg i32 %76 to i64
  %81 = getelementptr inbounds nuw %struct.anon, ptr @__powf_log2_data, i64 %80
  %82 = load double, ptr %81, align 8, !tbaa !108
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 8
  %84 = load double, ptr %83, align 8, !tbaa !110
  %85 = bitcast i32 %78 to float
  %86 = fpext float %85 to double
  %87 = tail call double @llvm.fmuladd.f64(double %86, double %82, double -1.000000e+00)
  %88 = sitofp i32 %79 to double
  %89 = fadd double %84, %88
  %90 = fmul double %87, %87
  %91 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 256), align 8, !tbaa !106
  %92 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 264), align 8, !tbaa !106
  %93 = tail call double @llvm.fmuladd.f64(double %91, double %87, double %92)
  %94 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 272), align 8, !tbaa !106
  %95 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 280), align 8, !tbaa !106
  %96 = tail call double @llvm.fmuladd.f64(double %94, double %87, double %95)
  %97 = fmul double %90, %90
  %98 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 288), align 8, !tbaa !106
  %99 = tail call double @llvm.fmuladd.f64(double %98, double %87, double %89)
  %100 = tail call double @llvm.fmuladd.f64(double %96, double %90, double %99)
  %101 = tail call double @llvm.fmuladd.f64(double %93, double %97, double %100)
  %102 = fpext float %1 to double
  %103 = fmul double %101, %102
  %104 = bitcast double %103 to i64
  %105 = and i64 %104, 9223231299366420480
  %106 = icmp samesign ugt i64 %105, 4638426141214900224
  br i1 %106, label %107, label %115, !prof !111

107:                                              ; preds = %73
  %108 = fcmp ogt double %103, 0x405FFFFFFFD1D571
  br i1 %108, label %109, label %111

109:                                              ; preds = %107
  %110 = tail call float @__math_oflowf(i32 noundef %.050) #7
  br label %138

111:                                              ; preds = %107
  %112 = fcmp ugt double %103, -1.500000e+02
  br i1 %112, label %115, label %113

113:                                              ; preds = %111
  %114 = tail call float @__math_uflowf(i32 noundef %.050) #7
  br label %138

115:                                              ; preds = %111, %73
  %116 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 256), align 8, !tbaa !112
  %117 = fadd double %103, %116
  %118 = bitcast double %117 to i64
  %119 = fsub double %117, %116
  %120 = fsub double %103, %119
  %121 = and i64 %118, 31
  %122 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %121
  %123 = load i64, ptr %122, align 8, !tbaa !104
  %124 = zext nneg i32 %.050 to i64
  %125 = add i64 %118, %124
  %126 = shl i64 %125, 47
  %127 = add i64 %126, %123
  %128 = bitcast i64 %127 to double
  %129 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 264), align 8, !tbaa !106
  %130 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 272), align 8, !tbaa !106
  %131 = tail call double @llvm.fmuladd.f64(double %129, double %120, double %130)
  %132 = fmul double %120, %120
  %133 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 280), align 8, !tbaa !106
  %134 = tail call double @llvm.fmuladd.f64(double %133, double %120, double 1.000000e+00)
  %135 = tail call double @llvm.fmuladd.f64(double %131, double %132, double %134)
  %136 = fmul double %135, %128
  %137 = fptrunc double %136 to float
  br label %138

138:                                              ; preds = %115, %113, %109, %.thread, %45, %checkint.exit.thread, %23, %21, %19, %12
  %.0 = phi float [ %20, %19 ], [ 1.000000e+00, %12 ], [ 1.000000e+00, %21 ], [ %.0..0..0..0..0..0..i, %45 ], [ %.057, %checkint.exit.thread ], [ %110, %109 ], [ %114, %113 ], [ %137, %115 ], [ %spec.select71, %23 ], [ %61, %.thread ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden noundef float @rintf(float noundef %0) local_unnamed_addr #7 {
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

; Function Attrs: inlinehint
define hidden float @roundf(float noundef %0) local_unnamed_addr #7 {
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
  store volatile float %9, ptr %2, align 4, !tbaa !97
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

attributes #0 = { "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { uwtable "nonlazybind" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { inlinehint }

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
!92 = !DILocation(line: 25, column: 10, scope: !9)
!93 = !DILocation(line: 26, column: 10, scope: !9)
!94 = !DILocation(line: 30, column: 8, scope: !9)
!95 = !{!96, !96, i64 0}
!96 = !{!"short", !7, i64 0}
!97 = !{!98, !98, i64 0}
!98 = !{!"float", !7, i64 0}
!99 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!100 = !{!101, !102, i64 296}
!101 = !{!"exp2f_data", !7, i64 0, !102, i64 256, !7, i64 264, !102, i64 288, !102, i64 296, !7, i64 304}
!102 = !{!"double", !7, i64 0}
!103 = !{!101, !102, i64 288}
!104 = !{!105, !105, i64 0}
!105 = !{!"long", !7, i64 0}
!106 = !{!102, !102, i64 0}
!107 = !{!"branch_weights", i32 4001, i32 4000000}
!108 = !{!109, !102, i64 0}
!109 = !{!"", !102, i64 0, !102, i64 8}
!110 = !{!109, !102, i64 8}
!111 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!112 = !{!101, !102, i64 256}
