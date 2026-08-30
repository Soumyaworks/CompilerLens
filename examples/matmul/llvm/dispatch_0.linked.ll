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
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ], !dbg !86
  %11 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !87
  %12 = extractvalue %iree_hal_executable_dispatch_state_v0_t %11, 10, !dbg !87
  %13 = getelementptr ptr, ptr %12, i32 2, !dbg !87
  %14 = load ptr, ptr %13, align 8, !dbg !87
  call void @llvm.assume(i1 true) [ "align"(ptr %14, i64 64) ], !dbg !87
  %15 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !88
  %16 = extractvalue %iree_hal_executable_workgroup_state_v0_t %15, 0, !dbg !88
  %17 = zext i32 %16 to i64, !dbg !88
  %18 = sdiv i64 %17, 2, !dbg !88
  %19 = mul i64 %18, 2, !dbg !88
  %20 = icmp ne i64 %17, %19, !dbg !88
  %21 = icmp slt i64 %17, 0, !dbg !88
  %22 = and i1 %20, %21, !dbg !88
  %23 = add i64 %18, -1, !dbg !88
  %24 = select i1 %22, i64 %23, i64 %18, !dbg !88
  %25 = srem i64 %17, 2, !dbg !88
  %26 = icmp slt i64 %25, 0, !dbg !88
  %27 = add nsw i64 %25, 2, !dbg !88
  %28 = select i1 %26, i64 %27, i64 %25, !dbg !88
  %29 = mul nsw i64 %24, 16, !dbg !88
  %30 = mul nsw i64 %28, 64, !dbg !88
  br label %31, !dbg !88

31:                                               ; preds = %973, %3
  %32 = phi i64 [ %974, %973 ], [ 0, %3 ], !dbg !88
  %33 = icmp slt i64 %32, 16, !dbg !88
  br i1 %33, label %34, label %975, !dbg !88

34:                                               ; preds = %924, %31
  %35 = phi i64 [ %972, %924 ], [ 0, %31 ], !dbg !88
  %36 = icmp slt i64 %35, 64, !dbg !88
  br i1 %36, label %37, label %973, !dbg !88

37:                                               ; preds = %34
  %38 = add i64 %35, %30, !dbg !88
  br label %39, !dbg !88

39:                                               ; preds = %43, %37
  %40 = phi i64 [ %923, %43 ], [ 0, %37 ], !dbg !88
  %41 = phi [8 x <16 x float>] [ %922, %43 ], [ zeroinitializer, %37 ], !dbg !88
  %42 = icmp slt i64 %40, 128, !dbg !88
  br i1 %42, label %43, label %924, !dbg !88

43:                                               ; preds = %39
  %44 = mul i64 %40, 128, !dbg !88
  %45 = add i64 %44, %38, !dbg !88
  %46 = getelementptr float, ptr %10, i64 %45, !dbg !88
  %47 = load <16 x float>, ptr %46, align 4, !dbg !88
  %48 = add i64 %40, 1, !dbg !88
  %49 = mul i64 %48, 128, !dbg !88
  %50 = add i64 %49, %38, !dbg !88
  %51 = getelementptr float, ptr %10, i64 %50, !dbg !88
  %52 = load <16 x float>, ptr %51, align 4, !dbg !88
  %53 = add i64 %40, 2, !dbg !88
  %54 = mul i64 %53, 128, !dbg !88
  %55 = add i64 %54, %38, !dbg !88
  %56 = getelementptr float, ptr %10, i64 %55, !dbg !88
  %57 = load <16 x float>, ptr %56, align 4, !dbg !88
  %58 = add i64 %40, 3, !dbg !88
  %59 = mul i64 %58, 128, !dbg !88
  %60 = add i64 %59, %38, !dbg !88
  %61 = getelementptr float, ptr %10, i64 %60, !dbg !88
  %62 = load <16 x float>, ptr %61, align 4, !dbg !88
  %63 = add i64 %40, 4, !dbg !88
  %64 = mul i64 %63, 128, !dbg !88
  %65 = add i64 %64, %38, !dbg !88
  %66 = getelementptr float, ptr %10, i64 %65, !dbg !88
  %67 = load <16 x float>, ptr %66, align 4, !dbg !88
  %68 = add i64 %40, 5, !dbg !88
  %69 = mul i64 %68, 128, !dbg !88
  %70 = add i64 %69, %38, !dbg !88
  %71 = getelementptr float, ptr %10, i64 %70, !dbg !88
  %72 = load <16 x float>, ptr %71, align 4, !dbg !88
  %73 = add i64 %40, 6, !dbg !88
  %74 = mul i64 %73, 128, !dbg !88
  %75 = add i64 %74, %38, !dbg !88
  %76 = getelementptr float, ptr %10, i64 %75, !dbg !88
  %77 = load <16 x float>, ptr %76, align 4, !dbg !88
  %78 = add i64 %40, 7, !dbg !88
  %79 = mul i64 %78, 128, !dbg !88
  %80 = add i64 %79, %38, !dbg !88
  %81 = getelementptr float, ptr %10, i64 %80, !dbg !88
  %82 = load <16 x float>, ptr %81, align 4, !dbg !88
  %83 = add i64 %40, 8, !dbg !88
  %84 = mul i64 %83, 128, !dbg !88
  %85 = add i64 %84, %38, !dbg !88
  %86 = getelementptr float, ptr %10, i64 %85, !dbg !88
  %87 = load <16 x float>, ptr %86, align 4, !dbg !88
  %88 = add i64 %40, 9, !dbg !88
  %89 = mul i64 %88, 128, !dbg !88
  %90 = add i64 %89, %38, !dbg !88
  %91 = getelementptr float, ptr %10, i64 %90, !dbg !88
  %92 = load <16 x float>, ptr %91, align 4, !dbg !88
  %93 = add i64 %40, 10, !dbg !88
  %94 = mul i64 %93, 128, !dbg !88
  %95 = add i64 %94, %38, !dbg !88
  %96 = getelementptr float, ptr %10, i64 %95, !dbg !88
  %97 = load <16 x float>, ptr %96, align 4, !dbg !88
  %98 = add i64 %40, 11, !dbg !88
  %99 = mul i64 %98, 128, !dbg !88
  %100 = add i64 %99, %38, !dbg !88
  %101 = getelementptr float, ptr %10, i64 %100, !dbg !88
  %102 = load <16 x float>, ptr %101, align 4, !dbg !88
  %103 = add i64 %40, 12, !dbg !88
  %104 = mul i64 %103, 128, !dbg !88
  %105 = add i64 %104, %38, !dbg !88
  %106 = getelementptr float, ptr %10, i64 %105, !dbg !88
  %107 = load <16 x float>, ptr %106, align 4, !dbg !88
  %108 = add i64 %40, 13, !dbg !88
  %109 = mul i64 %108, 128, !dbg !88
  %110 = add i64 %109, %38, !dbg !88
  %111 = getelementptr float, ptr %10, i64 %110, !dbg !88
  %112 = load <16 x float>, ptr %111, align 4, !dbg !88
  %113 = add i64 %40, 14, !dbg !88
  %114 = mul i64 %113, 128, !dbg !88
  %115 = add i64 %114, %38, !dbg !88
  %116 = getelementptr float, ptr %10, i64 %115, !dbg !88
  %117 = load <16 x float>, ptr %116, align 4, !dbg !88
  %118 = add i64 %40, 15, !dbg !88
  %119 = mul i64 %118, 128, !dbg !88
  %120 = add i64 %119, %38, !dbg !88
  %121 = getelementptr float, ptr %10, i64 %120, !dbg !88
  %122 = load <16 x float>, ptr %121, align 4, !dbg !88
  %123 = add i64 %32, %29
  %124 = mul nuw nsw i64 %123, 128
  %125 = add nuw nsw i64 %124, %40
  %126 = getelementptr inbounds nuw float, ptr %6, i64 %125
  %127 = load float, ptr %126, align 4
  %128 = insertelement <16 x float> poison, float %127, i32 0
  %129 = shufflevector <16 x float> %128, <16 x float> poison, <16 x i32> zeroinitializer
  %130 = extractvalue [8 x <16 x float>] %41, 0
  %131 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %129, <16 x float> %47, <16 x float> %130)
  %132 = add i64 %123, 1
  %133 = mul nuw nsw i64 %132, 128
  %134 = add nuw nsw i64 %133, %40
  %135 = getelementptr inbounds nuw float, ptr %6, i64 %134
  %136 = load float, ptr %135, align 4
  %137 = insertelement <16 x float> poison, float %136, i32 0
  %138 = shufflevector <16 x float> %137, <16 x float> poison, <16 x i32> zeroinitializer
  %139 = extractvalue [8 x <16 x float>] %41, 1
  %140 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %138, <16 x float> %47, <16 x float> %139)
  %141 = add i64 %123, 2
  %142 = mul nuw nsw i64 %141, 128
  %143 = add nuw nsw i64 %142, %40
  %144 = getelementptr inbounds nuw float, ptr %6, i64 %143
  %145 = load float, ptr %144, align 4
  %146 = insertelement <16 x float> poison, float %145, i32 0
  %147 = shufflevector <16 x float> %146, <16 x float> poison, <16 x i32> zeroinitializer
  %148 = extractvalue [8 x <16 x float>] %41, 2
  %149 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %147, <16 x float> %47, <16 x float> %148)
  %150 = add i64 %123, 3
  %151 = mul nuw nsw i64 %150, 128
  %152 = add nuw nsw i64 %151, %40
  %153 = getelementptr inbounds nuw float, ptr %6, i64 %152
  %154 = load float, ptr %153, align 4
  %155 = insertelement <16 x float> poison, float %154, i32 0
  %156 = shufflevector <16 x float> %155, <16 x float> poison, <16 x i32> zeroinitializer
  %157 = extractvalue [8 x <16 x float>] %41, 3
  %158 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %156, <16 x float> %47, <16 x float> %157)
  %159 = add i64 %123, 4
  %160 = mul nuw nsw i64 %159, 128
  %161 = add nuw nsw i64 %160, %40
  %162 = getelementptr inbounds nuw float, ptr %6, i64 %161
  %163 = load float, ptr %162, align 4
  %164 = insertelement <16 x float> poison, float %163, i32 0
  %165 = shufflevector <16 x float> %164, <16 x float> poison, <16 x i32> zeroinitializer
  %166 = extractvalue [8 x <16 x float>] %41, 4
  %167 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %165, <16 x float> %47, <16 x float> %166)
  %168 = add i64 %123, 5
  %169 = mul nuw nsw i64 %168, 128
  %170 = add nuw nsw i64 %169, %40
  %171 = getelementptr inbounds nuw float, ptr %6, i64 %170
  %172 = load float, ptr %171, align 4
  %173 = insertelement <16 x float> poison, float %172, i32 0
  %174 = shufflevector <16 x float> %173, <16 x float> poison, <16 x i32> zeroinitializer
  %175 = extractvalue [8 x <16 x float>] %41, 5
  %176 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %174, <16 x float> %47, <16 x float> %175)
  %177 = add i64 %123, 6
  %178 = mul nuw nsw i64 %177, 128
  %179 = add nuw nsw i64 %178, %40
  %180 = getelementptr inbounds nuw float, ptr %6, i64 %179
  %181 = load float, ptr %180, align 4
  %182 = insertelement <16 x float> poison, float %181, i32 0
  %183 = shufflevector <16 x float> %182, <16 x float> poison, <16 x i32> zeroinitializer
  %184 = extractvalue [8 x <16 x float>] %41, 6
  %185 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %183, <16 x float> %47, <16 x float> %184)
  %186 = add i64 %123, 7
  %187 = mul nuw nsw i64 %186, 128
  %188 = add nuw nsw i64 %187, %40
  %189 = getelementptr inbounds nuw float, ptr %6, i64 %188
  %190 = load float, ptr %189, align 4
  %191 = insertelement <16 x float> poison, float %190, i32 0
  %192 = shufflevector <16 x float> %191, <16 x float> poison, <16 x i32> zeroinitializer
  %193 = extractvalue [8 x <16 x float>] %41, 7
  %194 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %192, <16 x float> %47, <16 x float> %193)
  %195 = add nuw nsw i64 %124, %48
  %196 = getelementptr inbounds nuw float, ptr %6, i64 %195
  %197 = load float, ptr %196, align 4
  %198 = insertelement <16 x float> poison, float %197, i32 0
  %199 = shufflevector <16 x float> %198, <16 x float> poison, <16 x i32> zeroinitializer
  %200 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %199, <16 x float> %52, <16 x float> %131)
  %201 = add nuw nsw i64 %133, %48
  %202 = getelementptr inbounds nuw float, ptr %6, i64 %201
  %203 = load float, ptr %202, align 4
  %204 = insertelement <16 x float> poison, float %203, i32 0
  %205 = shufflevector <16 x float> %204, <16 x float> poison, <16 x i32> zeroinitializer
  %206 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %205, <16 x float> %52, <16 x float> %140)
  %207 = add nuw nsw i64 %142, %48
  %208 = getelementptr inbounds nuw float, ptr %6, i64 %207
  %209 = load float, ptr %208, align 4
  %210 = insertelement <16 x float> poison, float %209, i32 0
  %211 = shufflevector <16 x float> %210, <16 x float> poison, <16 x i32> zeroinitializer
  %212 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %211, <16 x float> %52, <16 x float> %149)
  %213 = add nuw nsw i64 %151, %48
  %214 = getelementptr inbounds nuw float, ptr %6, i64 %213
  %215 = load float, ptr %214, align 4
  %216 = insertelement <16 x float> poison, float %215, i32 0
  %217 = shufflevector <16 x float> %216, <16 x float> poison, <16 x i32> zeroinitializer
  %218 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %217, <16 x float> %52, <16 x float> %158)
  %219 = add nuw nsw i64 %160, %48
  %220 = getelementptr inbounds nuw float, ptr %6, i64 %219
  %221 = load float, ptr %220, align 4
  %222 = insertelement <16 x float> poison, float %221, i32 0
  %223 = shufflevector <16 x float> %222, <16 x float> poison, <16 x i32> zeroinitializer
  %224 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %223, <16 x float> %52, <16 x float> %167)
  %225 = add nuw nsw i64 %169, %48
  %226 = getelementptr inbounds nuw float, ptr %6, i64 %225
  %227 = load float, ptr %226, align 4
  %228 = insertelement <16 x float> poison, float %227, i32 0
  %229 = shufflevector <16 x float> %228, <16 x float> poison, <16 x i32> zeroinitializer
  %230 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %229, <16 x float> %52, <16 x float> %176)
  %231 = add nuw nsw i64 %178, %48
  %232 = getelementptr inbounds nuw float, ptr %6, i64 %231
  %233 = load float, ptr %232, align 4
  %234 = insertelement <16 x float> poison, float %233, i32 0
  %235 = shufflevector <16 x float> %234, <16 x float> poison, <16 x i32> zeroinitializer
  %236 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %235, <16 x float> %52, <16 x float> %185)
  %237 = add nuw nsw i64 %187, %48
  %238 = getelementptr inbounds nuw float, ptr %6, i64 %237
  %239 = load float, ptr %238, align 4
  %240 = insertelement <16 x float> poison, float %239, i32 0
  %241 = shufflevector <16 x float> %240, <16 x float> poison, <16 x i32> zeroinitializer
  %242 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %241, <16 x float> %52, <16 x float> %194)
  %243 = add nuw nsw i64 %124, %53
  %244 = getelementptr inbounds nuw float, ptr %6, i64 %243
  %245 = load float, ptr %244, align 4
  %246 = insertelement <16 x float> poison, float %245, i32 0
  %247 = shufflevector <16 x float> %246, <16 x float> poison, <16 x i32> zeroinitializer
  %248 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %247, <16 x float> %57, <16 x float> %200)
  %249 = add nuw nsw i64 %133, %53
  %250 = getelementptr inbounds nuw float, ptr %6, i64 %249
  %251 = load float, ptr %250, align 4
  %252 = insertelement <16 x float> poison, float %251, i32 0
  %253 = shufflevector <16 x float> %252, <16 x float> poison, <16 x i32> zeroinitializer
  %254 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %253, <16 x float> %57, <16 x float> %206)
  %255 = add nuw nsw i64 %142, %53
  %256 = getelementptr inbounds nuw float, ptr %6, i64 %255
  %257 = load float, ptr %256, align 4
  %258 = insertelement <16 x float> poison, float %257, i32 0
  %259 = shufflevector <16 x float> %258, <16 x float> poison, <16 x i32> zeroinitializer
  %260 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %259, <16 x float> %57, <16 x float> %212)
  %261 = add nuw nsw i64 %151, %53
  %262 = getelementptr inbounds nuw float, ptr %6, i64 %261
  %263 = load float, ptr %262, align 4
  %264 = insertelement <16 x float> poison, float %263, i32 0
  %265 = shufflevector <16 x float> %264, <16 x float> poison, <16 x i32> zeroinitializer
  %266 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %265, <16 x float> %57, <16 x float> %218)
  %267 = add nuw nsw i64 %160, %53
  %268 = getelementptr inbounds nuw float, ptr %6, i64 %267
  %269 = load float, ptr %268, align 4
  %270 = insertelement <16 x float> poison, float %269, i32 0
  %271 = shufflevector <16 x float> %270, <16 x float> poison, <16 x i32> zeroinitializer
  %272 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %271, <16 x float> %57, <16 x float> %224)
  %273 = add nuw nsw i64 %169, %53
  %274 = getelementptr inbounds nuw float, ptr %6, i64 %273
  %275 = load float, ptr %274, align 4
  %276 = insertelement <16 x float> poison, float %275, i32 0
  %277 = shufflevector <16 x float> %276, <16 x float> poison, <16 x i32> zeroinitializer
  %278 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %277, <16 x float> %57, <16 x float> %230)
  %279 = add nuw nsw i64 %178, %53
  %280 = getelementptr inbounds nuw float, ptr %6, i64 %279
  %281 = load float, ptr %280, align 4
  %282 = insertelement <16 x float> poison, float %281, i32 0
  %283 = shufflevector <16 x float> %282, <16 x float> poison, <16 x i32> zeroinitializer
  %284 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %283, <16 x float> %57, <16 x float> %236)
  %285 = add nuw nsw i64 %187, %53
  %286 = getelementptr inbounds nuw float, ptr %6, i64 %285
  %287 = load float, ptr %286, align 4
  %288 = insertelement <16 x float> poison, float %287, i32 0
  %289 = shufflevector <16 x float> %288, <16 x float> poison, <16 x i32> zeroinitializer
  %290 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %289, <16 x float> %57, <16 x float> %242)
  %291 = add nuw nsw i64 %124, %58
  %292 = getelementptr inbounds nuw float, ptr %6, i64 %291
  %293 = load float, ptr %292, align 4
  %294 = insertelement <16 x float> poison, float %293, i32 0
  %295 = shufflevector <16 x float> %294, <16 x float> poison, <16 x i32> zeroinitializer
  %296 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %295, <16 x float> %62, <16 x float> %248)
  %297 = add nuw nsw i64 %133, %58
  %298 = getelementptr inbounds nuw float, ptr %6, i64 %297
  %299 = load float, ptr %298, align 4
  %300 = insertelement <16 x float> poison, float %299, i32 0
  %301 = shufflevector <16 x float> %300, <16 x float> poison, <16 x i32> zeroinitializer
  %302 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %301, <16 x float> %62, <16 x float> %254)
  %303 = add nuw nsw i64 %142, %58
  %304 = getelementptr inbounds nuw float, ptr %6, i64 %303
  %305 = load float, ptr %304, align 4
  %306 = insertelement <16 x float> poison, float %305, i32 0
  %307 = shufflevector <16 x float> %306, <16 x float> poison, <16 x i32> zeroinitializer
  %308 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %307, <16 x float> %62, <16 x float> %260)
  %309 = add nuw nsw i64 %151, %58
  %310 = getelementptr inbounds nuw float, ptr %6, i64 %309
  %311 = load float, ptr %310, align 4
  %312 = insertelement <16 x float> poison, float %311, i32 0
  %313 = shufflevector <16 x float> %312, <16 x float> poison, <16 x i32> zeroinitializer
  %314 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %313, <16 x float> %62, <16 x float> %266)
  %315 = add nuw nsw i64 %160, %58
  %316 = getelementptr inbounds nuw float, ptr %6, i64 %315
  %317 = load float, ptr %316, align 4
  %318 = insertelement <16 x float> poison, float %317, i32 0
  %319 = shufflevector <16 x float> %318, <16 x float> poison, <16 x i32> zeroinitializer
  %320 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %319, <16 x float> %62, <16 x float> %272)
  %321 = add nuw nsw i64 %169, %58
  %322 = getelementptr inbounds nuw float, ptr %6, i64 %321
  %323 = load float, ptr %322, align 4
  %324 = insertelement <16 x float> poison, float %323, i32 0
  %325 = shufflevector <16 x float> %324, <16 x float> poison, <16 x i32> zeroinitializer
  %326 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %325, <16 x float> %62, <16 x float> %278)
  %327 = add nuw nsw i64 %178, %58
  %328 = getelementptr inbounds nuw float, ptr %6, i64 %327
  %329 = load float, ptr %328, align 4
  %330 = insertelement <16 x float> poison, float %329, i32 0
  %331 = shufflevector <16 x float> %330, <16 x float> poison, <16 x i32> zeroinitializer
  %332 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %331, <16 x float> %62, <16 x float> %284)
  %333 = add nuw nsw i64 %187, %58
  %334 = getelementptr inbounds nuw float, ptr %6, i64 %333
  %335 = load float, ptr %334, align 4
  %336 = insertelement <16 x float> poison, float %335, i32 0
  %337 = shufflevector <16 x float> %336, <16 x float> poison, <16 x i32> zeroinitializer
  %338 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %337, <16 x float> %62, <16 x float> %290)
  %339 = add nuw nsw i64 %124, %63
  %340 = getelementptr inbounds nuw float, ptr %6, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = insertelement <16 x float> poison, float %341, i32 0
  %343 = shufflevector <16 x float> %342, <16 x float> poison, <16 x i32> zeroinitializer
  %344 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %343, <16 x float> %67, <16 x float> %296)
  %345 = add nuw nsw i64 %133, %63
  %346 = getelementptr inbounds nuw float, ptr %6, i64 %345
  %347 = load float, ptr %346, align 4
  %348 = insertelement <16 x float> poison, float %347, i32 0
  %349 = shufflevector <16 x float> %348, <16 x float> poison, <16 x i32> zeroinitializer
  %350 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %349, <16 x float> %67, <16 x float> %302)
  %351 = add nuw nsw i64 %142, %63
  %352 = getelementptr inbounds nuw float, ptr %6, i64 %351
  %353 = load float, ptr %352, align 4
  %354 = insertelement <16 x float> poison, float %353, i32 0
  %355 = shufflevector <16 x float> %354, <16 x float> poison, <16 x i32> zeroinitializer
  %356 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %355, <16 x float> %67, <16 x float> %308)
  %357 = add nuw nsw i64 %151, %63
  %358 = getelementptr inbounds nuw float, ptr %6, i64 %357
  %359 = load float, ptr %358, align 4
  %360 = insertelement <16 x float> poison, float %359, i32 0
  %361 = shufflevector <16 x float> %360, <16 x float> poison, <16 x i32> zeroinitializer
  %362 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %361, <16 x float> %67, <16 x float> %314)
  %363 = add nuw nsw i64 %160, %63
  %364 = getelementptr inbounds nuw float, ptr %6, i64 %363
  %365 = load float, ptr %364, align 4
  %366 = insertelement <16 x float> poison, float %365, i32 0
  %367 = shufflevector <16 x float> %366, <16 x float> poison, <16 x i32> zeroinitializer
  %368 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %367, <16 x float> %67, <16 x float> %320)
  %369 = add nuw nsw i64 %169, %63
  %370 = getelementptr inbounds nuw float, ptr %6, i64 %369
  %371 = load float, ptr %370, align 4
  %372 = insertelement <16 x float> poison, float %371, i32 0
  %373 = shufflevector <16 x float> %372, <16 x float> poison, <16 x i32> zeroinitializer
  %374 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %373, <16 x float> %67, <16 x float> %326)
  %375 = add nuw nsw i64 %178, %63
  %376 = getelementptr inbounds nuw float, ptr %6, i64 %375
  %377 = load float, ptr %376, align 4
  %378 = insertelement <16 x float> poison, float %377, i32 0
  %379 = shufflevector <16 x float> %378, <16 x float> poison, <16 x i32> zeroinitializer
  %380 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %379, <16 x float> %67, <16 x float> %332)
  %381 = add nuw nsw i64 %187, %63
  %382 = getelementptr inbounds nuw float, ptr %6, i64 %381
  %383 = load float, ptr %382, align 4
  %384 = insertelement <16 x float> poison, float %383, i32 0
  %385 = shufflevector <16 x float> %384, <16 x float> poison, <16 x i32> zeroinitializer
  %386 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %385, <16 x float> %67, <16 x float> %338)
  %387 = add nuw nsw i64 %124, %68
  %388 = getelementptr inbounds nuw float, ptr %6, i64 %387
  %389 = load float, ptr %388, align 4
  %390 = insertelement <16 x float> poison, float %389, i32 0
  %391 = shufflevector <16 x float> %390, <16 x float> poison, <16 x i32> zeroinitializer
  %392 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %391, <16 x float> %72, <16 x float> %344)
  %393 = add nuw nsw i64 %133, %68
  %394 = getelementptr inbounds nuw float, ptr %6, i64 %393
  %395 = load float, ptr %394, align 4
  %396 = insertelement <16 x float> poison, float %395, i32 0
  %397 = shufflevector <16 x float> %396, <16 x float> poison, <16 x i32> zeroinitializer
  %398 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %397, <16 x float> %72, <16 x float> %350)
  %399 = add nuw nsw i64 %142, %68
  %400 = getelementptr inbounds nuw float, ptr %6, i64 %399
  %401 = load float, ptr %400, align 4
  %402 = insertelement <16 x float> poison, float %401, i32 0
  %403 = shufflevector <16 x float> %402, <16 x float> poison, <16 x i32> zeroinitializer
  %404 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %403, <16 x float> %72, <16 x float> %356)
  %405 = add nuw nsw i64 %151, %68
  %406 = getelementptr inbounds nuw float, ptr %6, i64 %405
  %407 = load float, ptr %406, align 4
  %408 = insertelement <16 x float> poison, float %407, i32 0
  %409 = shufflevector <16 x float> %408, <16 x float> poison, <16 x i32> zeroinitializer
  %410 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %409, <16 x float> %72, <16 x float> %362)
  %411 = add nuw nsw i64 %160, %68
  %412 = getelementptr inbounds nuw float, ptr %6, i64 %411
  %413 = load float, ptr %412, align 4
  %414 = insertelement <16 x float> poison, float %413, i32 0
  %415 = shufflevector <16 x float> %414, <16 x float> poison, <16 x i32> zeroinitializer
  %416 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %415, <16 x float> %72, <16 x float> %368)
  %417 = add nuw nsw i64 %169, %68
  %418 = getelementptr inbounds nuw float, ptr %6, i64 %417
  %419 = load float, ptr %418, align 4
  %420 = insertelement <16 x float> poison, float %419, i32 0
  %421 = shufflevector <16 x float> %420, <16 x float> poison, <16 x i32> zeroinitializer
  %422 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %421, <16 x float> %72, <16 x float> %374)
  %423 = add nuw nsw i64 %178, %68
  %424 = getelementptr inbounds nuw float, ptr %6, i64 %423
  %425 = load float, ptr %424, align 4
  %426 = insertelement <16 x float> poison, float %425, i32 0
  %427 = shufflevector <16 x float> %426, <16 x float> poison, <16 x i32> zeroinitializer
  %428 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %427, <16 x float> %72, <16 x float> %380)
  %429 = add nuw nsw i64 %187, %68
  %430 = getelementptr inbounds nuw float, ptr %6, i64 %429
  %431 = load float, ptr %430, align 4
  %432 = insertelement <16 x float> poison, float %431, i32 0
  %433 = shufflevector <16 x float> %432, <16 x float> poison, <16 x i32> zeroinitializer
  %434 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %433, <16 x float> %72, <16 x float> %386)
  %435 = add nuw nsw i64 %124, %73
  %436 = getelementptr inbounds nuw float, ptr %6, i64 %435
  %437 = load float, ptr %436, align 4
  %438 = insertelement <16 x float> poison, float %437, i32 0
  %439 = shufflevector <16 x float> %438, <16 x float> poison, <16 x i32> zeroinitializer
  %440 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %439, <16 x float> %77, <16 x float> %392)
  %441 = add nuw nsw i64 %133, %73
  %442 = getelementptr inbounds nuw float, ptr %6, i64 %441
  %443 = load float, ptr %442, align 4
  %444 = insertelement <16 x float> poison, float %443, i32 0
  %445 = shufflevector <16 x float> %444, <16 x float> poison, <16 x i32> zeroinitializer
  %446 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %445, <16 x float> %77, <16 x float> %398)
  %447 = add nuw nsw i64 %142, %73
  %448 = getelementptr inbounds nuw float, ptr %6, i64 %447
  %449 = load float, ptr %448, align 4
  %450 = insertelement <16 x float> poison, float %449, i32 0
  %451 = shufflevector <16 x float> %450, <16 x float> poison, <16 x i32> zeroinitializer
  %452 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %451, <16 x float> %77, <16 x float> %404)
  %453 = add nuw nsw i64 %151, %73
  %454 = getelementptr inbounds nuw float, ptr %6, i64 %453
  %455 = load float, ptr %454, align 4
  %456 = insertelement <16 x float> poison, float %455, i32 0
  %457 = shufflevector <16 x float> %456, <16 x float> poison, <16 x i32> zeroinitializer
  %458 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %457, <16 x float> %77, <16 x float> %410)
  %459 = add nuw nsw i64 %160, %73
  %460 = getelementptr inbounds nuw float, ptr %6, i64 %459
  %461 = load float, ptr %460, align 4
  %462 = insertelement <16 x float> poison, float %461, i32 0
  %463 = shufflevector <16 x float> %462, <16 x float> poison, <16 x i32> zeroinitializer
  %464 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %463, <16 x float> %77, <16 x float> %416)
  %465 = add nuw nsw i64 %169, %73
  %466 = getelementptr inbounds nuw float, ptr %6, i64 %465
  %467 = load float, ptr %466, align 4
  %468 = insertelement <16 x float> poison, float %467, i32 0
  %469 = shufflevector <16 x float> %468, <16 x float> poison, <16 x i32> zeroinitializer
  %470 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %469, <16 x float> %77, <16 x float> %422)
  %471 = add nuw nsw i64 %178, %73
  %472 = getelementptr inbounds nuw float, ptr %6, i64 %471
  %473 = load float, ptr %472, align 4
  %474 = insertelement <16 x float> poison, float %473, i32 0
  %475 = shufflevector <16 x float> %474, <16 x float> poison, <16 x i32> zeroinitializer
  %476 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %475, <16 x float> %77, <16 x float> %428)
  %477 = add nuw nsw i64 %187, %73
  %478 = getelementptr inbounds nuw float, ptr %6, i64 %477
  %479 = load float, ptr %478, align 4
  %480 = insertelement <16 x float> poison, float %479, i32 0
  %481 = shufflevector <16 x float> %480, <16 x float> poison, <16 x i32> zeroinitializer
  %482 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %481, <16 x float> %77, <16 x float> %434)
  %483 = add nuw nsw i64 %124, %78
  %484 = getelementptr inbounds nuw float, ptr %6, i64 %483
  %485 = load float, ptr %484, align 4
  %486 = insertelement <16 x float> poison, float %485, i32 0
  %487 = shufflevector <16 x float> %486, <16 x float> poison, <16 x i32> zeroinitializer
  %488 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %487, <16 x float> %82, <16 x float> %440)
  %489 = add nuw nsw i64 %133, %78
  %490 = getelementptr inbounds nuw float, ptr %6, i64 %489
  %491 = load float, ptr %490, align 4
  %492 = insertelement <16 x float> poison, float %491, i32 0
  %493 = shufflevector <16 x float> %492, <16 x float> poison, <16 x i32> zeroinitializer
  %494 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %493, <16 x float> %82, <16 x float> %446)
  %495 = add nuw nsw i64 %142, %78
  %496 = getelementptr inbounds nuw float, ptr %6, i64 %495
  %497 = load float, ptr %496, align 4
  %498 = insertelement <16 x float> poison, float %497, i32 0
  %499 = shufflevector <16 x float> %498, <16 x float> poison, <16 x i32> zeroinitializer
  %500 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %499, <16 x float> %82, <16 x float> %452)
  %501 = add nuw nsw i64 %151, %78
  %502 = getelementptr inbounds nuw float, ptr %6, i64 %501
  %503 = load float, ptr %502, align 4
  %504 = insertelement <16 x float> poison, float %503, i32 0
  %505 = shufflevector <16 x float> %504, <16 x float> poison, <16 x i32> zeroinitializer
  %506 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %505, <16 x float> %82, <16 x float> %458)
  %507 = add nuw nsw i64 %160, %78
  %508 = getelementptr inbounds nuw float, ptr %6, i64 %507
  %509 = load float, ptr %508, align 4
  %510 = insertelement <16 x float> poison, float %509, i32 0
  %511 = shufflevector <16 x float> %510, <16 x float> poison, <16 x i32> zeroinitializer
  %512 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %511, <16 x float> %82, <16 x float> %464)
  %513 = add nuw nsw i64 %169, %78
  %514 = getelementptr inbounds nuw float, ptr %6, i64 %513
  %515 = load float, ptr %514, align 4
  %516 = insertelement <16 x float> poison, float %515, i32 0
  %517 = shufflevector <16 x float> %516, <16 x float> poison, <16 x i32> zeroinitializer
  %518 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %517, <16 x float> %82, <16 x float> %470)
  %519 = add nuw nsw i64 %178, %78
  %520 = getelementptr inbounds nuw float, ptr %6, i64 %519
  %521 = load float, ptr %520, align 4
  %522 = insertelement <16 x float> poison, float %521, i32 0
  %523 = shufflevector <16 x float> %522, <16 x float> poison, <16 x i32> zeroinitializer
  %524 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %523, <16 x float> %82, <16 x float> %476)
  %525 = add nuw nsw i64 %187, %78
  %526 = getelementptr inbounds nuw float, ptr %6, i64 %525
  %527 = load float, ptr %526, align 4
  %528 = insertelement <16 x float> poison, float %527, i32 0
  %529 = shufflevector <16 x float> %528, <16 x float> poison, <16 x i32> zeroinitializer
  %530 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %529, <16 x float> %82, <16 x float> %482)
  %531 = add nuw nsw i64 %124, %83
  %532 = getelementptr inbounds nuw float, ptr %6, i64 %531
  %533 = load float, ptr %532, align 4
  %534 = insertelement <16 x float> poison, float %533, i32 0
  %535 = shufflevector <16 x float> %534, <16 x float> poison, <16 x i32> zeroinitializer
  %536 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %535, <16 x float> %87, <16 x float> %488)
  %537 = add nuw nsw i64 %133, %83
  %538 = getelementptr inbounds nuw float, ptr %6, i64 %537
  %539 = load float, ptr %538, align 4
  %540 = insertelement <16 x float> poison, float %539, i32 0
  %541 = shufflevector <16 x float> %540, <16 x float> poison, <16 x i32> zeroinitializer
  %542 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %541, <16 x float> %87, <16 x float> %494)
  %543 = add nuw nsw i64 %142, %83
  %544 = getelementptr inbounds nuw float, ptr %6, i64 %543
  %545 = load float, ptr %544, align 4
  %546 = insertelement <16 x float> poison, float %545, i32 0
  %547 = shufflevector <16 x float> %546, <16 x float> poison, <16 x i32> zeroinitializer
  %548 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %547, <16 x float> %87, <16 x float> %500)
  %549 = add nuw nsw i64 %151, %83
  %550 = getelementptr inbounds nuw float, ptr %6, i64 %549
  %551 = load float, ptr %550, align 4
  %552 = insertelement <16 x float> poison, float %551, i32 0
  %553 = shufflevector <16 x float> %552, <16 x float> poison, <16 x i32> zeroinitializer
  %554 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %553, <16 x float> %87, <16 x float> %506)
  %555 = add nuw nsw i64 %160, %83
  %556 = getelementptr inbounds nuw float, ptr %6, i64 %555
  %557 = load float, ptr %556, align 4
  %558 = insertelement <16 x float> poison, float %557, i32 0
  %559 = shufflevector <16 x float> %558, <16 x float> poison, <16 x i32> zeroinitializer
  %560 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %559, <16 x float> %87, <16 x float> %512)
  %561 = add nuw nsw i64 %169, %83
  %562 = getelementptr inbounds nuw float, ptr %6, i64 %561
  %563 = load float, ptr %562, align 4
  %564 = insertelement <16 x float> poison, float %563, i32 0
  %565 = shufflevector <16 x float> %564, <16 x float> poison, <16 x i32> zeroinitializer
  %566 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %565, <16 x float> %87, <16 x float> %518)
  %567 = add nuw nsw i64 %178, %83
  %568 = getelementptr inbounds nuw float, ptr %6, i64 %567
  %569 = load float, ptr %568, align 4
  %570 = insertelement <16 x float> poison, float %569, i32 0
  %571 = shufflevector <16 x float> %570, <16 x float> poison, <16 x i32> zeroinitializer
  %572 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %571, <16 x float> %87, <16 x float> %524)
  %573 = add nuw nsw i64 %187, %83
  %574 = getelementptr inbounds nuw float, ptr %6, i64 %573
  %575 = load float, ptr %574, align 4
  %576 = insertelement <16 x float> poison, float %575, i32 0
  %577 = shufflevector <16 x float> %576, <16 x float> poison, <16 x i32> zeroinitializer
  %578 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %577, <16 x float> %87, <16 x float> %530)
  %579 = add nuw nsw i64 %124, %88
  %580 = getelementptr inbounds nuw float, ptr %6, i64 %579
  %581 = load float, ptr %580, align 4
  %582 = insertelement <16 x float> poison, float %581, i32 0
  %583 = shufflevector <16 x float> %582, <16 x float> poison, <16 x i32> zeroinitializer
  %584 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %583, <16 x float> %92, <16 x float> %536)
  %585 = add nuw nsw i64 %133, %88
  %586 = getelementptr inbounds nuw float, ptr %6, i64 %585
  %587 = load float, ptr %586, align 4
  %588 = insertelement <16 x float> poison, float %587, i32 0
  %589 = shufflevector <16 x float> %588, <16 x float> poison, <16 x i32> zeroinitializer
  %590 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %589, <16 x float> %92, <16 x float> %542)
  %591 = add nuw nsw i64 %142, %88
  %592 = getelementptr inbounds nuw float, ptr %6, i64 %591
  %593 = load float, ptr %592, align 4
  %594 = insertelement <16 x float> poison, float %593, i32 0
  %595 = shufflevector <16 x float> %594, <16 x float> poison, <16 x i32> zeroinitializer
  %596 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %595, <16 x float> %92, <16 x float> %548)
  %597 = add nuw nsw i64 %151, %88
  %598 = getelementptr inbounds nuw float, ptr %6, i64 %597
  %599 = load float, ptr %598, align 4
  %600 = insertelement <16 x float> poison, float %599, i32 0
  %601 = shufflevector <16 x float> %600, <16 x float> poison, <16 x i32> zeroinitializer
  %602 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %601, <16 x float> %92, <16 x float> %554)
  %603 = add nuw nsw i64 %160, %88
  %604 = getelementptr inbounds nuw float, ptr %6, i64 %603
  %605 = load float, ptr %604, align 4
  %606 = insertelement <16 x float> poison, float %605, i32 0
  %607 = shufflevector <16 x float> %606, <16 x float> poison, <16 x i32> zeroinitializer
  %608 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %607, <16 x float> %92, <16 x float> %560)
  %609 = add nuw nsw i64 %169, %88
  %610 = getelementptr inbounds nuw float, ptr %6, i64 %609
  %611 = load float, ptr %610, align 4
  %612 = insertelement <16 x float> poison, float %611, i32 0
  %613 = shufflevector <16 x float> %612, <16 x float> poison, <16 x i32> zeroinitializer
  %614 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %613, <16 x float> %92, <16 x float> %566)
  %615 = add nuw nsw i64 %178, %88
  %616 = getelementptr inbounds nuw float, ptr %6, i64 %615
  %617 = load float, ptr %616, align 4
  %618 = insertelement <16 x float> poison, float %617, i32 0
  %619 = shufflevector <16 x float> %618, <16 x float> poison, <16 x i32> zeroinitializer
  %620 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %619, <16 x float> %92, <16 x float> %572)
  %621 = add nuw nsw i64 %187, %88
  %622 = getelementptr inbounds nuw float, ptr %6, i64 %621
  %623 = load float, ptr %622, align 4
  %624 = insertelement <16 x float> poison, float %623, i32 0
  %625 = shufflevector <16 x float> %624, <16 x float> poison, <16 x i32> zeroinitializer
  %626 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %625, <16 x float> %92, <16 x float> %578)
  %627 = add nuw nsw i64 %124, %93
  %628 = getelementptr inbounds nuw float, ptr %6, i64 %627
  %629 = load float, ptr %628, align 4
  %630 = insertelement <16 x float> poison, float %629, i32 0
  %631 = shufflevector <16 x float> %630, <16 x float> poison, <16 x i32> zeroinitializer
  %632 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %631, <16 x float> %97, <16 x float> %584)
  %633 = add nuw nsw i64 %133, %93
  %634 = getelementptr inbounds nuw float, ptr %6, i64 %633
  %635 = load float, ptr %634, align 4
  %636 = insertelement <16 x float> poison, float %635, i32 0
  %637 = shufflevector <16 x float> %636, <16 x float> poison, <16 x i32> zeroinitializer
  %638 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %637, <16 x float> %97, <16 x float> %590)
  %639 = add nuw nsw i64 %142, %93
  %640 = getelementptr inbounds nuw float, ptr %6, i64 %639
  %641 = load float, ptr %640, align 4
  %642 = insertelement <16 x float> poison, float %641, i32 0
  %643 = shufflevector <16 x float> %642, <16 x float> poison, <16 x i32> zeroinitializer
  %644 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %643, <16 x float> %97, <16 x float> %596)
  %645 = add nuw nsw i64 %151, %93
  %646 = getelementptr inbounds nuw float, ptr %6, i64 %645
  %647 = load float, ptr %646, align 4
  %648 = insertelement <16 x float> poison, float %647, i32 0
  %649 = shufflevector <16 x float> %648, <16 x float> poison, <16 x i32> zeroinitializer
  %650 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %649, <16 x float> %97, <16 x float> %602)
  %651 = add nuw nsw i64 %160, %93
  %652 = getelementptr inbounds nuw float, ptr %6, i64 %651
  %653 = load float, ptr %652, align 4
  %654 = insertelement <16 x float> poison, float %653, i32 0
  %655 = shufflevector <16 x float> %654, <16 x float> poison, <16 x i32> zeroinitializer
  %656 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %655, <16 x float> %97, <16 x float> %608)
  %657 = add nuw nsw i64 %169, %93
  %658 = getelementptr inbounds nuw float, ptr %6, i64 %657
  %659 = load float, ptr %658, align 4
  %660 = insertelement <16 x float> poison, float %659, i32 0
  %661 = shufflevector <16 x float> %660, <16 x float> poison, <16 x i32> zeroinitializer
  %662 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %661, <16 x float> %97, <16 x float> %614)
  %663 = add nuw nsw i64 %178, %93
  %664 = getelementptr inbounds nuw float, ptr %6, i64 %663
  %665 = load float, ptr %664, align 4
  %666 = insertelement <16 x float> poison, float %665, i32 0
  %667 = shufflevector <16 x float> %666, <16 x float> poison, <16 x i32> zeroinitializer
  %668 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %667, <16 x float> %97, <16 x float> %620)
  %669 = add nuw nsw i64 %187, %93
  %670 = getelementptr inbounds nuw float, ptr %6, i64 %669
  %671 = load float, ptr %670, align 4
  %672 = insertelement <16 x float> poison, float %671, i32 0
  %673 = shufflevector <16 x float> %672, <16 x float> poison, <16 x i32> zeroinitializer
  %674 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %673, <16 x float> %97, <16 x float> %626)
  %675 = add nuw nsw i64 %124, %98
  %676 = getelementptr inbounds nuw float, ptr %6, i64 %675
  %677 = load float, ptr %676, align 4
  %678 = insertelement <16 x float> poison, float %677, i32 0
  %679 = shufflevector <16 x float> %678, <16 x float> poison, <16 x i32> zeroinitializer
  %680 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %679, <16 x float> %102, <16 x float> %632)
  %681 = add nuw nsw i64 %133, %98
  %682 = getelementptr inbounds nuw float, ptr %6, i64 %681
  %683 = load float, ptr %682, align 4
  %684 = insertelement <16 x float> poison, float %683, i32 0
  %685 = shufflevector <16 x float> %684, <16 x float> poison, <16 x i32> zeroinitializer
  %686 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %685, <16 x float> %102, <16 x float> %638)
  %687 = add nuw nsw i64 %142, %98
  %688 = getelementptr inbounds nuw float, ptr %6, i64 %687
  %689 = load float, ptr %688, align 4
  %690 = insertelement <16 x float> poison, float %689, i32 0
  %691 = shufflevector <16 x float> %690, <16 x float> poison, <16 x i32> zeroinitializer
  %692 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %691, <16 x float> %102, <16 x float> %644)
  %693 = add nuw nsw i64 %151, %98
  %694 = getelementptr inbounds nuw float, ptr %6, i64 %693
  %695 = load float, ptr %694, align 4
  %696 = insertelement <16 x float> poison, float %695, i32 0
  %697 = shufflevector <16 x float> %696, <16 x float> poison, <16 x i32> zeroinitializer
  %698 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %697, <16 x float> %102, <16 x float> %650)
  %699 = add nuw nsw i64 %160, %98
  %700 = getelementptr inbounds nuw float, ptr %6, i64 %699
  %701 = load float, ptr %700, align 4
  %702 = insertelement <16 x float> poison, float %701, i32 0
  %703 = shufflevector <16 x float> %702, <16 x float> poison, <16 x i32> zeroinitializer
  %704 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %703, <16 x float> %102, <16 x float> %656)
  %705 = add nuw nsw i64 %169, %98
  %706 = getelementptr inbounds nuw float, ptr %6, i64 %705
  %707 = load float, ptr %706, align 4
  %708 = insertelement <16 x float> poison, float %707, i32 0
  %709 = shufflevector <16 x float> %708, <16 x float> poison, <16 x i32> zeroinitializer
  %710 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %709, <16 x float> %102, <16 x float> %662)
  %711 = add nuw nsw i64 %178, %98
  %712 = getelementptr inbounds nuw float, ptr %6, i64 %711
  %713 = load float, ptr %712, align 4
  %714 = insertelement <16 x float> poison, float %713, i32 0
  %715 = shufflevector <16 x float> %714, <16 x float> poison, <16 x i32> zeroinitializer
  %716 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %715, <16 x float> %102, <16 x float> %668)
  %717 = add nuw nsw i64 %187, %98
  %718 = getelementptr inbounds nuw float, ptr %6, i64 %717
  %719 = load float, ptr %718, align 4
  %720 = insertelement <16 x float> poison, float %719, i32 0
  %721 = shufflevector <16 x float> %720, <16 x float> poison, <16 x i32> zeroinitializer
  %722 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %721, <16 x float> %102, <16 x float> %674)
  %723 = add nuw nsw i64 %124, %103
  %724 = getelementptr inbounds nuw float, ptr %6, i64 %723
  %725 = load float, ptr %724, align 4
  %726 = insertelement <16 x float> poison, float %725, i32 0
  %727 = shufflevector <16 x float> %726, <16 x float> poison, <16 x i32> zeroinitializer
  %728 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %727, <16 x float> %107, <16 x float> %680)
  %729 = add nuw nsw i64 %133, %103
  %730 = getelementptr inbounds nuw float, ptr %6, i64 %729
  %731 = load float, ptr %730, align 4
  %732 = insertelement <16 x float> poison, float %731, i32 0
  %733 = shufflevector <16 x float> %732, <16 x float> poison, <16 x i32> zeroinitializer
  %734 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %733, <16 x float> %107, <16 x float> %686)
  %735 = add nuw nsw i64 %142, %103
  %736 = getelementptr inbounds nuw float, ptr %6, i64 %735
  %737 = load float, ptr %736, align 4
  %738 = insertelement <16 x float> poison, float %737, i32 0
  %739 = shufflevector <16 x float> %738, <16 x float> poison, <16 x i32> zeroinitializer
  %740 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %739, <16 x float> %107, <16 x float> %692)
  %741 = add nuw nsw i64 %151, %103
  %742 = getelementptr inbounds nuw float, ptr %6, i64 %741
  %743 = load float, ptr %742, align 4
  %744 = insertelement <16 x float> poison, float %743, i32 0
  %745 = shufflevector <16 x float> %744, <16 x float> poison, <16 x i32> zeroinitializer
  %746 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %745, <16 x float> %107, <16 x float> %698)
  %747 = add nuw nsw i64 %160, %103
  %748 = getelementptr inbounds nuw float, ptr %6, i64 %747
  %749 = load float, ptr %748, align 4
  %750 = insertelement <16 x float> poison, float %749, i32 0
  %751 = shufflevector <16 x float> %750, <16 x float> poison, <16 x i32> zeroinitializer
  %752 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %751, <16 x float> %107, <16 x float> %704)
  %753 = add nuw nsw i64 %169, %103
  %754 = getelementptr inbounds nuw float, ptr %6, i64 %753
  %755 = load float, ptr %754, align 4
  %756 = insertelement <16 x float> poison, float %755, i32 0
  %757 = shufflevector <16 x float> %756, <16 x float> poison, <16 x i32> zeroinitializer
  %758 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %757, <16 x float> %107, <16 x float> %710)
  %759 = add nuw nsw i64 %178, %103
  %760 = getelementptr inbounds nuw float, ptr %6, i64 %759
  %761 = load float, ptr %760, align 4
  %762 = insertelement <16 x float> poison, float %761, i32 0
  %763 = shufflevector <16 x float> %762, <16 x float> poison, <16 x i32> zeroinitializer
  %764 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %763, <16 x float> %107, <16 x float> %716)
  %765 = add nuw nsw i64 %187, %103
  %766 = getelementptr inbounds nuw float, ptr %6, i64 %765
  %767 = load float, ptr %766, align 4
  %768 = insertelement <16 x float> poison, float %767, i32 0
  %769 = shufflevector <16 x float> %768, <16 x float> poison, <16 x i32> zeroinitializer
  %770 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %769, <16 x float> %107, <16 x float> %722)
  %771 = add nuw nsw i64 %124, %108
  %772 = getelementptr inbounds nuw float, ptr %6, i64 %771
  %773 = load float, ptr %772, align 4
  %774 = insertelement <16 x float> poison, float %773, i32 0
  %775 = shufflevector <16 x float> %774, <16 x float> poison, <16 x i32> zeroinitializer
  %776 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %775, <16 x float> %112, <16 x float> %728)
  %777 = add nuw nsw i64 %133, %108
  %778 = getelementptr inbounds nuw float, ptr %6, i64 %777
  %779 = load float, ptr %778, align 4
  %780 = insertelement <16 x float> poison, float %779, i32 0
  %781 = shufflevector <16 x float> %780, <16 x float> poison, <16 x i32> zeroinitializer
  %782 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %781, <16 x float> %112, <16 x float> %734)
  %783 = add nuw nsw i64 %142, %108
  %784 = getelementptr inbounds nuw float, ptr %6, i64 %783
  %785 = load float, ptr %784, align 4
  %786 = insertelement <16 x float> poison, float %785, i32 0
  %787 = shufflevector <16 x float> %786, <16 x float> poison, <16 x i32> zeroinitializer
  %788 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %787, <16 x float> %112, <16 x float> %740)
  %789 = add nuw nsw i64 %151, %108
  %790 = getelementptr inbounds nuw float, ptr %6, i64 %789
  %791 = load float, ptr %790, align 4
  %792 = insertelement <16 x float> poison, float %791, i32 0
  %793 = shufflevector <16 x float> %792, <16 x float> poison, <16 x i32> zeroinitializer
  %794 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %793, <16 x float> %112, <16 x float> %746)
  %795 = add nuw nsw i64 %160, %108
  %796 = getelementptr inbounds nuw float, ptr %6, i64 %795
  %797 = load float, ptr %796, align 4
  %798 = insertelement <16 x float> poison, float %797, i32 0
  %799 = shufflevector <16 x float> %798, <16 x float> poison, <16 x i32> zeroinitializer
  %800 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %799, <16 x float> %112, <16 x float> %752)
  %801 = add nuw nsw i64 %169, %108
  %802 = getelementptr inbounds nuw float, ptr %6, i64 %801
  %803 = load float, ptr %802, align 4
  %804 = insertelement <16 x float> poison, float %803, i32 0
  %805 = shufflevector <16 x float> %804, <16 x float> poison, <16 x i32> zeroinitializer
  %806 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %805, <16 x float> %112, <16 x float> %758)
  %807 = add nuw nsw i64 %178, %108
  %808 = getelementptr inbounds nuw float, ptr %6, i64 %807
  %809 = load float, ptr %808, align 4
  %810 = insertelement <16 x float> poison, float %809, i32 0
  %811 = shufflevector <16 x float> %810, <16 x float> poison, <16 x i32> zeroinitializer
  %812 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %811, <16 x float> %112, <16 x float> %764)
  %813 = add nuw nsw i64 %187, %108
  %814 = getelementptr inbounds nuw float, ptr %6, i64 %813
  %815 = load float, ptr %814, align 4
  %816 = insertelement <16 x float> poison, float %815, i32 0
  %817 = shufflevector <16 x float> %816, <16 x float> poison, <16 x i32> zeroinitializer
  %818 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %817, <16 x float> %112, <16 x float> %770)
  %819 = add nuw nsw i64 %124, %113
  %820 = getelementptr inbounds nuw float, ptr %6, i64 %819
  %821 = load float, ptr %820, align 4
  %822 = insertelement <16 x float> poison, float %821, i32 0
  %823 = shufflevector <16 x float> %822, <16 x float> poison, <16 x i32> zeroinitializer
  %824 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %823, <16 x float> %117, <16 x float> %776)
  %825 = add nuw nsw i64 %133, %113
  %826 = getelementptr inbounds nuw float, ptr %6, i64 %825
  %827 = load float, ptr %826, align 4
  %828 = insertelement <16 x float> poison, float %827, i32 0
  %829 = shufflevector <16 x float> %828, <16 x float> poison, <16 x i32> zeroinitializer
  %830 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %829, <16 x float> %117, <16 x float> %782)
  %831 = add nuw nsw i64 %142, %113
  %832 = getelementptr inbounds nuw float, ptr %6, i64 %831
  %833 = load float, ptr %832, align 4
  %834 = insertelement <16 x float> poison, float %833, i32 0
  %835 = shufflevector <16 x float> %834, <16 x float> poison, <16 x i32> zeroinitializer
  %836 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %835, <16 x float> %117, <16 x float> %788)
  %837 = add nuw nsw i64 %151, %113
  %838 = getelementptr inbounds nuw float, ptr %6, i64 %837
  %839 = load float, ptr %838, align 4
  %840 = insertelement <16 x float> poison, float %839, i32 0
  %841 = shufflevector <16 x float> %840, <16 x float> poison, <16 x i32> zeroinitializer
  %842 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %841, <16 x float> %117, <16 x float> %794)
  %843 = add nuw nsw i64 %160, %113
  %844 = getelementptr inbounds nuw float, ptr %6, i64 %843
  %845 = load float, ptr %844, align 4
  %846 = insertelement <16 x float> poison, float %845, i32 0
  %847 = shufflevector <16 x float> %846, <16 x float> poison, <16 x i32> zeroinitializer
  %848 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %847, <16 x float> %117, <16 x float> %800)
  %849 = add nuw nsw i64 %169, %113
  %850 = getelementptr inbounds nuw float, ptr %6, i64 %849
  %851 = load float, ptr %850, align 4
  %852 = insertelement <16 x float> poison, float %851, i32 0
  %853 = shufflevector <16 x float> %852, <16 x float> poison, <16 x i32> zeroinitializer
  %854 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %853, <16 x float> %117, <16 x float> %806)
  %855 = add nuw nsw i64 %178, %113
  %856 = getelementptr inbounds nuw float, ptr %6, i64 %855
  %857 = load float, ptr %856, align 4
  %858 = insertelement <16 x float> poison, float %857, i32 0
  %859 = shufflevector <16 x float> %858, <16 x float> poison, <16 x i32> zeroinitializer
  %860 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %859, <16 x float> %117, <16 x float> %812)
  %861 = add nuw nsw i64 %187, %113
  %862 = getelementptr inbounds nuw float, ptr %6, i64 %861
  %863 = load float, ptr %862, align 4
  %864 = insertelement <16 x float> poison, float %863, i32 0
  %865 = shufflevector <16 x float> %864, <16 x float> poison, <16 x i32> zeroinitializer
  %866 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %865, <16 x float> %117, <16 x float> %818)
  %867 = add nuw nsw i64 %124, %118
  %868 = getelementptr inbounds nuw float, ptr %6, i64 %867
  %869 = load float, ptr %868, align 4
  %870 = insertelement <16 x float> poison, float %869, i32 0
  %871 = shufflevector <16 x float> %870, <16 x float> poison, <16 x i32> zeroinitializer
  %872 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %871, <16 x float> %122, <16 x float> %824)
  %873 = add nuw nsw i64 %133, %118
  %874 = getelementptr inbounds nuw float, ptr %6, i64 %873
  %875 = load float, ptr %874, align 4
  %876 = insertelement <16 x float> poison, float %875, i32 0
  %877 = shufflevector <16 x float> %876, <16 x float> poison, <16 x i32> zeroinitializer
  %878 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %877, <16 x float> %122, <16 x float> %830)
  %879 = add nuw nsw i64 %142, %118
  %880 = getelementptr inbounds nuw float, ptr %6, i64 %879
  %881 = load float, ptr %880, align 4
  %882 = insertelement <16 x float> poison, float %881, i32 0
  %883 = shufflevector <16 x float> %882, <16 x float> poison, <16 x i32> zeroinitializer
  %884 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %883, <16 x float> %122, <16 x float> %836)
  %885 = add nuw nsw i64 %151, %118
  %886 = getelementptr inbounds nuw float, ptr %6, i64 %885
  %887 = load float, ptr %886, align 4
  %888 = insertelement <16 x float> poison, float %887, i32 0
  %889 = shufflevector <16 x float> %888, <16 x float> poison, <16 x i32> zeroinitializer
  %890 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %889, <16 x float> %122, <16 x float> %842)
  %891 = add nuw nsw i64 %160, %118
  %892 = getelementptr inbounds nuw float, ptr %6, i64 %891
  %893 = load float, ptr %892, align 4
  %894 = insertelement <16 x float> poison, float %893, i32 0
  %895 = shufflevector <16 x float> %894, <16 x float> poison, <16 x i32> zeroinitializer
  %896 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %895, <16 x float> %122, <16 x float> %848)
  %897 = add nuw nsw i64 %169, %118
  %898 = getelementptr inbounds nuw float, ptr %6, i64 %897
  %899 = load float, ptr %898, align 4
  %900 = insertelement <16 x float> poison, float %899, i32 0
  %901 = shufflevector <16 x float> %900, <16 x float> poison, <16 x i32> zeroinitializer
  %902 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %901, <16 x float> %122, <16 x float> %854)
  %903 = add nuw nsw i64 %178, %118
  %904 = getelementptr inbounds nuw float, ptr %6, i64 %903
  %905 = load float, ptr %904, align 4
  %906 = insertelement <16 x float> poison, float %905, i32 0
  %907 = shufflevector <16 x float> %906, <16 x float> poison, <16 x i32> zeroinitializer
  %908 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %907, <16 x float> %122, <16 x float> %860)
  %909 = add nuw nsw i64 %187, %118
  %910 = getelementptr inbounds nuw float, ptr %6, i64 %909
  %911 = load float, ptr %910, align 4
  %912 = insertelement <16 x float> poison, float %911, i32 0
  %913 = shufflevector <16 x float> %912, <16 x float> poison, <16 x i32> zeroinitializer
  %914 = call <16 x float> @llvm.fmuladd.v16f32(<16 x float> %913, <16 x float> %122, <16 x float> %866)
  %915 = insertvalue [8 x <16 x float>] poison, <16 x float> %872, 0
  %916 = insertvalue [8 x <16 x float>] %915, <16 x float> %878, 1
  %917 = insertvalue [8 x <16 x float>] %916, <16 x float> %884, 2
  %918 = insertvalue [8 x <16 x float>] %917, <16 x float> %890, 3
  %919 = insertvalue [8 x <16 x float>] %918, <16 x float> %896, 4
  %920 = insertvalue [8 x <16 x float>] %919, <16 x float> %902, 5
  %921 = insertvalue [8 x <16 x float>] %920, <16 x float> %908, 6
  %922 = insertvalue [8 x <16 x float>] %921, <16 x float> %914, 7
  %923 = add i64 %40, 16, !dbg !88
  br label %39, !dbg !88

924:                                              ; preds = %39
  %925 = extractvalue [8 x <16 x float>] %41, 0, !dbg !88
  %926 = add i64 %29, %32, !dbg !88
  %927 = mul i64 %926, 128, !dbg !88
  %928 = add i64 %927, %38, !dbg !88
  %929 = getelementptr float, ptr %14, i64 %928, !dbg !88
  store <16 x float> %925, ptr %929, align 4, !dbg !88
  %930 = add i64 %32, 1, !dbg !88
  %931 = extractvalue [8 x <16 x float>] %41, 1, !dbg !88
  %932 = add i64 %29, %930, !dbg !88
  %933 = mul i64 %932, 128, !dbg !88
  %934 = add i64 %933, %38, !dbg !88
  %935 = getelementptr float, ptr %14, i64 %934, !dbg !88
  store <16 x float> %931, ptr %935, align 4, !dbg !88
  %936 = add i64 %32, 2, !dbg !88
  %937 = extractvalue [8 x <16 x float>] %41, 2, !dbg !88
  %938 = add i64 %29, %936, !dbg !88
  %939 = mul i64 %938, 128, !dbg !88
  %940 = add i64 %939, %38, !dbg !88
  %941 = getelementptr float, ptr %14, i64 %940, !dbg !88
  store <16 x float> %937, ptr %941, align 4, !dbg !88
  %942 = add i64 %32, 3, !dbg !88
  %943 = extractvalue [8 x <16 x float>] %41, 3, !dbg !88
  %944 = add i64 %29, %942, !dbg !88
  %945 = mul i64 %944, 128, !dbg !88
  %946 = add i64 %945, %38, !dbg !88
  %947 = getelementptr float, ptr %14, i64 %946, !dbg !88
  store <16 x float> %943, ptr %947, align 4, !dbg !88
  %948 = add i64 %32, 4, !dbg !88
  %949 = extractvalue [8 x <16 x float>] %41, 4, !dbg !88
  %950 = add i64 %29, %948, !dbg !88
  %951 = mul i64 %950, 128, !dbg !88
  %952 = add i64 %951, %38, !dbg !88
  %953 = getelementptr float, ptr %14, i64 %952, !dbg !88
  store <16 x float> %949, ptr %953, align 4, !dbg !88
  %954 = add i64 %32, 5, !dbg !88
  %955 = extractvalue [8 x <16 x float>] %41, 5, !dbg !88
  %956 = add i64 %29, %954, !dbg !88
  %957 = mul i64 %956, 128, !dbg !88
  %958 = add i64 %957, %38, !dbg !88
  %959 = getelementptr float, ptr %14, i64 %958, !dbg !88
  store <16 x float> %955, ptr %959, align 4, !dbg !88
  %960 = add i64 %32, 6, !dbg !88
  %961 = extractvalue [8 x <16 x float>] %41, 6, !dbg !88
  %962 = add i64 %29, %960, !dbg !88
  %963 = mul i64 %962, 128, !dbg !88
  %964 = add i64 %963, %38, !dbg !88
  %965 = getelementptr float, ptr %14, i64 %964, !dbg !88
  store <16 x float> %961, ptr %965, align 4, !dbg !88
  %966 = add i64 %32, 7, !dbg !88
  %967 = extractvalue [8 x <16 x float>] %41, 7, !dbg !88
  %968 = add i64 %29, %966, !dbg !88
  %969 = mul i64 %968, 128, !dbg !88
  %970 = add i64 %969, %38, !dbg !88
  %971 = getelementptr float, ptr %14, i64 %970, !dbg !88
  store <16 x float> %967, ptr %971, align 4, !dbg !88
  %972 = add i64 %35, 16, !dbg !88
  br label %34, !dbg !88

973:                                              ; preds = %34
  %974 = add i64 %32, 8, !dbg !88
  br label %31, !dbg !88

975:                                              ; preds = %31
  ret i32 0, !dbg !89
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
  store i16 %36, ptr %2, align 4, !tbaa !90
  %37 = load float, ptr %2, align 4, !tbaa !92
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
  store i16 %37, ptr %2, align 4, !tbaa !90
  %38 = load float, ptr %2, align 4, !tbaa !92
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
  store volatile float %5, ptr %3, align 4, !tbaa !92
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !92
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

; Function Attrs: inlinehint
define hidden float @expf(float noundef %0) local_unnamed_addr #7 {
  %2 = fpext float %0 to double
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 20
  %5 = and i32 %4, 2047
  %.not = icmp samesign ult i32 %5, 1067
  br i1 %.not, label %19, label %6, !prof !94

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
  %20 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 296), align 8, !tbaa !95
  %21 = fmul double %20, %2
  %22 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 288), align 8, !tbaa !98
  %23 = fadd double %21, %22
  %24 = bitcast double %23 to i64
  %25 = fsub double %23, %22
  %26 = fsub double %21, %25
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %27
  %29 = load i64, ptr %28, align 8, !tbaa !99
  %30 = shl i64 %24, 47
  %31 = add i64 %30, %29
  %32 = bitcast i64 %31 to double
  %33 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 304), align 8, !tbaa !101
  %34 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 312), align 8, !tbaa !101
  %35 = tail call double @llvm.fmuladd.f64(double %33, double %26, double %34)
  %36 = fmul double %26, %26
  %37 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 320), align 8, !tbaa !101
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
  store volatile float %2, ptr %4, align 4, !tbaa !92
  %.0..0..0..0.5 = load volatile float, ptr %4, align 4, !tbaa !92
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
  br i1 %or.cond99, label %.critedge, label %73, !prof !102

.critedge:                                        ; preds = %2
  %10 = add i32 %.pre, -1
  %11 = icmp ult i32 %10, -16777217
  br i1 %11, label %28, label %12, !prof !94

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
  br i1 %31, label %47, label %32, !prof !94

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
  store volatile float %46, ptr %3, align 4, !tbaa !92
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !92
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
  %82 = load double, ptr %81, align 8, !tbaa !103
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 8
  %84 = load double, ptr %83, align 8, !tbaa !105
  %85 = bitcast i32 %78 to float
  %86 = fpext float %85 to double
  %87 = tail call double @llvm.fmuladd.f64(double %86, double %82, double -1.000000e+00)
  %88 = sitofp i32 %79 to double
  %89 = fadd double %84, %88
  %90 = fmul double %87, %87
  %91 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 256), align 8, !tbaa !101
  %92 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 264), align 8, !tbaa !101
  %93 = tail call double @llvm.fmuladd.f64(double %91, double %87, double %92)
  %94 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 272), align 8, !tbaa !101
  %95 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 280), align 8, !tbaa !101
  %96 = tail call double @llvm.fmuladd.f64(double %94, double %87, double %95)
  %97 = fmul double %90, %90
  %98 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 288), align 8, !tbaa !101
  %99 = tail call double @llvm.fmuladd.f64(double %98, double %87, double %89)
  %100 = tail call double @llvm.fmuladd.f64(double %96, double %90, double %99)
  %101 = tail call double @llvm.fmuladd.f64(double %93, double %97, double %100)
  %102 = fpext float %1 to double
  %103 = fmul double %101, %102
  %104 = bitcast double %103 to i64
  %105 = and i64 %104, 9223231299366420480
  %106 = icmp samesign ugt i64 %105, 4638426141214900224
  br i1 %106, label %107, label %115, !prof !106

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
  %116 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 256), align 8, !tbaa !107
  %117 = fadd double %103, %116
  %118 = bitcast double %117 to i64
  %119 = fsub double %117, %116
  %120 = fsub double %103, %119
  %121 = and i64 %118, 31
  %122 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %121
  %123 = load i64, ptr %122, align 8, !tbaa !99
  %124 = zext nneg i32 %.050 to i64
  %125 = add i64 %118, %124
  %126 = shl i64 %125, 47
  %127 = add i64 %126, %123
  %128 = bitcast i64 %127 to double
  %129 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 264), align 8, !tbaa !101
  %130 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 272), align 8, !tbaa !101
  %131 = tail call double @llvm.fmuladd.f64(double %129, double %120, double %130)
  %132 = fmul double %120, %120
  %133 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 280), align 8, !tbaa !101
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
!95 = !{!96, !97, i64 296}
!96 = !{!"exp2f_data", !7, i64 0, !97, i64 256, !7, i64 264, !97, i64 288, !97, i64 296, !7, i64 304}
!97 = !{!"double", !7, i64 0}
!98 = !{!96, !97, i64 288}
!99 = !{!100, !100, i64 0}
!100 = !{!"long", !7, i64 0}
!101 = !{!97, !97, i64 0}
!102 = !{!"branch_weights", i32 4001, i32 4000000}
!103 = !{!104, !97, i64 0}
!104 = !{!"", !97, i64 0, !97, i64 8}
!105 = !{!104, !97, i64 8}
!106 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!107 = !{!96, !97, i64 256}
