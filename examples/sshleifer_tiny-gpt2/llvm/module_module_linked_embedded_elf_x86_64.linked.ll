; ModuleID = 'module_linked'
source_filename = "module_linked"
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

@__constant_2xf32_0 = private constant [2 x float] [float 1.000000e+00, float 1.000000e+00], align 64
@__constant_2xf32 = private constant [2 x float] zeroinitializer, align 64
@__constant_2x6xf32 = private constant [2 x [6 x float]] [[6 x float] [float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000], [6 x float] [float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000]], align 64
@__constant_6xf32 = private constant [6 x float] zeroinitializer, align 64
@__constant_2x2xf32 = private constant [2 x [2 x float]] [[2 x float] [float 0xBF554C1F60000000, float 0xBF53D82280000000], [2 x float] [float 0xBFAD403A40000000, float 0xBF97FF8520000000]], align 64
@__constant_2xf32_1 = private constant [2 x float] zeroinitializer, align 64
@__constant_2xf32_0_0 = private constant [2 x float] [float 1.000000e+00, float 1.000000e+00], align 64
@__constant_2xf32_2 = private constant [2 x float] zeroinitializer, align 64
@__constant_2x8xf32 = private constant [2 x [8 x float]] [[8 x float] [float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000], [8 x float] [float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000]], align 64
@__constant_8xf32 = private constant [8 x float] zeroinitializer, align 64
@__constant_8x2xf32 = private constant [8 x [2 x float]] [[2 x float] [float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000], [2 x float] [float 0xBF712326E0000000, float 0x3F82E7E1A0000000], [2 x float] [float 0xBF515CA0C0000000, float 0x3F9871AA00000000], [2 x float] [float 0x3F817F4E40000000, float 0x3F45818120000000], [2 x float] [float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000], [2 x float] [float 0xBF73016300000000, float 0x3FA6574200000000], [2 x float] [float 0x3F95E146E0000000, float 0x3F710DFE80000000], [2 x float] [float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000]], align 64
@__constant_2xf32_3 = private constant [2 x float] zeroinitializer, align 64
@__constant_2xf32_0_1 = private constant [2 x float] [float 1.000000e+00, float 1.000000e+00], align 64
@__constant_2xf32_4 = private constant [2 x float] zeroinitializer, align 64
@__constant_2x6xf32_0 = private constant [2 x [6 x float]] [[6 x float] [float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000], [6 x float] [float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000]], align 64
@__constant_6xf32_0 = private constant [6 x float] zeroinitializer, align 64
@__constant_2x2xf32_0 = private constant [2 x [2 x float]] [[2 x float] [float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000], [2 x float] [float 0x3F92D937E0000000, float 0xBF95926AA0000000]], align 64
@__constant_2xf32_5 = private constant [2 x float] zeroinitializer, align 64
@__constant_2xf32_0_2 = private constant [2 x float] [float 1.000000e+00, float 1.000000e+00], align 64
@__constant_2xf32_6 = private constant [2 x float] zeroinitializer, align 64
@__constant_2x8xf32_0 = private constant [2 x [8 x float]] [[8 x float] [float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000], [8 x float] [float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000]], align 64
@__constant_8xf32_0 = private constant [8 x float] zeroinitializer, align 64
@__constant_8x2xf32_0 = private constant [8 x [2 x float]] [[2 x float] [float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000], [2 x float] [float 0x3F498B8800000000, float 0xBF8DA57520000000], [2 x float] [float 0xBF8DCA4920000000, float 0xBF8A0AF260000000], [2 x float] [float 0xBF804CCA80000000, float 0xBF938889E0000000], [2 x float] [float 0x3FA32CDF60000000, float 0x3F84A29EC0000000], [2 x float] [float 0x3F83746E60000000, float 0xBF81ED3BA0000000], [2 x float] [float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000], [2 x float] [float 0xBF8D895D40000000, float 0x3F5C295820000000]], align 64
@__constant_2xf32_7 = private constant [2 x float] zeroinitializer, align 64
@__constant_2xf32_0_3 = private constant [2 x float] [float 1.000000e+00, float 1.000000e+00], align 64
@__constant_2xf32_8 = private constant [2 x float] zeroinitializer, align 64
@0 = private constant [14 x i8] c"module_linked\00", align 1
@iree_hal_executable_library_query_v0_header = private constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = private constant [17 x ptr] [ptr @"main$async_dispatch_0_elementwise_16x2_i64xf32xf32", ptr @"main$async_dispatch_1_reduction_16x2_f32", ptr @"main$async_dispatch_2_reduction_16x2_f32", ptr @"main$async_dispatch_3_matmul_16x6x2_f32", ptr @"main$async_dispatch_4_attention_2x16x16", ptr @"main$async_dispatch_5_matmul_16x2x2_f32", ptr @"main$async_dispatch_7_reduction_16x2_f32", ptr @"main$async_dispatch_8_matmul_16x8x2_f32", ptr @"main$async_dispatch_9_matmul_16x2x8_f32", ptr @"main$async_dispatch_11_reduction_16x2_f32", ptr @"main$async_dispatch_12_matmul_16x6x2_f32", ptr @"main$async_dispatch_14_matmul_16x2x2_f32", ptr @"main$async_dispatch_16_reduction_16x2_f32", ptr @"main$async_dispatch_17_matmul_16x8x2_f32", ptr @"main$async_dispatch_18_matmul_16x2x8_f32", ptr @"main$async_dispatch_20_reduction_16x2_f32", ptr @"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"]
@iree_hal_executable_library_query_v0_attrs = private constant [17 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 2, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = private constant [51 x i8] c"main$async_dispatch_0_elementwise_16x2_i64xf32xf32\00", align 1
@2 = private constant [41 x i8] c"main$async_dispatch_1_reduction_16x2_f32\00", align 1
@3 = private constant [41 x i8] c"main$async_dispatch_2_reduction_16x2_f32\00", align 1
@4 = private constant [40 x i8] c"main$async_dispatch_3_matmul_16x6x2_f32\00", align 1
@5 = private constant [40 x i8] c"main$async_dispatch_4_attention_2x16x16\00", align 1
@6 = private constant [40 x i8] c"main$async_dispatch_5_matmul_16x2x2_f32\00", align 1
@7 = private constant [41 x i8] c"main$async_dispatch_7_reduction_16x2_f32\00", align 1
@8 = private constant [40 x i8] c"main$async_dispatch_8_matmul_16x8x2_f32\00", align 1
@9 = private constant [40 x i8] c"main$async_dispatch_9_matmul_16x2x8_f32\00", align 1
@10 = private constant [42 x i8] c"main$async_dispatch_11_reduction_16x2_f32\00", align 1
@11 = private constant [41 x i8] c"main$async_dispatch_12_matmul_16x6x2_f32\00", align 1
@12 = private constant [41 x i8] c"main$async_dispatch_14_matmul_16x2x2_f32\00", align 1
@13 = private constant [42 x i8] c"main$async_dispatch_16_reduction_16x2_f32\00", align 1
@14 = private constant [41 x i8] c"main$async_dispatch_17_matmul_16x8x2_f32\00", align 1
@15 = private constant [41 x i8] c"main$async_dispatch_18_matmul_16x2x8_f32\00", align 1
@16 = private constant [42 x i8] c"main$async_dispatch_20_reduction_16x2_f32\00", align 1
@17 = private constant [53 x i8] c"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32\00", align 1
@iree_hal_executable_library_query_v0_names = private constant [17 x ptr] [ptr @1, ptr @2, ptr @3, ptr @4, ptr @5, ptr @6, ptr @7, ptr @8, ptr @9, ptr @10, ptr @11, ptr @12, ptr @13, ptr @14, ptr @15, ptr @16, ptr @17]
@18 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_0.mlir\00", align 1
@19 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_1.mlir\00", align 1
@20 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_2.mlir\00", align 1
@21 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_3.mlir\00", align 1
@22 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_4.mlir\00", align 1
@23 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_5.mlir\00", align 1
@24 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_7.mlir\00", align 1
@25 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_8.mlir\00", align 1
@26 = private constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_9.mlir\00", align 1
@27 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_11.mlir\00", align 1
@28 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_12.mlir\00", align 1
@29 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_14.mlir\00", align 1
@30 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_16.mlir\00", align 1
@31 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_17.mlir\00", align 1
@32 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_18.mlir\00", align 1
@33 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_20.mlir\00", align 1
@34 = private constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_21.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = private constant [17 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @18 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @19 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @20 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @21 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @22 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @23 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @24 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @25 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @26 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @27 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @28 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @29 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @30 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @31 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @32 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @33 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @34 }]
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names" = private constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations" = private constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = private constant [17 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations" }]
@iree_hal_executable_library_query_v0 = private constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 17, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = hidden local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = hidden local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

define internal i32 @"main$async_dispatch_0_elementwise_16x2_i64xf32xf32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !41 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !117
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !117
  %6 = load ptr, ptr %5, align 8, !dbg !117
  %7 = getelementptr float, ptr %6, i64 100560, !dbg !117
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !117
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !118
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !118
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !118
  %11 = load ptr, ptr %10, align 8, !dbg !118
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !118
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !119
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !119
  %14 = load ptr, ptr %13, align 8, !dbg !119
  call void @llvm.assume(i1 true) [ "align"(ptr %14, i64 64) ], !dbg !119
  %15 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !120
  %16 = extractvalue %iree_hal_executable_dispatch_state_v0_t %15, 10, !dbg !120
  %17 = getelementptr ptr, ptr %16, i32 2, !dbg !120
  %18 = load ptr, ptr %17, align 8, !dbg !120
  call void @llvm.assume(i1 true) [ "align"(ptr %18, i64 64) ], !dbg !120
  br label %19, !dbg !121

19:                                               ; preds = %22, %3
  %20 = phi i64 [ %72, %22 ], [ 0, %3 ], !dbg !121
  %21 = icmp slt i64 %20, 16, !dbg !121
  br i1 %21, label %22, label %73, !dbg !121

22:                                               ; preds = %19
  %23 = getelementptr i64, ptr %11, i64 %20, !dbg !121
  %24 = load <1 x i64>, ptr %23, align 8, !dbg !121
  %25 = mul i64 %20, 2, !dbg !121
  %26 = add i64 %25, 0, !dbg !121
  %27 = getelementptr float, ptr %14, i64 %26, !dbg !121
  %28 = load <2 x float>, ptr %27, align 4, !dbg !121
  %29 = mul <1 x i64> %24, splat (i64 2), !dbg !122
  %30 = extractelement <1 x i64> %29, i64 0, !dbg !122
  %31 = insertelement <2 x i64> poison, i64 %30, i32 0, !dbg !122
  %32 = shufflevector <2 x i64> %31, <2 x i64> poison, <2 x i32> zeroinitializer, !dbg !122
  %33 = add <2 x i64> %32, <i64 0, i64 1>, !dbg !122
  %34 = extractelement <2 x i64> %33, i64 0, !dbg !122
  %35 = sdiv i64 %34, 2, !dbg !122
  %36 = mul i64 %35, 2, !dbg !122
  %37 = icmp ne i64 %34, %36, !dbg !122
  %38 = icmp slt i64 %34, 0, !dbg !122
  %39 = and i1 %37, %38, !dbg !122
  %40 = add i64 %35, -1, !dbg !122
  %41 = select i1 %39, i64 %40, i64 %35, !dbg !122
  %42 = srem i64 %34, 2, !dbg !122
  %43 = icmp slt i64 %42, 0, !dbg !122
  %44 = add nsw i64 %42, 2, !dbg !122
  %45 = select i1 %43, i64 %44, i64 %42, !dbg !122
  %46 = mul i64 %41, 2, !dbg !122
  %47 = add i64 %46, %45, !dbg !122
  %48 = getelementptr float, ptr %7, i64 %47, !dbg !122
  %49 = load <1 x float>, ptr %48, align 4, !dbg !122
  %50 = extractelement <1 x float> %49, i64 0, !dbg !122
  %51 = extractelement <2 x i64> %33, i64 1, !dbg !122
  %52 = sdiv i64 %51, 2, !dbg !122
  %53 = mul i64 %52, 2, !dbg !122
  %54 = icmp ne i64 %51, %53, !dbg !122
  %55 = icmp slt i64 %51, 0, !dbg !122
  %56 = and i1 %54, %55, !dbg !122
  %57 = add i64 %52, -1, !dbg !122
  %58 = select i1 %56, i64 %57, i64 %52, !dbg !122
  %59 = srem i64 %51, 2, !dbg !122
  %60 = icmp slt i64 %59, 0, !dbg !122
  %61 = add nsw i64 %59, 2, !dbg !122
  %62 = select i1 %60, i64 %61, i64 %59, !dbg !122
  %63 = mul i64 %58, 2, !dbg !122
  %64 = add i64 %63, %62, !dbg !122
  %65 = getelementptr float, ptr %7, i64 %64, !dbg !122
  %66 = load <1 x float>, ptr %65, align 4, !dbg !122
  %67 = extractelement <1 x float> %66, i64 0, !dbg !122
  %68 = insertelement <2 x float> poison, float %50, i64 0, !dbg !123
  %69 = insertelement <2 x float> %68, float %67, i64 1, !dbg !123
  %70 = fadd contract <2 x float> %69, %28, !dbg !123
  %71 = getelementptr float, ptr %18, i64 %26, !dbg !121
  store <2 x float> %70, ptr %71, align 4, !dbg !121
  %72 = add i64 %20, 1, !dbg !121
  br label %19, !dbg !121

73:                                               ; preds = %19
  ret i32 0, !dbg !124
}

define internal i32 @"main$async_dispatch_1_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !125 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !126
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 9, !dbg !126
  %6 = load i32, ptr %5, align 4, !dbg !126
  %7 = getelementptr i32, ptr %5, i32 1, !dbg !127
  %8 = load i32, ptr %7, align 4, !dbg !127
  %9 = zext i32 %6 to i64, !dbg !128
  %10 = zext i32 %8 to i64, !dbg !129
  %11 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !130
  %12 = load ptr, ptr %11, align 8, !dbg !130
  %13 = mul i64 %9, 8, !dbg !130
  %14 = udiv i64 %13, 32, !dbg !130
  %15 = getelementptr float, ptr %12, i64 %14, !dbg !130
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !130
  %16 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !131
  %17 = extractvalue %iree_hal_executable_dispatch_state_v0_t %16, 10, !dbg !131
  %18 = getelementptr ptr, ptr %17, i32 1, !dbg !131
  %19 = load ptr, ptr %18, align 8, !dbg !131
  %20 = mul i64 %10, 8, !dbg !131
  %21 = udiv i64 %20, 32, !dbg !131
  %22 = getelementptr float, ptr %19, i64 %21, !dbg !131
  call void @llvm.assume(i1 true) [ "align"(ptr %22, i64 64) ], !dbg !131
  %23 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !132
  %24 = extractvalue %iree_hal_executable_workgroup_state_v0_t %23, 0, !dbg !132
  %25 = zext i32 %24 to i64, !dbg !132
  %26 = mul nsw i64 %25, 2, !dbg !132
  %27 = mul i64 %26, 2, !dbg !132
  %28 = add i64 %27, 0, !dbg !132
  %29 = getelementptr float, ptr %15, i64 %28, !dbg !132
  %30 = load <2 x float>, ptr %29, align 4, !dbg !132
  %31 = add i64 %26, 1, !dbg !132
  %32 = mul i64 %31, 2, !dbg !132
  %33 = add i64 %32, 0, !dbg !132
  %34 = getelementptr float, ptr %15, i64 %33, !dbg !132
  %35 = load <2 x float>, ptr %34, align 4, !dbg !132
  %36 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %30), !dbg !133
  %37 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %35), !dbg !133
  %38 = insertelement <2 x float> poison, float %36, i64 0, !dbg !133
  %39 = insertelement <2 x float> %38, float %37, i64 1, !dbg !133
  %40 = fdiv <2 x float> %39, splat (float 2.000000e+00), !dbg !134
  %41 = shufflevector <2 x float> %40, <2 x float> %40, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !134
  %42 = shufflevector <4 x float> %41, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !134
  %43 = shufflevector <4 x float> %41, <4 x float> %42, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !134
  %44 = shufflevector <4 x float> %43, <4 x float> %43, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !134
  %45 = shufflevector <4 x float> %44, <4 x float> %44, <2 x i32> <i32 0, i32 1>, !dbg !134
  %46 = shufflevector <4 x float> %44, <4 x float> %44, <2 x i32> <i32 2, i32 3>, !dbg !134
  %47 = fsub contract <2 x float> %30, %45, !dbg !135
  %48 = fsub contract <2 x float> %35, %46, !dbg !135
  %49 = getelementptr float, ptr %22, i64 %28, !dbg !135
  store <2 x float> %47, ptr %49, align 4, !dbg !135
  %50 = getelementptr float, ptr %22, i64 %33, !dbg !135
  store <2 x float> %48, ptr %50, align 4, !dbg !135
  ret i32 0, !dbg !136
}

define internal i32 @"main$async_dispatch_2_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !137 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !138
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !138
  %6 = load ptr, ptr %5, align 8, !dbg !138
  %7 = getelementptr float, ptr %6, i64 32, !dbg !138
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !138
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !139
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !139
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !139
  %11 = load ptr, ptr %10, align 8, !dbg !139
  %12 = getelementptr float, ptr %11, i64 64, !dbg !139
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !139
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !140
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !140
  %15 = zext i32 %14 to i64, !dbg !140
  %16 = mul nsw i64 %15, 2, !dbg !140
  %17 = mul i64 %16, 2, !dbg !140
  %18 = add i64 %17, 0, !dbg !140
  %19 = getelementptr float, ptr %7, i64 %18, !dbg !140
  %20 = load <2 x float>, ptr %19, align 4, !dbg !140
  %21 = add i64 %16, 1, !dbg !140
  %22 = mul i64 %21, 2, !dbg !140
  %23 = add i64 %22, 0, !dbg !140
  %24 = getelementptr float, ptr %7, i64 %23, !dbg !140
  %25 = load <2 x float>, ptr %24, align 4, !dbg !140
  %26 = fmul contract <2 x float> %20, %20, !dbg !141
  %27 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %26), !dbg !141
  %28 = fmul contract <2 x float> %25, %25, !dbg !141
  %29 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %28), !dbg !141
  %30 = insertelement <2 x float> poison, float %27, i64 0, !dbg !141
  %31 = insertelement <2 x float> %30, float %29, i64 1, !dbg !141
  %32 = load <2 x float>, ptr @__constant_2xf32_0, align 4, !dbg !142
  %33 = load <2 x float>, ptr @__constant_2xf32, align 4, !dbg !142
  %34 = fdiv <2 x float> %31, splat (float 2.000000e+00), !dbg !143
  %35 = fadd contract <2 x float> %34, splat (float 0x3EE4F8B580000000), !dbg !144
  %36 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> %35), !dbg !145
  %37 = fdiv <2 x float> splat (float 1.000000e+00), %36, !dbg !145
  %38 = shufflevector <2 x float> %37, <2 x float> %37, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !145
  %39 = shufflevector <4 x float> %38, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !145
  %40 = shufflevector <4 x float> %38, <4 x float> %39, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !145
  %41 = shufflevector <4 x float> %40, <4 x float> %40, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !145
  %42 = shufflevector <4 x float> %41, <4 x float> %41, <2 x i32> <i32 0, i32 1>, !dbg !145
  %43 = shufflevector <4 x float> %41, <4 x float> %41, <2 x i32> <i32 2, i32 3>, !dbg !145
  %44 = fmul contract <2 x float> %20, %42, !dbg !146
  %45 = fmul contract <2 x float> %25, %43, !dbg !146
  %46 = fmul contract <2 x float> %44, %32, !dbg !147
  %47 = fmul contract <2 x float> %45, %32, !dbg !147
  %48 = fadd contract <2 x float> %46, %33, !dbg !148
  %49 = fadd contract <2 x float> %47, %33, !dbg !148
  %50 = getelementptr float, ptr %12, i64 %18, !dbg !148
  store <2 x float> %48, ptr %50, align 4, !dbg !148
  %51 = getelementptr float, ptr %12, i64 %23, !dbg !148
  store <2 x float> %49, ptr %51, align 4, !dbg !148
  ret i32 0, !dbg !149
}

define internal i32 @"main$async_dispatch_3_matmul_16x6x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !150 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !151
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !151
  %6 = load ptr, ptr %5, align 8, !dbg !151
  %7 = getelementptr float, ptr %6, i64 64, !dbg !151
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !151
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !152
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !152
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !152
  %11 = load ptr, ptr %10, align 8, !dbg !152
  %12 = getelementptr float, ptr %11, i64 96, !dbg !152
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !152
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !153
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !153
  %15 = zext i32 %14 to i64, !dbg !153
  %16 = mul nsw i64 %15, 8, !dbg !153
  %17 = load <6 x float>, ptr @__constant_2x6xf32, align 4, !dbg !153
  %18 = load <6 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x6xf32, i64 24), align 4, !dbg !153
  %19 = load <6 x float>, ptr @__constant_6xf32, align 4, !dbg !154
  %20 = mul nuw nsw i64 %16, 2
  %21 = add nuw nsw i64 %20, 0
  %22 = getelementptr inbounds nuw float, ptr %7, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = insertelement <6 x float> poison, float %23, i32 0
  %25 = shufflevector <6 x float> %24, <6 x float> poison, <6 x i32> zeroinitializer
  %26 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %25, <6 x float> %17, <6 x float> %19)
  %27 = add i64 %16, 1, !dbg !155
  %28 = mul nuw nsw i64 %27, 2
  %29 = add nuw nsw i64 %28, 0
  %30 = getelementptr inbounds nuw float, ptr %7, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = insertelement <6 x float> poison, float %31, i32 0
  %33 = shufflevector <6 x float> %32, <6 x float> poison, <6 x i32> zeroinitializer
  %34 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %33, <6 x float> %17, <6 x float> %19)
  %35 = add i64 %16, 2, !dbg !155
  %36 = mul nuw nsw i64 %35, 2
  %37 = add nuw nsw i64 %36, 0
  %38 = getelementptr inbounds nuw float, ptr %7, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = insertelement <6 x float> poison, float %39, i32 0
  %41 = shufflevector <6 x float> %40, <6 x float> poison, <6 x i32> zeroinitializer
  %42 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %41, <6 x float> %17, <6 x float> %19)
  %43 = add i64 %16, 3, !dbg !155
  %44 = mul nuw nsw i64 %43, 2
  %45 = add nuw nsw i64 %44, 0
  %46 = getelementptr inbounds nuw float, ptr %7, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = insertelement <6 x float> poison, float %47, i32 0
  %49 = shufflevector <6 x float> %48, <6 x float> poison, <6 x i32> zeroinitializer
  %50 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %49, <6 x float> %17, <6 x float> %19)
  %51 = add i64 %16, 4, !dbg !155
  %52 = mul nuw nsw i64 %51, 2
  %53 = add nuw nsw i64 %52, 0
  %54 = getelementptr inbounds nuw float, ptr %7, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = insertelement <6 x float> poison, float %55, i32 0
  %57 = shufflevector <6 x float> %56, <6 x float> poison, <6 x i32> zeroinitializer
  %58 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %57, <6 x float> %17, <6 x float> %19)
  %59 = add i64 %16, 5, !dbg !155
  %60 = mul nuw nsw i64 %59, 2
  %61 = add nuw nsw i64 %60, 0
  %62 = getelementptr inbounds nuw float, ptr %7, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = insertelement <6 x float> poison, float %63, i32 0
  %65 = shufflevector <6 x float> %64, <6 x float> poison, <6 x i32> zeroinitializer
  %66 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %65, <6 x float> %17, <6 x float> %19)
  %67 = add i64 %16, 6, !dbg !155
  %68 = mul nuw nsw i64 %67, 2
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <6 x float> poison, float %71, i32 0
  %73 = shufflevector <6 x float> %72, <6 x float> poison, <6 x i32> zeroinitializer
  %74 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %73, <6 x float> %17, <6 x float> %19)
  %75 = add i64 %16, 7, !dbg !155
  %76 = mul nuw nsw i64 %75, 2
  %77 = add nuw nsw i64 %76, 0
  %78 = getelementptr inbounds nuw float, ptr %7, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = insertelement <6 x float> poison, float %79, i32 0
  %81 = shufflevector <6 x float> %80, <6 x float> poison, <6 x i32> zeroinitializer
  %82 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %81, <6 x float> %17, <6 x float> %19)
  %83 = add nuw nsw i64 %20, 1
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <6 x float> poison, float %85, i32 0
  %87 = shufflevector <6 x float> %86, <6 x float> poison, <6 x i32> zeroinitializer
  %88 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %87, <6 x float> %18, <6 x float> %26)
  %89 = add nuw nsw i64 %28, 1
  %90 = getelementptr inbounds nuw float, ptr %7, i64 %89
  %91 = load float, ptr %90, align 4
  %92 = insertelement <6 x float> poison, float %91, i32 0
  %93 = shufflevector <6 x float> %92, <6 x float> poison, <6 x i32> zeroinitializer
  %94 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %93, <6 x float> %18, <6 x float> %34)
  %95 = add nuw nsw i64 %36, 1
  %96 = getelementptr inbounds nuw float, ptr %7, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = insertelement <6 x float> poison, float %97, i32 0
  %99 = shufflevector <6 x float> %98, <6 x float> poison, <6 x i32> zeroinitializer
  %100 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %99, <6 x float> %18, <6 x float> %42)
  %101 = add nuw nsw i64 %44, 1
  %102 = getelementptr inbounds nuw float, ptr %7, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = insertelement <6 x float> poison, float %103, i32 0
  %105 = shufflevector <6 x float> %104, <6 x float> poison, <6 x i32> zeroinitializer
  %106 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %105, <6 x float> %18, <6 x float> %50)
  %107 = add nuw nsw i64 %52, 1
  %108 = getelementptr inbounds nuw float, ptr %7, i64 %107
  %109 = load float, ptr %108, align 4
  %110 = insertelement <6 x float> poison, float %109, i32 0
  %111 = shufflevector <6 x float> %110, <6 x float> poison, <6 x i32> zeroinitializer
  %112 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %111, <6 x float> %18, <6 x float> %58)
  %113 = add nuw nsw i64 %60, 1
  %114 = getelementptr inbounds nuw float, ptr %7, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = insertelement <6 x float> poison, float %115, i32 0
  %117 = shufflevector <6 x float> %116, <6 x float> poison, <6 x i32> zeroinitializer
  %118 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %117, <6 x float> %18, <6 x float> %66)
  %119 = add nuw nsw i64 %68, 1
  %120 = getelementptr inbounds nuw float, ptr %7, i64 %119
  %121 = load float, ptr %120, align 4
  %122 = insertelement <6 x float> poison, float %121, i32 0
  %123 = shufflevector <6 x float> %122, <6 x float> poison, <6 x i32> zeroinitializer
  %124 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %123, <6 x float> %18, <6 x float> %74)
  %125 = add nuw nsw i64 %76, 1
  %126 = getelementptr inbounds nuw float, ptr %7, i64 %125
  %127 = load float, ptr %126, align 4
  %128 = insertelement <6 x float> poison, float %127, i32 0
  %129 = shufflevector <6 x float> %128, <6 x float> poison, <6 x i32> zeroinitializer
  %130 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %129, <6 x float> %18, <6 x float> %82)
  %131 = mul i64 %16, 6, !dbg !155
  %132 = add i64 %131, 0, !dbg !155
  %133 = getelementptr float, ptr %12, i64 %132, !dbg !155
  store <6 x float> %88, ptr %133, align 4, !dbg !155
  %134 = mul i64 %27, 6, !dbg !155
  %135 = add i64 %134, 0, !dbg !155
  %136 = getelementptr float, ptr %12, i64 %135, !dbg !155
  store <6 x float> %94, ptr %136, align 4, !dbg !155
  %137 = mul i64 %35, 6, !dbg !155
  %138 = add i64 %137, 0, !dbg !155
  %139 = getelementptr float, ptr %12, i64 %138, !dbg !155
  store <6 x float> %100, ptr %139, align 4, !dbg !155
  %140 = mul i64 %43, 6, !dbg !155
  %141 = add i64 %140, 0, !dbg !155
  %142 = getelementptr float, ptr %12, i64 %141, !dbg !155
  store <6 x float> %106, ptr %142, align 4, !dbg !155
  %143 = mul i64 %51, 6, !dbg !155
  %144 = add i64 %143, 0, !dbg !155
  %145 = getelementptr float, ptr %12, i64 %144, !dbg !155
  store <6 x float> %112, ptr %145, align 4, !dbg !155
  %146 = mul i64 %59, 6, !dbg !155
  %147 = add i64 %146, 0, !dbg !155
  %148 = getelementptr float, ptr %12, i64 %147, !dbg !155
  store <6 x float> %118, ptr %148, align 4, !dbg !155
  %149 = mul i64 %67, 6, !dbg !155
  %150 = add i64 %149, 0, !dbg !155
  %151 = getelementptr float, ptr %12, i64 %150, !dbg !155
  store <6 x float> %124, ptr %151, align 4, !dbg !155
  %152 = mul i64 %75, 6, !dbg !155
  %153 = add i64 %152, 0, !dbg !155
  %154 = getelementptr float, ptr %12, i64 %153, !dbg !155
  store <6 x float> %130, ptr %154, align 4, !dbg !155
  ret i32 0, !dbg !156
}

define internal i32 @"main$async_dispatch_4_attention_2x16x16"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !157 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !158
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !158
  %6 = load ptr, ptr %5, align 8, !dbg !158
  %7 = getelementptr float, ptr %6, i64 96, !dbg !158
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !158
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !159
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !159
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !159
  %11 = load ptr, ptr %10, align 8, !dbg !159
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !159
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !160
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !160
  %14 = getelementptr ptr, ptr %13, i32 2, !dbg !160
  %15 = load ptr, ptr %14, align 8, !dbg !160
  %16 = getelementptr float, ptr %15, i64 32, !dbg !160
  call void @llvm.assume(i1 true) [ "align"(ptr %16, i64 64) ], !dbg !160
  %17 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !161
  %18 = extractvalue %iree_hal_executable_workgroup_state_v0_t %17, 0, !dbg !161
  %19 = zext i32 %18 to i64, !dbg !161
  %20 = sdiv i64 %19, 8, !dbg !161
  %21 = mul i64 %20, 8, !dbg !161
  %22 = icmp ne i64 %19, %21, !dbg !161
  %23 = icmp slt i64 %19, 0, !dbg !161
  %24 = and i1 %22, %23, !dbg !161
  %25 = add i64 %20, -1, !dbg !161
  %26 = select i1 %24, i64 %25, i64 %20, !dbg !161
  %27 = srem i64 %19, 8, !dbg !161
  %28 = icmp slt i64 %27, 0, !dbg !161
  %29 = add nsw i64 %27, 8, !dbg !161
  %30 = select i1 %28, i64 %29, i64 %27, !dbg !161
  %31 = mul nsw i64 %30, 2, !dbg !161
  %32 = mul i64 %31, 6, !dbg !161
  %33 = add i64 0, %32, !dbg !161
  %34 = add i64 %33, %26, !dbg !161
  %35 = getelementptr float, ptr %7, i64 %34, !dbg !161
  %36 = load <1 x float>, ptr %35, align 4, !dbg !161
  %37 = add i64 %31, 1, !dbg !161
  %38 = mul i64 %37, 6, !dbg !161
  %39 = add i64 0, %38, !dbg !161
  %40 = add i64 %39, %26, !dbg !161
  %41 = getelementptr float, ptr %7, i64 %40, !dbg !161
  %42 = load <1 x float>, ptr %41, align 4, !dbg !161
  %43 = extractelement <1 x float> %36, i64 0, !dbg !161
  %44 = extractelement <1 x float> %42, i64 0, !dbg !161
  %45 = insertelement <2 x float> poison, float %43, i64 0, !dbg !161
  %46 = insertelement <2 x float> %45, float %44, i64 1, !dbg !161
  %47 = fmul contract <2 x float> %46, splat (float 0x3FF7154760000000), !dbg !161
  %48 = extractelement <2 x float> %47, i64 0, !dbg !161
  %49 = extractelement <2 x float> %47, i64 1, !dbg !161
  %50 = insertelement <32 x float> poison, float %48, i64 0, !dbg !161
  %51 = insertelement <32 x float> %50, float %49, i64 1, !dbg !161
  %52 = insertelement <32 x float> %51, float %48, i64 2, !dbg !161
  %53 = insertelement <32 x float> %52, float %49, i64 3, !dbg !161
  %54 = insertelement <32 x float> %53, float %48, i64 4, !dbg !161
  %55 = insertelement <32 x float> %54, float %49, i64 5, !dbg !161
  %56 = insertelement <32 x float> %55, float %48, i64 6, !dbg !161
  %57 = insertelement <32 x float> %56, float %49, i64 7, !dbg !161
  %58 = insertelement <32 x float> %57, float %48, i64 8, !dbg !161
  %59 = insertelement <32 x float> %58, float %49, i64 9, !dbg !161
  %60 = insertelement <32 x float> %59, float %48, i64 10, !dbg !161
  %61 = insertelement <32 x float> %60, float %49, i64 11, !dbg !161
  %62 = insertelement <32 x float> %61, float %48, i64 12, !dbg !161
  %63 = insertelement <32 x float> %62, float %49, i64 13, !dbg !161
  %64 = insertelement <32 x float> %63, float %48, i64 14, !dbg !161
  %65 = insertelement <32 x float> %64, float %49, i64 15, !dbg !161
  %66 = insertelement <32 x float> %65, float %48, i64 16, !dbg !161
  %67 = insertelement <32 x float> %66, float %49, i64 17, !dbg !161
  %68 = insertelement <32 x float> %67, float %48, i64 18, !dbg !161
  %69 = insertelement <32 x float> %68, float %49, i64 19, !dbg !161
  %70 = insertelement <32 x float> %69, float %48, i64 20, !dbg !161
  %71 = insertelement <32 x float> %70, float %49, i64 21, !dbg !161
  %72 = insertelement <32 x float> %71, float %48, i64 22, !dbg !161
  %73 = insertelement <32 x float> %72, float %49, i64 23, !dbg !161
  %74 = insertelement <32 x float> %73, float %48, i64 24, !dbg !161
  %75 = insertelement <32 x float> %74, float %49, i64 25, !dbg !161
  %76 = insertelement <32 x float> %75, float %48, i64 26, !dbg !161
  %77 = insertelement <32 x float> %76, float %49, i64 27, !dbg !161
  %78 = insertelement <32 x float> %77, float %48, i64 28, !dbg !161
  %79 = insertelement <32 x float> %78, float %49, i64 29, !dbg !161
  %80 = insertelement <32 x float> %79, float %48, i64 30, !dbg !161
  %81 = insertelement <32 x float> %80, float %49, i64 31, !dbg !161
  %82 = shufflevector <32 x float> %81, <32 x float> %81, <32 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>, !dbg !161
  %83 = shufflevector <32 x float> %82, <32 x float> %82, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !161
  %84 = shufflevector <32 x float> %82, <32 x float> %82, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>, !dbg !161
  %85 = add i64 %26, 2, !dbg !161
  %86 = add i64 0, %85, !dbg !161
  %87 = getelementptr float, ptr %7, i64 %86, !dbg !161
  %88 = load <1 x float>, ptr %87, align 4, !dbg !161
  %89 = add i64 6, %85, !dbg !161
  %90 = getelementptr float, ptr %7, i64 %89, !dbg !161
  %91 = load <1 x float>, ptr %90, align 4, !dbg !161
  %92 = add i64 12, %85, !dbg !161
  %93 = getelementptr float, ptr %7, i64 %92, !dbg !161
  %94 = load <1 x float>, ptr %93, align 4, !dbg !161
  %95 = add i64 18, %85, !dbg !161
  %96 = getelementptr float, ptr %7, i64 %95, !dbg !161
  %97 = load <1 x float>, ptr %96, align 4, !dbg !161
  %98 = add i64 24, %85, !dbg !161
  %99 = getelementptr float, ptr %7, i64 %98, !dbg !161
  %100 = load <1 x float>, ptr %99, align 4, !dbg !161
  %101 = add i64 30, %85, !dbg !161
  %102 = getelementptr float, ptr %7, i64 %101, !dbg !161
  %103 = load <1 x float>, ptr %102, align 4, !dbg !161
  %104 = add i64 36, %85, !dbg !161
  %105 = getelementptr float, ptr %7, i64 %104, !dbg !161
  %106 = load <1 x float>, ptr %105, align 4, !dbg !161
  %107 = add i64 42, %85, !dbg !161
  %108 = getelementptr float, ptr %7, i64 %107, !dbg !161
  %109 = load <1 x float>, ptr %108, align 4, !dbg !161
  %110 = add i64 48, %85, !dbg !161
  %111 = getelementptr float, ptr %7, i64 %110, !dbg !161
  %112 = load <1 x float>, ptr %111, align 4, !dbg !161
  %113 = add i64 54, %85, !dbg !161
  %114 = getelementptr float, ptr %7, i64 %113, !dbg !161
  %115 = load <1 x float>, ptr %114, align 4, !dbg !161
  %116 = add i64 60, %85, !dbg !161
  %117 = getelementptr float, ptr %7, i64 %116, !dbg !161
  %118 = load <1 x float>, ptr %117, align 4, !dbg !161
  %119 = add i64 66, %85, !dbg !161
  %120 = getelementptr float, ptr %7, i64 %119, !dbg !161
  %121 = load <1 x float>, ptr %120, align 4, !dbg !161
  %122 = add i64 72, %85, !dbg !161
  %123 = getelementptr float, ptr %7, i64 %122, !dbg !161
  %124 = load <1 x float>, ptr %123, align 4, !dbg !161
  %125 = add i64 78, %85, !dbg !161
  %126 = getelementptr float, ptr %7, i64 %125, !dbg !161
  %127 = load <1 x float>, ptr %126, align 4, !dbg !161
  %128 = add i64 84, %85, !dbg !161
  %129 = getelementptr float, ptr %7, i64 %128, !dbg !161
  %130 = load <1 x float>, ptr %129, align 4, !dbg !161
  %131 = add i64 90, %85, !dbg !161
  %132 = getelementptr float, ptr %7, i64 %131, !dbg !161
  %133 = load <1 x float>, ptr %132, align 4, !dbg !161
  %134 = extractelement <1 x float> %88, i64 0, !dbg !161
  %135 = extractelement <1 x float> %91, i64 0, !dbg !161
  %136 = extractelement <1 x float> %94, i64 0, !dbg !161
  %137 = extractelement <1 x float> %97, i64 0, !dbg !161
  %138 = extractelement <1 x float> %100, i64 0, !dbg !161
  %139 = extractelement <1 x float> %103, i64 0, !dbg !161
  %140 = extractelement <1 x float> %106, i64 0, !dbg !161
  %141 = extractelement <1 x float> %109, i64 0, !dbg !161
  %142 = extractelement <1 x float> %112, i64 0, !dbg !161
  %143 = extractelement <1 x float> %115, i64 0, !dbg !161
  %144 = extractelement <1 x float> %118, i64 0, !dbg !161
  %145 = extractelement <1 x float> %121, i64 0, !dbg !161
  %146 = extractelement <1 x float> %124, i64 0, !dbg !161
  %147 = extractelement <1 x float> %127, i64 0, !dbg !161
  %148 = extractelement <1 x float> %130, i64 0, !dbg !161
  %149 = extractelement <1 x float> %133, i64 0, !dbg !161
  %150 = insertelement <16 x float> poison, float %134, i64 0, !dbg !161
  %151 = insertelement <16 x float> %150, float %135, i64 1, !dbg !161
  %152 = insertelement <16 x float> %151, float %136, i64 2, !dbg !161
  %153 = insertelement <16 x float> %152, float %137, i64 3, !dbg !161
  %154 = insertelement <16 x float> %153, float %138, i64 4, !dbg !161
  %155 = insertelement <16 x float> %154, float %139, i64 5, !dbg !161
  %156 = insertelement <16 x float> %155, float %140, i64 6, !dbg !161
  %157 = insertelement <16 x float> %156, float %141, i64 7, !dbg !161
  %158 = insertelement <16 x float> %157, float %142, i64 8, !dbg !161
  %159 = insertelement <16 x float> %158, float %143, i64 9, !dbg !161
  %160 = insertelement <16 x float> %159, float %144, i64 10, !dbg !161
  %161 = insertelement <16 x float> %160, float %145, i64 11, !dbg !161
  %162 = insertelement <16 x float> %161, float %146, i64 12, !dbg !161
  %163 = insertelement <16 x float> %162, float %147, i64 13, !dbg !161
  %164 = insertelement <16 x float> %163, float %148, i64 14, !dbg !161
  %165 = insertelement <16 x float> %164, float %149, i64 15, !dbg !161
  %166 = fmul contract <16 x float> %83, %165, !dbg !161
  %167 = fmul contract <16 x float> %84, %165, !dbg !161
  %168 = fadd contract <16 x float> %166, zeroinitializer, !dbg !161
  %169 = fadd contract <16 x float> %167, zeroinitializer, !dbg !161
  %170 = mul i64 %31, 16, !dbg !161
  %171 = add i64 %170, 0, !dbg !161
  %172 = getelementptr float, ptr %11, i64 %171, !dbg !161
  %173 = load <16 x float>, ptr %172, align 4, !dbg !161
  %174 = mul i64 %37, 16, !dbg !161
  %175 = add i64 %174, 0, !dbg !161
  %176 = getelementptr float, ptr %11, i64 %175, !dbg !161
  %177 = load <16 x float>, ptr %176, align 4, !dbg !161
  %178 = fmul contract <16 x float> %173, splat (float 0x3FF7154760000000), !dbg !161
  %179 = fmul contract <16 x float> %177, splat (float 0x3FF7154760000000), !dbg !161
  %180 = fadd contract <16 x float> %168, %178, !dbg !161
  %181 = fadd contract <16 x float> %169, %179, !dbg !161
  %182 = call float @llvm.vector.reduce.fmaximum.v16f32(<16 x float> %180), !dbg !161
  %183 = call float @llvm.maximum.f32(float %182, float 0xC7EFFFFFE0000000), !dbg !161
  %184 = call float @llvm.vector.reduce.fmaximum.v16f32(<16 x float> %181), !dbg !161
  %185 = call float @llvm.maximum.f32(float %184, float 0xC7EFFFFFE0000000), !dbg !161
  %186 = insertelement <2 x float> poison, float %183, i64 0, !dbg !161
  %187 = insertelement <2 x float> %186, float %185, i64 1, !dbg !161
  %188 = fsub contract <2 x float> splat (float 0xC7EFFFFFE0000000), %187, !dbg !161
  %189 = fmul contract <2 x float> %188, splat (float 0x3FE62E4300000000), !dbg !161
  %190 = fcmp uge <2 x float> %189, splat (float 0xC055F33340000000), !dbg !161
  %191 = select <2 x i1> %190, <2 x float> %189, <2 x float> splat (float 0xC055F33340000000), !dbg !161
  %192 = fcmp ule <2 x float> %191, splat (float 0x4056333340000000), !dbg !161
  %193 = select <2 x i1> %192, <2 x float> %191, <2 x float> splat (float 0x4056333340000000), !dbg !161
  %194 = call <2 x float> @llvm.fma.v2f32(<2 x float> %193, <2 x float> splat (float 0x3FF7154760000000), <2 x float> splat (float 5.000000e-01)), !dbg !161
  %195 = call <2 x float> @llvm.floor.v2f32(<2 x float> %194), !dbg !161
  %196 = fcmp uge <2 x float> %195, splat (float -1.270000e+02), !dbg !161
  %197 = select <2 x i1> %196, <2 x float> %195, <2 x float> splat (float -1.270000e+02), !dbg !161
  %198 = fcmp ule <2 x float> %197, splat (float 1.270000e+02), !dbg !161
  %199 = select <2 x i1> %198, <2 x float> %197, <2 x float> splat (float 1.270000e+02), !dbg !161
  %200 = call <2 x float> @llvm.fma.v2f32(<2 x float> splat (float 0xBFE6300000000000), <2 x float> %199, <2 x float> %193), !dbg !161
  %201 = call <2 x float> @llvm.fma.v2f32(<2 x float> splat (float 0x3F2BD01060000000), <2 x float> %199, <2 x float> %200), !dbg !161
  %202 = call <2 x float> @llvm.fma.v2f32(<2 x float> %201, <2 x float> splat (float 0x3F2A0D2CE0000000), <2 x float> splat (float 0x3F56E879C0000000)), !dbg !161
  %203 = call <2 x float> @llvm.fma.v2f32(<2 x float> %202, <2 x float> %201, <2 x float> splat (float 0x3F81112100000000)), !dbg !161
  %204 = call <2 x float> @llvm.fma.v2f32(<2 x float> %203, <2 x float> %201, <2 x float> splat (float 0x3FA5553820000000)), !dbg !161
  %205 = call <2 x float> @llvm.fma.v2f32(<2 x float> %204, <2 x float> %201, <2 x float> splat (float 0x3FC5555540000000)), !dbg !161
  %206 = call <2 x float> @llvm.fma.v2f32(<2 x float> %205, <2 x float> %201, <2 x float> splat (float 5.000000e-01)), !dbg !161
  %207 = fmul contract <2 x float> %201, %201, !dbg !161
  %208 = call <2 x float> @llvm.fma.v2f32(<2 x float> %206, <2 x float> %207, <2 x float> %201), !dbg !161
  %209 = fadd contract <2 x float> %208, splat (float 1.000000e+00), !dbg !161
  %210 = fptosi <2 x float> %199 to <2 x i32>, !dbg !161
  %211 = add <2 x i32> %210, splat (i32 127), !dbg !161
  %212 = shl <2 x i32> %211, splat (i32 23), !dbg !161
  %213 = bitcast <2 x i32> %212 to <2 x float>, !dbg !161
  %214 = fmul contract <2 x float> %209, %213, !dbg !161
  %215 = fmul contract <2 x float> %214, zeroinitializer, !dbg !161
  %216 = shufflevector <2 x float> %187, <2 x float> %187, <32 x i32> <i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, !dbg !161
  %217 = shufflevector <32 x float> %216, <32 x float> poison, <32 x i32> <i32 0, i32 1, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %218 = shufflevector <32 x float> %216, <32 x float> %217, <32 x i32> <i32 32, i32 33, i32 0, i32 1, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %219 = shufflevector <32 x float> %216, <32 x float> %218, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 0, i32 1, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %220 = shufflevector <32 x float> %216, <32 x float> %219, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 0, i32 1, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %221 = shufflevector <32 x float> %216, <32 x float> %220, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 0, i32 1, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %222 = shufflevector <32 x float> %216, <32 x float> %221, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 0, i32 1, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %223 = shufflevector <32 x float> %216, <32 x float> %222, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 0, i32 1, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %224 = shufflevector <32 x float> %216, <32 x float> %223, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 0, i32 1, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %225 = shufflevector <32 x float> %216, <32 x float> %224, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 0, i32 1, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %226 = shufflevector <32 x float> %216, <32 x float> %225, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 0, i32 1, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %227 = shufflevector <32 x float> %216, <32 x float> %226, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 0, i32 1, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %228 = shufflevector <32 x float> %216, <32 x float> %227, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 0, i32 1, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %229 = shufflevector <32 x float> %216, <32 x float> %228, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 0, i32 1, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %230 = shufflevector <32 x float> %216, <32 x float> %229, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 0, i32 1, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %231 = shufflevector <32 x float> %216, <32 x float> %230, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 0, i32 1, i32 62, i32 63>, !dbg !161
  %232 = shufflevector <32 x float> %216, <32 x float> %231, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 0, i32 1>, !dbg !161
  %233 = shufflevector <32 x float> %232, <32 x float> %232, <32 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>, !dbg !161
  %234 = shufflevector <32 x float> %233, <32 x float> %233, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !161
  %235 = shufflevector <32 x float> %233, <32 x float> %233, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>, !dbg !161
  %236 = fsub contract <16 x float> %180, %234, !dbg !161
  %237 = fsub contract <16 x float> %181, %235, !dbg !161
  %238 = fmul contract <16 x float> %236, splat (float 0x3FE62E4300000000), !dbg !161
  %239 = fmul contract <16 x float> %237, splat (float 0x3FE62E4300000000), !dbg !161
  %240 = fcmp uge <16 x float> %238, splat (float 0xC055F33340000000), !dbg !161
  %241 = fcmp uge <16 x float> %239, splat (float 0xC055F33340000000), !dbg !161
  %242 = select <16 x i1> %240, <16 x float> %238, <16 x float> splat (float 0xC055F33340000000), !dbg !161
  %243 = select <16 x i1> %241, <16 x float> %239, <16 x float> splat (float 0xC055F33340000000), !dbg !161
  %244 = fcmp ule <16 x float> %242, splat (float 0x4056333340000000), !dbg !161
  %245 = fcmp ule <16 x float> %243, splat (float 0x4056333340000000), !dbg !161
  %246 = select <16 x i1> %244, <16 x float> %242, <16 x float> splat (float 0x4056333340000000), !dbg !161
  %247 = select <16 x i1> %245, <16 x float> %243, <16 x float> splat (float 0x4056333340000000), !dbg !161
  %248 = call <16 x float> @llvm.fma.v16f32(<16 x float> %246, <16 x float> splat (float 0x3FF7154760000000), <16 x float> splat (float 5.000000e-01)), !dbg !161
  %249 = call <16 x float> @llvm.fma.v16f32(<16 x float> %247, <16 x float> splat (float 0x3FF7154760000000), <16 x float> splat (float 5.000000e-01)), !dbg !161
  %250 = call <16 x float> @llvm.floor.v16f32(<16 x float> %248), !dbg !161
  %251 = call <16 x float> @llvm.floor.v16f32(<16 x float> %249), !dbg !161
  %252 = fcmp uge <16 x float> %250, splat (float -1.270000e+02), !dbg !161
  %253 = fcmp uge <16 x float> %251, splat (float -1.270000e+02), !dbg !161
  %254 = select <16 x i1> %252, <16 x float> %250, <16 x float> splat (float -1.270000e+02), !dbg !161
  %255 = select <16 x i1> %253, <16 x float> %251, <16 x float> splat (float -1.270000e+02), !dbg !161
  %256 = fcmp ule <16 x float> %254, splat (float 1.270000e+02), !dbg !161
  %257 = fcmp ule <16 x float> %255, splat (float 1.270000e+02), !dbg !161
  %258 = select <16 x i1> %256, <16 x float> %254, <16 x float> splat (float 1.270000e+02), !dbg !161
  %259 = select <16 x i1> %257, <16 x float> %255, <16 x float> splat (float 1.270000e+02), !dbg !161
  %260 = call <16 x float> @llvm.fma.v16f32(<16 x float> splat (float 0xBFE6300000000000), <16 x float> %258, <16 x float> %246), !dbg !161
  %261 = call <16 x float> @llvm.fma.v16f32(<16 x float> splat (float 0xBFE6300000000000), <16 x float> %259, <16 x float> %247), !dbg !161
  %262 = call <16 x float> @llvm.fma.v16f32(<16 x float> splat (float 0x3F2BD01060000000), <16 x float> %258, <16 x float> %260), !dbg !161
  %263 = call <16 x float> @llvm.fma.v16f32(<16 x float> splat (float 0x3F2BD01060000000), <16 x float> %259, <16 x float> %261), !dbg !161
  %264 = call <16 x float> @llvm.fma.v16f32(<16 x float> %262, <16 x float> splat (float 0x3F2A0D2CE0000000), <16 x float> splat (float 0x3F56E879C0000000)), !dbg !161
  %265 = call <16 x float> @llvm.fma.v16f32(<16 x float> %263, <16 x float> splat (float 0x3F2A0D2CE0000000), <16 x float> splat (float 0x3F56E879C0000000)), !dbg !161
  %266 = call <16 x float> @llvm.fma.v16f32(<16 x float> %264, <16 x float> %262, <16 x float> splat (float 0x3F81112100000000)), !dbg !161
  %267 = call <16 x float> @llvm.fma.v16f32(<16 x float> %265, <16 x float> %263, <16 x float> splat (float 0x3F81112100000000)), !dbg !161
  %268 = call <16 x float> @llvm.fma.v16f32(<16 x float> %266, <16 x float> %262, <16 x float> splat (float 0x3FA5553820000000)), !dbg !161
  %269 = call <16 x float> @llvm.fma.v16f32(<16 x float> %267, <16 x float> %263, <16 x float> splat (float 0x3FA5553820000000)), !dbg !161
  %270 = call <16 x float> @llvm.fma.v16f32(<16 x float> %268, <16 x float> %262, <16 x float> splat (float 0x3FC5555540000000)), !dbg !161
  %271 = call <16 x float> @llvm.fma.v16f32(<16 x float> %269, <16 x float> %263, <16 x float> splat (float 0x3FC5555540000000)), !dbg !161
  %272 = call <16 x float> @llvm.fma.v16f32(<16 x float> %270, <16 x float> %262, <16 x float> splat (float 5.000000e-01)), !dbg !161
  %273 = call <16 x float> @llvm.fma.v16f32(<16 x float> %271, <16 x float> %263, <16 x float> splat (float 5.000000e-01)), !dbg !161
  %274 = fmul contract <16 x float> %262, %262, !dbg !161
  %275 = fmul contract <16 x float> %263, %263, !dbg !161
  %276 = call <16 x float> @llvm.fma.v16f32(<16 x float> %272, <16 x float> %274, <16 x float> %262), !dbg !161
  %277 = call <16 x float> @llvm.fma.v16f32(<16 x float> %273, <16 x float> %275, <16 x float> %263), !dbg !161
  %278 = fadd contract <16 x float> %276, splat (float 1.000000e+00), !dbg !161
  %279 = fadd contract <16 x float> %277, splat (float 1.000000e+00), !dbg !161
  %280 = fptosi <16 x float> %258 to <16 x i32>, !dbg !161
  %281 = fptosi <16 x float> %259 to <16 x i32>, !dbg !161
  %282 = add <16 x i32> %280, splat (i32 127), !dbg !161
  %283 = add <16 x i32> %281, splat (i32 127), !dbg !161
  %284 = shl <16 x i32> %282, splat (i32 23), !dbg !161
  %285 = shl <16 x i32> %283, splat (i32 23), !dbg !161
  %286 = bitcast <16 x i32> %284 to <16 x float>, !dbg !161
  %287 = bitcast <16 x i32> %285 to <16 x float>, !dbg !161
  %288 = fmul contract <16 x float> %278, %286, !dbg !161
  %289 = fmul contract <16 x float> %279, %287, !dbg !161
  %290 = extractelement <2 x float> %215, i64 0, !dbg !161
  %291 = call float @llvm.vector.reduce.fadd.v16f32(float %290, <16 x float> %288), !dbg !161
  %292 = extractelement <2 x float> %215, i64 1, !dbg !161
  %293 = call float @llvm.vector.reduce.fadd.v16f32(float %292, <16 x float> %289), !dbg !161
  %294 = insertelement <2 x float> poison, float %291, i64 0, !dbg !161
  %295 = insertelement <2 x float> %294, float %293, i64 1, !dbg !161
  %296 = shufflevector <16 x float> %288, <16 x float> %288, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, !dbg !161
  %297 = shufflevector <32 x float> %296, <32 x float> poison, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>, !dbg !161
  %298 = shufflevector <16 x float> %289, <16 x float> %289, <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>, !dbg !161
  %299 = shufflevector <32 x float> %298, <32 x float> %297, <32 x i32> <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !161
  %300 = shufflevector <32 x float> %299, <32 x float> %299, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>, !dbg !161
  %301 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 0, i32 1>, !dbg !161
  %302 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 2, i32 3>, !dbg !161
  %303 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 4, i32 5>, !dbg !161
  %304 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 6, i32 7>, !dbg !161
  %305 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 8, i32 9>, !dbg !161
  %306 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 10, i32 11>, !dbg !161
  %307 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 12, i32 13>, !dbg !161
  %308 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 14, i32 15>, !dbg !161
  %309 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 16, i32 17>, !dbg !161
  %310 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 18, i32 19>, !dbg !161
  %311 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 20, i32 21>, !dbg !161
  %312 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 22, i32 23>, !dbg !161
  %313 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 24, i32 25>, !dbg !161
  %314 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 26, i32 27>, !dbg !161
  %315 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 28, i32 29>, !dbg !161
  %316 = shufflevector <32 x float> %300, <32 x float> %300, <2 x i32> <i32 30, i32 31>, !dbg !161
  %317 = add i64 %26, 4, !dbg !161
  %318 = add nuw nsw i64 0, %317, !dbg !161
  %319 = getelementptr inbounds nuw float, ptr %7, i64 %318, !dbg !161
  %320 = load float, ptr %319, align 4, !dbg !161
  %321 = insertelement <2 x float> poison, float %320, i32 0, !dbg !161
  %322 = shufflevector <2 x float> %321, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %323 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %301, <2 x float> %322, <2 x float> %215), !dbg !161
  %324 = add nuw nsw i64 6, %317, !dbg !161
  %325 = getelementptr inbounds nuw float, ptr %7, i64 %324, !dbg !161
  %326 = load float, ptr %325, align 4, !dbg !161
  %327 = insertelement <2 x float> poison, float %326, i32 0, !dbg !161
  %328 = shufflevector <2 x float> %327, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %329 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %302, <2 x float> %328, <2 x float> %323), !dbg !161
  %330 = add nuw nsw i64 12, %317, !dbg !161
  %331 = getelementptr inbounds nuw float, ptr %7, i64 %330, !dbg !161
  %332 = load float, ptr %331, align 4, !dbg !161
  %333 = insertelement <2 x float> poison, float %332, i32 0, !dbg !161
  %334 = shufflevector <2 x float> %333, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %335 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %303, <2 x float> %334, <2 x float> %329), !dbg !161
  %336 = add nuw nsw i64 18, %317, !dbg !161
  %337 = getelementptr inbounds nuw float, ptr %7, i64 %336, !dbg !161
  %338 = load float, ptr %337, align 4, !dbg !161
  %339 = insertelement <2 x float> poison, float %338, i32 0, !dbg !161
  %340 = shufflevector <2 x float> %339, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %341 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %304, <2 x float> %340, <2 x float> %335), !dbg !161
  %342 = add nuw nsw i64 24, %317, !dbg !161
  %343 = getelementptr inbounds nuw float, ptr %7, i64 %342, !dbg !161
  %344 = load float, ptr %343, align 4, !dbg !161
  %345 = insertelement <2 x float> poison, float %344, i32 0, !dbg !161
  %346 = shufflevector <2 x float> %345, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %347 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %305, <2 x float> %346, <2 x float> %341), !dbg !161
  %348 = add nuw nsw i64 30, %317, !dbg !161
  %349 = getelementptr inbounds nuw float, ptr %7, i64 %348, !dbg !161
  %350 = load float, ptr %349, align 4, !dbg !161
  %351 = insertelement <2 x float> poison, float %350, i32 0, !dbg !161
  %352 = shufflevector <2 x float> %351, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %353 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %306, <2 x float> %352, <2 x float> %347), !dbg !161
  %354 = add nuw nsw i64 36, %317, !dbg !161
  %355 = getelementptr inbounds nuw float, ptr %7, i64 %354, !dbg !161
  %356 = load float, ptr %355, align 4, !dbg !161
  %357 = insertelement <2 x float> poison, float %356, i32 0, !dbg !161
  %358 = shufflevector <2 x float> %357, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %359 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %307, <2 x float> %358, <2 x float> %353), !dbg !161
  %360 = add nuw nsw i64 42, %317, !dbg !161
  %361 = getelementptr inbounds nuw float, ptr %7, i64 %360, !dbg !161
  %362 = load float, ptr %361, align 4, !dbg !161
  %363 = insertelement <2 x float> poison, float %362, i32 0, !dbg !161
  %364 = shufflevector <2 x float> %363, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %365 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %308, <2 x float> %364, <2 x float> %359), !dbg !161
  %366 = add nuw nsw i64 48, %317, !dbg !161
  %367 = getelementptr inbounds nuw float, ptr %7, i64 %366, !dbg !161
  %368 = load float, ptr %367, align 4, !dbg !161
  %369 = insertelement <2 x float> poison, float %368, i32 0, !dbg !161
  %370 = shufflevector <2 x float> %369, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %371 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %309, <2 x float> %370, <2 x float> %365), !dbg !161
  %372 = add nuw nsw i64 54, %317, !dbg !161
  %373 = getelementptr inbounds nuw float, ptr %7, i64 %372, !dbg !161
  %374 = load float, ptr %373, align 4, !dbg !161
  %375 = insertelement <2 x float> poison, float %374, i32 0, !dbg !161
  %376 = shufflevector <2 x float> %375, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %377 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %310, <2 x float> %376, <2 x float> %371), !dbg !161
  %378 = add nuw nsw i64 60, %317, !dbg !161
  %379 = getelementptr inbounds nuw float, ptr %7, i64 %378, !dbg !161
  %380 = load float, ptr %379, align 4, !dbg !161
  %381 = insertelement <2 x float> poison, float %380, i32 0, !dbg !161
  %382 = shufflevector <2 x float> %381, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %383 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %311, <2 x float> %382, <2 x float> %377), !dbg !161
  %384 = add nuw nsw i64 66, %317, !dbg !161
  %385 = getelementptr inbounds nuw float, ptr %7, i64 %384, !dbg !161
  %386 = load float, ptr %385, align 4, !dbg !161
  %387 = insertelement <2 x float> poison, float %386, i32 0, !dbg !161
  %388 = shufflevector <2 x float> %387, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %389 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %312, <2 x float> %388, <2 x float> %383), !dbg !161
  %390 = add nuw nsw i64 72, %317, !dbg !161
  %391 = getelementptr inbounds nuw float, ptr %7, i64 %390, !dbg !161
  %392 = load float, ptr %391, align 4, !dbg !161
  %393 = insertelement <2 x float> poison, float %392, i32 0, !dbg !161
  %394 = shufflevector <2 x float> %393, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %395 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %313, <2 x float> %394, <2 x float> %389), !dbg !161
  %396 = add nuw nsw i64 78, %317, !dbg !161
  %397 = getelementptr inbounds nuw float, ptr %7, i64 %396, !dbg !161
  %398 = load float, ptr %397, align 4, !dbg !161
  %399 = insertelement <2 x float> poison, float %398, i32 0, !dbg !161
  %400 = shufflevector <2 x float> %399, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %401 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %314, <2 x float> %400, <2 x float> %395), !dbg !161
  %402 = add nuw nsw i64 84, %317, !dbg !161
  %403 = getelementptr inbounds nuw float, ptr %7, i64 %402, !dbg !161
  %404 = load float, ptr %403, align 4, !dbg !161
  %405 = insertelement <2 x float> poison, float %404, i32 0, !dbg !161
  %406 = shufflevector <2 x float> %405, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %407 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %315, <2 x float> %406, <2 x float> %401), !dbg !161
  %408 = add nuw nsw i64 90, %317, !dbg !161
  %409 = getelementptr inbounds nuw float, ptr %7, i64 %408, !dbg !161
  %410 = load float, ptr %409, align 4, !dbg !161
  %411 = insertelement <2 x float> poison, float %410, i32 0, !dbg !161
  %412 = shufflevector <2 x float> %411, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !161
  %413 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %316, <2 x float> %412, <2 x float> %407), !dbg !161
  %414 = fdiv <2 x float> splat (float 1.000000e+00), %295, !dbg !161
  %415 = fmul contract <2 x float> %414, %413, !dbg !161
  %416 = mul i64 %26, 16, !dbg !161
  %417 = add i64 %416, %31, !dbg !161
  %418 = getelementptr float, ptr %16, i64 %417, !dbg !161
  store <2 x float> %415, ptr %418, align 4, !dbg !161
  ret i32 0, !dbg !162
}

define internal i32 @"main$async_dispatch_5_matmul_16x2x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !163 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !164
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !164
  %6 = load ptr, ptr %5, align 8, !dbg !164
  %7 = getelementptr float, ptr %6, i64 32, !dbg !164
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !164
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !165
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !165
  %10 = load ptr, ptr %9, align 8, !dbg !165
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ], !dbg !165
  %11 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !166
  %12 = extractvalue %iree_hal_executable_dispatch_state_v0_t %11, 10, !dbg !166
  %13 = getelementptr ptr, ptr %12, i32 1, !dbg !166
  %14 = load ptr, ptr %13, align 8, !dbg !166
  %15 = getelementptr float, ptr %14, i64 64, !dbg !166
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !166
  %16 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !167
  %17 = extractvalue %iree_hal_executable_workgroup_state_v0_t %16, 0, !dbg !167
  %18 = zext i32 %17 to i64, !dbg !167
  %19 = mul nsw i64 %18, 8, !dbg !167
  %20 = load <2 x float>, ptr @__constant_2x2xf32, align 4, !dbg !167
  %21 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x2xf32, i64 8), align 4, !dbg !167
  %22 = load <2 x float>, ptr @__constant_2xf32_1, align 4, !dbg !168
  %23 = mul i64 %19, 2, !dbg !168
  %24 = add i64 %23, 0, !dbg !168
  %25 = getelementptr float, ptr %10, i64 %24, !dbg !168
  %26 = load <2 x float>, ptr %25, align 4, !dbg !168
  %27 = add i64 %19, 1, !dbg !168
  %28 = mul i64 %27, 2, !dbg !168
  %29 = add i64 %28, 0, !dbg !168
  %30 = getelementptr float, ptr %10, i64 %29, !dbg !168
  %31 = load <2 x float>, ptr %30, align 4, !dbg !168
  %32 = add i64 %19, 2, !dbg !168
  %33 = mul i64 %32, 2, !dbg !168
  %34 = add i64 %33, 0, !dbg !168
  %35 = getelementptr float, ptr %10, i64 %34, !dbg !168
  %36 = load <2 x float>, ptr %35, align 4, !dbg !168
  %37 = add i64 %19, 3, !dbg !168
  %38 = mul i64 %37, 2, !dbg !168
  %39 = add i64 %38, 0, !dbg !168
  %40 = getelementptr float, ptr %10, i64 %39, !dbg !168
  %41 = load <2 x float>, ptr %40, align 4, !dbg !168
  %42 = add i64 %19, 4, !dbg !168
  %43 = mul i64 %42, 2, !dbg !168
  %44 = add i64 %43, 0, !dbg !168
  %45 = getelementptr float, ptr %10, i64 %44, !dbg !168
  %46 = load <2 x float>, ptr %45, align 4, !dbg !168
  %47 = add i64 %19, 5, !dbg !168
  %48 = mul i64 %47, 2, !dbg !168
  %49 = add i64 %48, 0, !dbg !168
  %50 = getelementptr float, ptr %10, i64 %49, !dbg !168
  %51 = load <2 x float>, ptr %50, align 4, !dbg !168
  %52 = add i64 %19, 6, !dbg !168
  %53 = mul i64 %52, 2, !dbg !168
  %54 = add i64 %53, 0, !dbg !168
  %55 = getelementptr float, ptr %10, i64 %54, !dbg !168
  %56 = load <2 x float>, ptr %55, align 4, !dbg !168
  %57 = add i64 %19, 7, !dbg !168
  %58 = mul i64 %57, 2, !dbg !168
  %59 = add i64 %58, 0, !dbg !168
  %60 = getelementptr float, ptr %10, i64 %59, !dbg !168
  %61 = load <2 x float>, ptr %60, align 4, !dbg !168
  %62 = add nuw nsw i64 0, %19
  %63 = getelementptr inbounds nuw float, ptr %7, i64 %62
  %64 = load float, ptr %63, align 4
  %65 = insertelement <2 x float> poison, float %64, i32 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> %20, <2 x float> %22)
  %68 = add nuw nsw i64 0, %27
  %69 = getelementptr inbounds nuw float, ptr %7, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = insertelement <2 x float> poison, float %70, i32 0
  %72 = shufflevector <2 x float> %71, <2 x float> poison, <2 x i32> zeroinitializer
  %73 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %72, <2 x float> %20, <2 x float> %22)
  %74 = add nuw nsw i64 0, %32
  %75 = getelementptr inbounds nuw float, ptr %7, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = insertelement <2 x float> poison, float %76, i32 0
  %78 = shufflevector <2 x float> %77, <2 x float> poison, <2 x i32> zeroinitializer
  %79 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %78, <2 x float> %20, <2 x float> %22)
  %80 = add nuw nsw i64 0, %37
  %81 = getelementptr inbounds nuw float, ptr %7, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = insertelement <2 x float> poison, float %82, i32 0
  %84 = shufflevector <2 x float> %83, <2 x float> poison, <2 x i32> zeroinitializer
  %85 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %84, <2 x float> %20, <2 x float> %22)
  %86 = add nuw nsw i64 0, %42
  %87 = getelementptr inbounds nuw float, ptr %7, i64 %86
  %88 = load float, ptr %87, align 4
  %89 = insertelement <2 x float> poison, float %88, i32 0
  %90 = shufflevector <2 x float> %89, <2 x float> poison, <2 x i32> zeroinitializer
  %91 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %90, <2 x float> %20, <2 x float> %22)
  %92 = add nuw nsw i64 0, %47
  %93 = getelementptr inbounds nuw float, ptr %7, i64 %92
  %94 = load float, ptr %93, align 4
  %95 = insertelement <2 x float> poison, float %94, i32 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> %20, <2 x float> %22)
  %98 = add nuw nsw i64 0, %52
  %99 = getelementptr inbounds nuw float, ptr %7, i64 %98
  %100 = load float, ptr %99, align 4
  %101 = insertelement <2 x float> poison, float %100, i32 0
  %102 = shufflevector <2 x float> %101, <2 x float> poison, <2 x i32> zeroinitializer
  %103 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %102, <2 x float> %20, <2 x float> %22)
  %104 = add nuw nsw i64 0, %57
  %105 = getelementptr inbounds nuw float, ptr %7, i64 %104
  %106 = load float, ptr %105, align 4
  %107 = insertelement <2 x float> poison, float %106, i32 0
  %108 = shufflevector <2 x float> %107, <2 x float> poison, <2 x i32> zeroinitializer
  %109 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %108, <2 x float> %20, <2 x float> %22)
  %110 = add nuw nsw i64 16, %19
  %111 = getelementptr inbounds nuw float, ptr %7, i64 %110
  %112 = load float, ptr %111, align 4
  %113 = insertelement <2 x float> poison, float %112, i32 0
  %114 = shufflevector <2 x float> %113, <2 x float> poison, <2 x i32> zeroinitializer
  %115 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %114, <2 x float> %21, <2 x float> %67)
  %116 = add nuw nsw i64 16, %27
  %117 = getelementptr inbounds nuw float, ptr %7, i64 %116
  %118 = load float, ptr %117, align 4
  %119 = insertelement <2 x float> poison, float %118, i32 0
  %120 = shufflevector <2 x float> %119, <2 x float> poison, <2 x i32> zeroinitializer
  %121 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %120, <2 x float> %21, <2 x float> %73)
  %122 = add nuw nsw i64 16, %32
  %123 = getelementptr inbounds nuw float, ptr %7, i64 %122
  %124 = load float, ptr %123, align 4
  %125 = insertelement <2 x float> poison, float %124, i32 0
  %126 = shufflevector <2 x float> %125, <2 x float> poison, <2 x i32> zeroinitializer
  %127 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %126, <2 x float> %21, <2 x float> %79)
  %128 = add nuw nsw i64 16, %37
  %129 = getelementptr inbounds nuw float, ptr %7, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = insertelement <2 x float> poison, float %130, i32 0
  %132 = shufflevector <2 x float> %131, <2 x float> poison, <2 x i32> zeroinitializer
  %133 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %132, <2 x float> %21, <2 x float> %85)
  %134 = add nuw nsw i64 16, %42
  %135 = getelementptr inbounds nuw float, ptr %7, i64 %134
  %136 = load float, ptr %135, align 4
  %137 = insertelement <2 x float> poison, float %136, i32 0
  %138 = shufflevector <2 x float> %137, <2 x float> poison, <2 x i32> zeroinitializer
  %139 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %138, <2 x float> %21, <2 x float> %91)
  %140 = add nuw nsw i64 16, %47
  %141 = getelementptr inbounds nuw float, ptr %7, i64 %140
  %142 = load float, ptr %141, align 4
  %143 = insertelement <2 x float> poison, float %142, i32 0
  %144 = shufflevector <2 x float> %143, <2 x float> poison, <2 x i32> zeroinitializer
  %145 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %144, <2 x float> %21, <2 x float> %97)
  %146 = add nuw nsw i64 16, %52
  %147 = getelementptr inbounds nuw float, ptr %7, i64 %146
  %148 = load float, ptr %147, align 4
  %149 = insertelement <2 x float> poison, float %148, i32 0
  %150 = shufflevector <2 x float> %149, <2 x float> poison, <2 x i32> zeroinitializer
  %151 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %150, <2 x float> %21, <2 x float> %103)
  %152 = add nuw nsw i64 16, %57
  %153 = getelementptr inbounds nuw float, ptr %7, i64 %152
  %154 = load float, ptr %153, align 4
  %155 = insertelement <2 x float> poison, float %154, i32 0
  %156 = shufflevector <2 x float> %155, <2 x float> poison, <2 x i32> zeroinitializer
  %157 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %156, <2 x float> %21, <2 x float> %109)
  %158 = fadd contract <2 x float> %115, %26, !dbg !169
  %159 = fadd contract <2 x float> %121, %31, !dbg !169
  %160 = fadd contract <2 x float> %127, %36, !dbg !169
  %161 = fadd contract <2 x float> %133, %41, !dbg !169
  %162 = fadd contract <2 x float> %139, %46, !dbg !169
  %163 = fadd contract <2 x float> %145, %51, !dbg !169
  %164 = fadd contract <2 x float> %151, %56, !dbg !169
  %165 = fadd contract <2 x float> %157, %61, !dbg !169
  %166 = getelementptr float, ptr %15, i64 %24, !dbg !169
  store <2 x float> %158, ptr %166, align 4, !dbg !169
  %167 = getelementptr float, ptr %15, i64 %29, !dbg !169
  store <2 x float> %159, ptr %167, align 4, !dbg !169
  %168 = getelementptr float, ptr %15, i64 %34, !dbg !169
  store <2 x float> %160, ptr %168, align 4, !dbg !169
  %169 = getelementptr float, ptr %15, i64 %39, !dbg !169
  store <2 x float> %161, ptr %169, align 4, !dbg !169
  %170 = getelementptr float, ptr %15, i64 %44, !dbg !169
  store <2 x float> %162, ptr %170, align 4, !dbg !169
  %171 = getelementptr float, ptr %15, i64 %49, !dbg !169
  store <2 x float> %163, ptr %171, align 4, !dbg !169
  %172 = getelementptr float, ptr %15, i64 %54, !dbg !169
  store <2 x float> %164, ptr %172, align 4, !dbg !169
  %173 = getelementptr float, ptr %15, i64 %59, !dbg !169
  store <2 x float> %165, ptr %173, align 4, !dbg !169
  ret i32 0, !dbg !170
}

define internal i32 @"main$async_dispatch_7_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !171 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !172
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !172
  %6 = load ptr, ptr %5, align 8, !dbg !172
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !172
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !173
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !173
  %9 = getelementptr ptr, ptr %8, i32 1, !dbg !173
  %10 = load ptr, ptr %9, align 8, !dbg !173
  %11 = getelementptr float, ptr %10, i64 32, !dbg !173
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !173
  %12 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !174
  %13 = extractvalue %iree_hal_executable_workgroup_state_v0_t %12, 0, !dbg !174
  %14 = zext i32 %13 to i64, !dbg !174
  %15 = mul nsw i64 %14, 2, !dbg !174
  %16 = mul i64 %15, 2, !dbg !174
  %17 = add i64 %16, 0, !dbg !174
  %18 = getelementptr float, ptr %6, i64 %17, !dbg !174
  %19 = load <2 x float>, ptr %18, align 4, !dbg !174
  %20 = add i64 %15, 1, !dbg !174
  %21 = mul i64 %20, 2, !dbg !174
  %22 = add i64 %21, 0, !dbg !174
  %23 = getelementptr float, ptr %6, i64 %22, !dbg !174
  %24 = load <2 x float>, ptr %23, align 4, !dbg !174
  %25 = fmul contract <2 x float> %19, %19, !dbg !175
  %26 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %25), !dbg !175
  %27 = fmul contract <2 x float> %24, %24, !dbg !175
  %28 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %27), !dbg !175
  %29 = insertelement <2 x float> poison, float %26, i64 0, !dbg !175
  %30 = insertelement <2 x float> %29, float %28, i64 1, !dbg !175
  %31 = load <2 x float>, ptr @__constant_2xf32_0_0, align 4, !dbg !176
  %32 = load <2 x float>, ptr @__constant_2xf32_2, align 4, !dbg !176
  %33 = fdiv <2 x float> %30, splat (float 2.000000e+00), !dbg !177
  %34 = fadd contract <2 x float> %33, splat (float 0x3EE4F8B580000000), !dbg !178
  %35 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> %34), !dbg !179
  %36 = fdiv <2 x float> splat (float 1.000000e+00), %35, !dbg !179
  %37 = shufflevector <2 x float> %36, <2 x float> %36, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !179
  %38 = shufflevector <4 x float> %37, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !179
  %39 = shufflevector <4 x float> %37, <4 x float> %38, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !179
  %40 = shufflevector <4 x float> %39, <4 x float> %39, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !179
  %41 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 0, i32 1>, !dbg !179
  %42 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 2, i32 3>, !dbg !179
  %43 = fmul contract <2 x float> %19, %41, !dbg !180
  %44 = fmul contract <2 x float> %24, %42, !dbg !180
  %45 = fmul contract <2 x float> %43, %31, !dbg !181
  %46 = fmul contract <2 x float> %44, %31, !dbg !181
  %47 = fadd contract <2 x float> %45, %32, !dbg !182
  %48 = fadd contract <2 x float> %46, %32, !dbg !182
  %49 = getelementptr float, ptr %11, i64 %17, !dbg !182
  store <2 x float> %47, ptr %49, align 4, !dbg !182
  %50 = getelementptr float, ptr %11, i64 %22, !dbg !182
  store <2 x float> %48, ptr %50, align 4, !dbg !182
  ret i32 0, !dbg !183
}

define internal i32 @"main$async_dispatch_8_matmul_16x8x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !184 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !185
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !185
  %6 = load ptr, ptr %5, align 8, !dbg !185
  %7 = getelementptr float, ptr %6, i64 32, !dbg !185
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !185
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !186
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !186
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !186
  %11 = load ptr, ptr %10, align 8, !dbg !186
  %12 = getelementptr float, ptr %11, i64 96, !dbg !186
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !186
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !187
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !187
  %15 = zext i32 %14 to i64, !dbg !187
  %16 = mul nsw i64 %15, 8, !dbg !187
  %17 = load <8 x float>, ptr @__constant_2x8xf32, align 4, !dbg !187
  %18 = load <8 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x8xf32, i64 32), align 4, !dbg !187
  %19 = load <8 x float>, ptr @__constant_8xf32, align 4, !dbg !188
  %20 = mul nuw nsw i64 %16, 2
  %21 = add nuw nsw i64 %20, 0
  %22 = getelementptr inbounds nuw float, ptr %7, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = insertelement <8 x float> poison, float %23, i32 0
  %25 = shufflevector <8 x float> %24, <8 x float> poison, <8 x i32> zeroinitializer
  %26 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %25, <8 x float> %17, <8 x float> %19)
  %27 = add i64 %16, 1, !dbg !189
  %28 = mul nuw nsw i64 %27, 2
  %29 = add nuw nsw i64 %28, 0
  %30 = getelementptr inbounds nuw float, ptr %7, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = insertelement <8 x float> poison, float %31, i32 0
  %33 = shufflevector <8 x float> %32, <8 x float> poison, <8 x i32> zeroinitializer
  %34 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %33, <8 x float> %17, <8 x float> %19)
  %35 = add i64 %16, 2, !dbg !189
  %36 = mul nuw nsw i64 %35, 2
  %37 = add nuw nsw i64 %36, 0
  %38 = getelementptr inbounds nuw float, ptr %7, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = insertelement <8 x float> poison, float %39, i32 0
  %41 = shufflevector <8 x float> %40, <8 x float> poison, <8 x i32> zeroinitializer
  %42 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %41, <8 x float> %17, <8 x float> %19)
  %43 = add i64 %16, 3, !dbg !189
  %44 = mul nuw nsw i64 %43, 2
  %45 = add nuw nsw i64 %44, 0
  %46 = getelementptr inbounds nuw float, ptr %7, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = insertelement <8 x float> poison, float %47, i32 0
  %49 = shufflevector <8 x float> %48, <8 x float> poison, <8 x i32> zeroinitializer
  %50 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %49, <8 x float> %17, <8 x float> %19)
  %51 = add i64 %16, 4, !dbg !189
  %52 = mul nuw nsw i64 %51, 2
  %53 = add nuw nsw i64 %52, 0
  %54 = getelementptr inbounds nuw float, ptr %7, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = insertelement <8 x float> poison, float %55, i32 0
  %57 = shufflevector <8 x float> %56, <8 x float> poison, <8 x i32> zeroinitializer
  %58 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %57, <8 x float> %17, <8 x float> %19)
  %59 = add i64 %16, 5, !dbg !189
  %60 = mul nuw nsw i64 %59, 2
  %61 = add nuw nsw i64 %60, 0
  %62 = getelementptr inbounds nuw float, ptr %7, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = insertelement <8 x float> poison, float %63, i32 0
  %65 = shufflevector <8 x float> %64, <8 x float> poison, <8 x i32> zeroinitializer
  %66 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %65, <8 x float> %17, <8 x float> %19)
  %67 = add i64 %16, 6, !dbg !189
  %68 = mul nuw nsw i64 %67, 2
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <8 x float> poison, float %71, i32 0
  %73 = shufflevector <8 x float> %72, <8 x float> poison, <8 x i32> zeroinitializer
  %74 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %73, <8 x float> %17, <8 x float> %19)
  %75 = add i64 %16, 7, !dbg !189
  %76 = mul nuw nsw i64 %75, 2
  %77 = add nuw nsw i64 %76, 0
  %78 = getelementptr inbounds nuw float, ptr %7, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = insertelement <8 x float> poison, float %79, i32 0
  %81 = shufflevector <8 x float> %80, <8 x float> poison, <8 x i32> zeroinitializer
  %82 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %81, <8 x float> %17, <8 x float> %19)
  %83 = add nuw nsw i64 %20, 1
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <8 x float> poison, float %85, i32 0
  %87 = shufflevector <8 x float> %86, <8 x float> poison, <8 x i32> zeroinitializer
  %88 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %87, <8 x float> %18, <8 x float> %26)
  %89 = add nuw nsw i64 %28, 1
  %90 = getelementptr inbounds nuw float, ptr %7, i64 %89
  %91 = load float, ptr %90, align 4
  %92 = insertelement <8 x float> poison, float %91, i32 0
  %93 = shufflevector <8 x float> %92, <8 x float> poison, <8 x i32> zeroinitializer
  %94 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %93, <8 x float> %18, <8 x float> %34)
  %95 = add nuw nsw i64 %36, 1
  %96 = getelementptr inbounds nuw float, ptr %7, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = insertelement <8 x float> poison, float %97, i32 0
  %99 = shufflevector <8 x float> %98, <8 x float> poison, <8 x i32> zeroinitializer
  %100 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %99, <8 x float> %18, <8 x float> %42)
  %101 = add nuw nsw i64 %44, 1
  %102 = getelementptr inbounds nuw float, ptr %7, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = insertelement <8 x float> poison, float %103, i32 0
  %105 = shufflevector <8 x float> %104, <8 x float> poison, <8 x i32> zeroinitializer
  %106 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %105, <8 x float> %18, <8 x float> %50)
  %107 = add nuw nsw i64 %52, 1
  %108 = getelementptr inbounds nuw float, ptr %7, i64 %107
  %109 = load float, ptr %108, align 4
  %110 = insertelement <8 x float> poison, float %109, i32 0
  %111 = shufflevector <8 x float> %110, <8 x float> poison, <8 x i32> zeroinitializer
  %112 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %111, <8 x float> %18, <8 x float> %58)
  %113 = add nuw nsw i64 %60, 1
  %114 = getelementptr inbounds nuw float, ptr %7, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = insertelement <8 x float> poison, float %115, i32 0
  %117 = shufflevector <8 x float> %116, <8 x float> poison, <8 x i32> zeroinitializer
  %118 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %117, <8 x float> %18, <8 x float> %66)
  %119 = add nuw nsw i64 %68, 1
  %120 = getelementptr inbounds nuw float, ptr %7, i64 %119
  %121 = load float, ptr %120, align 4
  %122 = insertelement <8 x float> poison, float %121, i32 0
  %123 = shufflevector <8 x float> %122, <8 x float> poison, <8 x i32> zeroinitializer
  %124 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %123, <8 x float> %18, <8 x float> %74)
  %125 = add nuw nsw i64 %76, 1
  %126 = getelementptr inbounds nuw float, ptr %7, i64 %125
  %127 = load float, ptr %126, align 4
  %128 = insertelement <8 x float> poison, float %127, i32 0
  %129 = shufflevector <8 x float> %128, <8 x float> poison, <8 x i32> zeroinitializer
  %130 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %129, <8 x float> %18, <8 x float> %82)
  %131 = fmul contract <8 x float> %88, %88, !dbg !190
  %132 = fmul contract <8 x float> %94, %94, !dbg !190
  %133 = fmul contract <8 x float> %100, %100, !dbg !190
  %134 = fmul contract <8 x float> %106, %106, !dbg !190
  %135 = fmul contract <8 x float> %112, %112, !dbg !190
  %136 = fmul contract <8 x float> %118, %118, !dbg !190
  %137 = fmul contract <8 x float> %124, %124, !dbg !190
  %138 = fmul contract <8 x float> %130, %130, !dbg !190
  %139 = fmul contract <8 x float> %131, %88, !dbg !190
  %140 = fmul contract <8 x float> %132, %94, !dbg !190
  %141 = fmul contract <8 x float> %133, %100, !dbg !190
  %142 = fmul contract <8 x float> %134, %106, !dbg !190
  %143 = fmul contract <8 x float> %135, %112, !dbg !190
  %144 = fmul contract <8 x float> %136, %118, !dbg !190
  %145 = fmul contract <8 x float> %137, %124, !dbg !190
  %146 = fmul contract <8 x float> %138, %130, !dbg !190
  %147 = fmul contract <8 x float> %139, splat (float 0x3FA6E4E260000000), !dbg !191
  %148 = fmul contract <8 x float> %140, splat (float 0x3FA6E4E260000000), !dbg !191
  %149 = fmul contract <8 x float> %141, splat (float 0x3FA6E4E260000000), !dbg !191
  %150 = fmul contract <8 x float> %142, splat (float 0x3FA6E4E260000000), !dbg !191
  %151 = fmul contract <8 x float> %143, splat (float 0x3FA6E4E260000000), !dbg !191
  %152 = fmul contract <8 x float> %144, splat (float 0x3FA6E4E260000000), !dbg !191
  %153 = fmul contract <8 x float> %145, splat (float 0x3FA6E4E260000000), !dbg !191
  %154 = fmul contract <8 x float> %146, splat (float 0x3FA6E4E260000000), !dbg !191
  %155 = fadd contract <8 x float> %88, %147, !dbg !192
  %156 = fadd contract <8 x float> %94, %148, !dbg !192
  %157 = fadd contract <8 x float> %100, %149, !dbg !192
  %158 = fadd contract <8 x float> %106, %150, !dbg !192
  %159 = fadd contract <8 x float> %112, %151, !dbg !192
  %160 = fadd contract <8 x float> %118, %152, !dbg !192
  %161 = fadd contract <8 x float> %124, %153, !dbg !192
  %162 = fadd contract <8 x float> %130, %154, !dbg !192
  %163 = fmul contract <8 x float> %155, splat (float 0x3FE9884520000000), !dbg !193
  %164 = fmul contract <8 x float> %156, splat (float 0x3FE9884520000000), !dbg !193
  %165 = fmul contract <8 x float> %157, splat (float 0x3FE9884520000000), !dbg !193
  %166 = fmul contract <8 x float> %158, splat (float 0x3FE9884520000000), !dbg !193
  %167 = fmul contract <8 x float> %159, splat (float 0x3FE9884520000000), !dbg !193
  %168 = fmul contract <8 x float> %160, splat (float 0x3FE9884520000000), !dbg !193
  %169 = fmul contract <8 x float> %161, splat (float 0x3FE9884520000000), !dbg !193
  %170 = fmul contract <8 x float> %162, splat (float 0x3FE9884520000000), !dbg !193
  %171 = fcmp ult <8 x float> %163, splat (float 0x401FFEC880000000), !dbg !194
  %172 = fcmp ult <8 x float> %164, splat (float 0x401FFEC880000000), !dbg !194
  %173 = fcmp ult <8 x float> %165, splat (float 0x401FFEC880000000), !dbg !194
  %174 = fcmp ult <8 x float> %166, splat (float 0x401FFEC880000000), !dbg !194
  %175 = fcmp ult <8 x float> %167, splat (float 0x401FFEC880000000), !dbg !194
  %176 = fcmp ult <8 x float> %168, splat (float 0x401FFEC880000000), !dbg !194
  %177 = fcmp ult <8 x float> %169, splat (float 0x401FFEC880000000), !dbg !194
  %178 = fcmp ult <8 x float> %170, splat (float 0x401FFEC880000000), !dbg !194
  %179 = select <8 x i1> %171, <8 x float> %163, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %180 = select <8 x i1> %172, <8 x float> %164, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %181 = select <8 x i1> %173, <8 x float> %165, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %182 = select <8 x i1> %174, <8 x float> %166, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %183 = select <8 x i1> %175, <8 x float> %167, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %184 = select <8 x i1> %176, <8 x float> %168, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %185 = select <8 x i1> %177, <8 x float> %169, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %186 = select <8 x i1> %178, <8 x float> %170, <8 x float> splat (float 0x401FFEC880000000), !dbg !194
  %187 = fcmp ugt <8 x float> %179, splat (float 0xC01FFEC880000000), !dbg !194
  %188 = fcmp ugt <8 x float> %180, splat (float 0xC01FFEC880000000), !dbg !194
  %189 = fcmp ugt <8 x float> %181, splat (float 0xC01FFEC880000000), !dbg !194
  %190 = fcmp ugt <8 x float> %182, splat (float 0xC01FFEC880000000), !dbg !194
  %191 = fcmp ugt <8 x float> %183, splat (float 0xC01FFEC880000000), !dbg !194
  %192 = fcmp ugt <8 x float> %184, splat (float 0xC01FFEC880000000), !dbg !194
  %193 = fcmp ugt <8 x float> %185, splat (float 0xC01FFEC880000000), !dbg !194
  %194 = fcmp ugt <8 x float> %186, splat (float 0xC01FFEC880000000), !dbg !194
  %195 = select <8 x i1> %187, <8 x float> %179, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %196 = select <8 x i1> %188, <8 x float> %180, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %197 = select <8 x i1> %189, <8 x float> %181, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %198 = select <8 x i1> %190, <8 x float> %182, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %199 = select <8 x i1> %191, <8 x float> %183, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %200 = select <8 x i1> %192, <8 x float> %184, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %201 = select <8 x i1> %193, <8 x float> %185, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %202 = select <8 x i1> %194, <8 x float> %186, <8 x float> splat (float 0xC01FFEC880000000), !dbg !194
  %203 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %163), !dbg !194
  %204 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %164), !dbg !194
  %205 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %165), !dbg !194
  %206 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %166), !dbg !194
  %207 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %167), !dbg !194
  %208 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %168), !dbg !194
  %209 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %169), !dbg !194
  %210 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %170), !dbg !194
  %211 = fcmp olt <8 x float> %203, splat (float 0x3F3A36E2E0000000), !dbg !194
  %212 = fcmp olt <8 x float> %204, splat (float 0x3F3A36E2E0000000), !dbg !194
  %213 = fcmp olt <8 x float> %205, splat (float 0x3F3A36E2E0000000), !dbg !194
  %214 = fcmp olt <8 x float> %206, splat (float 0x3F3A36E2E0000000), !dbg !194
  %215 = fcmp olt <8 x float> %207, splat (float 0x3F3A36E2E0000000), !dbg !194
  %216 = fcmp olt <8 x float> %208, splat (float 0x3F3A36E2E0000000), !dbg !194
  %217 = fcmp olt <8 x float> %209, splat (float 0x3F3A36E2E0000000), !dbg !194
  %218 = fcmp olt <8 x float> %210, splat (float 0x3F3A36E2E0000000), !dbg !194
  %219 = fmul contract <8 x float> %195, %195, !dbg !194
  %220 = fmul contract <8 x float> %196, %196, !dbg !194
  %221 = fmul contract <8 x float> %197, %197, !dbg !194
  %222 = fmul contract <8 x float> %198, %198, !dbg !194
  %223 = fmul contract <8 x float> %199, %199, !dbg !194
  %224 = fmul contract <8 x float> %200, %200, !dbg !194
  %225 = fmul contract <8 x float> %201, %201, !dbg !194
  %226 = fmul contract <8 x float> %202, %202, !dbg !194
  %227 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %228 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %229 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %230 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %231 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %232 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %233 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %234 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !194
  %235 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %227, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %236 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %228, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %237 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %229, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %238 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %230, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %239 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %231, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %240 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %232, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %241 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %233, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %242 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %234, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !194
  %243 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %235, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %244 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %236, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %245 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %237, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %246 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %238, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %247 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %239, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %248 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %240, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %249 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %241, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %250 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %242, <8 x float> splat (float 0x3E6B800820000000)), !dbg !194
  %251 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %243, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %252 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %244, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %253 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %245, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %254 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %246, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %255 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %247, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %256 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %248, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %257 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %249, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %258 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %250, <8 x float> splat (float 0x3EEF286940000000)), !dbg !194
  %259 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %251, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %260 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %252, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %261 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %253, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %262 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %254, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %263 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %255, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %264 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %256, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %265 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %257, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %266 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %258, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !194
  %267 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %259, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %268 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %260, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %269 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %261, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %270 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %262, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %271 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %263, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %272 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %264, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %273 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %265, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %274 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %266, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !194
  %275 = fmul contract <8 x float> %195, %267, !dbg !194
  %276 = fmul contract <8 x float> %196, %268, !dbg !194
  %277 = fmul contract <8 x float> %197, %269, !dbg !194
  %278 = fmul contract <8 x float> %198, %270, !dbg !194
  %279 = fmul contract <8 x float> %199, %271, !dbg !194
  %280 = fmul contract <8 x float> %200, %272, !dbg !194
  %281 = fmul contract <8 x float> %201, %273, !dbg !194
  %282 = fmul contract <8 x float> %202, %274, !dbg !194
  %283 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %284 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %285 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %286 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %287 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %288 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %289 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %290 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !194
  %291 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %283, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %292 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %284, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %293 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %285, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %294 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %286, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %295 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %287, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %296 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %288, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %297 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %289, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %298 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %290, <8 x float> splat (float 0x3F629540A0000000)), !dbg !194
  %299 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %291, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %300 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %292, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %301 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %293, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %302 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %294, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %303 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %295, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %304 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %296, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %305 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %297, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %306 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %298, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !194
  %307 = fdiv <8 x float> %275, %299, !dbg !194
  %308 = fdiv <8 x float> %276, %300, !dbg !194
  %309 = fdiv <8 x float> %277, %301, !dbg !194
  %310 = fdiv <8 x float> %278, %302, !dbg !194
  %311 = fdiv <8 x float> %279, %303, !dbg !194
  %312 = fdiv <8 x float> %280, %304, !dbg !194
  %313 = fdiv <8 x float> %281, %305, !dbg !194
  %314 = fdiv <8 x float> %282, %306, !dbg !194
  %315 = select <8 x i1> %211, <8 x float> %195, <8 x float> %307, !dbg !194
  %316 = select <8 x i1> %212, <8 x float> %196, <8 x float> %308, !dbg !194
  %317 = select <8 x i1> %213, <8 x float> %197, <8 x float> %309, !dbg !194
  %318 = select <8 x i1> %214, <8 x float> %198, <8 x float> %310, !dbg !194
  %319 = select <8 x i1> %215, <8 x float> %199, <8 x float> %311, !dbg !194
  %320 = select <8 x i1> %216, <8 x float> %200, <8 x float> %312, !dbg !194
  %321 = select <8 x i1> %217, <8 x float> %201, <8 x float> %313, !dbg !194
  %322 = select <8 x i1> %218, <8 x float> %202, <8 x float> %314, !dbg !194
  %323 = fadd contract <8 x float> %315, splat (float 1.000000e+00), !dbg !195
  %324 = fadd contract <8 x float> %316, splat (float 1.000000e+00), !dbg !195
  %325 = fadd contract <8 x float> %317, splat (float 1.000000e+00), !dbg !195
  %326 = fadd contract <8 x float> %318, splat (float 1.000000e+00), !dbg !195
  %327 = fadd contract <8 x float> %319, splat (float 1.000000e+00), !dbg !195
  %328 = fadd contract <8 x float> %320, splat (float 1.000000e+00), !dbg !195
  %329 = fadd contract <8 x float> %321, splat (float 1.000000e+00), !dbg !195
  %330 = fadd contract <8 x float> %322, splat (float 1.000000e+00), !dbg !195
  %331 = fmul contract <8 x float> %88, splat (float 5.000000e-01), !dbg !196
  %332 = fmul contract <8 x float> %94, splat (float 5.000000e-01), !dbg !196
  %333 = fmul contract <8 x float> %100, splat (float 5.000000e-01), !dbg !196
  %334 = fmul contract <8 x float> %106, splat (float 5.000000e-01), !dbg !196
  %335 = fmul contract <8 x float> %112, splat (float 5.000000e-01), !dbg !196
  %336 = fmul contract <8 x float> %118, splat (float 5.000000e-01), !dbg !196
  %337 = fmul contract <8 x float> %124, splat (float 5.000000e-01), !dbg !196
  %338 = fmul contract <8 x float> %130, splat (float 5.000000e-01), !dbg !196
  %339 = fmul contract <8 x float> %331, %323, !dbg !189
  %340 = fmul contract <8 x float> %332, %324, !dbg !189
  %341 = fmul contract <8 x float> %333, %325, !dbg !189
  %342 = fmul contract <8 x float> %334, %326, !dbg !189
  %343 = fmul contract <8 x float> %335, %327, !dbg !189
  %344 = fmul contract <8 x float> %336, %328, !dbg !189
  %345 = fmul contract <8 x float> %337, %329, !dbg !189
  %346 = fmul contract <8 x float> %338, %330, !dbg !189
  %347 = mul i64 %16, 8, !dbg !189
  %348 = add i64 %347, 0, !dbg !189
  %349 = getelementptr float, ptr %12, i64 %348, !dbg !189
  store <8 x float> %339, ptr %349, align 4, !dbg !189
  %350 = mul i64 %27, 8, !dbg !189
  %351 = add i64 %350, 0, !dbg !189
  %352 = getelementptr float, ptr %12, i64 %351, !dbg !189
  store <8 x float> %340, ptr %352, align 4, !dbg !189
  %353 = mul i64 %35, 8, !dbg !189
  %354 = add i64 %353, 0, !dbg !189
  %355 = getelementptr float, ptr %12, i64 %354, !dbg !189
  store <8 x float> %341, ptr %355, align 4, !dbg !189
  %356 = mul i64 %43, 8, !dbg !189
  %357 = add i64 %356, 0, !dbg !189
  %358 = getelementptr float, ptr %12, i64 %357, !dbg !189
  store <8 x float> %342, ptr %358, align 4, !dbg !189
  %359 = mul i64 %51, 8, !dbg !189
  %360 = add i64 %359, 0, !dbg !189
  %361 = getelementptr float, ptr %12, i64 %360, !dbg !189
  store <8 x float> %343, ptr %361, align 4, !dbg !189
  %362 = mul i64 %59, 8, !dbg !189
  %363 = add i64 %362, 0, !dbg !189
  %364 = getelementptr float, ptr %12, i64 %363, !dbg !189
  store <8 x float> %344, ptr %364, align 4, !dbg !189
  %365 = mul i64 %67, 8, !dbg !189
  %366 = add i64 %365, 0, !dbg !189
  %367 = getelementptr float, ptr %12, i64 %366, !dbg !189
  store <8 x float> %345, ptr %367, align 4, !dbg !189
  %368 = mul i64 %75, 8, !dbg !189
  %369 = add i64 %368, 0, !dbg !189
  %370 = getelementptr float, ptr %12, i64 %369, !dbg !189
  store <8 x float> %346, ptr %370, align 4, !dbg !189
  ret i32 0, !dbg !197
}

define internal i32 @"main$async_dispatch_9_matmul_16x2x8_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !198 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !199
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !199
  %6 = load ptr, ptr %5, align 8, !dbg !199
  %7 = getelementptr float, ptr %6, i64 96, !dbg !199
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !199
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !200
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !200
  %10 = load ptr, ptr %9, align 8, !dbg !200
  %11 = getelementptr float, ptr %10, i64 64, !dbg !200
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !200
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !201
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !201
  %14 = getelementptr ptr, ptr %13, i32 1, !dbg !201
  %15 = load ptr, ptr %14, align 8, !dbg !201
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !201
  %16 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !202
  %17 = extractvalue %iree_hal_executable_workgroup_state_v0_t %16, 0, !dbg !202
  %18 = zext i32 %17 to i64, !dbg !202
  %19 = mul nsw i64 %18, 8, !dbg !202
  %20 = load <2 x float>, ptr @__constant_8x2xf32, align 4, !dbg !202
  %21 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 8), align 4, !dbg !202
  %22 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 16), align 4, !dbg !202
  %23 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 24), align 4, !dbg !202
  %24 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 32), align 4, !dbg !202
  %25 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 40), align 4, !dbg !202
  %26 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 48), align 4, !dbg !202
  %27 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32, i64 56), align 4, !dbg !202
  %28 = mul i64 %19, 2, !dbg !203
  %29 = add i64 %28, 0, !dbg !203
  %30 = getelementptr float, ptr %11, i64 %29, !dbg !203
  %31 = load <2 x float>, ptr %30, align 4, !dbg !203
  %32 = add i64 %19, 1, !dbg !203
  %33 = mul i64 %32, 2, !dbg !203
  %34 = add i64 %33, 0, !dbg !203
  %35 = getelementptr float, ptr %11, i64 %34, !dbg !203
  %36 = load <2 x float>, ptr %35, align 4, !dbg !203
  %37 = add i64 %19, 2, !dbg !203
  %38 = mul i64 %37, 2, !dbg !203
  %39 = add i64 %38, 0, !dbg !203
  %40 = getelementptr float, ptr %11, i64 %39, !dbg !203
  %41 = load <2 x float>, ptr %40, align 4, !dbg !203
  %42 = add i64 %19, 3, !dbg !203
  %43 = mul i64 %42, 2, !dbg !203
  %44 = add i64 %43, 0, !dbg !203
  %45 = getelementptr float, ptr %11, i64 %44, !dbg !203
  %46 = load <2 x float>, ptr %45, align 4, !dbg !203
  %47 = add i64 %19, 4, !dbg !203
  %48 = mul i64 %47, 2, !dbg !203
  %49 = add i64 %48, 0, !dbg !203
  %50 = getelementptr float, ptr %11, i64 %49, !dbg !203
  %51 = load <2 x float>, ptr %50, align 4, !dbg !203
  %52 = add i64 %19, 5, !dbg !203
  %53 = mul i64 %52, 2, !dbg !203
  %54 = add i64 %53, 0, !dbg !203
  %55 = getelementptr float, ptr %11, i64 %54, !dbg !203
  %56 = load <2 x float>, ptr %55, align 4, !dbg !203
  %57 = add i64 %19, 6, !dbg !203
  %58 = mul i64 %57, 2, !dbg !203
  %59 = add i64 %58, 0, !dbg !203
  %60 = getelementptr float, ptr %11, i64 %59, !dbg !203
  %61 = load <2 x float>, ptr %60, align 4, !dbg !203
  %62 = add i64 %19, 7, !dbg !203
  %63 = mul i64 %62, 2, !dbg !203
  %64 = add i64 %63, 0, !dbg !203
  %65 = getelementptr float, ptr %11, i64 %64, !dbg !203
  %66 = load <2 x float>, ptr %65, align 4, !dbg !203
  %67 = load <2 x float>, ptr @__constant_2xf32_3, align 4, !dbg !203
  %68 = mul nuw nsw i64 %19, 8
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <2 x float> poison, float %71, i32 0
  %73 = shufflevector <2 x float> %72, <2 x float> poison, <2 x i32> zeroinitializer
  %74 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %73, <2 x float> %20, <2 x float> %67)
  %75 = mul nuw nsw i64 %32, 8
  %76 = add nuw nsw i64 %75, 0
  %77 = getelementptr inbounds nuw float, ptr %7, i64 %76
  %78 = load float, ptr %77, align 4
  %79 = insertelement <2 x float> poison, float %78, i32 0
  %80 = shufflevector <2 x float> %79, <2 x float> poison, <2 x i32> zeroinitializer
  %81 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %80, <2 x float> %20, <2 x float> %67)
  %82 = mul nuw nsw i64 %37, 8
  %83 = add nuw nsw i64 %82, 0
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <2 x float> poison, float %85, i32 0
  %87 = shufflevector <2 x float> %86, <2 x float> poison, <2 x i32> zeroinitializer
  %88 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %87, <2 x float> %20, <2 x float> %67)
  %89 = mul nuw nsw i64 %42, 8
  %90 = add nuw nsw i64 %89, 0
  %91 = getelementptr inbounds nuw float, ptr %7, i64 %90
  %92 = load float, ptr %91, align 4
  %93 = insertelement <2 x float> poison, float %92, i32 0
  %94 = shufflevector <2 x float> %93, <2 x float> poison, <2 x i32> zeroinitializer
  %95 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %94, <2 x float> %20, <2 x float> %67)
  %96 = mul nuw nsw i64 %47, 8
  %97 = add nuw nsw i64 %96, 0
  %98 = getelementptr inbounds nuw float, ptr %7, i64 %97
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i32 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> %20, <2 x float> %67)
  %103 = mul nuw nsw i64 %52, 8
  %104 = add nuw nsw i64 %103, 0
  %105 = getelementptr inbounds nuw float, ptr %7, i64 %104
  %106 = load float, ptr %105, align 4
  %107 = insertelement <2 x float> poison, float %106, i32 0
  %108 = shufflevector <2 x float> %107, <2 x float> poison, <2 x i32> zeroinitializer
  %109 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %108, <2 x float> %20, <2 x float> %67)
  %110 = mul nuw nsw i64 %57, 8
  %111 = add nuw nsw i64 %110, 0
  %112 = getelementptr inbounds nuw float, ptr %7, i64 %111
  %113 = load float, ptr %112, align 4
  %114 = insertelement <2 x float> poison, float %113, i32 0
  %115 = shufflevector <2 x float> %114, <2 x float> poison, <2 x i32> zeroinitializer
  %116 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %115, <2 x float> %20, <2 x float> %67)
  %117 = mul nuw nsw i64 %62, 8
  %118 = add nuw nsw i64 %117, 0
  %119 = getelementptr inbounds nuw float, ptr %7, i64 %118
  %120 = load float, ptr %119, align 4
  %121 = insertelement <2 x float> poison, float %120, i32 0
  %122 = shufflevector <2 x float> %121, <2 x float> poison, <2 x i32> zeroinitializer
  %123 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %122, <2 x float> %20, <2 x float> %67)
  %124 = add nuw nsw i64 %68, 1
  %125 = getelementptr inbounds nuw float, ptr %7, i64 %124
  %126 = load float, ptr %125, align 4
  %127 = insertelement <2 x float> poison, float %126, i32 0
  %128 = shufflevector <2 x float> %127, <2 x float> poison, <2 x i32> zeroinitializer
  %129 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %128, <2 x float> %21, <2 x float> %74)
  %130 = add nuw nsw i64 %75, 1
  %131 = getelementptr inbounds nuw float, ptr %7, i64 %130
  %132 = load float, ptr %131, align 4
  %133 = insertelement <2 x float> poison, float %132, i32 0
  %134 = shufflevector <2 x float> %133, <2 x float> poison, <2 x i32> zeroinitializer
  %135 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %134, <2 x float> %21, <2 x float> %81)
  %136 = add nuw nsw i64 %82, 1
  %137 = getelementptr inbounds nuw float, ptr %7, i64 %136
  %138 = load float, ptr %137, align 4
  %139 = insertelement <2 x float> poison, float %138, i32 0
  %140 = shufflevector <2 x float> %139, <2 x float> poison, <2 x i32> zeroinitializer
  %141 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %140, <2 x float> %21, <2 x float> %88)
  %142 = add nuw nsw i64 %89, 1
  %143 = getelementptr inbounds nuw float, ptr %7, i64 %142
  %144 = load float, ptr %143, align 4
  %145 = insertelement <2 x float> poison, float %144, i32 0
  %146 = shufflevector <2 x float> %145, <2 x float> poison, <2 x i32> zeroinitializer
  %147 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %146, <2 x float> %21, <2 x float> %95)
  %148 = add nuw nsw i64 %96, 1
  %149 = getelementptr inbounds nuw float, ptr %7, i64 %148
  %150 = load float, ptr %149, align 4
  %151 = insertelement <2 x float> poison, float %150, i32 0
  %152 = shufflevector <2 x float> %151, <2 x float> poison, <2 x i32> zeroinitializer
  %153 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %152, <2 x float> %21, <2 x float> %102)
  %154 = add nuw nsw i64 %103, 1
  %155 = getelementptr inbounds nuw float, ptr %7, i64 %154
  %156 = load float, ptr %155, align 4
  %157 = insertelement <2 x float> poison, float %156, i32 0
  %158 = shufflevector <2 x float> %157, <2 x float> poison, <2 x i32> zeroinitializer
  %159 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %158, <2 x float> %21, <2 x float> %109)
  %160 = add nuw nsw i64 %110, 1
  %161 = getelementptr inbounds nuw float, ptr %7, i64 %160
  %162 = load float, ptr %161, align 4
  %163 = insertelement <2 x float> poison, float %162, i32 0
  %164 = shufflevector <2 x float> %163, <2 x float> poison, <2 x i32> zeroinitializer
  %165 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %164, <2 x float> %21, <2 x float> %116)
  %166 = add nuw nsw i64 %117, 1
  %167 = getelementptr inbounds nuw float, ptr %7, i64 %166
  %168 = load float, ptr %167, align 4
  %169 = insertelement <2 x float> poison, float %168, i32 0
  %170 = shufflevector <2 x float> %169, <2 x float> poison, <2 x i32> zeroinitializer
  %171 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %170, <2 x float> %21, <2 x float> %123)
  %172 = add nuw nsw i64 %68, 2
  %173 = getelementptr inbounds nuw float, ptr %7, i64 %172
  %174 = load float, ptr %173, align 4
  %175 = insertelement <2 x float> poison, float %174, i32 0
  %176 = shufflevector <2 x float> %175, <2 x float> poison, <2 x i32> zeroinitializer
  %177 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %176, <2 x float> %22, <2 x float> %129)
  %178 = add nuw nsw i64 %75, 2
  %179 = getelementptr inbounds nuw float, ptr %7, i64 %178
  %180 = load float, ptr %179, align 4
  %181 = insertelement <2 x float> poison, float %180, i32 0
  %182 = shufflevector <2 x float> %181, <2 x float> poison, <2 x i32> zeroinitializer
  %183 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %182, <2 x float> %22, <2 x float> %135)
  %184 = add nuw nsw i64 %82, 2
  %185 = getelementptr inbounds nuw float, ptr %7, i64 %184
  %186 = load float, ptr %185, align 4
  %187 = insertelement <2 x float> poison, float %186, i32 0
  %188 = shufflevector <2 x float> %187, <2 x float> poison, <2 x i32> zeroinitializer
  %189 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %188, <2 x float> %22, <2 x float> %141)
  %190 = add nuw nsw i64 %89, 2
  %191 = getelementptr inbounds nuw float, ptr %7, i64 %190
  %192 = load float, ptr %191, align 4
  %193 = insertelement <2 x float> poison, float %192, i32 0
  %194 = shufflevector <2 x float> %193, <2 x float> poison, <2 x i32> zeroinitializer
  %195 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %194, <2 x float> %22, <2 x float> %147)
  %196 = add nuw nsw i64 %96, 2
  %197 = getelementptr inbounds nuw float, ptr %7, i64 %196
  %198 = load float, ptr %197, align 4
  %199 = insertelement <2 x float> poison, float %198, i32 0
  %200 = shufflevector <2 x float> %199, <2 x float> poison, <2 x i32> zeroinitializer
  %201 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %200, <2 x float> %22, <2 x float> %153)
  %202 = add nuw nsw i64 %103, 2
  %203 = getelementptr inbounds nuw float, ptr %7, i64 %202
  %204 = load float, ptr %203, align 4
  %205 = insertelement <2 x float> poison, float %204, i32 0
  %206 = shufflevector <2 x float> %205, <2 x float> poison, <2 x i32> zeroinitializer
  %207 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %206, <2 x float> %22, <2 x float> %159)
  %208 = add nuw nsw i64 %110, 2
  %209 = getelementptr inbounds nuw float, ptr %7, i64 %208
  %210 = load float, ptr %209, align 4
  %211 = insertelement <2 x float> poison, float %210, i32 0
  %212 = shufflevector <2 x float> %211, <2 x float> poison, <2 x i32> zeroinitializer
  %213 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %212, <2 x float> %22, <2 x float> %165)
  %214 = add nuw nsw i64 %117, 2
  %215 = getelementptr inbounds nuw float, ptr %7, i64 %214
  %216 = load float, ptr %215, align 4
  %217 = insertelement <2 x float> poison, float %216, i32 0
  %218 = shufflevector <2 x float> %217, <2 x float> poison, <2 x i32> zeroinitializer
  %219 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %218, <2 x float> %22, <2 x float> %171)
  %220 = add nuw nsw i64 %68, 3
  %221 = getelementptr inbounds nuw float, ptr %7, i64 %220
  %222 = load float, ptr %221, align 4
  %223 = insertelement <2 x float> poison, float %222, i32 0
  %224 = shufflevector <2 x float> %223, <2 x float> poison, <2 x i32> zeroinitializer
  %225 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %224, <2 x float> %23, <2 x float> %177)
  %226 = add nuw nsw i64 %75, 3
  %227 = getelementptr inbounds nuw float, ptr %7, i64 %226
  %228 = load float, ptr %227, align 4
  %229 = insertelement <2 x float> poison, float %228, i32 0
  %230 = shufflevector <2 x float> %229, <2 x float> poison, <2 x i32> zeroinitializer
  %231 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %230, <2 x float> %23, <2 x float> %183)
  %232 = add nuw nsw i64 %82, 3
  %233 = getelementptr inbounds nuw float, ptr %7, i64 %232
  %234 = load float, ptr %233, align 4
  %235 = insertelement <2 x float> poison, float %234, i32 0
  %236 = shufflevector <2 x float> %235, <2 x float> poison, <2 x i32> zeroinitializer
  %237 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %236, <2 x float> %23, <2 x float> %189)
  %238 = add nuw nsw i64 %89, 3
  %239 = getelementptr inbounds nuw float, ptr %7, i64 %238
  %240 = load float, ptr %239, align 4
  %241 = insertelement <2 x float> poison, float %240, i32 0
  %242 = shufflevector <2 x float> %241, <2 x float> poison, <2 x i32> zeroinitializer
  %243 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %242, <2 x float> %23, <2 x float> %195)
  %244 = add nuw nsw i64 %96, 3
  %245 = getelementptr inbounds nuw float, ptr %7, i64 %244
  %246 = load float, ptr %245, align 4
  %247 = insertelement <2 x float> poison, float %246, i32 0
  %248 = shufflevector <2 x float> %247, <2 x float> poison, <2 x i32> zeroinitializer
  %249 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %248, <2 x float> %23, <2 x float> %201)
  %250 = add nuw nsw i64 %103, 3
  %251 = getelementptr inbounds nuw float, ptr %7, i64 %250
  %252 = load float, ptr %251, align 4
  %253 = insertelement <2 x float> poison, float %252, i32 0
  %254 = shufflevector <2 x float> %253, <2 x float> poison, <2 x i32> zeroinitializer
  %255 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %254, <2 x float> %23, <2 x float> %207)
  %256 = add nuw nsw i64 %110, 3
  %257 = getelementptr inbounds nuw float, ptr %7, i64 %256
  %258 = load float, ptr %257, align 4
  %259 = insertelement <2 x float> poison, float %258, i32 0
  %260 = shufflevector <2 x float> %259, <2 x float> poison, <2 x i32> zeroinitializer
  %261 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %260, <2 x float> %23, <2 x float> %213)
  %262 = add nuw nsw i64 %117, 3
  %263 = getelementptr inbounds nuw float, ptr %7, i64 %262
  %264 = load float, ptr %263, align 4
  %265 = insertelement <2 x float> poison, float %264, i32 0
  %266 = shufflevector <2 x float> %265, <2 x float> poison, <2 x i32> zeroinitializer
  %267 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %266, <2 x float> %23, <2 x float> %219)
  %268 = add nuw nsw i64 %68, 4
  %269 = getelementptr inbounds nuw float, ptr %7, i64 %268
  %270 = load float, ptr %269, align 4
  %271 = insertelement <2 x float> poison, float %270, i32 0
  %272 = shufflevector <2 x float> %271, <2 x float> poison, <2 x i32> zeroinitializer
  %273 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %272, <2 x float> %24, <2 x float> %225)
  %274 = add nuw nsw i64 %75, 4
  %275 = getelementptr inbounds nuw float, ptr %7, i64 %274
  %276 = load float, ptr %275, align 4
  %277 = insertelement <2 x float> poison, float %276, i32 0
  %278 = shufflevector <2 x float> %277, <2 x float> poison, <2 x i32> zeroinitializer
  %279 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %278, <2 x float> %24, <2 x float> %231)
  %280 = add nuw nsw i64 %82, 4
  %281 = getelementptr inbounds nuw float, ptr %7, i64 %280
  %282 = load float, ptr %281, align 4
  %283 = insertelement <2 x float> poison, float %282, i32 0
  %284 = shufflevector <2 x float> %283, <2 x float> poison, <2 x i32> zeroinitializer
  %285 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %284, <2 x float> %24, <2 x float> %237)
  %286 = add nuw nsw i64 %89, 4
  %287 = getelementptr inbounds nuw float, ptr %7, i64 %286
  %288 = load float, ptr %287, align 4
  %289 = insertelement <2 x float> poison, float %288, i32 0
  %290 = shufflevector <2 x float> %289, <2 x float> poison, <2 x i32> zeroinitializer
  %291 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %290, <2 x float> %24, <2 x float> %243)
  %292 = add nuw nsw i64 %96, 4
  %293 = getelementptr inbounds nuw float, ptr %7, i64 %292
  %294 = load float, ptr %293, align 4
  %295 = insertelement <2 x float> poison, float %294, i32 0
  %296 = shufflevector <2 x float> %295, <2 x float> poison, <2 x i32> zeroinitializer
  %297 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %296, <2 x float> %24, <2 x float> %249)
  %298 = add nuw nsw i64 %103, 4
  %299 = getelementptr inbounds nuw float, ptr %7, i64 %298
  %300 = load float, ptr %299, align 4
  %301 = insertelement <2 x float> poison, float %300, i32 0
  %302 = shufflevector <2 x float> %301, <2 x float> poison, <2 x i32> zeroinitializer
  %303 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %302, <2 x float> %24, <2 x float> %255)
  %304 = add nuw nsw i64 %110, 4
  %305 = getelementptr inbounds nuw float, ptr %7, i64 %304
  %306 = load float, ptr %305, align 4
  %307 = insertelement <2 x float> poison, float %306, i32 0
  %308 = shufflevector <2 x float> %307, <2 x float> poison, <2 x i32> zeroinitializer
  %309 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %308, <2 x float> %24, <2 x float> %261)
  %310 = add nuw nsw i64 %117, 4
  %311 = getelementptr inbounds nuw float, ptr %7, i64 %310
  %312 = load float, ptr %311, align 4
  %313 = insertelement <2 x float> poison, float %312, i32 0
  %314 = shufflevector <2 x float> %313, <2 x float> poison, <2 x i32> zeroinitializer
  %315 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %314, <2 x float> %24, <2 x float> %267)
  %316 = add nuw nsw i64 %68, 5
  %317 = getelementptr inbounds nuw float, ptr %7, i64 %316
  %318 = load float, ptr %317, align 4
  %319 = insertelement <2 x float> poison, float %318, i32 0
  %320 = shufflevector <2 x float> %319, <2 x float> poison, <2 x i32> zeroinitializer
  %321 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %320, <2 x float> %25, <2 x float> %273)
  %322 = add nuw nsw i64 %75, 5
  %323 = getelementptr inbounds nuw float, ptr %7, i64 %322
  %324 = load float, ptr %323, align 4
  %325 = insertelement <2 x float> poison, float %324, i32 0
  %326 = shufflevector <2 x float> %325, <2 x float> poison, <2 x i32> zeroinitializer
  %327 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %326, <2 x float> %25, <2 x float> %279)
  %328 = add nuw nsw i64 %82, 5
  %329 = getelementptr inbounds nuw float, ptr %7, i64 %328
  %330 = load float, ptr %329, align 4
  %331 = insertelement <2 x float> poison, float %330, i32 0
  %332 = shufflevector <2 x float> %331, <2 x float> poison, <2 x i32> zeroinitializer
  %333 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %332, <2 x float> %25, <2 x float> %285)
  %334 = add nuw nsw i64 %89, 5
  %335 = getelementptr inbounds nuw float, ptr %7, i64 %334
  %336 = load float, ptr %335, align 4
  %337 = insertelement <2 x float> poison, float %336, i32 0
  %338 = shufflevector <2 x float> %337, <2 x float> poison, <2 x i32> zeroinitializer
  %339 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %338, <2 x float> %25, <2 x float> %291)
  %340 = add nuw nsw i64 %96, 5
  %341 = getelementptr inbounds nuw float, ptr %7, i64 %340
  %342 = load float, ptr %341, align 4
  %343 = insertelement <2 x float> poison, float %342, i32 0
  %344 = shufflevector <2 x float> %343, <2 x float> poison, <2 x i32> zeroinitializer
  %345 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %344, <2 x float> %25, <2 x float> %297)
  %346 = add nuw nsw i64 %103, 5
  %347 = getelementptr inbounds nuw float, ptr %7, i64 %346
  %348 = load float, ptr %347, align 4
  %349 = insertelement <2 x float> poison, float %348, i32 0
  %350 = shufflevector <2 x float> %349, <2 x float> poison, <2 x i32> zeroinitializer
  %351 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %350, <2 x float> %25, <2 x float> %303)
  %352 = add nuw nsw i64 %110, 5
  %353 = getelementptr inbounds nuw float, ptr %7, i64 %352
  %354 = load float, ptr %353, align 4
  %355 = insertelement <2 x float> poison, float %354, i32 0
  %356 = shufflevector <2 x float> %355, <2 x float> poison, <2 x i32> zeroinitializer
  %357 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %25, <2 x float> %309)
  %358 = add nuw nsw i64 %117, 5
  %359 = getelementptr inbounds nuw float, ptr %7, i64 %358
  %360 = load float, ptr %359, align 4
  %361 = insertelement <2 x float> poison, float %360, i32 0
  %362 = shufflevector <2 x float> %361, <2 x float> poison, <2 x i32> zeroinitializer
  %363 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %362, <2 x float> %25, <2 x float> %315)
  %364 = add nuw nsw i64 %68, 6
  %365 = getelementptr inbounds nuw float, ptr %7, i64 %364
  %366 = load float, ptr %365, align 4
  %367 = insertelement <2 x float> poison, float %366, i32 0
  %368 = shufflevector <2 x float> %367, <2 x float> poison, <2 x i32> zeroinitializer
  %369 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %368, <2 x float> %26, <2 x float> %321)
  %370 = add nuw nsw i64 %75, 6
  %371 = getelementptr inbounds nuw float, ptr %7, i64 %370
  %372 = load float, ptr %371, align 4
  %373 = insertelement <2 x float> poison, float %372, i32 0
  %374 = shufflevector <2 x float> %373, <2 x float> poison, <2 x i32> zeroinitializer
  %375 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %374, <2 x float> %26, <2 x float> %327)
  %376 = add nuw nsw i64 %82, 6
  %377 = getelementptr inbounds nuw float, ptr %7, i64 %376
  %378 = load float, ptr %377, align 4
  %379 = insertelement <2 x float> poison, float %378, i32 0
  %380 = shufflevector <2 x float> %379, <2 x float> poison, <2 x i32> zeroinitializer
  %381 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %380, <2 x float> %26, <2 x float> %333)
  %382 = add nuw nsw i64 %89, 6
  %383 = getelementptr inbounds nuw float, ptr %7, i64 %382
  %384 = load float, ptr %383, align 4
  %385 = insertelement <2 x float> poison, float %384, i32 0
  %386 = shufflevector <2 x float> %385, <2 x float> poison, <2 x i32> zeroinitializer
  %387 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %386, <2 x float> %26, <2 x float> %339)
  %388 = add nuw nsw i64 %96, 6
  %389 = getelementptr inbounds nuw float, ptr %7, i64 %388
  %390 = load float, ptr %389, align 4
  %391 = insertelement <2 x float> poison, float %390, i32 0
  %392 = shufflevector <2 x float> %391, <2 x float> poison, <2 x i32> zeroinitializer
  %393 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %392, <2 x float> %26, <2 x float> %345)
  %394 = add nuw nsw i64 %103, 6
  %395 = getelementptr inbounds nuw float, ptr %7, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = insertelement <2 x float> poison, float %396, i32 0
  %398 = shufflevector <2 x float> %397, <2 x float> poison, <2 x i32> zeroinitializer
  %399 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %398, <2 x float> %26, <2 x float> %351)
  %400 = add nuw nsw i64 %110, 6
  %401 = getelementptr inbounds nuw float, ptr %7, i64 %400
  %402 = load float, ptr %401, align 4
  %403 = insertelement <2 x float> poison, float %402, i32 0
  %404 = shufflevector <2 x float> %403, <2 x float> poison, <2 x i32> zeroinitializer
  %405 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %404, <2 x float> %26, <2 x float> %357)
  %406 = add nuw nsw i64 %117, 6
  %407 = getelementptr inbounds nuw float, ptr %7, i64 %406
  %408 = load float, ptr %407, align 4
  %409 = insertelement <2 x float> poison, float %408, i32 0
  %410 = shufflevector <2 x float> %409, <2 x float> poison, <2 x i32> zeroinitializer
  %411 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %410, <2 x float> %26, <2 x float> %363)
  %412 = add nuw nsw i64 %68, 7
  %413 = getelementptr inbounds nuw float, ptr %7, i64 %412
  %414 = load float, ptr %413, align 4
  %415 = insertelement <2 x float> poison, float %414, i32 0
  %416 = shufflevector <2 x float> %415, <2 x float> poison, <2 x i32> zeroinitializer
  %417 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %416, <2 x float> %27, <2 x float> %369)
  %418 = add nuw nsw i64 %75, 7
  %419 = getelementptr inbounds nuw float, ptr %7, i64 %418
  %420 = load float, ptr %419, align 4
  %421 = insertelement <2 x float> poison, float %420, i32 0
  %422 = shufflevector <2 x float> %421, <2 x float> poison, <2 x i32> zeroinitializer
  %423 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %422, <2 x float> %27, <2 x float> %375)
  %424 = add nuw nsw i64 %82, 7
  %425 = getelementptr inbounds nuw float, ptr %7, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = insertelement <2 x float> poison, float %426, i32 0
  %428 = shufflevector <2 x float> %427, <2 x float> poison, <2 x i32> zeroinitializer
  %429 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %428, <2 x float> %27, <2 x float> %381)
  %430 = add nuw nsw i64 %89, 7
  %431 = getelementptr inbounds nuw float, ptr %7, i64 %430
  %432 = load float, ptr %431, align 4
  %433 = insertelement <2 x float> poison, float %432, i32 0
  %434 = shufflevector <2 x float> %433, <2 x float> poison, <2 x i32> zeroinitializer
  %435 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %434, <2 x float> %27, <2 x float> %387)
  %436 = add nuw nsw i64 %96, 7
  %437 = getelementptr inbounds nuw float, ptr %7, i64 %436
  %438 = load float, ptr %437, align 4
  %439 = insertelement <2 x float> poison, float %438, i32 0
  %440 = shufflevector <2 x float> %439, <2 x float> poison, <2 x i32> zeroinitializer
  %441 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %440, <2 x float> %27, <2 x float> %393)
  %442 = add nuw nsw i64 %103, 7
  %443 = getelementptr inbounds nuw float, ptr %7, i64 %442
  %444 = load float, ptr %443, align 4
  %445 = insertelement <2 x float> poison, float %444, i32 0
  %446 = shufflevector <2 x float> %445, <2 x float> poison, <2 x i32> zeroinitializer
  %447 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %446, <2 x float> %27, <2 x float> %399)
  %448 = add nuw nsw i64 %110, 7
  %449 = getelementptr inbounds nuw float, ptr %7, i64 %448
  %450 = load float, ptr %449, align 4
  %451 = insertelement <2 x float> poison, float %450, i32 0
  %452 = shufflevector <2 x float> %451, <2 x float> poison, <2 x i32> zeroinitializer
  %453 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %452, <2 x float> %27, <2 x float> %405)
  %454 = add nuw nsw i64 %117, 7
  %455 = getelementptr inbounds nuw float, ptr %7, i64 %454
  %456 = load float, ptr %455, align 4
  %457 = insertelement <2 x float> poison, float %456, i32 0
  %458 = shufflevector <2 x float> %457, <2 x float> poison, <2 x i32> zeroinitializer
  %459 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %458, <2 x float> %27, <2 x float> %411)
  %460 = fadd contract <2 x float> %31, %417, !dbg !204
  %461 = fadd contract <2 x float> %36, %423, !dbg !204
  %462 = fadd contract <2 x float> %41, %429, !dbg !204
  %463 = fadd contract <2 x float> %46, %435, !dbg !204
  %464 = fadd contract <2 x float> %51, %441, !dbg !204
  %465 = fadd contract <2 x float> %56, %447, !dbg !204
  %466 = fadd contract <2 x float> %61, %453, !dbg !204
  %467 = fadd contract <2 x float> %66, %459, !dbg !204
  %468 = getelementptr float, ptr %15, i64 %29, !dbg !204
  store <2 x float> %460, ptr %468, align 4, !dbg !204
  %469 = getelementptr float, ptr %15, i64 %34, !dbg !204
  store <2 x float> %461, ptr %469, align 4, !dbg !204
  %470 = getelementptr float, ptr %15, i64 %39, !dbg !204
  store <2 x float> %462, ptr %470, align 4, !dbg !204
  %471 = getelementptr float, ptr %15, i64 %44, !dbg !204
  store <2 x float> %463, ptr %471, align 4, !dbg !204
  %472 = getelementptr float, ptr %15, i64 %49, !dbg !204
  store <2 x float> %464, ptr %472, align 4, !dbg !204
  %473 = getelementptr float, ptr %15, i64 %54, !dbg !204
  store <2 x float> %465, ptr %473, align 4, !dbg !204
  %474 = getelementptr float, ptr %15, i64 %59, !dbg !204
  store <2 x float> %466, ptr %474, align 4, !dbg !204
  %475 = getelementptr float, ptr %15, i64 %64, !dbg !204
  store <2 x float> %467, ptr %475, align 4, !dbg !204
  ret i32 0, !dbg !205
}

define internal i32 @"main$async_dispatch_11_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !206 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !207
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !207
  %6 = load ptr, ptr %5, align 8, !dbg !207
  %7 = getelementptr float, ptr %6, i64 32, !dbg !207
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !207
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !208
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !208
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !208
  %11 = load ptr, ptr %10, align 8, !dbg !208
  %12 = getelementptr float, ptr %11, i64 64, !dbg !208
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !208
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !209
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !209
  %15 = zext i32 %14 to i64, !dbg !209
  %16 = mul nsw i64 %15, 2, !dbg !209
  %17 = mul i64 %16, 2, !dbg !209
  %18 = add i64 %17, 0, !dbg !209
  %19 = getelementptr float, ptr %7, i64 %18, !dbg !209
  %20 = load <2 x float>, ptr %19, align 4, !dbg !209
  %21 = add i64 %16, 1, !dbg !209
  %22 = mul i64 %21, 2, !dbg !209
  %23 = add i64 %22, 0, !dbg !209
  %24 = getelementptr float, ptr %7, i64 %23, !dbg !209
  %25 = load <2 x float>, ptr %24, align 4, !dbg !209
  %26 = fmul contract <2 x float> %20, %20, !dbg !210
  %27 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %26), !dbg !210
  %28 = fmul contract <2 x float> %25, %25, !dbg !210
  %29 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %28), !dbg !210
  %30 = insertelement <2 x float> poison, float %27, i64 0, !dbg !210
  %31 = insertelement <2 x float> %30, float %29, i64 1, !dbg !210
  %32 = load <2 x float>, ptr @__constant_2xf32_0_1, align 4, !dbg !211
  %33 = load <2 x float>, ptr @__constant_2xf32_4, align 4, !dbg !211
  %34 = fdiv <2 x float> %31, splat (float 2.000000e+00), !dbg !212
  %35 = fadd contract <2 x float> %34, splat (float 0x3EE4F8B580000000), !dbg !213
  %36 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> %35), !dbg !214
  %37 = fdiv <2 x float> splat (float 1.000000e+00), %36, !dbg !214
  %38 = shufflevector <2 x float> %37, <2 x float> %37, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !214
  %39 = shufflevector <4 x float> %38, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !214
  %40 = shufflevector <4 x float> %38, <4 x float> %39, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !214
  %41 = shufflevector <4 x float> %40, <4 x float> %40, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !214
  %42 = shufflevector <4 x float> %41, <4 x float> %41, <2 x i32> <i32 0, i32 1>, !dbg !214
  %43 = shufflevector <4 x float> %41, <4 x float> %41, <2 x i32> <i32 2, i32 3>, !dbg !214
  %44 = fmul contract <2 x float> %20, %42, !dbg !215
  %45 = fmul contract <2 x float> %25, %43, !dbg !215
  %46 = fmul contract <2 x float> %44, %32, !dbg !216
  %47 = fmul contract <2 x float> %45, %32, !dbg !216
  %48 = fadd contract <2 x float> %46, %33, !dbg !217
  %49 = fadd contract <2 x float> %47, %33, !dbg !217
  %50 = getelementptr float, ptr %12, i64 %18, !dbg !217
  store <2 x float> %48, ptr %50, align 4, !dbg !217
  %51 = getelementptr float, ptr %12, i64 %23, !dbg !217
  store <2 x float> %49, ptr %51, align 4, !dbg !217
  ret i32 0, !dbg !218
}

define internal i32 @"main$async_dispatch_12_matmul_16x6x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !219 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !220
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !220
  %6 = load ptr, ptr %5, align 8, !dbg !220
  %7 = getelementptr float, ptr %6, i64 64, !dbg !220
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !220
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !221
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !221
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !221
  %11 = load ptr, ptr %10, align 8, !dbg !221
  %12 = getelementptr float, ptr %11, i64 96, !dbg !221
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !221
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !222
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !222
  %15 = zext i32 %14 to i64, !dbg !222
  %16 = mul nsw i64 %15, 8, !dbg !222
  %17 = load <6 x float>, ptr @__constant_2x6xf32_0, align 4, !dbg !222
  %18 = load <6 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x6xf32_0, i64 24), align 4, !dbg !222
  %19 = load <6 x float>, ptr @__constant_6xf32_0, align 4, !dbg !223
  %20 = mul nuw nsw i64 %16, 2
  %21 = add nuw nsw i64 %20, 0
  %22 = getelementptr inbounds nuw float, ptr %7, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = insertelement <6 x float> poison, float %23, i32 0
  %25 = shufflevector <6 x float> %24, <6 x float> poison, <6 x i32> zeroinitializer
  %26 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %25, <6 x float> %17, <6 x float> %19)
  %27 = add i64 %16, 1, !dbg !224
  %28 = mul nuw nsw i64 %27, 2
  %29 = add nuw nsw i64 %28, 0
  %30 = getelementptr inbounds nuw float, ptr %7, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = insertelement <6 x float> poison, float %31, i32 0
  %33 = shufflevector <6 x float> %32, <6 x float> poison, <6 x i32> zeroinitializer
  %34 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %33, <6 x float> %17, <6 x float> %19)
  %35 = add i64 %16, 2, !dbg !224
  %36 = mul nuw nsw i64 %35, 2
  %37 = add nuw nsw i64 %36, 0
  %38 = getelementptr inbounds nuw float, ptr %7, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = insertelement <6 x float> poison, float %39, i32 0
  %41 = shufflevector <6 x float> %40, <6 x float> poison, <6 x i32> zeroinitializer
  %42 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %41, <6 x float> %17, <6 x float> %19)
  %43 = add i64 %16, 3, !dbg !224
  %44 = mul nuw nsw i64 %43, 2
  %45 = add nuw nsw i64 %44, 0
  %46 = getelementptr inbounds nuw float, ptr %7, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = insertelement <6 x float> poison, float %47, i32 0
  %49 = shufflevector <6 x float> %48, <6 x float> poison, <6 x i32> zeroinitializer
  %50 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %49, <6 x float> %17, <6 x float> %19)
  %51 = add i64 %16, 4, !dbg !224
  %52 = mul nuw nsw i64 %51, 2
  %53 = add nuw nsw i64 %52, 0
  %54 = getelementptr inbounds nuw float, ptr %7, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = insertelement <6 x float> poison, float %55, i32 0
  %57 = shufflevector <6 x float> %56, <6 x float> poison, <6 x i32> zeroinitializer
  %58 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %57, <6 x float> %17, <6 x float> %19)
  %59 = add i64 %16, 5, !dbg !224
  %60 = mul nuw nsw i64 %59, 2
  %61 = add nuw nsw i64 %60, 0
  %62 = getelementptr inbounds nuw float, ptr %7, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = insertelement <6 x float> poison, float %63, i32 0
  %65 = shufflevector <6 x float> %64, <6 x float> poison, <6 x i32> zeroinitializer
  %66 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %65, <6 x float> %17, <6 x float> %19)
  %67 = add i64 %16, 6, !dbg !224
  %68 = mul nuw nsw i64 %67, 2
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <6 x float> poison, float %71, i32 0
  %73 = shufflevector <6 x float> %72, <6 x float> poison, <6 x i32> zeroinitializer
  %74 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %73, <6 x float> %17, <6 x float> %19)
  %75 = add i64 %16, 7, !dbg !224
  %76 = mul nuw nsw i64 %75, 2
  %77 = add nuw nsw i64 %76, 0
  %78 = getelementptr inbounds nuw float, ptr %7, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = insertelement <6 x float> poison, float %79, i32 0
  %81 = shufflevector <6 x float> %80, <6 x float> poison, <6 x i32> zeroinitializer
  %82 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %81, <6 x float> %17, <6 x float> %19)
  %83 = add nuw nsw i64 %20, 1
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <6 x float> poison, float %85, i32 0
  %87 = shufflevector <6 x float> %86, <6 x float> poison, <6 x i32> zeroinitializer
  %88 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %87, <6 x float> %18, <6 x float> %26)
  %89 = add nuw nsw i64 %28, 1
  %90 = getelementptr inbounds nuw float, ptr %7, i64 %89
  %91 = load float, ptr %90, align 4
  %92 = insertelement <6 x float> poison, float %91, i32 0
  %93 = shufflevector <6 x float> %92, <6 x float> poison, <6 x i32> zeroinitializer
  %94 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %93, <6 x float> %18, <6 x float> %34)
  %95 = add nuw nsw i64 %36, 1
  %96 = getelementptr inbounds nuw float, ptr %7, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = insertelement <6 x float> poison, float %97, i32 0
  %99 = shufflevector <6 x float> %98, <6 x float> poison, <6 x i32> zeroinitializer
  %100 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %99, <6 x float> %18, <6 x float> %42)
  %101 = add nuw nsw i64 %44, 1
  %102 = getelementptr inbounds nuw float, ptr %7, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = insertelement <6 x float> poison, float %103, i32 0
  %105 = shufflevector <6 x float> %104, <6 x float> poison, <6 x i32> zeroinitializer
  %106 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %105, <6 x float> %18, <6 x float> %50)
  %107 = add nuw nsw i64 %52, 1
  %108 = getelementptr inbounds nuw float, ptr %7, i64 %107
  %109 = load float, ptr %108, align 4
  %110 = insertelement <6 x float> poison, float %109, i32 0
  %111 = shufflevector <6 x float> %110, <6 x float> poison, <6 x i32> zeroinitializer
  %112 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %111, <6 x float> %18, <6 x float> %58)
  %113 = add nuw nsw i64 %60, 1
  %114 = getelementptr inbounds nuw float, ptr %7, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = insertelement <6 x float> poison, float %115, i32 0
  %117 = shufflevector <6 x float> %116, <6 x float> poison, <6 x i32> zeroinitializer
  %118 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %117, <6 x float> %18, <6 x float> %66)
  %119 = add nuw nsw i64 %68, 1
  %120 = getelementptr inbounds nuw float, ptr %7, i64 %119
  %121 = load float, ptr %120, align 4
  %122 = insertelement <6 x float> poison, float %121, i32 0
  %123 = shufflevector <6 x float> %122, <6 x float> poison, <6 x i32> zeroinitializer
  %124 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %123, <6 x float> %18, <6 x float> %74)
  %125 = add nuw nsw i64 %76, 1
  %126 = getelementptr inbounds nuw float, ptr %7, i64 %125
  %127 = load float, ptr %126, align 4
  %128 = insertelement <6 x float> poison, float %127, i32 0
  %129 = shufflevector <6 x float> %128, <6 x float> poison, <6 x i32> zeroinitializer
  %130 = call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %129, <6 x float> %18, <6 x float> %82)
  %131 = mul i64 %16, 6, !dbg !224
  %132 = add i64 %131, 0, !dbg !224
  %133 = getelementptr float, ptr %12, i64 %132, !dbg !224
  store <6 x float> %88, ptr %133, align 4, !dbg !224
  %134 = mul i64 %27, 6, !dbg !224
  %135 = add i64 %134, 0, !dbg !224
  %136 = getelementptr float, ptr %12, i64 %135, !dbg !224
  store <6 x float> %94, ptr %136, align 4, !dbg !224
  %137 = mul i64 %35, 6, !dbg !224
  %138 = add i64 %137, 0, !dbg !224
  %139 = getelementptr float, ptr %12, i64 %138, !dbg !224
  store <6 x float> %100, ptr %139, align 4, !dbg !224
  %140 = mul i64 %43, 6, !dbg !224
  %141 = add i64 %140, 0, !dbg !224
  %142 = getelementptr float, ptr %12, i64 %141, !dbg !224
  store <6 x float> %106, ptr %142, align 4, !dbg !224
  %143 = mul i64 %51, 6, !dbg !224
  %144 = add i64 %143, 0, !dbg !224
  %145 = getelementptr float, ptr %12, i64 %144, !dbg !224
  store <6 x float> %112, ptr %145, align 4, !dbg !224
  %146 = mul i64 %59, 6, !dbg !224
  %147 = add i64 %146, 0, !dbg !224
  %148 = getelementptr float, ptr %12, i64 %147, !dbg !224
  store <6 x float> %118, ptr %148, align 4, !dbg !224
  %149 = mul i64 %67, 6, !dbg !224
  %150 = add i64 %149, 0, !dbg !224
  %151 = getelementptr float, ptr %12, i64 %150, !dbg !224
  store <6 x float> %124, ptr %151, align 4, !dbg !224
  %152 = mul i64 %75, 6, !dbg !224
  %153 = add i64 %152, 0, !dbg !224
  %154 = getelementptr float, ptr %12, i64 %153, !dbg !224
  store <6 x float> %130, ptr %154, align 4, !dbg !224
  ret i32 0, !dbg !225
}

define internal i32 @"main$async_dispatch_14_matmul_16x2x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !226 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !227
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !227
  %6 = load ptr, ptr %5, align 8, !dbg !227
  %7 = getelementptr float, ptr %6, i64 32, !dbg !227
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !227
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !228
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !228
  %10 = load ptr, ptr %9, align 8, !dbg !228
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ], !dbg !228
  %11 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !229
  %12 = extractvalue %iree_hal_executable_dispatch_state_v0_t %11, 10, !dbg !229
  %13 = getelementptr ptr, ptr %12, i32 1, !dbg !229
  %14 = load ptr, ptr %13, align 8, !dbg !229
  %15 = getelementptr float, ptr %14, i64 64, !dbg !229
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !229
  %16 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !230
  %17 = extractvalue %iree_hal_executable_workgroup_state_v0_t %16, 0, !dbg !230
  %18 = zext i32 %17 to i64, !dbg !230
  %19 = mul nsw i64 %18, 8, !dbg !230
  %20 = load <2 x float>, ptr @__constant_2x2xf32_0, align 4, !dbg !230
  %21 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x2xf32_0, i64 8), align 4, !dbg !230
  %22 = load <2 x float>, ptr @__constant_2xf32_5, align 4, !dbg !231
  %23 = mul i64 %19, 2, !dbg !231
  %24 = add i64 %23, 0, !dbg !231
  %25 = getelementptr float, ptr %10, i64 %24, !dbg !231
  %26 = load <2 x float>, ptr %25, align 4, !dbg !231
  %27 = add i64 %19, 1, !dbg !231
  %28 = mul i64 %27, 2, !dbg !231
  %29 = add i64 %28, 0, !dbg !231
  %30 = getelementptr float, ptr %10, i64 %29, !dbg !231
  %31 = load <2 x float>, ptr %30, align 4, !dbg !231
  %32 = add i64 %19, 2, !dbg !231
  %33 = mul i64 %32, 2, !dbg !231
  %34 = add i64 %33, 0, !dbg !231
  %35 = getelementptr float, ptr %10, i64 %34, !dbg !231
  %36 = load <2 x float>, ptr %35, align 4, !dbg !231
  %37 = add i64 %19, 3, !dbg !231
  %38 = mul i64 %37, 2, !dbg !231
  %39 = add i64 %38, 0, !dbg !231
  %40 = getelementptr float, ptr %10, i64 %39, !dbg !231
  %41 = load <2 x float>, ptr %40, align 4, !dbg !231
  %42 = add i64 %19, 4, !dbg !231
  %43 = mul i64 %42, 2, !dbg !231
  %44 = add i64 %43, 0, !dbg !231
  %45 = getelementptr float, ptr %10, i64 %44, !dbg !231
  %46 = load <2 x float>, ptr %45, align 4, !dbg !231
  %47 = add i64 %19, 5, !dbg !231
  %48 = mul i64 %47, 2, !dbg !231
  %49 = add i64 %48, 0, !dbg !231
  %50 = getelementptr float, ptr %10, i64 %49, !dbg !231
  %51 = load <2 x float>, ptr %50, align 4, !dbg !231
  %52 = add i64 %19, 6, !dbg !231
  %53 = mul i64 %52, 2, !dbg !231
  %54 = add i64 %53, 0, !dbg !231
  %55 = getelementptr float, ptr %10, i64 %54, !dbg !231
  %56 = load <2 x float>, ptr %55, align 4, !dbg !231
  %57 = add i64 %19, 7, !dbg !231
  %58 = mul i64 %57, 2, !dbg !231
  %59 = add i64 %58, 0, !dbg !231
  %60 = getelementptr float, ptr %10, i64 %59, !dbg !231
  %61 = load <2 x float>, ptr %60, align 4, !dbg !231
  %62 = add nuw nsw i64 0, %19
  %63 = getelementptr inbounds nuw float, ptr %7, i64 %62
  %64 = load float, ptr %63, align 4
  %65 = insertelement <2 x float> poison, float %64, i32 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> %20, <2 x float> %22)
  %68 = add nuw nsw i64 0, %27
  %69 = getelementptr inbounds nuw float, ptr %7, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = insertelement <2 x float> poison, float %70, i32 0
  %72 = shufflevector <2 x float> %71, <2 x float> poison, <2 x i32> zeroinitializer
  %73 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %72, <2 x float> %20, <2 x float> %22)
  %74 = add nuw nsw i64 0, %32
  %75 = getelementptr inbounds nuw float, ptr %7, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = insertelement <2 x float> poison, float %76, i32 0
  %78 = shufflevector <2 x float> %77, <2 x float> poison, <2 x i32> zeroinitializer
  %79 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %78, <2 x float> %20, <2 x float> %22)
  %80 = add nuw nsw i64 0, %37
  %81 = getelementptr inbounds nuw float, ptr %7, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = insertelement <2 x float> poison, float %82, i32 0
  %84 = shufflevector <2 x float> %83, <2 x float> poison, <2 x i32> zeroinitializer
  %85 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %84, <2 x float> %20, <2 x float> %22)
  %86 = add nuw nsw i64 0, %42
  %87 = getelementptr inbounds nuw float, ptr %7, i64 %86
  %88 = load float, ptr %87, align 4
  %89 = insertelement <2 x float> poison, float %88, i32 0
  %90 = shufflevector <2 x float> %89, <2 x float> poison, <2 x i32> zeroinitializer
  %91 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %90, <2 x float> %20, <2 x float> %22)
  %92 = add nuw nsw i64 0, %47
  %93 = getelementptr inbounds nuw float, ptr %7, i64 %92
  %94 = load float, ptr %93, align 4
  %95 = insertelement <2 x float> poison, float %94, i32 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> %20, <2 x float> %22)
  %98 = add nuw nsw i64 0, %52
  %99 = getelementptr inbounds nuw float, ptr %7, i64 %98
  %100 = load float, ptr %99, align 4
  %101 = insertelement <2 x float> poison, float %100, i32 0
  %102 = shufflevector <2 x float> %101, <2 x float> poison, <2 x i32> zeroinitializer
  %103 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %102, <2 x float> %20, <2 x float> %22)
  %104 = add nuw nsw i64 0, %57
  %105 = getelementptr inbounds nuw float, ptr %7, i64 %104
  %106 = load float, ptr %105, align 4
  %107 = insertelement <2 x float> poison, float %106, i32 0
  %108 = shufflevector <2 x float> %107, <2 x float> poison, <2 x i32> zeroinitializer
  %109 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %108, <2 x float> %20, <2 x float> %22)
  %110 = add nuw nsw i64 16, %19
  %111 = getelementptr inbounds nuw float, ptr %7, i64 %110
  %112 = load float, ptr %111, align 4
  %113 = insertelement <2 x float> poison, float %112, i32 0
  %114 = shufflevector <2 x float> %113, <2 x float> poison, <2 x i32> zeroinitializer
  %115 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %114, <2 x float> %21, <2 x float> %67)
  %116 = add nuw nsw i64 16, %27
  %117 = getelementptr inbounds nuw float, ptr %7, i64 %116
  %118 = load float, ptr %117, align 4
  %119 = insertelement <2 x float> poison, float %118, i32 0
  %120 = shufflevector <2 x float> %119, <2 x float> poison, <2 x i32> zeroinitializer
  %121 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %120, <2 x float> %21, <2 x float> %73)
  %122 = add nuw nsw i64 16, %32
  %123 = getelementptr inbounds nuw float, ptr %7, i64 %122
  %124 = load float, ptr %123, align 4
  %125 = insertelement <2 x float> poison, float %124, i32 0
  %126 = shufflevector <2 x float> %125, <2 x float> poison, <2 x i32> zeroinitializer
  %127 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %126, <2 x float> %21, <2 x float> %79)
  %128 = add nuw nsw i64 16, %37
  %129 = getelementptr inbounds nuw float, ptr %7, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = insertelement <2 x float> poison, float %130, i32 0
  %132 = shufflevector <2 x float> %131, <2 x float> poison, <2 x i32> zeroinitializer
  %133 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %132, <2 x float> %21, <2 x float> %85)
  %134 = add nuw nsw i64 16, %42
  %135 = getelementptr inbounds nuw float, ptr %7, i64 %134
  %136 = load float, ptr %135, align 4
  %137 = insertelement <2 x float> poison, float %136, i32 0
  %138 = shufflevector <2 x float> %137, <2 x float> poison, <2 x i32> zeroinitializer
  %139 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %138, <2 x float> %21, <2 x float> %91)
  %140 = add nuw nsw i64 16, %47
  %141 = getelementptr inbounds nuw float, ptr %7, i64 %140
  %142 = load float, ptr %141, align 4
  %143 = insertelement <2 x float> poison, float %142, i32 0
  %144 = shufflevector <2 x float> %143, <2 x float> poison, <2 x i32> zeroinitializer
  %145 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %144, <2 x float> %21, <2 x float> %97)
  %146 = add nuw nsw i64 16, %52
  %147 = getelementptr inbounds nuw float, ptr %7, i64 %146
  %148 = load float, ptr %147, align 4
  %149 = insertelement <2 x float> poison, float %148, i32 0
  %150 = shufflevector <2 x float> %149, <2 x float> poison, <2 x i32> zeroinitializer
  %151 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %150, <2 x float> %21, <2 x float> %103)
  %152 = add nuw nsw i64 16, %57
  %153 = getelementptr inbounds nuw float, ptr %7, i64 %152
  %154 = load float, ptr %153, align 4
  %155 = insertelement <2 x float> poison, float %154, i32 0
  %156 = shufflevector <2 x float> %155, <2 x float> poison, <2 x i32> zeroinitializer
  %157 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %156, <2 x float> %21, <2 x float> %109)
  %158 = fadd contract <2 x float> %115, %26, !dbg !232
  %159 = fadd contract <2 x float> %121, %31, !dbg !232
  %160 = fadd contract <2 x float> %127, %36, !dbg !232
  %161 = fadd contract <2 x float> %133, %41, !dbg !232
  %162 = fadd contract <2 x float> %139, %46, !dbg !232
  %163 = fadd contract <2 x float> %145, %51, !dbg !232
  %164 = fadd contract <2 x float> %151, %56, !dbg !232
  %165 = fadd contract <2 x float> %157, %61, !dbg !232
  %166 = getelementptr float, ptr %15, i64 %24, !dbg !232
  store <2 x float> %158, ptr %166, align 4, !dbg !232
  %167 = getelementptr float, ptr %15, i64 %29, !dbg !232
  store <2 x float> %159, ptr %167, align 4, !dbg !232
  %168 = getelementptr float, ptr %15, i64 %34, !dbg !232
  store <2 x float> %160, ptr %168, align 4, !dbg !232
  %169 = getelementptr float, ptr %15, i64 %39, !dbg !232
  store <2 x float> %161, ptr %169, align 4, !dbg !232
  %170 = getelementptr float, ptr %15, i64 %44, !dbg !232
  store <2 x float> %162, ptr %170, align 4, !dbg !232
  %171 = getelementptr float, ptr %15, i64 %49, !dbg !232
  store <2 x float> %163, ptr %171, align 4, !dbg !232
  %172 = getelementptr float, ptr %15, i64 %54, !dbg !232
  store <2 x float> %164, ptr %172, align 4, !dbg !232
  %173 = getelementptr float, ptr %15, i64 %59, !dbg !232
  store <2 x float> %165, ptr %173, align 4, !dbg !232
  ret i32 0, !dbg !233
}

define internal i32 @"main$async_dispatch_16_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !234 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !235
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !235
  %6 = load ptr, ptr %5, align 8, !dbg !235
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !235
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !236
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !236
  %9 = getelementptr ptr, ptr %8, i32 1, !dbg !236
  %10 = load ptr, ptr %9, align 8, !dbg !236
  %11 = getelementptr float, ptr %10, i64 32, !dbg !236
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !236
  %12 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !237
  %13 = extractvalue %iree_hal_executable_workgroup_state_v0_t %12, 0, !dbg !237
  %14 = zext i32 %13 to i64, !dbg !237
  %15 = mul nsw i64 %14, 2, !dbg !237
  %16 = mul i64 %15, 2, !dbg !237
  %17 = add i64 %16, 0, !dbg !237
  %18 = getelementptr float, ptr %6, i64 %17, !dbg !237
  %19 = load <2 x float>, ptr %18, align 4, !dbg !237
  %20 = add i64 %15, 1, !dbg !237
  %21 = mul i64 %20, 2, !dbg !237
  %22 = add i64 %21, 0, !dbg !237
  %23 = getelementptr float, ptr %6, i64 %22, !dbg !237
  %24 = load <2 x float>, ptr %23, align 4, !dbg !237
  %25 = fmul contract <2 x float> %19, %19, !dbg !238
  %26 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %25), !dbg !238
  %27 = fmul contract <2 x float> %24, %24, !dbg !238
  %28 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %27), !dbg !238
  %29 = insertelement <2 x float> poison, float %26, i64 0, !dbg !238
  %30 = insertelement <2 x float> %29, float %28, i64 1, !dbg !238
  %31 = load <2 x float>, ptr @__constant_2xf32_0_2, align 4, !dbg !239
  %32 = load <2 x float>, ptr @__constant_2xf32_6, align 4, !dbg !239
  %33 = fdiv <2 x float> %30, splat (float 2.000000e+00), !dbg !240
  %34 = fadd contract <2 x float> %33, splat (float 0x3EE4F8B580000000), !dbg !241
  %35 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> %34), !dbg !242
  %36 = fdiv <2 x float> splat (float 1.000000e+00), %35, !dbg !242
  %37 = shufflevector <2 x float> %36, <2 x float> %36, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !242
  %38 = shufflevector <4 x float> %37, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !242
  %39 = shufflevector <4 x float> %37, <4 x float> %38, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !242
  %40 = shufflevector <4 x float> %39, <4 x float> %39, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !242
  %41 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 0, i32 1>, !dbg !242
  %42 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 2, i32 3>, !dbg !242
  %43 = fmul contract <2 x float> %19, %41, !dbg !243
  %44 = fmul contract <2 x float> %24, %42, !dbg !243
  %45 = fmul contract <2 x float> %43, %31, !dbg !244
  %46 = fmul contract <2 x float> %44, %31, !dbg !244
  %47 = fadd contract <2 x float> %45, %32, !dbg !245
  %48 = fadd contract <2 x float> %46, %32, !dbg !245
  %49 = getelementptr float, ptr %11, i64 %17, !dbg !245
  store <2 x float> %47, ptr %49, align 4, !dbg !245
  %50 = getelementptr float, ptr %11, i64 %22, !dbg !245
  store <2 x float> %48, ptr %50, align 4, !dbg !245
  ret i32 0, !dbg !246
}

define internal i32 @"main$async_dispatch_17_matmul_16x8x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !247 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !248
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !248
  %6 = load ptr, ptr %5, align 8, !dbg !248
  %7 = getelementptr float, ptr %6, i64 32, !dbg !248
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !248
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !249
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !249
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !249
  %11 = load ptr, ptr %10, align 8, !dbg !249
  %12 = getelementptr float, ptr %11, i64 96, !dbg !249
  call void @llvm.assume(i1 true) [ "align"(ptr %12, i64 64) ], !dbg !249
  %13 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !250
  %14 = extractvalue %iree_hal_executable_workgroup_state_v0_t %13, 0, !dbg !250
  %15 = zext i32 %14 to i64, !dbg !250
  %16 = mul nsw i64 %15, 8, !dbg !250
  %17 = load <8 x float>, ptr @__constant_2x8xf32_0, align 4, !dbg !250
  %18 = load <8 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_2x8xf32_0, i64 32), align 4, !dbg !250
  %19 = load <8 x float>, ptr @__constant_8xf32_0, align 4, !dbg !251
  %20 = mul nuw nsw i64 %16, 2
  %21 = add nuw nsw i64 %20, 0
  %22 = getelementptr inbounds nuw float, ptr %7, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = insertelement <8 x float> poison, float %23, i32 0
  %25 = shufflevector <8 x float> %24, <8 x float> poison, <8 x i32> zeroinitializer
  %26 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %25, <8 x float> %17, <8 x float> %19)
  %27 = add i64 %16, 1, !dbg !252
  %28 = mul nuw nsw i64 %27, 2
  %29 = add nuw nsw i64 %28, 0
  %30 = getelementptr inbounds nuw float, ptr %7, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = insertelement <8 x float> poison, float %31, i32 0
  %33 = shufflevector <8 x float> %32, <8 x float> poison, <8 x i32> zeroinitializer
  %34 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %33, <8 x float> %17, <8 x float> %19)
  %35 = add i64 %16, 2, !dbg !252
  %36 = mul nuw nsw i64 %35, 2
  %37 = add nuw nsw i64 %36, 0
  %38 = getelementptr inbounds nuw float, ptr %7, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = insertelement <8 x float> poison, float %39, i32 0
  %41 = shufflevector <8 x float> %40, <8 x float> poison, <8 x i32> zeroinitializer
  %42 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %41, <8 x float> %17, <8 x float> %19)
  %43 = add i64 %16, 3, !dbg !252
  %44 = mul nuw nsw i64 %43, 2
  %45 = add nuw nsw i64 %44, 0
  %46 = getelementptr inbounds nuw float, ptr %7, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = insertelement <8 x float> poison, float %47, i32 0
  %49 = shufflevector <8 x float> %48, <8 x float> poison, <8 x i32> zeroinitializer
  %50 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %49, <8 x float> %17, <8 x float> %19)
  %51 = add i64 %16, 4, !dbg !252
  %52 = mul nuw nsw i64 %51, 2
  %53 = add nuw nsw i64 %52, 0
  %54 = getelementptr inbounds nuw float, ptr %7, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = insertelement <8 x float> poison, float %55, i32 0
  %57 = shufflevector <8 x float> %56, <8 x float> poison, <8 x i32> zeroinitializer
  %58 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %57, <8 x float> %17, <8 x float> %19)
  %59 = add i64 %16, 5, !dbg !252
  %60 = mul nuw nsw i64 %59, 2
  %61 = add nuw nsw i64 %60, 0
  %62 = getelementptr inbounds nuw float, ptr %7, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = insertelement <8 x float> poison, float %63, i32 0
  %65 = shufflevector <8 x float> %64, <8 x float> poison, <8 x i32> zeroinitializer
  %66 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %65, <8 x float> %17, <8 x float> %19)
  %67 = add i64 %16, 6, !dbg !252
  %68 = mul nuw nsw i64 %67, 2
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <8 x float> poison, float %71, i32 0
  %73 = shufflevector <8 x float> %72, <8 x float> poison, <8 x i32> zeroinitializer
  %74 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %73, <8 x float> %17, <8 x float> %19)
  %75 = add i64 %16, 7, !dbg !252
  %76 = mul nuw nsw i64 %75, 2
  %77 = add nuw nsw i64 %76, 0
  %78 = getelementptr inbounds nuw float, ptr %7, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = insertelement <8 x float> poison, float %79, i32 0
  %81 = shufflevector <8 x float> %80, <8 x float> poison, <8 x i32> zeroinitializer
  %82 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %81, <8 x float> %17, <8 x float> %19)
  %83 = add nuw nsw i64 %20, 1
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <8 x float> poison, float %85, i32 0
  %87 = shufflevector <8 x float> %86, <8 x float> poison, <8 x i32> zeroinitializer
  %88 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %87, <8 x float> %18, <8 x float> %26)
  %89 = add nuw nsw i64 %28, 1
  %90 = getelementptr inbounds nuw float, ptr %7, i64 %89
  %91 = load float, ptr %90, align 4
  %92 = insertelement <8 x float> poison, float %91, i32 0
  %93 = shufflevector <8 x float> %92, <8 x float> poison, <8 x i32> zeroinitializer
  %94 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %93, <8 x float> %18, <8 x float> %34)
  %95 = add nuw nsw i64 %36, 1
  %96 = getelementptr inbounds nuw float, ptr %7, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = insertelement <8 x float> poison, float %97, i32 0
  %99 = shufflevector <8 x float> %98, <8 x float> poison, <8 x i32> zeroinitializer
  %100 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %99, <8 x float> %18, <8 x float> %42)
  %101 = add nuw nsw i64 %44, 1
  %102 = getelementptr inbounds nuw float, ptr %7, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = insertelement <8 x float> poison, float %103, i32 0
  %105 = shufflevector <8 x float> %104, <8 x float> poison, <8 x i32> zeroinitializer
  %106 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %105, <8 x float> %18, <8 x float> %50)
  %107 = add nuw nsw i64 %52, 1
  %108 = getelementptr inbounds nuw float, ptr %7, i64 %107
  %109 = load float, ptr %108, align 4
  %110 = insertelement <8 x float> poison, float %109, i32 0
  %111 = shufflevector <8 x float> %110, <8 x float> poison, <8 x i32> zeroinitializer
  %112 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %111, <8 x float> %18, <8 x float> %58)
  %113 = add nuw nsw i64 %60, 1
  %114 = getelementptr inbounds nuw float, ptr %7, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = insertelement <8 x float> poison, float %115, i32 0
  %117 = shufflevector <8 x float> %116, <8 x float> poison, <8 x i32> zeroinitializer
  %118 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %117, <8 x float> %18, <8 x float> %66)
  %119 = add nuw nsw i64 %68, 1
  %120 = getelementptr inbounds nuw float, ptr %7, i64 %119
  %121 = load float, ptr %120, align 4
  %122 = insertelement <8 x float> poison, float %121, i32 0
  %123 = shufflevector <8 x float> %122, <8 x float> poison, <8 x i32> zeroinitializer
  %124 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %123, <8 x float> %18, <8 x float> %74)
  %125 = add nuw nsw i64 %76, 1
  %126 = getelementptr inbounds nuw float, ptr %7, i64 %125
  %127 = load float, ptr %126, align 4
  %128 = insertelement <8 x float> poison, float %127, i32 0
  %129 = shufflevector <8 x float> %128, <8 x float> poison, <8 x i32> zeroinitializer
  %130 = call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %129, <8 x float> %18, <8 x float> %82)
  %131 = fmul contract <8 x float> %88, %88, !dbg !253
  %132 = fmul contract <8 x float> %94, %94, !dbg !253
  %133 = fmul contract <8 x float> %100, %100, !dbg !253
  %134 = fmul contract <8 x float> %106, %106, !dbg !253
  %135 = fmul contract <8 x float> %112, %112, !dbg !253
  %136 = fmul contract <8 x float> %118, %118, !dbg !253
  %137 = fmul contract <8 x float> %124, %124, !dbg !253
  %138 = fmul contract <8 x float> %130, %130, !dbg !253
  %139 = fmul contract <8 x float> %131, %88, !dbg !253
  %140 = fmul contract <8 x float> %132, %94, !dbg !253
  %141 = fmul contract <8 x float> %133, %100, !dbg !253
  %142 = fmul contract <8 x float> %134, %106, !dbg !253
  %143 = fmul contract <8 x float> %135, %112, !dbg !253
  %144 = fmul contract <8 x float> %136, %118, !dbg !253
  %145 = fmul contract <8 x float> %137, %124, !dbg !253
  %146 = fmul contract <8 x float> %138, %130, !dbg !253
  %147 = fmul contract <8 x float> %139, splat (float 0x3FA6E4E260000000), !dbg !254
  %148 = fmul contract <8 x float> %140, splat (float 0x3FA6E4E260000000), !dbg !254
  %149 = fmul contract <8 x float> %141, splat (float 0x3FA6E4E260000000), !dbg !254
  %150 = fmul contract <8 x float> %142, splat (float 0x3FA6E4E260000000), !dbg !254
  %151 = fmul contract <8 x float> %143, splat (float 0x3FA6E4E260000000), !dbg !254
  %152 = fmul contract <8 x float> %144, splat (float 0x3FA6E4E260000000), !dbg !254
  %153 = fmul contract <8 x float> %145, splat (float 0x3FA6E4E260000000), !dbg !254
  %154 = fmul contract <8 x float> %146, splat (float 0x3FA6E4E260000000), !dbg !254
  %155 = fadd contract <8 x float> %88, %147, !dbg !255
  %156 = fadd contract <8 x float> %94, %148, !dbg !255
  %157 = fadd contract <8 x float> %100, %149, !dbg !255
  %158 = fadd contract <8 x float> %106, %150, !dbg !255
  %159 = fadd contract <8 x float> %112, %151, !dbg !255
  %160 = fadd contract <8 x float> %118, %152, !dbg !255
  %161 = fadd contract <8 x float> %124, %153, !dbg !255
  %162 = fadd contract <8 x float> %130, %154, !dbg !255
  %163 = fmul contract <8 x float> %155, splat (float 0x3FE9884520000000), !dbg !256
  %164 = fmul contract <8 x float> %156, splat (float 0x3FE9884520000000), !dbg !256
  %165 = fmul contract <8 x float> %157, splat (float 0x3FE9884520000000), !dbg !256
  %166 = fmul contract <8 x float> %158, splat (float 0x3FE9884520000000), !dbg !256
  %167 = fmul contract <8 x float> %159, splat (float 0x3FE9884520000000), !dbg !256
  %168 = fmul contract <8 x float> %160, splat (float 0x3FE9884520000000), !dbg !256
  %169 = fmul contract <8 x float> %161, splat (float 0x3FE9884520000000), !dbg !256
  %170 = fmul contract <8 x float> %162, splat (float 0x3FE9884520000000), !dbg !256
  %171 = fcmp ult <8 x float> %163, splat (float 0x401FFEC880000000), !dbg !257
  %172 = fcmp ult <8 x float> %164, splat (float 0x401FFEC880000000), !dbg !257
  %173 = fcmp ult <8 x float> %165, splat (float 0x401FFEC880000000), !dbg !257
  %174 = fcmp ult <8 x float> %166, splat (float 0x401FFEC880000000), !dbg !257
  %175 = fcmp ult <8 x float> %167, splat (float 0x401FFEC880000000), !dbg !257
  %176 = fcmp ult <8 x float> %168, splat (float 0x401FFEC880000000), !dbg !257
  %177 = fcmp ult <8 x float> %169, splat (float 0x401FFEC880000000), !dbg !257
  %178 = fcmp ult <8 x float> %170, splat (float 0x401FFEC880000000), !dbg !257
  %179 = select <8 x i1> %171, <8 x float> %163, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %180 = select <8 x i1> %172, <8 x float> %164, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %181 = select <8 x i1> %173, <8 x float> %165, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %182 = select <8 x i1> %174, <8 x float> %166, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %183 = select <8 x i1> %175, <8 x float> %167, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %184 = select <8 x i1> %176, <8 x float> %168, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %185 = select <8 x i1> %177, <8 x float> %169, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %186 = select <8 x i1> %178, <8 x float> %170, <8 x float> splat (float 0x401FFEC880000000), !dbg !257
  %187 = fcmp ugt <8 x float> %179, splat (float 0xC01FFEC880000000), !dbg !257
  %188 = fcmp ugt <8 x float> %180, splat (float 0xC01FFEC880000000), !dbg !257
  %189 = fcmp ugt <8 x float> %181, splat (float 0xC01FFEC880000000), !dbg !257
  %190 = fcmp ugt <8 x float> %182, splat (float 0xC01FFEC880000000), !dbg !257
  %191 = fcmp ugt <8 x float> %183, splat (float 0xC01FFEC880000000), !dbg !257
  %192 = fcmp ugt <8 x float> %184, splat (float 0xC01FFEC880000000), !dbg !257
  %193 = fcmp ugt <8 x float> %185, splat (float 0xC01FFEC880000000), !dbg !257
  %194 = fcmp ugt <8 x float> %186, splat (float 0xC01FFEC880000000), !dbg !257
  %195 = select <8 x i1> %187, <8 x float> %179, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %196 = select <8 x i1> %188, <8 x float> %180, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %197 = select <8 x i1> %189, <8 x float> %181, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %198 = select <8 x i1> %190, <8 x float> %182, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %199 = select <8 x i1> %191, <8 x float> %183, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %200 = select <8 x i1> %192, <8 x float> %184, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %201 = select <8 x i1> %193, <8 x float> %185, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %202 = select <8 x i1> %194, <8 x float> %186, <8 x float> splat (float 0xC01FFEC880000000), !dbg !257
  %203 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %163), !dbg !257
  %204 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %164), !dbg !257
  %205 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %165), !dbg !257
  %206 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %166), !dbg !257
  %207 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %167), !dbg !257
  %208 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %168), !dbg !257
  %209 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %169), !dbg !257
  %210 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %170), !dbg !257
  %211 = fcmp olt <8 x float> %203, splat (float 0x3F3A36E2E0000000), !dbg !257
  %212 = fcmp olt <8 x float> %204, splat (float 0x3F3A36E2E0000000), !dbg !257
  %213 = fcmp olt <8 x float> %205, splat (float 0x3F3A36E2E0000000), !dbg !257
  %214 = fcmp olt <8 x float> %206, splat (float 0x3F3A36E2E0000000), !dbg !257
  %215 = fcmp olt <8 x float> %207, splat (float 0x3F3A36E2E0000000), !dbg !257
  %216 = fcmp olt <8 x float> %208, splat (float 0x3F3A36E2E0000000), !dbg !257
  %217 = fcmp olt <8 x float> %209, splat (float 0x3F3A36E2E0000000), !dbg !257
  %218 = fcmp olt <8 x float> %210, splat (float 0x3F3A36E2E0000000), !dbg !257
  %219 = fmul contract <8 x float> %195, %195, !dbg !257
  %220 = fmul contract <8 x float> %196, %196, !dbg !257
  %221 = fmul contract <8 x float> %197, %197, !dbg !257
  %222 = fmul contract <8 x float> %198, %198, !dbg !257
  %223 = fmul contract <8 x float> %199, %199, !dbg !257
  %224 = fmul contract <8 x float> %200, %200, !dbg !257
  %225 = fmul contract <8 x float> %201, %201, !dbg !257
  %226 = fmul contract <8 x float> %202, %202, !dbg !257
  %227 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %228 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %229 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %230 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %231 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %232 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %233 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %234 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !257
  %235 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %227, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %236 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %228, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %237 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %229, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %238 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %230, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %239 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %231, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %240 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %232, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %241 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %233, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %242 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %234, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !257
  %243 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %235, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %244 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %236, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %245 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %237, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %246 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %238, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %247 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %239, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %248 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %240, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %249 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %241, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %250 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %242, <8 x float> splat (float 0x3E6B800820000000)), !dbg !257
  %251 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %243, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %252 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %244, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %253 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %245, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %254 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %246, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %255 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %247, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %256 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %248, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %257 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %249, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %258 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %250, <8 x float> splat (float 0x3EEF286940000000)), !dbg !257
  %259 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %251, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %260 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %252, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %261 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %253, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %262 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %254, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %263 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %255, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %264 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %256, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %265 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %257, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %266 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %258, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !257
  %267 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %259, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %268 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %260, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %269 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %261, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %270 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %262, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %271 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %263, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %272 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %264, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %273 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %265, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %274 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %266, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !257
  %275 = fmul contract <8 x float> %195, %267, !dbg !257
  %276 = fmul contract <8 x float> %196, %268, !dbg !257
  %277 = fmul contract <8 x float> %197, %269, !dbg !257
  %278 = fmul contract <8 x float> %198, %270, !dbg !257
  %279 = fmul contract <8 x float> %199, %271, !dbg !257
  %280 = fmul contract <8 x float> %200, %272, !dbg !257
  %281 = fmul contract <8 x float> %201, %273, !dbg !257
  %282 = fmul contract <8 x float> %202, %274, !dbg !257
  %283 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %284 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %285 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %286 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %287 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %288 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %289 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %290 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !257
  %291 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %283, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %292 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %284, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %293 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %285, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %294 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %286, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %295 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %287, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %296 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %288, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %297 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %289, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %298 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %290, <8 x float> splat (float 0x3F629540A0000000)), !dbg !257
  %299 = call <8 x float> @llvm.fma.v8f32(<8 x float> %219, <8 x float> %291, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %300 = call <8 x float> @llvm.fma.v8f32(<8 x float> %220, <8 x float> %292, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %301 = call <8 x float> @llvm.fma.v8f32(<8 x float> %221, <8 x float> %293, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %302 = call <8 x float> @llvm.fma.v8f32(<8 x float> %222, <8 x float> %294, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %303 = call <8 x float> @llvm.fma.v8f32(<8 x float> %223, <8 x float> %295, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %304 = call <8 x float> @llvm.fma.v8f32(<8 x float> %224, <8 x float> %296, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %305 = call <8 x float> @llvm.fma.v8f32(<8 x float> %225, <8 x float> %297, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %306 = call <8 x float> @llvm.fma.v8f32(<8 x float> %226, <8 x float> %298, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !257
  %307 = fdiv <8 x float> %275, %299, !dbg !257
  %308 = fdiv <8 x float> %276, %300, !dbg !257
  %309 = fdiv <8 x float> %277, %301, !dbg !257
  %310 = fdiv <8 x float> %278, %302, !dbg !257
  %311 = fdiv <8 x float> %279, %303, !dbg !257
  %312 = fdiv <8 x float> %280, %304, !dbg !257
  %313 = fdiv <8 x float> %281, %305, !dbg !257
  %314 = fdiv <8 x float> %282, %306, !dbg !257
  %315 = select <8 x i1> %211, <8 x float> %195, <8 x float> %307, !dbg !257
  %316 = select <8 x i1> %212, <8 x float> %196, <8 x float> %308, !dbg !257
  %317 = select <8 x i1> %213, <8 x float> %197, <8 x float> %309, !dbg !257
  %318 = select <8 x i1> %214, <8 x float> %198, <8 x float> %310, !dbg !257
  %319 = select <8 x i1> %215, <8 x float> %199, <8 x float> %311, !dbg !257
  %320 = select <8 x i1> %216, <8 x float> %200, <8 x float> %312, !dbg !257
  %321 = select <8 x i1> %217, <8 x float> %201, <8 x float> %313, !dbg !257
  %322 = select <8 x i1> %218, <8 x float> %202, <8 x float> %314, !dbg !257
  %323 = fadd contract <8 x float> %315, splat (float 1.000000e+00), !dbg !258
  %324 = fadd contract <8 x float> %316, splat (float 1.000000e+00), !dbg !258
  %325 = fadd contract <8 x float> %317, splat (float 1.000000e+00), !dbg !258
  %326 = fadd contract <8 x float> %318, splat (float 1.000000e+00), !dbg !258
  %327 = fadd contract <8 x float> %319, splat (float 1.000000e+00), !dbg !258
  %328 = fadd contract <8 x float> %320, splat (float 1.000000e+00), !dbg !258
  %329 = fadd contract <8 x float> %321, splat (float 1.000000e+00), !dbg !258
  %330 = fadd contract <8 x float> %322, splat (float 1.000000e+00), !dbg !258
  %331 = fmul contract <8 x float> %88, splat (float 5.000000e-01), !dbg !259
  %332 = fmul contract <8 x float> %94, splat (float 5.000000e-01), !dbg !259
  %333 = fmul contract <8 x float> %100, splat (float 5.000000e-01), !dbg !259
  %334 = fmul contract <8 x float> %106, splat (float 5.000000e-01), !dbg !259
  %335 = fmul contract <8 x float> %112, splat (float 5.000000e-01), !dbg !259
  %336 = fmul contract <8 x float> %118, splat (float 5.000000e-01), !dbg !259
  %337 = fmul contract <8 x float> %124, splat (float 5.000000e-01), !dbg !259
  %338 = fmul contract <8 x float> %130, splat (float 5.000000e-01), !dbg !259
  %339 = fmul contract <8 x float> %331, %323, !dbg !252
  %340 = fmul contract <8 x float> %332, %324, !dbg !252
  %341 = fmul contract <8 x float> %333, %325, !dbg !252
  %342 = fmul contract <8 x float> %334, %326, !dbg !252
  %343 = fmul contract <8 x float> %335, %327, !dbg !252
  %344 = fmul contract <8 x float> %336, %328, !dbg !252
  %345 = fmul contract <8 x float> %337, %329, !dbg !252
  %346 = fmul contract <8 x float> %338, %330, !dbg !252
  %347 = mul i64 %16, 8, !dbg !252
  %348 = add i64 %347, 0, !dbg !252
  %349 = getelementptr float, ptr %12, i64 %348, !dbg !252
  store <8 x float> %339, ptr %349, align 4, !dbg !252
  %350 = mul i64 %27, 8, !dbg !252
  %351 = add i64 %350, 0, !dbg !252
  %352 = getelementptr float, ptr %12, i64 %351, !dbg !252
  store <8 x float> %340, ptr %352, align 4, !dbg !252
  %353 = mul i64 %35, 8, !dbg !252
  %354 = add i64 %353, 0, !dbg !252
  %355 = getelementptr float, ptr %12, i64 %354, !dbg !252
  store <8 x float> %341, ptr %355, align 4, !dbg !252
  %356 = mul i64 %43, 8, !dbg !252
  %357 = add i64 %356, 0, !dbg !252
  %358 = getelementptr float, ptr %12, i64 %357, !dbg !252
  store <8 x float> %342, ptr %358, align 4, !dbg !252
  %359 = mul i64 %51, 8, !dbg !252
  %360 = add i64 %359, 0, !dbg !252
  %361 = getelementptr float, ptr %12, i64 %360, !dbg !252
  store <8 x float> %343, ptr %361, align 4, !dbg !252
  %362 = mul i64 %59, 8, !dbg !252
  %363 = add i64 %362, 0, !dbg !252
  %364 = getelementptr float, ptr %12, i64 %363, !dbg !252
  store <8 x float> %344, ptr %364, align 4, !dbg !252
  %365 = mul i64 %67, 8, !dbg !252
  %366 = add i64 %365, 0, !dbg !252
  %367 = getelementptr float, ptr %12, i64 %366, !dbg !252
  store <8 x float> %345, ptr %367, align 4, !dbg !252
  %368 = mul i64 %75, 8, !dbg !252
  %369 = add i64 %368, 0, !dbg !252
  %370 = getelementptr float, ptr %12, i64 %369, !dbg !252
  store <8 x float> %346, ptr %370, align 4, !dbg !252
  ret i32 0, !dbg !260
}

define internal i32 @"main$async_dispatch_18_matmul_16x2x8_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !261 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !262
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !262
  %6 = load ptr, ptr %5, align 8, !dbg !262
  %7 = getelementptr float, ptr %6, i64 96, !dbg !262
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !262
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !263
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !263
  %10 = load ptr, ptr %9, align 8, !dbg !263
  %11 = getelementptr float, ptr %10, i64 64, !dbg !263
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !263
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !264
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !264
  %14 = getelementptr ptr, ptr %13, i32 1, !dbg !264
  %15 = load ptr, ptr %14, align 8, !dbg !264
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !264
  %16 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !265
  %17 = extractvalue %iree_hal_executable_workgroup_state_v0_t %16, 0, !dbg !265
  %18 = zext i32 %17 to i64, !dbg !265
  %19 = mul nsw i64 %18, 8, !dbg !265
  %20 = load <2 x float>, ptr @__constant_8x2xf32_0, align 4, !dbg !265
  %21 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 8), align 4, !dbg !265
  %22 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 16), align 4, !dbg !265
  %23 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 24), align 4, !dbg !265
  %24 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 32), align 4, !dbg !265
  %25 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 40), align 4, !dbg !265
  %26 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 48), align 4, !dbg !265
  %27 = load <2 x float>, ptr getelementptr inbounds nuw (i8, ptr @__constant_8x2xf32_0, i64 56), align 4, !dbg !265
  %28 = mul i64 %19, 2, !dbg !266
  %29 = add i64 %28, 0, !dbg !266
  %30 = getelementptr float, ptr %11, i64 %29, !dbg !266
  %31 = load <2 x float>, ptr %30, align 4, !dbg !266
  %32 = add i64 %19, 1, !dbg !266
  %33 = mul i64 %32, 2, !dbg !266
  %34 = add i64 %33, 0, !dbg !266
  %35 = getelementptr float, ptr %11, i64 %34, !dbg !266
  %36 = load <2 x float>, ptr %35, align 4, !dbg !266
  %37 = add i64 %19, 2, !dbg !266
  %38 = mul i64 %37, 2, !dbg !266
  %39 = add i64 %38, 0, !dbg !266
  %40 = getelementptr float, ptr %11, i64 %39, !dbg !266
  %41 = load <2 x float>, ptr %40, align 4, !dbg !266
  %42 = add i64 %19, 3, !dbg !266
  %43 = mul i64 %42, 2, !dbg !266
  %44 = add i64 %43, 0, !dbg !266
  %45 = getelementptr float, ptr %11, i64 %44, !dbg !266
  %46 = load <2 x float>, ptr %45, align 4, !dbg !266
  %47 = add i64 %19, 4, !dbg !266
  %48 = mul i64 %47, 2, !dbg !266
  %49 = add i64 %48, 0, !dbg !266
  %50 = getelementptr float, ptr %11, i64 %49, !dbg !266
  %51 = load <2 x float>, ptr %50, align 4, !dbg !266
  %52 = add i64 %19, 5, !dbg !266
  %53 = mul i64 %52, 2, !dbg !266
  %54 = add i64 %53, 0, !dbg !266
  %55 = getelementptr float, ptr %11, i64 %54, !dbg !266
  %56 = load <2 x float>, ptr %55, align 4, !dbg !266
  %57 = add i64 %19, 6, !dbg !266
  %58 = mul i64 %57, 2, !dbg !266
  %59 = add i64 %58, 0, !dbg !266
  %60 = getelementptr float, ptr %11, i64 %59, !dbg !266
  %61 = load <2 x float>, ptr %60, align 4, !dbg !266
  %62 = add i64 %19, 7, !dbg !266
  %63 = mul i64 %62, 2, !dbg !266
  %64 = add i64 %63, 0, !dbg !266
  %65 = getelementptr float, ptr %11, i64 %64, !dbg !266
  %66 = load <2 x float>, ptr %65, align 4, !dbg !266
  %67 = load <2 x float>, ptr @__constant_2xf32_7, align 4, !dbg !266
  %68 = mul nuw nsw i64 %19, 8
  %69 = add nuw nsw i64 %68, 0
  %70 = getelementptr inbounds nuw float, ptr %7, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = insertelement <2 x float> poison, float %71, i32 0
  %73 = shufflevector <2 x float> %72, <2 x float> poison, <2 x i32> zeroinitializer
  %74 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %73, <2 x float> %20, <2 x float> %67)
  %75 = mul nuw nsw i64 %32, 8
  %76 = add nuw nsw i64 %75, 0
  %77 = getelementptr inbounds nuw float, ptr %7, i64 %76
  %78 = load float, ptr %77, align 4
  %79 = insertelement <2 x float> poison, float %78, i32 0
  %80 = shufflevector <2 x float> %79, <2 x float> poison, <2 x i32> zeroinitializer
  %81 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %80, <2 x float> %20, <2 x float> %67)
  %82 = mul nuw nsw i64 %37, 8
  %83 = add nuw nsw i64 %82, 0
  %84 = getelementptr inbounds nuw float, ptr %7, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = insertelement <2 x float> poison, float %85, i32 0
  %87 = shufflevector <2 x float> %86, <2 x float> poison, <2 x i32> zeroinitializer
  %88 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %87, <2 x float> %20, <2 x float> %67)
  %89 = mul nuw nsw i64 %42, 8
  %90 = add nuw nsw i64 %89, 0
  %91 = getelementptr inbounds nuw float, ptr %7, i64 %90
  %92 = load float, ptr %91, align 4
  %93 = insertelement <2 x float> poison, float %92, i32 0
  %94 = shufflevector <2 x float> %93, <2 x float> poison, <2 x i32> zeroinitializer
  %95 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %94, <2 x float> %20, <2 x float> %67)
  %96 = mul nuw nsw i64 %47, 8
  %97 = add nuw nsw i64 %96, 0
  %98 = getelementptr inbounds nuw float, ptr %7, i64 %97
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i32 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> %20, <2 x float> %67)
  %103 = mul nuw nsw i64 %52, 8
  %104 = add nuw nsw i64 %103, 0
  %105 = getelementptr inbounds nuw float, ptr %7, i64 %104
  %106 = load float, ptr %105, align 4
  %107 = insertelement <2 x float> poison, float %106, i32 0
  %108 = shufflevector <2 x float> %107, <2 x float> poison, <2 x i32> zeroinitializer
  %109 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %108, <2 x float> %20, <2 x float> %67)
  %110 = mul nuw nsw i64 %57, 8
  %111 = add nuw nsw i64 %110, 0
  %112 = getelementptr inbounds nuw float, ptr %7, i64 %111
  %113 = load float, ptr %112, align 4
  %114 = insertelement <2 x float> poison, float %113, i32 0
  %115 = shufflevector <2 x float> %114, <2 x float> poison, <2 x i32> zeroinitializer
  %116 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %115, <2 x float> %20, <2 x float> %67)
  %117 = mul nuw nsw i64 %62, 8
  %118 = add nuw nsw i64 %117, 0
  %119 = getelementptr inbounds nuw float, ptr %7, i64 %118
  %120 = load float, ptr %119, align 4
  %121 = insertelement <2 x float> poison, float %120, i32 0
  %122 = shufflevector <2 x float> %121, <2 x float> poison, <2 x i32> zeroinitializer
  %123 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %122, <2 x float> %20, <2 x float> %67)
  %124 = add nuw nsw i64 %68, 1
  %125 = getelementptr inbounds nuw float, ptr %7, i64 %124
  %126 = load float, ptr %125, align 4
  %127 = insertelement <2 x float> poison, float %126, i32 0
  %128 = shufflevector <2 x float> %127, <2 x float> poison, <2 x i32> zeroinitializer
  %129 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %128, <2 x float> %21, <2 x float> %74)
  %130 = add nuw nsw i64 %75, 1
  %131 = getelementptr inbounds nuw float, ptr %7, i64 %130
  %132 = load float, ptr %131, align 4
  %133 = insertelement <2 x float> poison, float %132, i32 0
  %134 = shufflevector <2 x float> %133, <2 x float> poison, <2 x i32> zeroinitializer
  %135 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %134, <2 x float> %21, <2 x float> %81)
  %136 = add nuw nsw i64 %82, 1
  %137 = getelementptr inbounds nuw float, ptr %7, i64 %136
  %138 = load float, ptr %137, align 4
  %139 = insertelement <2 x float> poison, float %138, i32 0
  %140 = shufflevector <2 x float> %139, <2 x float> poison, <2 x i32> zeroinitializer
  %141 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %140, <2 x float> %21, <2 x float> %88)
  %142 = add nuw nsw i64 %89, 1
  %143 = getelementptr inbounds nuw float, ptr %7, i64 %142
  %144 = load float, ptr %143, align 4
  %145 = insertelement <2 x float> poison, float %144, i32 0
  %146 = shufflevector <2 x float> %145, <2 x float> poison, <2 x i32> zeroinitializer
  %147 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %146, <2 x float> %21, <2 x float> %95)
  %148 = add nuw nsw i64 %96, 1
  %149 = getelementptr inbounds nuw float, ptr %7, i64 %148
  %150 = load float, ptr %149, align 4
  %151 = insertelement <2 x float> poison, float %150, i32 0
  %152 = shufflevector <2 x float> %151, <2 x float> poison, <2 x i32> zeroinitializer
  %153 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %152, <2 x float> %21, <2 x float> %102)
  %154 = add nuw nsw i64 %103, 1
  %155 = getelementptr inbounds nuw float, ptr %7, i64 %154
  %156 = load float, ptr %155, align 4
  %157 = insertelement <2 x float> poison, float %156, i32 0
  %158 = shufflevector <2 x float> %157, <2 x float> poison, <2 x i32> zeroinitializer
  %159 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %158, <2 x float> %21, <2 x float> %109)
  %160 = add nuw nsw i64 %110, 1
  %161 = getelementptr inbounds nuw float, ptr %7, i64 %160
  %162 = load float, ptr %161, align 4
  %163 = insertelement <2 x float> poison, float %162, i32 0
  %164 = shufflevector <2 x float> %163, <2 x float> poison, <2 x i32> zeroinitializer
  %165 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %164, <2 x float> %21, <2 x float> %116)
  %166 = add nuw nsw i64 %117, 1
  %167 = getelementptr inbounds nuw float, ptr %7, i64 %166
  %168 = load float, ptr %167, align 4
  %169 = insertelement <2 x float> poison, float %168, i32 0
  %170 = shufflevector <2 x float> %169, <2 x float> poison, <2 x i32> zeroinitializer
  %171 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %170, <2 x float> %21, <2 x float> %123)
  %172 = add nuw nsw i64 %68, 2
  %173 = getelementptr inbounds nuw float, ptr %7, i64 %172
  %174 = load float, ptr %173, align 4
  %175 = insertelement <2 x float> poison, float %174, i32 0
  %176 = shufflevector <2 x float> %175, <2 x float> poison, <2 x i32> zeroinitializer
  %177 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %176, <2 x float> %22, <2 x float> %129)
  %178 = add nuw nsw i64 %75, 2
  %179 = getelementptr inbounds nuw float, ptr %7, i64 %178
  %180 = load float, ptr %179, align 4
  %181 = insertelement <2 x float> poison, float %180, i32 0
  %182 = shufflevector <2 x float> %181, <2 x float> poison, <2 x i32> zeroinitializer
  %183 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %182, <2 x float> %22, <2 x float> %135)
  %184 = add nuw nsw i64 %82, 2
  %185 = getelementptr inbounds nuw float, ptr %7, i64 %184
  %186 = load float, ptr %185, align 4
  %187 = insertelement <2 x float> poison, float %186, i32 0
  %188 = shufflevector <2 x float> %187, <2 x float> poison, <2 x i32> zeroinitializer
  %189 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %188, <2 x float> %22, <2 x float> %141)
  %190 = add nuw nsw i64 %89, 2
  %191 = getelementptr inbounds nuw float, ptr %7, i64 %190
  %192 = load float, ptr %191, align 4
  %193 = insertelement <2 x float> poison, float %192, i32 0
  %194 = shufflevector <2 x float> %193, <2 x float> poison, <2 x i32> zeroinitializer
  %195 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %194, <2 x float> %22, <2 x float> %147)
  %196 = add nuw nsw i64 %96, 2
  %197 = getelementptr inbounds nuw float, ptr %7, i64 %196
  %198 = load float, ptr %197, align 4
  %199 = insertelement <2 x float> poison, float %198, i32 0
  %200 = shufflevector <2 x float> %199, <2 x float> poison, <2 x i32> zeroinitializer
  %201 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %200, <2 x float> %22, <2 x float> %153)
  %202 = add nuw nsw i64 %103, 2
  %203 = getelementptr inbounds nuw float, ptr %7, i64 %202
  %204 = load float, ptr %203, align 4
  %205 = insertelement <2 x float> poison, float %204, i32 0
  %206 = shufflevector <2 x float> %205, <2 x float> poison, <2 x i32> zeroinitializer
  %207 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %206, <2 x float> %22, <2 x float> %159)
  %208 = add nuw nsw i64 %110, 2
  %209 = getelementptr inbounds nuw float, ptr %7, i64 %208
  %210 = load float, ptr %209, align 4
  %211 = insertelement <2 x float> poison, float %210, i32 0
  %212 = shufflevector <2 x float> %211, <2 x float> poison, <2 x i32> zeroinitializer
  %213 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %212, <2 x float> %22, <2 x float> %165)
  %214 = add nuw nsw i64 %117, 2
  %215 = getelementptr inbounds nuw float, ptr %7, i64 %214
  %216 = load float, ptr %215, align 4
  %217 = insertelement <2 x float> poison, float %216, i32 0
  %218 = shufflevector <2 x float> %217, <2 x float> poison, <2 x i32> zeroinitializer
  %219 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %218, <2 x float> %22, <2 x float> %171)
  %220 = add nuw nsw i64 %68, 3
  %221 = getelementptr inbounds nuw float, ptr %7, i64 %220
  %222 = load float, ptr %221, align 4
  %223 = insertelement <2 x float> poison, float %222, i32 0
  %224 = shufflevector <2 x float> %223, <2 x float> poison, <2 x i32> zeroinitializer
  %225 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %224, <2 x float> %23, <2 x float> %177)
  %226 = add nuw nsw i64 %75, 3
  %227 = getelementptr inbounds nuw float, ptr %7, i64 %226
  %228 = load float, ptr %227, align 4
  %229 = insertelement <2 x float> poison, float %228, i32 0
  %230 = shufflevector <2 x float> %229, <2 x float> poison, <2 x i32> zeroinitializer
  %231 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %230, <2 x float> %23, <2 x float> %183)
  %232 = add nuw nsw i64 %82, 3
  %233 = getelementptr inbounds nuw float, ptr %7, i64 %232
  %234 = load float, ptr %233, align 4
  %235 = insertelement <2 x float> poison, float %234, i32 0
  %236 = shufflevector <2 x float> %235, <2 x float> poison, <2 x i32> zeroinitializer
  %237 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %236, <2 x float> %23, <2 x float> %189)
  %238 = add nuw nsw i64 %89, 3
  %239 = getelementptr inbounds nuw float, ptr %7, i64 %238
  %240 = load float, ptr %239, align 4
  %241 = insertelement <2 x float> poison, float %240, i32 0
  %242 = shufflevector <2 x float> %241, <2 x float> poison, <2 x i32> zeroinitializer
  %243 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %242, <2 x float> %23, <2 x float> %195)
  %244 = add nuw nsw i64 %96, 3
  %245 = getelementptr inbounds nuw float, ptr %7, i64 %244
  %246 = load float, ptr %245, align 4
  %247 = insertelement <2 x float> poison, float %246, i32 0
  %248 = shufflevector <2 x float> %247, <2 x float> poison, <2 x i32> zeroinitializer
  %249 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %248, <2 x float> %23, <2 x float> %201)
  %250 = add nuw nsw i64 %103, 3
  %251 = getelementptr inbounds nuw float, ptr %7, i64 %250
  %252 = load float, ptr %251, align 4
  %253 = insertelement <2 x float> poison, float %252, i32 0
  %254 = shufflevector <2 x float> %253, <2 x float> poison, <2 x i32> zeroinitializer
  %255 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %254, <2 x float> %23, <2 x float> %207)
  %256 = add nuw nsw i64 %110, 3
  %257 = getelementptr inbounds nuw float, ptr %7, i64 %256
  %258 = load float, ptr %257, align 4
  %259 = insertelement <2 x float> poison, float %258, i32 0
  %260 = shufflevector <2 x float> %259, <2 x float> poison, <2 x i32> zeroinitializer
  %261 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %260, <2 x float> %23, <2 x float> %213)
  %262 = add nuw nsw i64 %117, 3
  %263 = getelementptr inbounds nuw float, ptr %7, i64 %262
  %264 = load float, ptr %263, align 4
  %265 = insertelement <2 x float> poison, float %264, i32 0
  %266 = shufflevector <2 x float> %265, <2 x float> poison, <2 x i32> zeroinitializer
  %267 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %266, <2 x float> %23, <2 x float> %219)
  %268 = add nuw nsw i64 %68, 4
  %269 = getelementptr inbounds nuw float, ptr %7, i64 %268
  %270 = load float, ptr %269, align 4
  %271 = insertelement <2 x float> poison, float %270, i32 0
  %272 = shufflevector <2 x float> %271, <2 x float> poison, <2 x i32> zeroinitializer
  %273 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %272, <2 x float> %24, <2 x float> %225)
  %274 = add nuw nsw i64 %75, 4
  %275 = getelementptr inbounds nuw float, ptr %7, i64 %274
  %276 = load float, ptr %275, align 4
  %277 = insertelement <2 x float> poison, float %276, i32 0
  %278 = shufflevector <2 x float> %277, <2 x float> poison, <2 x i32> zeroinitializer
  %279 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %278, <2 x float> %24, <2 x float> %231)
  %280 = add nuw nsw i64 %82, 4
  %281 = getelementptr inbounds nuw float, ptr %7, i64 %280
  %282 = load float, ptr %281, align 4
  %283 = insertelement <2 x float> poison, float %282, i32 0
  %284 = shufflevector <2 x float> %283, <2 x float> poison, <2 x i32> zeroinitializer
  %285 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %284, <2 x float> %24, <2 x float> %237)
  %286 = add nuw nsw i64 %89, 4
  %287 = getelementptr inbounds nuw float, ptr %7, i64 %286
  %288 = load float, ptr %287, align 4
  %289 = insertelement <2 x float> poison, float %288, i32 0
  %290 = shufflevector <2 x float> %289, <2 x float> poison, <2 x i32> zeroinitializer
  %291 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %290, <2 x float> %24, <2 x float> %243)
  %292 = add nuw nsw i64 %96, 4
  %293 = getelementptr inbounds nuw float, ptr %7, i64 %292
  %294 = load float, ptr %293, align 4
  %295 = insertelement <2 x float> poison, float %294, i32 0
  %296 = shufflevector <2 x float> %295, <2 x float> poison, <2 x i32> zeroinitializer
  %297 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %296, <2 x float> %24, <2 x float> %249)
  %298 = add nuw nsw i64 %103, 4
  %299 = getelementptr inbounds nuw float, ptr %7, i64 %298
  %300 = load float, ptr %299, align 4
  %301 = insertelement <2 x float> poison, float %300, i32 0
  %302 = shufflevector <2 x float> %301, <2 x float> poison, <2 x i32> zeroinitializer
  %303 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %302, <2 x float> %24, <2 x float> %255)
  %304 = add nuw nsw i64 %110, 4
  %305 = getelementptr inbounds nuw float, ptr %7, i64 %304
  %306 = load float, ptr %305, align 4
  %307 = insertelement <2 x float> poison, float %306, i32 0
  %308 = shufflevector <2 x float> %307, <2 x float> poison, <2 x i32> zeroinitializer
  %309 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %308, <2 x float> %24, <2 x float> %261)
  %310 = add nuw nsw i64 %117, 4
  %311 = getelementptr inbounds nuw float, ptr %7, i64 %310
  %312 = load float, ptr %311, align 4
  %313 = insertelement <2 x float> poison, float %312, i32 0
  %314 = shufflevector <2 x float> %313, <2 x float> poison, <2 x i32> zeroinitializer
  %315 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %314, <2 x float> %24, <2 x float> %267)
  %316 = add nuw nsw i64 %68, 5
  %317 = getelementptr inbounds nuw float, ptr %7, i64 %316
  %318 = load float, ptr %317, align 4
  %319 = insertelement <2 x float> poison, float %318, i32 0
  %320 = shufflevector <2 x float> %319, <2 x float> poison, <2 x i32> zeroinitializer
  %321 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %320, <2 x float> %25, <2 x float> %273)
  %322 = add nuw nsw i64 %75, 5
  %323 = getelementptr inbounds nuw float, ptr %7, i64 %322
  %324 = load float, ptr %323, align 4
  %325 = insertelement <2 x float> poison, float %324, i32 0
  %326 = shufflevector <2 x float> %325, <2 x float> poison, <2 x i32> zeroinitializer
  %327 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %326, <2 x float> %25, <2 x float> %279)
  %328 = add nuw nsw i64 %82, 5
  %329 = getelementptr inbounds nuw float, ptr %7, i64 %328
  %330 = load float, ptr %329, align 4
  %331 = insertelement <2 x float> poison, float %330, i32 0
  %332 = shufflevector <2 x float> %331, <2 x float> poison, <2 x i32> zeroinitializer
  %333 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %332, <2 x float> %25, <2 x float> %285)
  %334 = add nuw nsw i64 %89, 5
  %335 = getelementptr inbounds nuw float, ptr %7, i64 %334
  %336 = load float, ptr %335, align 4
  %337 = insertelement <2 x float> poison, float %336, i32 0
  %338 = shufflevector <2 x float> %337, <2 x float> poison, <2 x i32> zeroinitializer
  %339 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %338, <2 x float> %25, <2 x float> %291)
  %340 = add nuw nsw i64 %96, 5
  %341 = getelementptr inbounds nuw float, ptr %7, i64 %340
  %342 = load float, ptr %341, align 4
  %343 = insertelement <2 x float> poison, float %342, i32 0
  %344 = shufflevector <2 x float> %343, <2 x float> poison, <2 x i32> zeroinitializer
  %345 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %344, <2 x float> %25, <2 x float> %297)
  %346 = add nuw nsw i64 %103, 5
  %347 = getelementptr inbounds nuw float, ptr %7, i64 %346
  %348 = load float, ptr %347, align 4
  %349 = insertelement <2 x float> poison, float %348, i32 0
  %350 = shufflevector <2 x float> %349, <2 x float> poison, <2 x i32> zeroinitializer
  %351 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %350, <2 x float> %25, <2 x float> %303)
  %352 = add nuw nsw i64 %110, 5
  %353 = getelementptr inbounds nuw float, ptr %7, i64 %352
  %354 = load float, ptr %353, align 4
  %355 = insertelement <2 x float> poison, float %354, i32 0
  %356 = shufflevector <2 x float> %355, <2 x float> poison, <2 x i32> zeroinitializer
  %357 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> %25, <2 x float> %309)
  %358 = add nuw nsw i64 %117, 5
  %359 = getelementptr inbounds nuw float, ptr %7, i64 %358
  %360 = load float, ptr %359, align 4
  %361 = insertelement <2 x float> poison, float %360, i32 0
  %362 = shufflevector <2 x float> %361, <2 x float> poison, <2 x i32> zeroinitializer
  %363 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %362, <2 x float> %25, <2 x float> %315)
  %364 = add nuw nsw i64 %68, 6
  %365 = getelementptr inbounds nuw float, ptr %7, i64 %364
  %366 = load float, ptr %365, align 4
  %367 = insertelement <2 x float> poison, float %366, i32 0
  %368 = shufflevector <2 x float> %367, <2 x float> poison, <2 x i32> zeroinitializer
  %369 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %368, <2 x float> %26, <2 x float> %321)
  %370 = add nuw nsw i64 %75, 6
  %371 = getelementptr inbounds nuw float, ptr %7, i64 %370
  %372 = load float, ptr %371, align 4
  %373 = insertelement <2 x float> poison, float %372, i32 0
  %374 = shufflevector <2 x float> %373, <2 x float> poison, <2 x i32> zeroinitializer
  %375 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %374, <2 x float> %26, <2 x float> %327)
  %376 = add nuw nsw i64 %82, 6
  %377 = getelementptr inbounds nuw float, ptr %7, i64 %376
  %378 = load float, ptr %377, align 4
  %379 = insertelement <2 x float> poison, float %378, i32 0
  %380 = shufflevector <2 x float> %379, <2 x float> poison, <2 x i32> zeroinitializer
  %381 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %380, <2 x float> %26, <2 x float> %333)
  %382 = add nuw nsw i64 %89, 6
  %383 = getelementptr inbounds nuw float, ptr %7, i64 %382
  %384 = load float, ptr %383, align 4
  %385 = insertelement <2 x float> poison, float %384, i32 0
  %386 = shufflevector <2 x float> %385, <2 x float> poison, <2 x i32> zeroinitializer
  %387 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %386, <2 x float> %26, <2 x float> %339)
  %388 = add nuw nsw i64 %96, 6
  %389 = getelementptr inbounds nuw float, ptr %7, i64 %388
  %390 = load float, ptr %389, align 4
  %391 = insertelement <2 x float> poison, float %390, i32 0
  %392 = shufflevector <2 x float> %391, <2 x float> poison, <2 x i32> zeroinitializer
  %393 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %392, <2 x float> %26, <2 x float> %345)
  %394 = add nuw nsw i64 %103, 6
  %395 = getelementptr inbounds nuw float, ptr %7, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = insertelement <2 x float> poison, float %396, i32 0
  %398 = shufflevector <2 x float> %397, <2 x float> poison, <2 x i32> zeroinitializer
  %399 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %398, <2 x float> %26, <2 x float> %351)
  %400 = add nuw nsw i64 %110, 6
  %401 = getelementptr inbounds nuw float, ptr %7, i64 %400
  %402 = load float, ptr %401, align 4
  %403 = insertelement <2 x float> poison, float %402, i32 0
  %404 = shufflevector <2 x float> %403, <2 x float> poison, <2 x i32> zeroinitializer
  %405 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %404, <2 x float> %26, <2 x float> %357)
  %406 = add nuw nsw i64 %117, 6
  %407 = getelementptr inbounds nuw float, ptr %7, i64 %406
  %408 = load float, ptr %407, align 4
  %409 = insertelement <2 x float> poison, float %408, i32 0
  %410 = shufflevector <2 x float> %409, <2 x float> poison, <2 x i32> zeroinitializer
  %411 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %410, <2 x float> %26, <2 x float> %363)
  %412 = add nuw nsw i64 %68, 7
  %413 = getelementptr inbounds nuw float, ptr %7, i64 %412
  %414 = load float, ptr %413, align 4
  %415 = insertelement <2 x float> poison, float %414, i32 0
  %416 = shufflevector <2 x float> %415, <2 x float> poison, <2 x i32> zeroinitializer
  %417 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %416, <2 x float> %27, <2 x float> %369)
  %418 = add nuw nsw i64 %75, 7
  %419 = getelementptr inbounds nuw float, ptr %7, i64 %418
  %420 = load float, ptr %419, align 4
  %421 = insertelement <2 x float> poison, float %420, i32 0
  %422 = shufflevector <2 x float> %421, <2 x float> poison, <2 x i32> zeroinitializer
  %423 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %422, <2 x float> %27, <2 x float> %375)
  %424 = add nuw nsw i64 %82, 7
  %425 = getelementptr inbounds nuw float, ptr %7, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = insertelement <2 x float> poison, float %426, i32 0
  %428 = shufflevector <2 x float> %427, <2 x float> poison, <2 x i32> zeroinitializer
  %429 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %428, <2 x float> %27, <2 x float> %381)
  %430 = add nuw nsw i64 %89, 7
  %431 = getelementptr inbounds nuw float, ptr %7, i64 %430
  %432 = load float, ptr %431, align 4
  %433 = insertelement <2 x float> poison, float %432, i32 0
  %434 = shufflevector <2 x float> %433, <2 x float> poison, <2 x i32> zeroinitializer
  %435 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %434, <2 x float> %27, <2 x float> %387)
  %436 = add nuw nsw i64 %96, 7
  %437 = getelementptr inbounds nuw float, ptr %7, i64 %436
  %438 = load float, ptr %437, align 4
  %439 = insertelement <2 x float> poison, float %438, i32 0
  %440 = shufflevector <2 x float> %439, <2 x float> poison, <2 x i32> zeroinitializer
  %441 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %440, <2 x float> %27, <2 x float> %393)
  %442 = add nuw nsw i64 %103, 7
  %443 = getelementptr inbounds nuw float, ptr %7, i64 %442
  %444 = load float, ptr %443, align 4
  %445 = insertelement <2 x float> poison, float %444, i32 0
  %446 = shufflevector <2 x float> %445, <2 x float> poison, <2 x i32> zeroinitializer
  %447 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %446, <2 x float> %27, <2 x float> %399)
  %448 = add nuw nsw i64 %110, 7
  %449 = getelementptr inbounds nuw float, ptr %7, i64 %448
  %450 = load float, ptr %449, align 4
  %451 = insertelement <2 x float> poison, float %450, i32 0
  %452 = shufflevector <2 x float> %451, <2 x float> poison, <2 x i32> zeroinitializer
  %453 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %452, <2 x float> %27, <2 x float> %405)
  %454 = add nuw nsw i64 %117, 7
  %455 = getelementptr inbounds nuw float, ptr %7, i64 %454
  %456 = load float, ptr %455, align 4
  %457 = insertelement <2 x float> poison, float %456, i32 0
  %458 = shufflevector <2 x float> %457, <2 x float> poison, <2 x i32> zeroinitializer
  %459 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %458, <2 x float> %27, <2 x float> %411)
  %460 = fadd contract <2 x float> %31, %417, !dbg !267
  %461 = fadd contract <2 x float> %36, %423, !dbg !267
  %462 = fadd contract <2 x float> %41, %429, !dbg !267
  %463 = fadd contract <2 x float> %46, %435, !dbg !267
  %464 = fadd contract <2 x float> %51, %441, !dbg !267
  %465 = fadd contract <2 x float> %56, %447, !dbg !267
  %466 = fadd contract <2 x float> %61, %453, !dbg !267
  %467 = fadd contract <2 x float> %66, %459, !dbg !267
  %468 = getelementptr float, ptr %15, i64 %29, !dbg !267
  store <2 x float> %460, ptr %468, align 4, !dbg !267
  %469 = getelementptr float, ptr %15, i64 %34, !dbg !267
  store <2 x float> %461, ptr %469, align 4, !dbg !267
  %470 = getelementptr float, ptr %15, i64 %39, !dbg !267
  store <2 x float> %462, ptr %470, align 4, !dbg !267
  %471 = getelementptr float, ptr %15, i64 %44, !dbg !267
  store <2 x float> %463, ptr %471, align 4, !dbg !267
  %472 = getelementptr float, ptr %15, i64 %49, !dbg !267
  store <2 x float> %464, ptr %472, align 4, !dbg !267
  %473 = getelementptr float, ptr %15, i64 %54, !dbg !267
  store <2 x float> %465, ptr %473, align 4, !dbg !267
  %474 = getelementptr float, ptr %15, i64 %59, !dbg !267
  store <2 x float> %466, ptr %474, align 4, !dbg !267
  %475 = getelementptr float, ptr %15, i64 %64, !dbg !267
  store <2 x float> %467, ptr %475, align 4, !dbg !267
  ret i32 0, !dbg !268
}

define internal i32 @"main$async_dispatch_20_reduction_16x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !269 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !270
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !270
  %6 = load ptr, ptr %5, align 8, !dbg !270
  %7 = getelementptr float, ptr %6, i64 32, !dbg !270
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !270
  %8 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !271
  %9 = extractvalue %iree_hal_executable_dispatch_state_v0_t %8, 10, !dbg !271
  %10 = getelementptr ptr, ptr %9, i32 1, !dbg !271
  %11 = load ptr, ptr %10, align 8, !dbg !271
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !271
  %12 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !272
  %13 = extractvalue %iree_hal_executable_workgroup_state_v0_t %12, 0, !dbg !272
  %14 = zext i32 %13 to i64, !dbg !272
  %15 = mul nsw i64 %14, 2, !dbg !272
  %16 = mul i64 %15, 2, !dbg !272
  %17 = add i64 %16, 0, !dbg !272
  %18 = getelementptr float, ptr %7, i64 %17, !dbg !272
  %19 = load <2 x float>, ptr %18, align 4, !dbg !272
  %20 = add i64 %15, 1, !dbg !272
  %21 = mul i64 %20, 2, !dbg !272
  %22 = add i64 %21, 0, !dbg !272
  %23 = getelementptr float, ptr %7, i64 %22, !dbg !272
  %24 = load <2 x float>, ptr %23, align 4, !dbg !272
  %25 = fmul contract <2 x float> %19, %19, !dbg !273
  %26 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %25), !dbg !273
  %27 = fmul contract <2 x float> %24, %24, !dbg !273
  %28 = call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %27), !dbg !273
  %29 = insertelement <2 x float> poison, float %26, i64 0, !dbg !273
  %30 = insertelement <2 x float> %29, float %28, i64 1, !dbg !273
  %31 = load <2 x float>, ptr @__constant_2xf32_0_3, align 4, !dbg !274
  %32 = load <2 x float>, ptr @__constant_2xf32_8, align 4, !dbg !274
  %33 = fdiv <2 x float> %30, splat (float 2.000000e+00), !dbg !275
  %34 = fadd contract <2 x float> %33, splat (float 0x3EE4F8B580000000), !dbg !276
  %35 = call <2 x float> @llvm.sqrt.v2f32(<2 x float> %34), !dbg !277
  %36 = fdiv <2 x float> splat (float 1.000000e+00), %35, !dbg !277
  %37 = shufflevector <2 x float> %36, <2 x float> %36, <4 x i32> <i32 0, i32 1, i32 0, i32 0>, !dbg !277
  %38 = shufflevector <4 x float> %37, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 6, i32 7>, !dbg !277
  %39 = shufflevector <4 x float> %37, <4 x float> %38, <4 x i32> <i32 4, i32 5, i32 0, i32 1>, !dbg !277
  %40 = shufflevector <4 x float> %39, <4 x float> %39, <4 x i32> <i32 0, i32 2, i32 1, i32 3>, !dbg !277
  %41 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 0, i32 1>, !dbg !277
  %42 = shufflevector <4 x float> %40, <4 x float> %40, <2 x i32> <i32 2, i32 3>, !dbg !277
  %43 = fmul contract <2 x float> %19, %41, !dbg !278
  %44 = fmul contract <2 x float> %24, %42, !dbg !278
  %45 = fmul contract <2 x float> %43, %31, !dbg !279
  %46 = fmul contract <2 x float> %44, %31, !dbg !279
  %47 = fadd contract <2 x float> %45, %32, !dbg !280
  %48 = fadd contract <2 x float> %46, %32, !dbg !280
  %49 = getelementptr float, ptr %11, i64 %17, !dbg !280
  store <2 x float> %47, ptr %49, align 4, !dbg !280
  %50 = getelementptr float, ptr %11, i64 %22, !dbg !280
  store <2 x float> %48, ptr %50, align 4, !dbg !280
  ret i32 0, !dbg !281
}

define internal i32 @"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"(ptr noalias noundef nonnull align 16 %0, ptr noalias noundef nonnull align 16 %1, ptr noalias noundef nonnull align 16 %2) #0 !dbg !282 {
  %4 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !283
  %5 = extractvalue %iree_hal_executable_dispatch_state_v0_t %4, 10, !dbg !283
  %6 = load ptr, ptr %5, align 8, !dbg !283
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !283
  %7 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !284
  %8 = extractvalue %iree_hal_executable_dispatch_state_v0_t %7, 10, !dbg !284
  %9 = getelementptr ptr, ptr %8, i32 1, !dbg !284
  %10 = load ptr, ptr %9, align 8, !dbg !284
  %11 = getelementptr float, ptr %10, i64 32, !dbg !284
  call void @llvm.assume(i1 true) [ "align"(ptr %11, i64 64) ], !dbg !284
  %12 = load %iree_hal_executable_dispatch_state_v0_t, ptr %1, align 8, !dbg !285
  %13 = extractvalue %iree_hal_executable_dispatch_state_v0_t %12, 10, !dbg !285
  %14 = getelementptr ptr, ptr %13, i32 2, !dbg !285
  %15 = load ptr, ptr %14, align 8, !dbg !285
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !285
  %16 = load %iree_hal_executable_workgroup_state_v0_t, ptr %2, align 8, !dbg !286
  %17 = extractvalue %iree_hal_executable_workgroup_state_v0_t %16, 0, !dbg !286
  %18 = zext i32 %17 to i64, !dbg !286
  %19 = mul nsw i64 %18, 64, !dbg !286
  %20 = mul nsw i64 %18, -64, !dbg !286
  %21 = add i64 %20, 50257, !dbg !286
  %22 = icmp slt i64 %21, 64, !dbg !286
  %23 = select i1 %22, i64 %21, i64 64, !dbg !286
  br label %24, !dbg !286

24:                                               ; preds = %221, %3
  %25 = phi i64 [ %222, %221 ], [ 0, %3 ], !dbg !286
  %26 = icmp slt i64 %25, 16, !dbg !286
  br i1 %26, label %27, label %223, !dbg !286

27:                                               ; preds = %30, %24
  %28 = phi i64 [ %220, %30 ], [ 0, %24 ], !dbg !286
  %29 = icmp slt i64 %28, %23, !dbg !286
  br i1 %29, label %30, label %221, !dbg !286

30:                                               ; preds = %27
  %31 = sub i64 %23, %28, !dbg !286
  %32 = icmp slt i64 %31, 29, !dbg !286
  %33 = select i1 %32, i64 %31, i64 29, !dbg !286
  %34 = trunc i64 %33 to i32, !dbg !287
  %35 = insertelement <29 x i32> poison, i32 %34, i32 0, !dbg !287
  %36 = shufflevector <29 x i32> %35, <29 x i32> poison, <29 x i32> zeroinitializer, !dbg !287
  %37 = icmp sgt <29 x i32> %36, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28>, !dbg !287
  %38 = add i64 %19, %28, !dbg !287
  %39 = mul i64 %25, 50257, !dbg !287
  %40 = add i64 0, %39, !dbg !287
  %41 = add i64 %40, %38, !dbg !287
  %42 = getelementptr float, ptr %15, i64 %41, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %42, <29 x i1> %37), !dbg !287
  %43 = add i64 %25, 1, !dbg !287
  %44 = mul i64 %43, 50257, !dbg !287
  %45 = add i64 0, %44, !dbg !287
  %46 = add i64 %45, %38, !dbg !287
  %47 = getelementptr float, ptr %15, i64 %46, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %47, <29 x i1> %37), !dbg !287
  %48 = add i64 %25, 2, !dbg !287
  %49 = mul i64 %48, 50257, !dbg !287
  %50 = add i64 0, %49, !dbg !287
  %51 = add i64 %50, %38, !dbg !287
  %52 = getelementptr float, ptr %15, i64 %51, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %52, <29 x i1> %37), !dbg !287
  %53 = add i64 %25, 3, !dbg !287
  %54 = mul i64 %53, 50257, !dbg !287
  %55 = add i64 0, %54, !dbg !287
  %56 = add i64 %55, %38, !dbg !287
  %57 = getelementptr float, ptr %15, i64 %56, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %57, <29 x i1> %37), !dbg !287
  %58 = add i64 %25, 4, !dbg !287
  %59 = mul i64 %58, 50257, !dbg !287
  %60 = add i64 0, %59, !dbg !287
  %61 = add i64 %60, %38, !dbg !287
  %62 = getelementptr float, ptr %15, i64 %61, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %62, <29 x i1> %37), !dbg !287
  %63 = add i64 %25, 5, !dbg !287
  %64 = mul i64 %63, 50257, !dbg !287
  %65 = add i64 0, %64, !dbg !287
  %66 = add i64 %65, %38, !dbg !287
  %67 = getelementptr float, ptr %15, i64 %66, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %67, <29 x i1> %37), !dbg !287
  %68 = add i64 %25, 6, !dbg !287
  %69 = mul i64 %68, 50257, !dbg !287
  %70 = add i64 0, %69, !dbg !287
  %71 = add i64 %70, %38, !dbg !287
  %72 = getelementptr float, ptr %15, i64 %71, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %72, <29 x i1> %37), !dbg !287
  %73 = add i64 %25, 7, !dbg !287
  %74 = mul i64 %73, 50257, !dbg !287
  %75 = add i64 0, %74, !dbg !287
  %76 = add i64 %75, %38, !dbg !287
  %77 = getelementptr float, ptr %15, i64 %76, !dbg !287
  call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %77, <29 x i1> %37), !dbg !287
  %78 = add i64 0, %38, !dbg !286
  %79 = getelementptr float, ptr %11, i64 %78, !dbg !286
  %80 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %79, <29 x i1> %37, <29 x float> poison), !dbg !286
  %81 = add i64 50257, %38, !dbg !286
  %82 = getelementptr float, ptr %11, i64 %81, !dbg !286
  %83 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %82, <29 x i1> %37, <29 x float> poison), !dbg !286
  %84 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %42, <29 x i1> %37, <29 x float> poison), !dbg !286
  %85 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %47, <29 x i1> %37, <29 x float> poison), !dbg !286
  %86 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %52, <29 x i1> %37, <29 x float> poison), !dbg !286
  %87 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %57, <29 x i1> %37, <29 x float> poison), !dbg !286
  %88 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %62, <29 x i1> %37, <29 x float> poison), !dbg !286
  %89 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %67, <29 x i1> %37, <29 x float> poison), !dbg !286
  %90 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %72, <29 x i1> %37, <29 x float> poison), !dbg !286
  %91 = call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %77, <29 x i1> %37, <29 x float> poison), !dbg !286
  %92 = mul nuw nsw i64 %25, 2
  %93 = add nuw nsw i64 0, %92
  %94 = add nuw nsw i64 %93, 0
  %95 = getelementptr inbounds nuw float, ptr %6, i64 %94
  %96 = load float, ptr %95, align 4
  %97 = insertelement <29 x float> poison, float %96, i32 0
  %98 = shufflevector <29 x float> %97, <29 x float> poison, <29 x i32> zeroinitializer
  %99 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %98, <29 x float> %80, <29 x float> %84)
  %100 = select <29 x i1> %37, <29 x float> %99, <29 x float> %84
  %101 = mul nuw nsw i64 %43, 2
  %102 = add nuw nsw i64 0, %101
  %103 = add nuw nsw i64 %102, 0
  %104 = getelementptr inbounds nuw float, ptr %6, i64 %103
  %105 = load float, ptr %104, align 4
  %106 = insertelement <29 x float> poison, float %105, i32 0
  %107 = shufflevector <29 x float> %106, <29 x float> poison, <29 x i32> zeroinitializer
  %108 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %107, <29 x float> %80, <29 x float> %85)
  %109 = select <29 x i1> %37, <29 x float> %108, <29 x float> %85
  %110 = mul nuw nsw i64 %48, 2
  %111 = add nuw nsw i64 0, %110
  %112 = add nuw nsw i64 %111, 0
  %113 = getelementptr inbounds nuw float, ptr %6, i64 %112
  %114 = load float, ptr %113, align 4
  %115 = insertelement <29 x float> poison, float %114, i32 0
  %116 = shufflevector <29 x float> %115, <29 x float> poison, <29 x i32> zeroinitializer
  %117 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %116, <29 x float> %80, <29 x float> %86)
  %118 = select <29 x i1> %37, <29 x float> %117, <29 x float> %86
  %119 = mul nuw nsw i64 %53, 2
  %120 = add nuw nsw i64 0, %119
  %121 = add nuw nsw i64 %120, 0
  %122 = getelementptr inbounds nuw float, ptr %6, i64 %121
  %123 = load float, ptr %122, align 4
  %124 = insertelement <29 x float> poison, float %123, i32 0
  %125 = shufflevector <29 x float> %124, <29 x float> poison, <29 x i32> zeroinitializer
  %126 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %125, <29 x float> %80, <29 x float> %87)
  %127 = select <29 x i1> %37, <29 x float> %126, <29 x float> %87
  %128 = mul nuw nsw i64 %58, 2
  %129 = add nuw nsw i64 0, %128
  %130 = add nuw nsw i64 %129, 0
  %131 = getelementptr inbounds nuw float, ptr %6, i64 %130
  %132 = load float, ptr %131, align 4
  %133 = insertelement <29 x float> poison, float %132, i32 0
  %134 = shufflevector <29 x float> %133, <29 x float> poison, <29 x i32> zeroinitializer
  %135 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %134, <29 x float> %80, <29 x float> %88)
  %136 = select <29 x i1> %37, <29 x float> %135, <29 x float> %88
  %137 = mul nuw nsw i64 %63, 2
  %138 = add nuw nsw i64 0, %137
  %139 = add nuw nsw i64 %138, 0
  %140 = getelementptr inbounds nuw float, ptr %6, i64 %139
  %141 = load float, ptr %140, align 4
  %142 = insertelement <29 x float> poison, float %141, i32 0
  %143 = shufflevector <29 x float> %142, <29 x float> poison, <29 x i32> zeroinitializer
  %144 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %143, <29 x float> %80, <29 x float> %89)
  %145 = select <29 x i1> %37, <29 x float> %144, <29 x float> %89
  %146 = mul nuw nsw i64 %68, 2
  %147 = add nuw nsw i64 0, %146
  %148 = add nuw nsw i64 %147, 0
  %149 = getelementptr inbounds nuw float, ptr %6, i64 %148
  %150 = load float, ptr %149, align 4
  %151 = insertelement <29 x float> poison, float %150, i32 0
  %152 = shufflevector <29 x float> %151, <29 x float> poison, <29 x i32> zeroinitializer
  %153 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %152, <29 x float> %80, <29 x float> %90)
  %154 = select <29 x i1> %37, <29 x float> %153, <29 x float> %90
  %155 = mul nuw nsw i64 %73, 2
  %156 = add nuw nsw i64 0, %155
  %157 = add nuw nsw i64 %156, 0
  %158 = getelementptr inbounds nuw float, ptr %6, i64 %157
  %159 = load float, ptr %158, align 4
  %160 = insertelement <29 x float> poison, float %159, i32 0
  %161 = shufflevector <29 x float> %160, <29 x float> poison, <29 x i32> zeroinitializer
  %162 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %161, <29 x float> %80, <29 x float> %91)
  %163 = select <29 x i1> %37, <29 x float> %162, <29 x float> %91
  %164 = add nuw nsw i64 %93, 1
  %165 = getelementptr inbounds nuw float, ptr %6, i64 %164
  %166 = load float, ptr %165, align 4
  %167 = insertelement <29 x float> poison, float %166, i32 0
  %168 = shufflevector <29 x float> %167, <29 x float> poison, <29 x i32> zeroinitializer
  %169 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %168, <29 x float> %83, <29 x float> %100)
  %170 = select <29 x i1> %37, <29 x float> %169, <29 x float> %84
  %171 = add nuw nsw i64 %102, 1
  %172 = getelementptr inbounds nuw float, ptr %6, i64 %171
  %173 = load float, ptr %172, align 4
  %174 = insertelement <29 x float> poison, float %173, i32 0
  %175 = shufflevector <29 x float> %174, <29 x float> poison, <29 x i32> zeroinitializer
  %176 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %175, <29 x float> %83, <29 x float> %109)
  %177 = select <29 x i1> %37, <29 x float> %176, <29 x float> %85
  %178 = add nuw nsw i64 %111, 1
  %179 = getelementptr inbounds nuw float, ptr %6, i64 %178
  %180 = load float, ptr %179, align 4
  %181 = insertelement <29 x float> poison, float %180, i32 0
  %182 = shufflevector <29 x float> %181, <29 x float> poison, <29 x i32> zeroinitializer
  %183 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %182, <29 x float> %83, <29 x float> %118)
  %184 = select <29 x i1> %37, <29 x float> %183, <29 x float> %86
  %185 = add nuw nsw i64 %120, 1
  %186 = getelementptr inbounds nuw float, ptr %6, i64 %185
  %187 = load float, ptr %186, align 4
  %188 = insertelement <29 x float> poison, float %187, i32 0
  %189 = shufflevector <29 x float> %188, <29 x float> poison, <29 x i32> zeroinitializer
  %190 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %189, <29 x float> %83, <29 x float> %127)
  %191 = select <29 x i1> %37, <29 x float> %190, <29 x float> %87
  %192 = add nuw nsw i64 %129, 1
  %193 = getelementptr inbounds nuw float, ptr %6, i64 %192
  %194 = load float, ptr %193, align 4
  %195 = insertelement <29 x float> poison, float %194, i32 0
  %196 = shufflevector <29 x float> %195, <29 x float> poison, <29 x i32> zeroinitializer
  %197 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %196, <29 x float> %83, <29 x float> %136)
  %198 = select <29 x i1> %37, <29 x float> %197, <29 x float> %88
  %199 = add nuw nsw i64 %138, 1
  %200 = getelementptr inbounds nuw float, ptr %6, i64 %199
  %201 = load float, ptr %200, align 4
  %202 = insertelement <29 x float> poison, float %201, i32 0
  %203 = shufflevector <29 x float> %202, <29 x float> poison, <29 x i32> zeroinitializer
  %204 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %203, <29 x float> %83, <29 x float> %145)
  %205 = select <29 x i1> %37, <29 x float> %204, <29 x float> %89
  %206 = add nuw nsw i64 %147, 1
  %207 = getelementptr inbounds nuw float, ptr %6, i64 %206
  %208 = load float, ptr %207, align 4
  %209 = insertelement <29 x float> poison, float %208, i32 0
  %210 = shufflevector <29 x float> %209, <29 x float> poison, <29 x i32> zeroinitializer
  %211 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %210, <29 x float> %83, <29 x float> %154)
  %212 = select <29 x i1> %37, <29 x float> %211, <29 x float> %90
  %213 = add nuw nsw i64 %156, 1
  %214 = getelementptr inbounds nuw float, ptr %6, i64 %213
  %215 = load float, ptr %214, align 4
  %216 = insertelement <29 x float> poison, float %215, i32 0
  %217 = shufflevector <29 x float> %216, <29 x float> poison, <29 x i32> zeroinitializer
  %218 = call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %217, <29 x float> %83, <29 x float> %163)
  %219 = select <29 x i1> %37, <29 x float> %218, <29 x float> %91
  call void @llvm.masked.store.v29f32.p0(<29 x float> %170, ptr align 4 %42, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %177, ptr align 4 %47, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %184, ptr align 4 %52, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %191, ptr align 4 %57, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %198, ptr align 4 %62, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %205, ptr align 4 %67, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %212, ptr align 4 %72, <29 x i1> %37)
  call void @llvm.masked.store.v29f32.p0(<29 x float> %219, ptr align 4 %77, <29 x i1> %37)
  %220 = add i64 %28, 29, !dbg !286
  br label %27, !dbg !286

221:                                              ; preds = %27
  %222 = add i64 %25, 8, !dbg !286
  br label %24, !dbg !286

223:                                              ; preds = %24
  ret i32 0, !dbg !288
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v2f32(float, <2 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.sqrt.v2f32(<2 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <6 x float> @llvm.fmuladd.v6f32(<6 x float>, <6 x float>, <6 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fmaximum.v16f32(<16 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fma.v2f32(<2 x float>, <2 x float>, <2 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.floor.v2f32(<2 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fma.v16f32(<16 x float>, <16 x float>, <16 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.floor.v16f32(<16 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v16f32(float, <16 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fmuladd.v8f32(<8 x float>, <8 x float>, <8 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v29f32.p0(<29 x float>, ptr captures(none), <29 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <29 x float> @llvm.masked.load.v29f32.p0(ptr captures(none), <29 x i1>, <29 x float>) #4

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <29 x float> @llvm.fmuladd.v29f32(<29 x float>, <29 x float>, <29 x float>) #2

; Function Attrs: uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr %1) #5 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
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
define hidden signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
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
define hidden float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #6 {
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
define hidden float @__extendhfsf2(float noundef %0) local_unnamed_addr #6 {
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
define hidden signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #6 {
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
define hidden float @__truncsfhf2(float noundef %0) local_unnamed_addr #6 {
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
  store i16 %36, ptr %2, align 4, !tbaa !289
  %37 = load float, ptr %2, align 4, !tbaa !291
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %37
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #7

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden double @__extendhfdf2(float noundef %0) local_unnamed_addr #6 {
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
define hidden float @__truncdfhf2(double noundef %0) local_unnamed_addr #6 {
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
  store i16 %37, ptr %2, align 4, !tbaa !289
  %38 = load float, ptr %2, align 4, !tbaa !291
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %38
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define hidden noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #6 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #8

; Function Attrs: inlinehint
define hidden noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #9 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @__math_oflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x4600000000000000) #9
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !291
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !291
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint
define hidden float @__math_uflowf(i32 noundef %0) local_unnamed_addr #9 {
  %2 = tail call float @__math_xflowf(i32 noundef %0, float noundef 0x3A00000000000000) #9
  ret float %2
}

; Function Attrs: inlinehint
define hidden float @ceilf(float noundef %0) local_unnamed_addr #9 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !291
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
  store volatile float %24, ptr %2, align 4, !tbaa !291
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
define hidden float @expf(float noundef %0) local_unnamed_addr #9 {
  %2 = fpext float %0 to double
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 20
  %5 = and i32 %4, 2047
  %.not = icmp samesign ult i32 %5, 1067
  br i1 %.not, label %19, label %6, !prof !293

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
  %14 = tail call float @__math_oflowf(i32 noundef 0) #9
  br label %42

15:                                               ; preds = %11
  %16 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %16, label %17, label %19

17:                                               ; preds = %15
  %18 = tail call float @__math_uflowf(i32 noundef 0) #9
  br label %42

19:                                               ; preds = %15, %1
  %20 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 296), align 8, !tbaa !294
  %21 = fmul double %20, %2
  %22 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 288), align 8, !tbaa !297
  %23 = fadd double %21, %22
  %24 = bitcast double %23 to i64
  %25 = fsub double %23, %22
  %26 = fsub double %21, %25
  %27 = and i64 %24, 31
  %28 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %27
  %29 = load i64, ptr %28, align 8, !tbaa !298
  %30 = shl i64 %24, 47
  %31 = add i64 %30, %29
  %32 = bitcast i64 %31 to double
  %33 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 304), align 8, !tbaa !300
  %34 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 312), align 8, !tbaa !300
  %35 = tail call double @llvm.fmuladd.f64(double %33, double %26, double %34)
  %36 = fmul double %26, %26
  %37 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 320), align 8, !tbaa !300
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
define hidden noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetround() local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret i32 0
}

; Function Attrs: inlinehint
define hidden float @floorf(float noundef %0) local_unnamed_addr #9 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !291
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
  store volatile float %23, ptr %2, align 4, !tbaa !291
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
define hidden float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #9 {
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
  %23 = tail call i32 @fegetround() #9
  %.not = icmp eq i32 %23, 0
  br i1 %.not, label %34, label %24

24:                                               ; preds = %22, %17, %3
  %25 = add nsw i32 %13, -874
  %or.cond3 = icmp ult i32 %25, 23
  br i1 %or.cond3, label %26, label %46

26:                                               ; preds = %24
  %27 = tail call i32 @fetestexcept(i32 noundef 32) #9
  %.not41 = icmp eq i32 %27, 0
  br i1 %.not41, label %46, label %28

28:                                               ; preds = %26
  %29 = tail call i32 @feclearexcept(i32 noundef 32) #9
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %2, ptr %4, align 4, !tbaa !291
  %.0..0..0..0.5 = load volatile float, ptr %4, align 4, !tbaa !291
  %30 = fpext float %.0..0..0..0.5 to double
  %31 = fadd double %7, %30
  %32 = tail call i32 @fetestexcept(i32 noundef 32) #9
  %.not42 = icmp eq i32 %32, 0
  %. = select i1 %.not42, i32 32, i32 16
  %33 = tail call i32 @feraiseexcept(i32 noundef %.) #9
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
define hidden float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
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
declare float @llvm.fabs.f32(float) #8

; Function Attrs: inlinehint
define hidden float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #9 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #9
  %10 = load i32, ptr %1, align 4, !tbaa !37
  %11 = add nsw i32 %10, -64
  br label %12

12:                                               ; preds = %7, %5
  %storemerge = phi i32 [ %11, %7 ], [ 0, %5 ]
  %.014 = phi float [ %9, %7 ], [ %0, %5 ]
  store i32 %storemerge, ptr %1, align 4, !tbaa !37
  br label %19

13:                                               ; preds = %2
  %14 = and i32 %4, 255
  %15 = add nsw i32 %14, -126
  store i32 %15, ptr %1, align 4, !tbaa !37
  %16 = and i32 %3, -2139095041
  %17 = or disjoint i32 %16, 1056964608
  %18 = bitcast i32 %17 to float
  br label %19

19:                                               ; preds = %13, %12, %2
  %.0 = phi float [ %18, %13 ], [ %.014, %12 ], [ %0, %2 ]
  ret float %.0
}

; Function Attrs: inlinehint
define hidden float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = tail call float @scalbnf(float noundef %0, i32 noundef %1) #9
  ret float %3
}

; Function Attrs: inlinehint
define hidden float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #9 {
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
declare i32 @llvm.umin.i32(i32, i32) #8

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #8

; Function Attrs: inlinehint
define hidden float @powf(float noundef %0, float noundef %1) local_unnamed_addr #9 {
  %3 = alloca float, align 4
  %4 = bitcast float %0 to i32
  %5 = bitcast float %1 to i32
  %6 = add i32 %4, -2139095040
  %7 = icmp ult i32 %6, -2130706432
  %.pre = shl i32 %5, 1
  %8 = add i32 %.pre, 16777216
  %9 = icmp ult i32 %8, 16777217
  %or.cond99 = or i1 %7, %9
  br i1 %or.cond99, label %.critedge, label %73, !prof !301

.critedge:                                        ; preds = %2
  %10 = add i32 %.pre, -1
  %11 = icmp ult i32 %10, -16777217
  br i1 %11, label %28, label %12, !prof !293

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
  br i1 %31, label %47, label %32, !prof !293

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
  store volatile float %46, ptr %3, align 4, !tbaa !291
  %.0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !291
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
  %61 = tail call float @__math_invalidf(float noundef %0) #9
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
  %82 = load double, ptr %81, align 8, !tbaa !302
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 8
  %84 = load double, ptr %83, align 8, !tbaa !304
  %85 = bitcast i32 %78 to float
  %86 = fpext float %85 to double
  %87 = tail call double @llvm.fmuladd.f64(double %86, double %82, double -1.000000e+00)
  %88 = sitofp i32 %79 to double
  %89 = fadd double %84, %88
  %90 = fmul double %87, %87
  %91 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 256), align 8, !tbaa !300
  %92 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 264), align 8, !tbaa !300
  %93 = tail call double @llvm.fmuladd.f64(double %91, double %87, double %92)
  %94 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 272), align 8, !tbaa !300
  %95 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 280), align 8, !tbaa !300
  %96 = tail call double @llvm.fmuladd.f64(double %94, double %87, double %95)
  %97 = fmul double %90, %90
  %98 = load double, ptr getelementptr inbounds nuw (i8, ptr @__powf_log2_data, i64 288), align 8, !tbaa !300
  %99 = tail call double @llvm.fmuladd.f64(double %98, double %87, double %89)
  %100 = tail call double @llvm.fmuladd.f64(double %96, double %90, double %99)
  %101 = tail call double @llvm.fmuladd.f64(double %93, double %97, double %100)
  %102 = fpext float %1 to double
  %103 = fmul double %101, %102
  %104 = bitcast double %103 to i64
  %105 = and i64 %104, 9223231299366420480
  %106 = icmp samesign ugt i64 %105, 4638426141214900224
  br i1 %106, label %107, label %115, !prof !305

107:                                              ; preds = %73
  %108 = fcmp ogt double %103, 0x405FFFFFFFD1D571
  br i1 %108, label %109, label %111

109:                                              ; preds = %107
  %110 = tail call float @__math_oflowf(i32 noundef %.050) #9
  br label %138

111:                                              ; preds = %107
  %112 = fcmp ugt double %103, -1.500000e+02
  br i1 %112, label %115, label %113

113:                                              ; preds = %111
  %114 = tail call float @__math_uflowf(i32 noundef %.050) #9
  br label %138

115:                                              ; preds = %111, %73
  %116 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 256), align 8, !tbaa !306
  %117 = fadd double %103, %116
  %118 = bitcast double %117 to i64
  %119 = fsub double %117, %116
  %120 = fsub double %103, %119
  %121 = and i64 %118, 31
  %122 = getelementptr inbounds nuw i64, ptr @__exp2f_data, i64 %121
  %123 = load i64, ptr %122, align 8, !tbaa !298
  %124 = zext nneg i32 %.050 to i64
  %125 = add i64 %118, %124
  %126 = shl i64 %125, 47
  %127 = add i64 %126, %123
  %128 = bitcast i64 %127 to double
  %129 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 264), align 8, !tbaa !300
  %130 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 272), align 8, !tbaa !300
  %131 = tail call double @llvm.fmuladd.f64(double %129, double %120, double %130)
  %132 = fmul double %120, %120
  %133 = load double, ptr getelementptr inbounds nuw (i8, ptr @__exp2f_data, i64 280), align 8, !tbaa !300
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
define hidden noundef float @rintf(float noundef %0) local_unnamed_addr #9 {
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
define hidden float @roundf(float noundef %0) local_unnamed_addr #9 {
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
  store volatile float %9, ptr %2, align 4, !tbaa !291
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
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #5 = { uwtable "nonlazybind" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #9 = { inlinehint }

!llvm.dbg.cu = !{!0, !2, !4, !6, !8, !10, !12, !14, !16, !18, !20, !22, !24, !26, !28, !30, !32}
!llvm.module.flags = !{!34, !35, !36}
!llvm.errno.tbaa = !{!37}

!0 = distinct !DICompileUnit(language: DW_LANG_C17, file: !1, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "module_main$async_dispatch_0.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!2 = distinct !DICompileUnit(language: DW_LANG_C17, file: !3, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!3 = !DIFile(filename: "module_main$async_dispatch_1.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!4 = distinct !DICompileUnit(language: DW_LANG_C17, file: !5, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!5 = !DIFile(filename: "module_main$async_dispatch_2.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!6 = distinct !DICompileUnit(language: DW_LANG_C17, file: !7, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!7 = !DIFile(filename: "module_main$async_dispatch_3.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!8 = distinct !DICompileUnit(language: DW_LANG_C17, file: !9, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!9 = !DIFile(filename: "module_main$async_dispatch_4.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!10 = distinct !DICompileUnit(language: DW_LANG_C17, file: !11, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!11 = !DIFile(filename: "module_main$async_dispatch_5.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!12 = distinct !DICompileUnit(language: DW_LANG_C17, file: !13, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!13 = !DIFile(filename: "module_main$async_dispatch_7.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!14 = distinct !DICompileUnit(language: DW_LANG_C17, file: !15, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!15 = !DIFile(filename: "module_main$async_dispatch_8.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!16 = distinct !DICompileUnit(language: DW_LANG_C17, file: !17, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!17 = !DIFile(filename: "module_main$async_dispatch_9.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!18 = distinct !DICompileUnit(language: DW_LANG_C17, file: !19, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!19 = !DIFile(filename: "module_main$async_dispatch_11.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!20 = distinct !DICompileUnit(language: DW_LANG_C17, file: !21, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!21 = !DIFile(filename: "module_main$async_dispatch_12.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!22 = distinct !DICompileUnit(language: DW_LANG_C17, file: !23, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!23 = !DIFile(filename: "module_main$async_dispatch_14.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!24 = distinct !DICompileUnit(language: DW_LANG_C17, file: !25, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!25 = !DIFile(filename: "module_main$async_dispatch_16.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!26 = distinct !DICompileUnit(language: DW_LANG_C17, file: !27, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!27 = !DIFile(filename: "module_main$async_dispatch_17.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!28 = distinct !DICompileUnit(language: DW_LANG_C17, file: !29, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!29 = !DIFile(filename: "module_main$async_dispatch_18.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!30 = distinct !DICompileUnit(language: DW_LANG_C17, file: !31, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!31 = !DIFile(filename: "module_main$async_dispatch_20.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!32 = distinct !DICompileUnit(language: DW_LANG_C17, file: !33, producer: "IREE", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!33 = !DIFile(filename: "module_main$async_dispatch_21.mlir", directory: "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm")
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{!38, !38, i64 0}
!38 = !{!"int", !39, i64 0}
!39 = !{!"omnipotent char", !40, i64 0}
!40 = !{!"Simple C/C++ TBAA"}
!41 = distinct !DISubprogram(name: "main$async_dispatch_0_elementwise_16x2_i64xf32xf32", linkageName: "main$async_dispatch_0_elementwise_16x2_i64xf32xf32", scope: !1, file: !1, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0)
!42 = !DISubroutineType(cc: DW_CC_normal, types: !43)
!43 = !{!44, !45, !76, !105}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_environment_v0_t", baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_environment_v0_t", scope: !49, file: !49, line: 246, size: 768, elements: !50)
!49 = !DIFile(filename: "runtime/src/iree/hal/local/executable_library.h", directory: ".")
!50 = !{!51, !59, !62, !65, !67}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, scope: !49, file: !49, line: 227, baseType: !55, size: 2048, elements: !57)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", baseType: !56)
!56 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!57 = !{!58}
!58 = !DISubrange(count: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "import_thunk", baseType: !60, size: 64, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "void", encoding: DW_ATE_address)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "import_funcs", baseType: !63, size: 64, offset: 128)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !60)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "import_contexts", baseType: !66, size: 64, offset: 192)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "processor", baseType: !68, offset: 256)
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_processor_v0_t", scope: !49, file: !49, line: 227, size: 512, elements: !69)
!69 = !{!70}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "data", baseType: !71)
!71 = !DICompositeType(tag: DW_TAG_array_type, scope: !49, file: !49, line: 227, baseType: !72, size: 512, elements: !74)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", baseType: !73)
!73 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!74 = !{!75}
!75 = !DISubrange(count: 8)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_dispatch_state_v0_t", baseType: !79)
!79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_dispatch_state_v0_t", scope: !49, file: !49, line: 275, size: 384, elements: !80)
!80 = !{!81, !82, !83, !86, !87, !88, !89, !90, !93, !94, !95, !100}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_x", baseType: !55, size: 32)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_y", baseType: !55, size: 32, offset: 32)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_size_z", baseType: !84, size: 16, offset: 64)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", baseType: !85)
!85 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "constant_count", baseType: !84, size: 16, offset: 80)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_x", baseType: !55, size: 32, offset: 96)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_y", baseType: !55, size: 32, offset: 128)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_count_z", baseType: !84, size: 16, offset: 160)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "max_concurrency", baseType: !91, size: 8, offset: 176)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", baseType: !92)
!92 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "binding_count", baseType: !91, size: 8, offset: 184)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "constants", baseType: !52, size: 64, offset: 192)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "binding_ptrs", baseType: !96, size: 64, offset: 256)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !98)
!98 = !DICompositeType(tag: DW_TAG_array_type, scope: !49, file: !49, line: 227, baseType: !99, size: 4096, elements: !57)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "binding_lengths", baseType: !101, size: 64, offset: 320)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !103)
!103 = !DICompositeType(tag: DW_TAG_array_type, scope: !49, file: !49, line: 227, baseType: !104, size: 4096, elements: !57)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", baseType: !72)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "iree_hal_executable_workgroup_state_v0_t", baseType: !108)
!108 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iree_hal_executable_workgroup_state_v0_t", scope: !49, file: !49, line: 321, size: 256, elements: !109)
!109 = !{!110, !111, !112, !113, !114, !115, !116}
!110 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_x", baseType: !55, size: 32)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_y", baseType: !55, size: 32, offset: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "workgroup_id_z", baseType: !84, size: 16, offset: 64)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", baseType: !84, size: 16, offset: 80)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "processor_id", baseType: !55, size: 32, offset: 96)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory", baseType: !60, size: 64, offset: 128)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "local_memory_size", baseType: !55, size: 32, offset: 192)
!117 = !DILocation(line: 11, column: 8, scope: !41)
!118 = !DILocation(line: 12, column: 8, scope: !41)
!119 = !DILocation(line: 13, column: 8, scope: !41)
!120 = !DILocation(line: 14, column: 8, scope: !41)
!121 = !DILocation(line: 19, column: 8, scope: !41)
!122 = !DILocation(line: 23, column: 10, scope: !41)
!123 = !DILocation(line: 24, column: 10, scope: !41)
!124 = !DILocation(line: 28, column: 8, scope: !41)
!125 = distinct !DISubprogram(name: "main$async_dispatch_1_reduction_16x2_f32", linkageName: "main$async_dispatch_1_reduction_16x2_f32", scope: !3, file: !3, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!126 = !DILocation(line: 11, column: 8, scope: !125)
!127 = !DILocation(line: 12, column: 8, scope: !125)
!128 = !DILocation(line: 13, column: 8, scope: !125)
!129 = !DILocation(line: 14, column: 8, scope: !125)
!130 = !DILocation(line: 19, column: 8, scope: !125)
!131 = !DILocation(line: 20, column: 8, scope: !125)
!132 = !DILocation(line: 25, column: 8, scope: !125)
!133 = !DILocation(line: 27, column: 10, scope: !125)
!134 = !DILocation(line: 32, column: 10, scope: !125)
!135 = !DILocation(line: 33, column: 10, scope: !125)
!136 = !DILocation(line: 37, column: 8, scope: !125)
!137 = distinct !DISubprogram(name: "main$async_dispatch_2_reduction_16x2_f32", linkageName: "main$async_dispatch_2_reduction_16x2_f32", scope: !5, file: !5, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4)
!138 = !DILocation(line: 16, column: 8, scope: !137)
!139 = !DILocation(line: 17, column: 8, scope: !137)
!140 = !DILocation(line: 22, column: 8, scope: !137)
!141 = !DILocation(line: 25, column: 10, scope: !137)
!142 = !DILocation(line: 28, column: 8, scope: !137)
!143 = !DILocation(line: 30, column: 10, scope: !137)
!144 = !DILocation(line: 31, column: 10, scope: !137)
!145 = !DILocation(line: 32, column: 10, scope: !137)
!146 = !DILocation(line: 33, column: 10, scope: !137)
!147 = !DILocation(line: 34, column: 10, scope: !137)
!148 = !DILocation(line: 35, column: 10, scope: !137)
!149 = !DILocation(line: 39, column: 8, scope: !137)
!150 = distinct !DISubprogram(name: "main$async_dispatch_3_matmul_16x6x2_f32", linkageName: "main$async_dispatch_3_matmul_16x6x2_f32", scope: !7, file: !7, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6)
!151 = !DILocation(line: 14, column: 8, scope: !150)
!152 = !DILocation(line: 15, column: 8, scope: !150)
!153 = !DILocation(line: 19, column: 8, scope: !150)
!154 = !DILocation(line: 20, column: 8, scope: !150)
!155 = !DILocation(line: 22, column: 10, scope: !150)
!156 = !DILocation(line: 26, column: 8, scope: !150)
!157 = distinct !DISubprogram(name: "main$async_dispatch_4_attention_2x16x16", linkageName: "main$async_dispatch_4_attention_2x16x16", scope: !9, file: !9, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8)
!158 = !DILocation(line: 13, column: 8, scope: !157)
!159 = !DILocation(line: 14, column: 8, scope: !157)
!160 = !DILocation(line: 15, column: 8, scope: !157)
!161 = !DILocation(line: 21, column: 8, scope: !157)
!162 = !DILocation(line: 26, column: 8, scope: !157)
!163 = distinct !DISubprogram(name: "main$async_dispatch_5_matmul_16x2x2_f32", linkageName: "main$async_dispatch_5_matmul_16x2x2_f32", scope: !11, file: !11, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10)
!164 = !DILocation(line: 15, column: 8, scope: !163)
!165 = !DILocation(line: 16, column: 8, scope: !163)
!166 = !DILocation(line: 17, column: 8, scope: !163)
!167 = !DILocation(line: 22, column: 8, scope: !163)
!168 = !DILocation(line: 23, column: 8, scope: !163)
!169 = !DILocation(line: 26, column: 10, scope: !163)
!170 = !DILocation(line: 30, column: 8, scope: !163)
!171 = distinct !DISubprogram(name: "main$async_dispatch_7_reduction_16x2_f32", linkageName: "main$async_dispatch_7_reduction_16x2_f32", scope: !13, file: !13, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !12)
!172 = !DILocation(line: 16, column: 8, scope: !171)
!173 = !DILocation(line: 17, column: 8, scope: !171)
!174 = !DILocation(line: 22, column: 8, scope: !171)
!175 = !DILocation(line: 25, column: 10, scope: !171)
!176 = !DILocation(line: 28, column: 8, scope: !171)
!177 = !DILocation(line: 30, column: 10, scope: !171)
!178 = !DILocation(line: 31, column: 10, scope: !171)
!179 = !DILocation(line: 32, column: 10, scope: !171)
!180 = !DILocation(line: 33, column: 10, scope: !171)
!181 = !DILocation(line: 34, column: 10, scope: !171)
!182 = !DILocation(line: 35, column: 10, scope: !171)
!183 = !DILocation(line: 39, column: 8, scope: !171)
!184 = distinct !DISubprogram(name: "main$async_dispatch_8_matmul_16x8x2_f32", linkageName: "main$async_dispatch_8_matmul_16x8x2_f32", scope: !15, file: !15, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14)
!185 = !DILocation(line: 19, column: 8, scope: !184)
!186 = !DILocation(line: 20, column: 8, scope: !184)
!187 = !DILocation(line: 24, column: 8, scope: !184)
!188 = !DILocation(line: 25, column: 8, scope: !184)
!189 = !DILocation(line: 35, column: 10, scope: !184)
!190 = !DILocation(line: 28, column: 10, scope: !184)
!191 = !DILocation(line: 29, column: 10, scope: !184)
!192 = !DILocation(line: 30, column: 10, scope: !184)
!193 = !DILocation(line: 31, column: 10, scope: !184)
!194 = !DILocation(line: 32, column: 10, scope: !184)
!195 = !DILocation(line: 33, column: 10, scope: !184)
!196 = !DILocation(line: 34, column: 10, scope: !184)
!197 = !DILocation(line: 39, column: 8, scope: !184)
!198 = distinct !DISubprogram(name: "main$async_dispatch_9_matmul_16x2x8_f32", linkageName: "main$async_dispatch_9_matmul_16x2x8_f32", scope: !17, file: !17, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !16)
!199 = !DILocation(line: 15, column: 8, scope: !198)
!200 = !DILocation(line: 16, column: 8, scope: !198)
!201 = !DILocation(line: 17, column: 8, scope: !198)
!202 = !DILocation(line: 22, column: 8, scope: !198)
!203 = !DILocation(line: 23, column: 8, scope: !198)
!204 = !DILocation(line: 26, column: 10, scope: !198)
!205 = !DILocation(line: 30, column: 8, scope: !198)
!206 = distinct !DISubprogram(name: "main$async_dispatch_11_reduction_16x2_f32", linkageName: "main$async_dispatch_11_reduction_16x2_f32", scope: !19, file: !19, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18)
!207 = !DILocation(line: 16, column: 8, scope: !206)
!208 = !DILocation(line: 17, column: 8, scope: !206)
!209 = !DILocation(line: 22, column: 8, scope: !206)
!210 = !DILocation(line: 25, column: 10, scope: !206)
!211 = !DILocation(line: 28, column: 8, scope: !206)
!212 = !DILocation(line: 30, column: 10, scope: !206)
!213 = !DILocation(line: 31, column: 10, scope: !206)
!214 = !DILocation(line: 32, column: 10, scope: !206)
!215 = !DILocation(line: 33, column: 10, scope: !206)
!216 = !DILocation(line: 34, column: 10, scope: !206)
!217 = !DILocation(line: 35, column: 10, scope: !206)
!218 = !DILocation(line: 39, column: 8, scope: !206)
!219 = distinct !DISubprogram(name: "main$async_dispatch_12_matmul_16x6x2_f32", linkageName: "main$async_dispatch_12_matmul_16x6x2_f32", scope: !21, file: !21, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20)
!220 = !DILocation(line: 14, column: 8, scope: !219)
!221 = !DILocation(line: 15, column: 8, scope: !219)
!222 = !DILocation(line: 19, column: 8, scope: !219)
!223 = !DILocation(line: 20, column: 8, scope: !219)
!224 = !DILocation(line: 22, column: 10, scope: !219)
!225 = !DILocation(line: 26, column: 8, scope: !219)
!226 = distinct !DISubprogram(name: "main$async_dispatch_14_matmul_16x2x2_f32", linkageName: "main$async_dispatch_14_matmul_16x2x2_f32", scope: !23, file: !23, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22)
!227 = !DILocation(line: 15, column: 8, scope: !226)
!228 = !DILocation(line: 16, column: 8, scope: !226)
!229 = !DILocation(line: 17, column: 8, scope: !226)
!230 = !DILocation(line: 22, column: 8, scope: !226)
!231 = !DILocation(line: 23, column: 8, scope: !226)
!232 = !DILocation(line: 26, column: 10, scope: !226)
!233 = !DILocation(line: 30, column: 8, scope: !226)
!234 = distinct !DISubprogram(name: "main$async_dispatch_16_reduction_16x2_f32", linkageName: "main$async_dispatch_16_reduction_16x2_f32", scope: !25, file: !25, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !24)
!235 = !DILocation(line: 16, column: 8, scope: !234)
!236 = !DILocation(line: 17, column: 8, scope: !234)
!237 = !DILocation(line: 22, column: 8, scope: !234)
!238 = !DILocation(line: 25, column: 10, scope: !234)
!239 = !DILocation(line: 28, column: 8, scope: !234)
!240 = !DILocation(line: 30, column: 10, scope: !234)
!241 = !DILocation(line: 31, column: 10, scope: !234)
!242 = !DILocation(line: 32, column: 10, scope: !234)
!243 = !DILocation(line: 33, column: 10, scope: !234)
!244 = !DILocation(line: 34, column: 10, scope: !234)
!245 = !DILocation(line: 35, column: 10, scope: !234)
!246 = !DILocation(line: 39, column: 8, scope: !234)
!247 = distinct !DISubprogram(name: "main$async_dispatch_17_matmul_16x8x2_f32", linkageName: "main$async_dispatch_17_matmul_16x8x2_f32", scope: !27, file: !27, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !26)
!248 = !DILocation(line: 19, column: 8, scope: !247)
!249 = !DILocation(line: 20, column: 8, scope: !247)
!250 = !DILocation(line: 24, column: 8, scope: !247)
!251 = !DILocation(line: 25, column: 8, scope: !247)
!252 = !DILocation(line: 35, column: 10, scope: !247)
!253 = !DILocation(line: 28, column: 10, scope: !247)
!254 = !DILocation(line: 29, column: 10, scope: !247)
!255 = !DILocation(line: 30, column: 10, scope: !247)
!256 = !DILocation(line: 31, column: 10, scope: !247)
!257 = !DILocation(line: 32, column: 10, scope: !247)
!258 = !DILocation(line: 33, column: 10, scope: !247)
!259 = !DILocation(line: 34, column: 10, scope: !247)
!260 = !DILocation(line: 39, column: 8, scope: !247)
!261 = distinct !DISubprogram(name: "main$async_dispatch_18_matmul_16x2x8_f32", linkageName: "main$async_dispatch_18_matmul_16x2x8_f32", scope: !29, file: !29, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !28)
!262 = !DILocation(line: 15, column: 8, scope: !261)
!263 = !DILocation(line: 16, column: 8, scope: !261)
!264 = !DILocation(line: 17, column: 8, scope: !261)
!265 = !DILocation(line: 22, column: 8, scope: !261)
!266 = !DILocation(line: 23, column: 8, scope: !261)
!267 = !DILocation(line: 26, column: 10, scope: !261)
!268 = !DILocation(line: 30, column: 8, scope: !261)
!269 = distinct !DISubprogram(name: "main$async_dispatch_20_reduction_16x2_f32", linkageName: "main$async_dispatch_20_reduction_16x2_f32", scope: !31, file: !31, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !30)
!270 = !DILocation(line: 16, column: 8, scope: !269)
!271 = !DILocation(line: 17, column: 8, scope: !269)
!272 = !DILocation(line: 22, column: 8, scope: !269)
!273 = !DILocation(line: 25, column: 10, scope: !269)
!274 = !DILocation(line: 28, column: 8, scope: !269)
!275 = !DILocation(line: 30, column: 10, scope: !269)
!276 = !DILocation(line: 31, column: 10, scope: !269)
!277 = !DILocation(line: 32, column: 10, scope: !269)
!278 = !DILocation(line: 33, column: 10, scope: !269)
!279 = !DILocation(line: 34, column: 10, scope: !269)
!280 = !DILocation(line: 35, column: 10, scope: !269)
!281 = !DILocation(line: 39, column: 8, scope: !269)
!282 = distinct !DISubprogram(name: "main$async_dispatch_21_batch_matmul_1x16x50257x2_f32", linkageName: "main$async_dispatch_21_batch_matmul_1x16x50257x2_f32", scope: !33, file: !33, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32)
!283 = !DILocation(line: 12, column: 8, scope: !282)
!284 = !DILocation(line: 13, column: 8, scope: !282)
!285 = !DILocation(line: 14, column: 8, scope: !282)
!286 = !DILocation(line: 19, column: 8, scope: !282)
!287 = !DILocation(line: 9, column: 8, scope: !282)
!288 = !DILocation(line: 21, column: 8, scope: !282)
!289 = !{!290, !290, i64 0}
!290 = !{!"short", !39, i64 0}
!291 = !{!292, !292, i64 0}
!292 = !{!"float", !39, i64 0}
!293 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!294 = !{!295, !296, i64 296}
!295 = !{!"exp2f_data", !39, i64 0, !296, i64 256, !39, i64 264, !296, i64 288, !296, i64 296, !39, i64 304}
!296 = !{!"double", !39, i64 0}
!297 = !{!295, !296, i64 288}
!298 = !{!299, !299, i64 0}
!299 = !{!"long", !39, i64 0}
!300 = !{!296, !296, i64 0}
!301 = !{!"branch_weights", i32 4001, i32 4000000}
!302 = !{!303, !296, i64 0}
!303 = !{!"", !296, i64 0, !296, i64 8}
!304 = !{!303, !296, i64 8}
!305 = !{!"branch_weights", !"expected", i32 1, i32 2000}
!306 = !{!295, !296, i64 256}
