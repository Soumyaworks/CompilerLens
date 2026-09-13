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

@0 = internal constant [14 x i8] c"module_linked\00", align 1
@iree_hal_executable_library_query_v0_header = internal constant %iree_hal_executable_library_header_t { i32 6, ptr @0, i32 0, i32 0 }
@iree_hal_executable_library_query_v0_funcs = internal constant [17 x ptr] [ptr @"main$async_dispatch_0_elementwise_16x2_i64xf32xf32", ptr @"main$async_dispatch_1_reduction_16x2_f32", ptr @"main$async_dispatch_2_reduction_16x2_f32", ptr @"main$async_dispatch_3_matmul_16x6x2_f32", ptr @"main$async_dispatch_4_attention_2x16x16", ptr @"main$async_dispatch_5_matmul_16x2x2_f32", ptr @"main$async_dispatch_7_reduction_16x2_f32", ptr @"main$async_dispatch_8_matmul_16x8x2_f32", ptr @"main$async_dispatch_9_matmul_16x2x8_f32", ptr @"main$async_dispatch_11_reduction_16x2_f32", ptr @"main$async_dispatch_12_matmul_16x6x2_f32", ptr @"main$async_dispatch_14_matmul_16x2x2_f32", ptr @"main$async_dispatch_16_reduction_16x2_f32", ptr @"main$async_dispatch_17_matmul_16x8x2_f32", ptr @"main$async_dispatch_18_matmul_16x2x8_f32", ptr @"main$async_dispatch_20_reduction_16x2_f32", ptr @"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"]
@iree_hal_executable_library_query_v0_attrs = internal constant [17 x %iree_hal_executable_dispatch_attrs_v0_t] [%iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 2, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 2, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }, %iree_hal_executable_dispatch_attrs_v0_t { i64 0, i16 0, i8 0, i8 3, i32 1, i32 1, i16 1, i16 0, i64 0, i64 0, i64 0, i64 0, i64 0 }]
@1 = internal constant [51 x i8] c"main$async_dispatch_0_elementwise_16x2_i64xf32xf32\00", align 1
@2 = internal constant [41 x i8] c"main$async_dispatch_1_reduction_16x2_f32\00", align 1
@3 = internal constant [41 x i8] c"main$async_dispatch_2_reduction_16x2_f32\00", align 1
@4 = internal constant [40 x i8] c"main$async_dispatch_3_matmul_16x6x2_f32\00", align 1
@5 = internal constant [40 x i8] c"main$async_dispatch_4_attention_2x16x16\00", align 1
@6 = internal constant [40 x i8] c"main$async_dispatch_5_matmul_16x2x2_f32\00", align 1
@7 = internal constant [41 x i8] c"main$async_dispatch_7_reduction_16x2_f32\00", align 1
@8 = internal constant [40 x i8] c"main$async_dispatch_8_matmul_16x8x2_f32\00", align 1
@9 = internal constant [40 x i8] c"main$async_dispatch_9_matmul_16x2x8_f32\00", align 1
@10 = internal constant [42 x i8] c"main$async_dispatch_11_reduction_16x2_f32\00", align 1
@11 = internal constant [41 x i8] c"main$async_dispatch_12_matmul_16x6x2_f32\00", align 1
@12 = internal constant [41 x i8] c"main$async_dispatch_14_matmul_16x2x2_f32\00", align 1
@13 = internal constant [42 x i8] c"main$async_dispatch_16_reduction_16x2_f32\00", align 1
@14 = internal constant [41 x i8] c"main$async_dispatch_17_matmul_16x8x2_f32\00", align 1
@15 = internal constant [41 x i8] c"main$async_dispatch_18_matmul_16x2x8_f32\00", align 1
@16 = internal constant [42 x i8] c"main$async_dispatch_20_reduction_16x2_f32\00", align 1
@17 = internal constant [53 x i8] c"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32\00", align 1
@iree_hal_executable_library_query_v0_names = internal constant [17 x ptr] [ptr @1, ptr @2, ptr @3, ptr @4, ptr @5, ptr @6, ptr @7, ptr @8, ptr @9, ptr @10, ptr @11, ptr @12, ptr @13, ptr @14, ptr @15, ptr @16, ptr @17]
@18 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_0.mlir\00", align 1
@19 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_1.mlir\00", align 1
@20 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_2.mlir\00", align 1
@21 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_3.mlir\00", align 1
@22 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_4.mlir\00", align 1
@23 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_5.mlir\00", align 1
@24 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_7.mlir\00", align 1
@25 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_8.mlir\00", align 1
@26 = internal constant [112 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_9.mlir\00", align 1
@27 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_11.mlir\00", align 1
@28 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_12.mlir\00", align 1
@29 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_14.mlir\00", align 1
@30 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_16.mlir\00", align 1
@31 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_17.mlir\00", align 1
@32 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_18.mlir\00", align 1
@33 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_20.mlir\00", align 1
@34 = internal constant [113 x i8] c"/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/llvm/module_main$async_dispatch_21.mlir\00", align 1
@iree_hal_executable_library_query_v0_source_locations = internal constant [17 x %iree_hal_executable_source_location_v0_t] [%iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @18 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @19 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @20 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @21 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @22 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @23 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @24 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @25 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 111, ptr @26 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @27 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @28 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @29 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @30 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @31 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @32 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @33 }, %iree_hal_executable_source_location_v0_t { i32 3, i32 112, ptr @34 }]
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names" = internal constant [0 x ptr] zeroinitializer
@"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations" = internal constant [0 x %iree_hal_executable_source_location_v0_t] zeroinitializer
@iree_hal_executable_library_query_v0_stage_location_tables = internal constant [17 x %iree_hal_executable_stage_location_table_v0_t] [%iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_0_elementwise_16x2_i64xf32xf32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_1_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_2_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_3_matmul_16x6x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_4_attention_2x16x16_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_5_matmul_16x2x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_7_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_8_matmul_16x8x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_9_matmul_16x2x8_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_11_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_12_matmul_16x6x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_14_matmul_16x2x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_16_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_17_matmul_16x8x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_18_matmul_16x2x8_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_20_reduction_16x2_f32_stage_source_locations" }, %iree_hal_executable_stage_location_table_v0_t { i32 0, ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_names", ptr @"iree_hal_executable_library_query_v0_main$async_dispatch_21_batch_matmul_1x16x50257x2_f32_stage_source_locations" }]
@iree_hal_executable_library_query_v0 = internal constant %iree_hal_executable_library_v0_t { ptr @iree_hal_executable_library_query_v0_header, %iree_hal_executable_import_table_v0_t zeroinitializer, %iree_hal_executable_export_table_v0_t { i32 17, ptr @iree_hal_executable_library_query_v0_funcs, ptr @iree_hal_executable_library_query_v0_attrs, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_names, ptr null, ptr null, ptr @iree_hal_executable_library_query_v0_source_locations, ptr @iree_hal_executable_library_query_v0_stage_location_tables }, %iree_hal_executable_constant_table_v0_t zeroinitializer, %iree_hal_executable_source_file_table_v0_t zeroinitializer }
@__exp2f_data = internal local_unnamed_addr constant %struct.exp2f_data { [32 x i64] [i64 4607182418800017408, i64 4607140297302181236, i64 4607100335213349135, i64 4607062579818421073, i64 4607027079437701499, i64 4606993883449571754, i64 4606963042313658936, i64 4606934607594512097, i64 4606908631985796885, i64 4606885169335019979, i64 4606864274668794914, i64 4606846004218661165, i64 4606830415447468583, i64 4606817567076339586, i64 4606807519112221737, i64 4606800332876043653, i64 4606796071031487437, i64 4606794797614391156, i64 4606796578062795143, i64 4606801479247646227, i64 4606809569504174299, i64 4606820918663955941, i64 4606835598087680144, i64 4606853680698631517, i64 4606875241016906669, i64 4606900355194379847, i64 4606929101050434204, i64 4606961558108475497, i64 4606997807633245319, i64 4607037932668951391, i64 4607082018078232794, i64 4607130150581978432], double 0x42E8000000000000, [3 x double] [double 0x3FAC6AF84B912394, double 0x3FCEBFCE50FAC4F3, double 0x3FE62E42FF0C52D6], double 0x4338000000000000, double 0x40471547652B82FE, [3 x double] [double 0x3EBC6AF84B912394, double 0x3F2EBFCE50FAC4F3, double 0x3F962E42FF0C52D6] }, align 8
@__powf_log2_data = internal local_unnamed_addr constant %struct.powf_log2_data { [16 x %struct.anon] [%struct.anon { double 0x3FF661EC79F8F3BE, double 0xBFDEFEC65B963019 }, %struct.anon { double 0x3FF571ED4AAF883D, double 0xBFDB0B6832D4FCA4 }, %struct.anon { double 0x3FF49539F0F010B0, double 0xBFD7418B0A1FB77B }, %struct.anon { double 0x3FF3C995B0B80385, double 0xBFD39DE91A6DCF7B }, %struct.anon { double 0x3FF30D190C8864A5, double 0xBFD01D9BF3F2B631 }, %struct.anon { double 0x3FF25E227B0B8EA0, double 0xBFC97C1D1B3B7AF0 }, %struct.anon { double 0x3FF1BB4A4A1A343F, double 0xBFC2F9E393AF3C9F }, %struct.anon { double 0x3FF12358F08AE5BA, double 0xBFB960CBBF788D5C }, %struct.anon { double 0x3FF0953F419900A7, double 0xBFAA6F9DB6475FCE }, %struct.anon { double 1.000000e+00, double 0.000000e+00 }, %struct.anon { double 0x3FEE608CFD9A47AC, double 0x3FB338CA9F24F53D }, %struct.anon { double 0x3FECA4B31F026AA0, double 0x3FC476A9543891BA }, %struct.anon { double 0x3FEB2036576AFCE6, double 0x3FCE840B4AC4E4D2 }, %struct.anon { double 0x3FE9C2D163A1AA2D, double 0x3FD40645F0C6651C }, %struct.anon { double 0x3FE886E6037841ED, double 0x3FD88E9C2C1B9FF8 }, %struct.anon { double 0x3FE767DCF5534862, double 0x3FDCE0A44EB17BCC }], [5 x double] [double 0x3FD27616C9496E0B, double 0xBFD71969A075C67A, double 0x3FDEC70A6CA7BADD, double 0xBFE7154748BEF6C8, double 0x3FF71547652AB82B] }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_0_elementwise_16x2_i64xf32xf32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias nonnull readnone align 16 captures(none) %2) #0 !dbg !41 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !117
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !117
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !117
  %5 = getelementptr i8, ptr %4, i64 402240, !dbg !117
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !117
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !118
  %7 = load ptr, ptr %6, align 8, !dbg !118
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !118
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !119
  %8 = getelementptr i8, ptr %.unpack20, i64 16, !dbg !120
  %9 = load ptr, ptr %8, align 8, !dbg !120
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 64) ], !dbg !120
  br label %10, !dbg !121

10:                                               ; preds = %3, %10
  %11 = phi i64 [ 0, %3 ], [ %30, %10 ]
  %12 = getelementptr [8 x i8], ptr %7, i64 %11, !dbg !121
  %13 = load <1 x i64>, ptr %12, align 8, !dbg !121
  %14 = shl nuw nsw i64 %11, 1, !dbg !121
  %15 = getelementptr [4 x i8], ptr %4, i64 %14, !dbg !121
  %16 = load <2 x float>, ptr %15, align 8, !dbg !121
  %17 = extractelement <1 x i64> %13, i64 0, !dbg !122
  %18 = shl i64 %17, 1, !dbg !122
  %19 = getelementptr [4 x i8], ptr %5, i64 %18, !dbg !122
  %20 = load <1 x float>, ptr %19, align 8, !dbg !122
  %21 = or disjoint i64 %18, 1, !dbg !122
  %22 = sdiv i64 %21, 2, !dbg !122
  %.lobit = ashr i64 %18, 63, !dbg !122
  %23 = add nsw i64 %22, %.lobit, !dbg !122
  %.idx = shl i64 %23, 3, !dbg !122
  %24 = getelementptr i8, ptr %5, i64 %.idx, !dbg !122
  %25 = getelementptr i8, ptr %24, i64 4, !dbg !122
  %26 = load <1 x float>, ptr %25, align 4, !dbg !122
  %27 = shufflevector <1 x float> %20, <1 x float> %26, <2 x i32> <i32 0, i32 1>, !dbg !123
  %28 = fadd contract <2 x float> %16, %27, !dbg !123
  %29 = getelementptr [4 x i8], ptr %9, i64 %14, !dbg !121
  store <2 x float> %28, ptr %29, align 8, !dbg !121
  %30 = add nuw nsw i64 %11, 1, !dbg !121
  %exitcond.not = icmp eq i64 %30, 16, !dbg !121
  br i1 %exitcond.not, label %31, label %10, !dbg !121

31:                                               ; preds = %10
  ret i32 0, !dbg !124
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_1_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !125 {
  %.elt17 = getelementptr inbounds nuw i8, ptr %1, i64 24, !dbg !126
  %.unpack18 = load ptr, ptr %.elt17, align 8, !dbg !126
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !126
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !126
  %4 = load i32, ptr %.unpack18, align 4, !dbg !126
  %5 = getelementptr i8, ptr %.unpack18, i64 4, !dbg !127
  %6 = load i32, ptr %5, align 4, !dbg !127
  %7 = load ptr, ptr %.unpack20, align 8, !dbg !128
  %8 = lshr i32 %4, 2, !dbg !128
  %9 = zext nneg i32 %8 to i64, !dbg !128
  %10 = getelementptr [4 x i8], ptr %7, i64 %9, !dbg !128
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ], !dbg !128
  %11 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !129
  %12 = load ptr, ptr %11, align 8, !dbg !129
  %13 = lshr i32 %6, 2, !dbg !129
  %14 = zext nneg i32 %13 to i64, !dbg !129
  %15 = getelementptr [4 x i8], ptr %12, i64 %14, !dbg !129
  call void @llvm.assume(i1 true) [ "align"(ptr %15, i64 64) ], !dbg !129
  %16 = load i32, ptr %2, align 16, !dbg !130
  %17 = zext i32 %16 to i64, !dbg !130
  %18 = shl nuw nsw i64 %17, 2, !dbg !130
  %19 = getelementptr [4 x i8], ptr %10, i64 %18, !dbg !130
  %20 = load <2 x float>, ptr %19, align 16, !dbg !130
  %21 = or disjoint i64 %18, 2, !dbg !130
  %22 = getelementptr [4 x i8], ptr %10, i64 %21, !dbg !130
  %23 = load <2 x float>, ptr %22, align 8, !dbg !130
  %24 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %20), !dbg !131
  %25 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %23), !dbg !131
  %26 = insertelement <2 x float> poison, float %24, i64 0, !dbg !131
  %27 = insertelement <2 x float> %26, float %25, i64 1, !dbg !131
  %28 = fmul <2 x float> %27, splat (float 5.000000e-01), !dbg !132
  %29 = shufflevector <2 x float> %28, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !132
  %30 = shufflevector <2 x float> %28, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !132
  %31 = fsub contract <2 x float> %20, %29, !dbg !133
  %32 = fsub contract <2 x float> %23, %30, !dbg !133
  %33 = getelementptr [4 x i8], ptr %15, i64 %18, !dbg !133
  store <2 x float> %31, ptr %33, align 16, !dbg !133
  %34 = getelementptr [4 x i8], ptr %15, i64 %21, !dbg !133
  store <2 x float> %32, ptr %34, align 8, !dbg !133
  ret i32 0, !dbg !134
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_2_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !135 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !136
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !136
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !136
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !136
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !136
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !137
  %7 = load ptr, ptr %6, align 8, !dbg !137
  %8 = getelementptr i8, ptr %7, i64 256, !dbg !137
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !137
  %9 = load i32, ptr %2, align 16, !dbg !138
  %10 = zext i32 %9 to i64, !dbg !138
  %11 = shl nuw nsw i64 %10, 2, !dbg !138
  %12 = getelementptr [4 x i8], ptr %5, i64 %11, !dbg !138
  %13 = load <2 x float>, ptr %12, align 16, !dbg !138
  %14 = or disjoint i64 %11, 2, !dbg !138
  %15 = getelementptr [4 x i8], ptr %5, i64 %14, !dbg !138
  %16 = load <2 x float>, ptr %15, align 8, !dbg !138
  %17 = fmul contract <2 x float> %13, %13, !dbg !139
  %18 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %17), !dbg !139
  %19 = fmul contract <2 x float> %16, %16, !dbg !139
  %20 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %19), !dbg !139
  %21 = insertelement <2 x float> poison, float %18, i64 0, !dbg !139
  %22 = insertelement <2 x float> %21, float %20, i64 1, !dbg !139
  %23 = fmul <2 x float> %22, splat (float 5.000000e-01), !dbg !140
  %24 = fadd contract <2 x float> %23, splat (float 0x3EE4F8B580000000), !dbg !141
  %25 = tail call <2 x float> @llvm.sqrt.v2f32(<2 x float> %24), !dbg !142
  %26 = fdiv <2 x float> splat (float 1.000000e+00), %25, !dbg !142
  %27 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !142
  %28 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !142
  %29 = fmul contract <2 x float> %13, %27, !dbg !143
  %30 = fmul contract <2 x float> %16, %28, !dbg !143
  %31 = fadd contract <2 x float> %29, zeroinitializer, !dbg !144
  %32 = fadd contract <2 x float> %30, zeroinitializer, !dbg !144
  %33 = getelementptr [4 x i8], ptr %8, i64 %11, !dbg !144
  store <2 x float> %31, ptr %33, align 16, !dbg !144
  %34 = getelementptr [4 x i8], ptr %8, i64 %14, !dbg !144
  store <2 x float> %32, ptr %34, align 8, !dbg !144
  ret i32 0, !dbg !145
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_3_matmul_16x6x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !146 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !147
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !147
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !147
  %5 = getelementptr i8, ptr %4, i64 256, !dbg !147
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !147
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !148
  %7 = load ptr, ptr %6, align 8, !dbg !148
  %8 = getelementptr i8, ptr %7, i64 384, !dbg !148
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !148
  %9 = load i32, ptr %2, align 16, !dbg !149
  %10 = zext i32 %9 to i64, !dbg !149
  %11 = shl nuw nsw i64 %10, 3, !dbg !149
  %.idx30 = shl nuw nsw i64 %10, 6
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx30
  %13 = load float, ptr %12, align 64
  %14 = insertelement <6 x float> poison, float %13, i64 0
  %15 = shufflevector <6 x float> %14, <6 x float> poison, <6 x i32> zeroinitializer
  %16 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %15, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %17 = or disjoint i64 %11, 1, !dbg !150
  %.idx31 = shl nuw nsw i64 %17, 3
  %18 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx31
  %19 = load float, ptr %18, align 8
  %20 = insertelement <6 x float> poison, float %19, i64 0
  %21 = shufflevector <6 x float> %20, <6 x float> poison, <6 x i32> zeroinitializer
  %22 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %21, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %23 = or disjoint i64 %11, 2, !dbg !150
  %.idx32 = shl nuw nsw i64 %23, 3
  %24 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx32
  %25 = load float, ptr %24, align 16
  %26 = insertelement <6 x float> poison, float %25, i64 0
  %27 = shufflevector <6 x float> %26, <6 x float> poison, <6 x i32> zeroinitializer
  %28 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %27, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %29 = or disjoint i64 %11, 3, !dbg !150
  %.idx33 = shl nuw nsw i64 %29, 3
  %30 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx33
  %31 = load float, ptr %30, align 8
  %32 = insertelement <6 x float> poison, float %31, i64 0
  %33 = shufflevector <6 x float> %32, <6 x float> poison, <6 x i32> zeroinitializer
  %34 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %33, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %35 = or disjoint i64 %11, 4, !dbg !150
  %.idx34 = shl nuw nsw i64 %35, 3
  %36 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx34
  %37 = load float, ptr %36, align 32
  %38 = insertelement <6 x float> poison, float %37, i64 0
  %39 = shufflevector <6 x float> %38, <6 x float> poison, <6 x i32> zeroinitializer
  %40 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %39, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %41 = or disjoint i64 %11, 5, !dbg !150
  %.idx35 = shl nuw nsw i64 %41, 3
  %42 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx35
  %43 = load float, ptr %42, align 8
  %44 = insertelement <6 x float> poison, float %43, i64 0
  %45 = shufflevector <6 x float> %44, <6 x float> poison, <6 x i32> zeroinitializer
  %46 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %45, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %47 = or disjoint i64 %11, 6, !dbg !150
  %.idx36 = shl nuw nsw i64 %47, 3
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx36
  %49 = load float, ptr %48, align 16
  %50 = insertelement <6 x float> poison, float %49, i64 0
  %51 = shufflevector <6 x float> %50, <6 x float> poison, <6 x i32> zeroinitializer
  %52 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %51, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %53 = or disjoint i64 %11, 7, !dbg !150
  %.idx37 = shl nuw nsw i64 %53, 3
  %54 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx37
  %55 = load float, ptr %54, align 8
  %56 = insertelement <6 x float> poison, float %55, i64 0
  %57 = shufflevector <6 x float> %56, <6 x float> poison, <6 x i32> zeroinitializer
  %58 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %57, <6 x float> <float 0xBF97E09660000000, float 0xBF9921A700000000, float 0xBF7EF165C0000000, float 0xBF7F2DAAC0000000, float 0xBF988AABE0000000, float 0xBF957BAE40000000>, <6 x float> zeroinitializer)
  %59 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %60 = load float, ptr %59, align 4
  %61 = insertelement <6 x float> poison, float %60, i64 0
  %62 = shufflevector <6 x float> %61, <6 x float> poison, <6 x i32> zeroinitializer
  %63 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %62, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %16)
  %64 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %65 = load float, ptr %64, align 4
  %66 = insertelement <6 x float> poison, float %65, i64 0
  %67 = shufflevector <6 x float> %66, <6 x float> poison, <6 x i32> zeroinitializer
  %68 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %67, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %22)
  %69 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %70 = load float, ptr %69, align 4
  %71 = insertelement <6 x float> poison, float %70, i64 0
  %72 = shufflevector <6 x float> %71, <6 x float> poison, <6 x i32> zeroinitializer
  %73 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %72, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %28)
  %74 = getelementptr inbounds nuw i8, ptr %30, i64 4
  %75 = load float, ptr %74, align 4
  %76 = insertelement <6 x float> poison, float %75, i64 0
  %77 = shufflevector <6 x float> %76, <6 x float> poison, <6 x i32> zeroinitializer
  %78 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %77, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %34)
  %79 = getelementptr inbounds nuw i8, ptr %36, i64 4
  %80 = load float, ptr %79, align 4
  %81 = insertelement <6 x float> poison, float %80, i64 0
  %82 = shufflevector <6 x float> %81, <6 x float> poison, <6 x i32> zeroinitializer
  %83 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %82, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %40)
  %84 = getelementptr inbounds nuw i8, ptr %42, i64 4
  %85 = load float, ptr %84, align 4
  %86 = insertelement <6 x float> poison, float %85, i64 0
  %87 = shufflevector <6 x float> %86, <6 x float> poison, <6 x i32> zeroinitializer
  %88 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %87, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %46)
  %89 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %90 = load float, ptr %89, align 4
  %91 = insertelement <6 x float> poison, float %90, i64 0
  %92 = shufflevector <6 x float> %91, <6 x float> poison, <6 x i32> zeroinitializer
  %93 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %92, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %52)
  %94 = getelementptr inbounds nuw i8, ptr %54, i64 4
  %95 = load float, ptr %94, align 4
  %96 = insertelement <6 x float> poison, float %95, i64 0
  %97 = shufflevector <6 x float> %96, <6 x float> poison, <6 x i32> zeroinitializer
  %98 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %97, <6 x float> <float 0xBF721AFAA0000000, float 0x3F8AD7B960000000, float 0xBF8ED094A0000000, float 0xBF52B2D160000000, float 0x3FA3A34A20000000, float 0xBF912E2820000000>, <6 x float> %58)
  %.idx = mul nuw nsw i64 %10, 192, !dbg !150
  %99 = getelementptr i8, ptr %8, i64 %.idx, !dbg !150
  store <6 x float> %63, ptr %99, align 64, !dbg !150
  %.idx23 = mul nuw nsw i64 %17, 24, !dbg !150
  %100 = getelementptr i8, ptr %8, i64 %.idx23, !dbg !150
  store <6 x float> %68, ptr %100, align 8, !dbg !150
  %.idx24 = mul nuw nsw i64 %23, 24, !dbg !150
  %101 = getelementptr i8, ptr %8, i64 %.idx24, !dbg !150
  store <6 x float> %73, ptr %101, align 16, !dbg !150
  %.idx25 = mul nuw nsw i64 %29, 24, !dbg !150
  %102 = getelementptr i8, ptr %8, i64 %.idx25, !dbg !150
  store <6 x float> %78, ptr %102, align 8, !dbg !150
  %.idx26 = mul nuw nsw i64 %35, 24, !dbg !150
  %103 = getelementptr i8, ptr %8, i64 %.idx26, !dbg !150
  store <6 x float> %83, ptr %103, align 32, !dbg !150
  %.idx27 = mul nuw nsw i64 %41, 24, !dbg !150
  %104 = getelementptr i8, ptr %8, i64 %.idx27, !dbg !150
  store <6 x float> %88, ptr %104, align 8, !dbg !150
  %.idx28 = mul nuw nsw i64 %47, 24, !dbg !150
  %105 = getelementptr i8, ptr %8, i64 %.idx28, !dbg !150
  store <6 x float> %93, ptr %105, align 16, !dbg !150
  %.idx29 = mul nuw nsw i64 %53, 24, !dbg !150
  %106 = getelementptr i8, ptr %8, i64 %.idx29, !dbg !150
  store <6 x float> %98, ptr %106, align 8, !dbg !150
  ret i32 0, !dbg !151
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_4_attention_2x16x16"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !152 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !153
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !153
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !153
  %5 = getelementptr i8, ptr %4, i64 384, !dbg !153
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !153
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !154
  %7 = load ptr, ptr %6, align 8, !dbg !154
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !154
  %8 = getelementptr i8, ptr %.unpack20, i64 16, !dbg !155
  %9 = load ptr, ptr %8, align 8, !dbg !155
  %10 = getelementptr i8, ptr %9, i64 128, !dbg !155
  call void @llvm.assume(i1 true) [ "align"(ptr %10, i64 64) ], !dbg !155
  %11 = load i32, ptr %2, align 16, !dbg !156
  %12 = zext i32 %11 to i64, !dbg !156
  %13 = lshr i64 %12, 3, !dbg !156
  %14 = shl nuw nsw i64 %12, 1, !dbg !156
  %15 = and i64 %14, 14, !dbg !156
  %.idx = mul nuw nsw i64 %15, 24, !dbg !156
  %16 = getelementptr i8, ptr %5, i64 %.idx, !dbg !156
  %17 = getelementptr [4 x i8], ptr %16, i64 %13, !dbg !156
  %18 = load <1 x float>, ptr %17, align 4, !dbg !156
  %19 = or disjoint i64 %15, 1, !dbg !156
  %.idx23 = mul nuw nsw i64 %19, 24, !dbg !156
  %20 = getelementptr i8, ptr %5, i64 %.idx23, !dbg !156
  %21 = getelementptr [4 x i8], ptr %20, i64 %13, !dbg !156
  %22 = load <1 x float>, ptr %21, align 4, !dbg !156
  %23 = shufflevector <1 x float> %18, <1 x float> %22, <32 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, !dbg !156
  %24 = fmul contract <32 x float> %23, splat (float 0x3FF7154760000000), !dbg !156
  %25 = shufflevector <32 x float> %24, <32 x float> poison, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>, !dbg !156
  %26 = shufflevector <32 x float> %24, <32 x float> poison, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>, !dbg !156
  %27 = getelementptr [4 x i8], ptr %5, i64 %13, !dbg !156
  %28 = getelementptr i8, ptr %27, i64 8, !dbg !156
  %29 = load <1 x float>, ptr %28, align 4, !dbg !156
  %30 = getelementptr i8, ptr %27, i64 32, !dbg !156
  %31 = load <1 x float>, ptr %30, align 4, !dbg !156
  %32 = getelementptr i8, ptr %27, i64 56, !dbg !156
  %33 = load <1 x float>, ptr %32, align 4, !dbg !156
  %34 = shufflevector <1 x float> %33, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %35 = getelementptr i8, ptr %27, i64 80, !dbg !156
  %36 = load <1 x float>, ptr %35, align 4, !dbg !156
  %37 = shufflevector <1 x float> %36, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %38 = getelementptr i8, ptr %27, i64 104, !dbg !156
  %39 = load <1 x float>, ptr %38, align 4, !dbg !156
  %40 = shufflevector <1 x float> %39, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %41 = getelementptr i8, ptr %27, i64 128, !dbg !156
  %42 = load <1 x float>, ptr %41, align 4, !dbg !156
  %43 = shufflevector <1 x float> %42, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %44 = getelementptr i8, ptr %27, i64 152, !dbg !156
  %45 = load <1 x float>, ptr %44, align 4, !dbg !156
  %46 = shufflevector <1 x float> %45, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %47 = getelementptr i8, ptr %27, i64 176, !dbg !156
  %48 = load <1 x float>, ptr %47, align 4, !dbg !156
  %49 = shufflevector <1 x float> %48, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %50 = getelementptr i8, ptr %27, i64 200, !dbg !156
  %51 = load <1 x float>, ptr %50, align 4, !dbg !156
  %52 = shufflevector <1 x float> %51, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %53 = getelementptr i8, ptr %27, i64 224, !dbg !156
  %54 = load <1 x float>, ptr %53, align 4, !dbg !156
  %55 = shufflevector <1 x float> %54, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %56 = getelementptr i8, ptr %27, i64 248, !dbg !156
  %57 = load <1 x float>, ptr %56, align 4, !dbg !156
  %58 = shufflevector <1 x float> %57, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %59 = getelementptr i8, ptr %27, i64 272, !dbg !156
  %60 = load <1 x float>, ptr %59, align 4, !dbg !156
  %61 = shufflevector <1 x float> %60, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %62 = getelementptr i8, ptr %27, i64 296, !dbg !156
  %63 = load <1 x float>, ptr %62, align 4, !dbg !156
  %64 = shufflevector <1 x float> %63, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %65 = getelementptr i8, ptr %27, i64 320, !dbg !156
  %66 = load <1 x float>, ptr %65, align 4, !dbg !156
  %67 = shufflevector <1 x float> %66, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %68 = getelementptr i8, ptr %27, i64 344, !dbg !156
  %69 = load <1 x float>, ptr %68, align 4, !dbg !156
  %70 = shufflevector <1 x float> %69, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %71 = getelementptr i8, ptr %27, i64 368, !dbg !156
  %72 = load <1 x float>, ptr %71, align 4, !dbg !156
  %73 = shufflevector <1 x float> %72, <1 x float> poison, <16 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %74 = shufflevector <1 x float> %29, <1 x float> %31, <16 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %75 = shufflevector <16 x float> %74, <16 x float> %34, <16 x i32> <i32 0, i32 1, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %76 = shufflevector <16 x float> %75, <16 x float> %37, <16 x i32> <i32 0, i32 1, i32 2, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %77 = shufflevector <16 x float> %76, <16 x float> %40, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %78 = shufflevector <16 x float> %77, <16 x float> %43, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %79 = shufflevector <16 x float> %78, <16 x float> %46, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %80 = shufflevector <16 x float> %79, <16 x float> %49, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %81 = shufflevector <16 x float> %80, <16 x float> %52, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %82 = shufflevector <16 x float> %81, <16 x float> %55, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %83 = shufflevector <16 x float> %82, <16 x float> %58, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 16, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %84 = shufflevector <16 x float> %83, <16 x float> %61, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 16, i32 poison, i32 poison, i32 poison, i32 poison>, !dbg !156
  %85 = shufflevector <16 x float> %84, <16 x float> %64, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 16, i32 poison, i32 poison, i32 poison>, !dbg !156
  %86 = shufflevector <16 x float> %85, <16 x float> %67, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 16, i32 poison, i32 poison>, !dbg !156
  %87 = shufflevector <16 x float> %86, <16 x float> %70, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 16, i32 poison>, !dbg !156
  %88 = shufflevector <16 x float> %87, <16 x float> %73, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16>, !dbg !156
  %89 = fmul contract <16 x float> %25, %88, !dbg !156
  %90 = fmul contract <16 x float> %26, %88, !dbg !156
  %91 = fadd contract <16 x float> %89, zeroinitializer, !dbg !156
  %92 = fadd contract <16 x float> %90, zeroinitializer, !dbg !156
  %.idx24 = shl nuw nsw i64 %15, 6, !dbg !156
  %93 = getelementptr i8, ptr %7, i64 %.idx24, !dbg !156
  %94 = load <16 x float>, ptr %93, align 64, !dbg !156
  %.idx25 = shl nuw nsw i64 %19, 6, !dbg !156
  %95 = getelementptr i8, ptr %7, i64 %.idx25, !dbg !156
  %96 = load <16 x float>, ptr %95, align 64, !dbg !156
  %97 = fmul contract <16 x float> %94, splat (float 0x3FF7154760000000), !dbg !156
  %98 = fmul contract <16 x float> %96, splat (float 0x3FF7154760000000), !dbg !156
  %99 = fadd contract <16 x float> %97, %91, !dbg !156
  %100 = fadd contract <16 x float> %98, %92, !dbg !156
  %101 = tail call float @llvm.vector.reduce.fmaximum.v16f32(<16 x float> %99), !dbg !156
  %102 = tail call float @llvm.maximum.f32(float %101, float 0xC7EFFFFFE0000000), !dbg !156
  %103 = tail call float @llvm.vector.reduce.fmaximum.v16f32(<16 x float> %100), !dbg !156
  %104 = tail call float @llvm.maximum.f32(float %103, float 0xC7EFFFFFE0000000), !dbg !156
  %105 = insertelement <2 x float> poison, float %102, i64 0, !dbg !156
  %106 = insertelement <2 x float> %105, float %104, i64 1, !dbg !156
  %107 = fsub contract <2 x float> splat (float 0xC7EFFFFFE0000000), %106, !dbg !156
  %108 = fmul contract <2 x float> %107, splat (float 0x3FE62E4300000000), !dbg !156
  %.inv = fcmp olt <2 x float> %108, splat (float 0xC055F33340000000), !dbg !156
  %109 = select <2 x i1> %.inv, <2 x float> splat (float 0xC055F33340000000), <2 x float> %108, !dbg !156
  %.inv26 = fcmp ogt <2 x float> %109, splat (float 0x4056333340000000), !dbg !156
  %110 = select <2 x i1> %.inv26, <2 x float> splat (float 0x4056333340000000), <2 x float> %109, !dbg !156
  %111 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %110, <2 x float> splat (float 0x3FF7154760000000), <2 x float> splat (float 5.000000e-01)), !dbg !156
  %112 = tail call <2 x float> @llvm.floor.v2f32(<2 x float> %111), !dbg !156
  %.inv27 = fcmp olt <2 x float> %112, splat (float -1.270000e+02), !dbg !156
  %113 = select <2 x i1> %.inv27, <2 x float> splat (float -1.270000e+02), <2 x float> %112, !dbg !156
  %.inv28 = fcmp ogt <2 x float> %113, splat (float 1.270000e+02), !dbg !156
  %114 = select <2 x i1> %.inv28, <2 x float> splat (float 1.270000e+02), <2 x float> %113, !dbg !156
  %115 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %114, <2 x float> splat (float 0xBFE6300000000000), <2 x float> %110), !dbg !156
  %116 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %114, <2 x float> splat (float 0x3F2BD01060000000), <2 x float> %115), !dbg !156
  %117 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %116, <2 x float> splat (float 0x3F2A0D2CE0000000), <2 x float> splat (float 0x3F56E879C0000000)), !dbg !156
  %118 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %117, <2 x float> %116, <2 x float> splat (float 0x3F81112100000000)), !dbg !156
  %119 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %118, <2 x float> %116, <2 x float> splat (float 0x3FA5553820000000)), !dbg !156
  %120 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %119, <2 x float> %116, <2 x float> splat (float 0x3FC5555540000000)), !dbg !156
  %121 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %120, <2 x float> %116, <2 x float> splat (float 5.000000e-01)), !dbg !156
  %122 = fmul contract <2 x float> %116, %116, !dbg !156
  %123 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %121, <2 x float> %122, <2 x float> %116), !dbg !156
  %124 = fadd contract <2 x float> %123, splat (float 1.000000e+00), !dbg !156
  %125 = fptosi <2 x float> %114 to <2 x i32>, !dbg !156
  %126 = shl <2 x i32> %125, splat (i32 23), !dbg !156
  %127 = add <2 x i32> %126, splat (i32 1065353216), !dbg !156
  %128 = bitcast <2 x i32> %127 to <2 x float>, !dbg !156
  %129 = fmul contract <2 x float> %124, %128, !dbg !156
  %130 = fmul contract <2 x float> %129, zeroinitializer, !dbg !156
  %131 = shufflevector <2 x float> %105, <2 x float> poison, <16 x i32> zeroinitializer, !dbg !156
  %132 = shufflevector <2 x float> %106, <2 x float> poison, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, !dbg !156
  %133 = fsub contract <16 x float> %99, %131, !dbg !156
  %134 = fsub contract <16 x float> %100, %132, !dbg !156
  %135 = fmul contract <16 x float> %133, splat (float 0x3FE62E4300000000), !dbg !156
  %136 = fmul contract <16 x float> %134, splat (float 0x3FE62E4300000000), !dbg !156
  %.inv29 = fcmp olt <16 x float> %135, splat (float 0xC055F33340000000), !dbg !156
  %137 = select <16 x i1> %.inv29, <16 x float> splat (float 0xC055F33340000000), <16 x float> %135, !dbg !156
  %.inv30 = fcmp olt <16 x float> %136, splat (float 0xC055F33340000000), !dbg !156
  %138 = select <16 x i1> %.inv30, <16 x float> splat (float 0xC055F33340000000), <16 x float> %136, !dbg !156
  %.inv31 = fcmp ogt <16 x float> %137, splat (float 0x4056333340000000), !dbg !156
  %139 = select <16 x i1> %.inv31, <16 x float> splat (float 0x4056333340000000), <16 x float> %137, !dbg !156
  %.inv32 = fcmp ogt <16 x float> %138, splat (float 0x4056333340000000), !dbg !156
  %140 = select <16 x i1> %.inv32, <16 x float> splat (float 0x4056333340000000), <16 x float> %138, !dbg !156
  %141 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %139, <16 x float> splat (float 0x3FF7154760000000), <16 x float> splat (float 5.000000e-01)), !dbg !156
  %142 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %140, <16 x float> splat (float 0x3FF7154760000000), <16 x float> splat (float 5.000000e-01)), !dbg !156
  %143 = tail call <16 x float> @llvm.floor.v16f32(<16 x float> %141), !dbg !156
  %144 = tail call <16 x float> @llvm.floor.v16f32(<16 x float> %142), !dbg !156
  %.inv33 = fcmp olt <16 x float> %143, splat (float -1.270000e+02), !dbg !156
  %145 = select <16 x i1> %.inv33, <16 x float> splat (float -1.270000e+02), <16 x float> %143, !dbg !156
  %.inv34 = fcmp olt <16 x float> %144, splat (float -1.270000e+02), !dbg !156
  %146 = select <16 x i1> %.inv34, <16 x float> splat (float -1.270000e+02), <16 x float> %144, !dbg !156
  %.inv35 = fcmp ogt <16 x float> %145, splat (float 1.270000e+02), !dbg !156
  %147 = select <16 x i1> %.inv35, <16 x float> splat (float 1.270000e+02), <16 x float> %145, !dbg !156
  %.inv36 = fcmp ogt <16 x float> %146, splat (float 1.270000e+02), !dbg !156
  %148 = select <16 x i1> %.inv36, <16 x float> splat (float 1.270000e+02), <16 x float> %146, !dbg !156
  %149 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %147, <16 x float> splat (float 0xBFE6300000000000), <16 x float> %139), !dbg !156
  %150 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %148, <16 x float> splat (float 0xBFE6300000000000), <16 x float> %140), !dbg !156
  %151 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %147, <16 x float> splat (float 0x3F2BD01060000000), <16 x float> %149), !dbg !156
  %152 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %148, <16 x float> splat (float 0x3F2BD01060000000), <16 x float> %150), !dbg !156
  %153 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %151, <16 x float> splat (float 0x3F2A0D2CE0000000), <16 x float> splat (float 0x3F56E879C0000000)), !dbg !156
  %154 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %152, <16 x float> splat (float 0x3F2A0D2CE0000000), <16 x float> splat (float 0x3F56E879C0000000)), !dbg !156
  %155 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %153, <16 x float> %151, <16 x float> splat (float 0x3F81112100000000)), !dbg !156
  %156 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %154, <16 x float> %152, <16 x float> splat (float 0x3F81112100000000)), !dbg !156
  %157 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %155, <16 x float> %151, <16 x float> splat (float 0x3FA5553820000000)), !dbg !156
  %158 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %156, <16 x float> %152, <16 x float> splat (float 0x3FA5553820000000)), !dbg !156
  %159 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %157, <16 x float> %151, <16 x float> splat (float 0x3FC5555540000000)), !dbg !156
  %160 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %158, <16 x float> %152, <16 x float> splat (float 0x3FC5555540000000)), !dbg !156
  %161 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %159, <16 x float> %151, <16 x float> splat (float 5.000000e-01)), !dbg !156
  %162 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %160, <16 x float> %152, <16 x float> splat (float 5.000000e-01)), !dbg !156
  %163 = fmul contract <16 x float> %151, %151, !dbg !156
  %164 = fmul contract <16 x float> %152, %152, !dbg !156
  %165 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %161, <16 x float> %163, <16 x float> %151), !dbg !156
  %166 = tail call <16 x float> @llvm.fma.v16f32(<16 x float> %162, <16 x float> %164, <16 x float> %152), !dbg !156
  %167 = fadd contract <16 x float> %165, splat (float 1.000000e+00), !dbg !156
  %168 = fadd contract <16 x float> %166, splat (float 1.000000e+00), !dbg !156
  %169 = fptosi <16 x float> %147 to <16 x i32>, !dbg !156
  %170 = fptosi <16 x float> %148 to <16 x i32>, !dbg !156
  %171 = shl <16 x i32> %169, splat (i32 23), !dbg !156
  %172 = add <16 x i32> %171, splat (i32 1065353216), !dbg !156
  %173 = shl <16 x i32> %170, splat (i32 23), !dbg !156
  %174 = add <16 x i32> %173, splat (i32 1065353216), !dbg !156
  %175 = bitcast <16 x i32> %172 to <16 x float>, !dbg !156
  %176 = bitcast <16 x i32> %174 to <16 x float>, !dbg !156
  %177 = fmul contract <16 x float> %167, %175, !dbg !156
  %178 = fmul contract <16 x float> %168, %176, !dbg !156
  %179 = extractelement <2 x float> %130, i64 0, !dbg !156
  %180 = tail call float @llvm.vector.reduce.fadd.v16f32(float %179, <16 x float> %177), !dbg !156
  %181 = extractelement <2 x float> %130, i64 1, !dbg !156
  %182 = tail call float @llvm.vector.reduce.fadd.v16f32(float %181, <16 x float> %178), !dbg !156
  %183 = insertelement <2 x float> poison, float %180, i64 0, !dbg !156
  %184 = insertelement <2 x float> %183, float %182, i64 1, !dbg !156
  %185 = shufflevector <16 x float> %177, <16 x float> %178, <32 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23, i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>, !dbg !156
  %186 = shufflevector <32 x float> %185, <32 x float> poison, <2 x i32> <i32 0, i32 1>, !dbg !156
  %187 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 1, i32 17>, !dbg !156
  %188 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 2, i32 18>, !dbg !156
  %189 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 3, i32 19>, !dbg !156
  %190 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 4, i32 20>, !dbg !156
  %191 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 5, i32 21>, !dbg !156
  %192 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 6, i32 22>, !dbg !156
  %193 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 7, i32 23>, !dbg !156
  %194 = shufflevector <32 x float> %185, <32 x float> poison, <2 x i32> <i32 16, i32 17>, !dbg !156
  %195 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 9, i32 25>, !dbg !156
  %196 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 10, i32 26>, !dbg !156
  %197 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 11, i32 27>, !dbg !156
  %198 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 12, i32 28>, !dbg !156
  %199 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 13, i32 29>, !dbg !156
  %200 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 14, i32 30>, !dbg !156
  %201 = shufflevector <16 x float> %177, <16 x float> %178, <2 x i32> <i32 15, i32 31>, !dbg !156
  %202 = getelementptr inbounds nuw i8, ptr %27, i64 16, !dbg !156
  %203 = load float, ptr %202, align 4, !dbg !156
  %204 = insertelement <2 x float> poison, float %203, i64 0, !dbg !156
  %205 = shufflevector <2 x float> %204, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %206 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %186, <2 x float> %205, <2 x float> %130), !dbg !156
  %207 = getelementptr inbounds nuw i8, ptr %27, i64 40, !dbg !156
  %208 = load float, ptr %207, align 4, !dbg !156
  %209 = insertelement <2 x float> poison, float %208, i64 0, !dbg !156
  %210 = shufflevector <2 x float> %209, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %211 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %187, <2 x float> %210, <2 x float> %206), !dbg !156
  %212 = getelementptr inbounds nuw i8, ptr %27, i64 64, !dbg !156
  %213 = load float, ptr %212, align 4, !dbg !156
  %214 = insertelement <2 x float> poison, float %213, i64 0, !dbg !156
  %215 = shufflevector <2 x float> %214, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %216 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %188, <2 x float> %215, <2 x float> %211), !dbg !156
  %217 = getelementptr inbounds nuw i8, ptr %27, i64 88, !dbg !156
  %218 = load float, ptr %217, align 4, !dbg !156
  %219 = insertelement <2 x float> poison, float %218, i64 0, !dbg !156
  %220 = shufflevector <2 x float> %219, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %221 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %189, <2 x float> %220, <2 x float> %216), !dbg !156
  %222 = getelementptr inbounds nuw i8, ptr %27, i64 112, !dbg !156
  %223 = load float, ptr %222, align 4, !dbg !156
  %224 = insertelement <2 x float> poison, float %223, i64 0, !dbg !156
  %225 = shufflevector <2 x float> %224, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %226 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %190, <2 x float> %225, <2 x float> %221), !dbg !156
  %227 = getelementptr inbounds nuw i8, ptr %27, i64 136, !dbg !156
  %228 = load float, ptr %227, align 4, !dbg !156
  %229 = insertelement <2 x float> poison, float %228, i64 0, !dbg !156
  %230 = shufflevector <2 x float> %229, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %231 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %191, <2 x float> %230, <2 x float> %226), !dbg !156
  %232 = getelementptr inbounds nuw i8, ptr %27, i64 160, !dbg !156
  %233 = load float, ptr %232, align 4, !dbg !156
  %234 = insertelement <2 x float> poison, float %233, i64 0, !dbg !156
  %235 = shufflevector <2 x float> %234, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %236 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %192, <2 x float> %235, <2 x float> %231), !dbg !156
  %237 = getelementptr inbounds nuw i8, ptr %27, i64 184, !dbg !156
  %238 = load float, ptr %237, align 4, !dbg !156
  %239 = insertelement <2 x float> poison, float %238, i64 0, !dbg !156
  %240 = shufflevector <2 x float> %239, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %241 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %193, <2 x float> %240, <2 x float> %236), !dbg !156
  %242 = getelementptr inbounds nuw i8, ptr %27, i64 208, !dbg !156
  %243 = load float, ptr %242, align 4, !dbg !156
  %244 = insertelement <2 x float> poison, float %243, i64 0, !dbg !156
  %245 = shufflevector <2 x float> %244, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %246 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %194, <2 x float> %245, <2 x float> %241), !dbg !156
  %247 = getelementptr inbounds nuw i8, ptr %27, i64 232, !dbg !156
  %248 = load float, ptr %247, align 4, !dbg !156
  %249 = insertelement <2 x float> poison, float %248, i64 0, !dbg !156
  %250 = shufflevector <2 x float> %249, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %251 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %195, <2 x float> %250, <2 x float> %246), !dbg !156
  %252 = getelementptr inbounds nuw i8, ptr %27, i64 256, !dbg !156
  %253 = load float, ptr %252, align 4, !dbg !156
  %254 = insertelement <2 x float> poison, float %253, i64 0, !dbg !156
  %255 = shufflevector <2 x float> %254, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %256 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %196, <2 x float> %255, <2 x float> %251), !dbg !156
  %257 = getelementptr inbounds nuw i8, ptr %27, i64 280, !dbg !156
  %258 = load float, ptr %257, align 4, !dbg !156
  %259 = insertelement <2 x float> poison, float %258, i64 0, !dbg !156
  %260 = shufflevector <2 x float> %259, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %261 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %197, <2 x float> %260, <2 x float> %256), !dbg !156
  %262 = getelementptr inbounds nuw i8, ptr %27, i64 304, !dbg !156
  %263 = load float, ptr %262, align 4, !dbg !156
  %264 = insertelement <2 x float> poison, float %263, i64 0, !dbg !156
  %265 = shufflevector <2 x float> %264, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %266 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %198, <2 x float> %265, <2 x float> %261), !dbg !156
  %267 = getelementptr inbounds nuw i8, ptr %27, i64 328, !dbg !156
  %268 = load float, ptr %267, align 4, !dbg !156
  %269 = insertelement <2 x float> poison, float %268, i64 0, !dbg !156
  %270 = shufflevector <2 x float> %269, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %271 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %199, <2 x float> %270, <2 x float> %266), !dbg !156
  %272 = getelementptr inbounds nuw i8, ptr %27, i64 352, !dbg !156
  %273 = load float, ptr %272, align 4, !dbg !156
  %274 = insertelement <2 x float> poison, float %273, i64 0, !dbg !156
  %275 = shufflevector <2 x float> %274, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %276 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %200, <2 x float> %275, <2 x float> %271), !dbg !156
  %277 = getelementptr inbounds nuw i8, ptr %27, i64 376, !dbg !156
  %278 = load float, ptr %277, align 4, !dbg !156
  %279 = insertelement <2 x float> poison, float %278, i64 0, !dbg !156
  %280 = shufflevector <2 x float> %279, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !156
  %281 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %201, <2 x float> %280, <2 x float> %276), !dbg !156
  %282 = fdiv <2 x float> splat (float 1.000000e+00), %184, !dbg !156
  %283 = fmul contract <2 x float> %282, %281, !dbg !156
  %.idx37 = shl nuw nsw i64 %13, 6, !dbg !156
  %284 = getelementptr i8, ptr %10, i64 %.idx37, !dbg !156
  %285 = getelementptr [4 x i8], ptr %284, i64 %15, !dbg !156
  store <2 x float> %283, ptr %285, align 8, !dbg !156
  ret i32 0, !dbg !157
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_5_matmul_16x2x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !158 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !159
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !159
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !159
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !159
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !159
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !160
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !161
  %7 = load ptr, ptr %6, align 8, !dbg !161
  %8 = getelementptr i8, ptr %7, i64 256, !dbg !161
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !161
  %9 = load i32, ptr %2, align 16, !dbg !162
  %10 = zext i32 %9 to i64, !dbg !162
  %11 = shl nuw nsw i64 %10, 3, !dbg !162
  %12 = shl nuw nsw i64 %10, 4, !dbg !163
  %13 = getelementptr [4 x i8], ptr %4, i64 %12, !dbg !163
  %14 = load <2 x float>, ptr %13, align 64, !dbg !163
  %15 = or disjoint i64 %11, 1, !dbg !163
  %16 = shl nuw nsw i64 %15, 1, !dbg !163
  %17 = getelementptr [4 x i8], ptr %4, i64 %16, !dbg !163
  %18 = load <2 x float>, ptr %17, align 8, !dbg !163
  %19 = or disjoint i64 %11, 2, !dbg !163
  %20 = shl nuw nsw i64 %19, 1, !dbg !163
  %21 = getelementptr [4 x i8], ptr %4, i64 %20, !dbg !163
  %22 = load <2 x float>, ptr %21, align 16, !dbg !163
  %23 = or disjoint i64 %11, 3, !dbg !163
  %24 = shl nuw nsw i64 %23, 1, !dbg !163
  %25 = getelementptr [4 x i8], ptr %4, i64 %24, !dbg !163
  %26 = load <2 x float>, ptr %25, align 8, !dbg !163
  %27 = or disjoint i64 %11, 4, !dbg !163
  %28 = shl nuw nsw i64 %27, 1, !dbg !163
  %29 = getelementptr [4 x i8], ptr %4, i64 %28, !dbg !163
  %30 = load <2 x float>, ptr %29, align 32, !dbg !163
  %31 = or disjoint i64 %11, 5, !dbg !163
  %32 = shl nuw nsw i64 %31, 1, !dbg !163
  %33 = getelementptr [4 x i8], ptr %4, i64 %32, !dbg !163
  %34 = load <2 x float>, ptr %33, align 8, !dbg !163
  %35 = or disjoint i64 %11, 6, !dbg !163
  %36 = shl nuw nsw i64 %35, 1, !dbg !163
  %37 = getelementptr [4 x i8], ptr %4, i64 %36, !dbg !163
  %38 = load <2 x float>, ptr %37, align 16, !dbg !163
  %39 = or disjoint i64 %11, 7, !dbg !163
  %40 = shl nuw nsw i64 %39, 1, !dbg !163
  %41 = getelementptr [4 x i8], ptr %4, i64 %40, !dbg !163
  %42 = load <2 x float>, ptr %41, align 8, !dbg !163
  %43 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %11
  %44 = load float, ptr %43, align 32
  %45 = insertelement <2 x float> poison, float %44, i64 0
  %46 = shufflevector <2 x float> %45, <2 x float> poison, <2 x i32> zeroinitializer
  %47 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %46, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %48 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %15
  %49 = load float, ptr %48, align 4
  %50 = insertelement <2 x float> poison, float %49, i64 0
  %51 = shufflevector <2 x float> %50, <2 x float> poison, <2 x i32> zeroinitializer
  %52 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %51, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %53 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %19
  %54 = load float, ptr %53, align 8
  %55 = insertelement <2 x float> poison, float %54, i64 0
  %56 = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> zeroinitializer
  %57 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %56, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %58 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %23
  %59 = load float, ptr %58, align 4
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %61, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %63 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %27
  %64 = load float, ptr %63, align 16
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %68 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %31
  %69 = load float, ptr %68, align 4
  %70 = insertelement <2 x float> poison, float %69, i64 0
  %71 = shufflevector <2 x float> %70, <2 x float> poison, <2 x i32> zeroinitializer
  %72 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %71, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %73 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %35
  %74 = load float, ptr %73, align 8
  %75 = insertelement <2 x float> poison, float %74, i64 0
  %76 = shufflevector <2 x float> %75, <2 x float> poison, <2 x i32> zeroinitializer
  %77 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %76, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %78 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %39
  %79 = load float, ptr %78, align 4
  %80 = insertelement <2 x float> poison, float %79, i64 0
  %81 = shufflevector <2 x float> %80, <2 x float> poison, <2 x i32> zeroinitializer
  %82 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %81, <2 x float> <float 0xBF554C1F60000000, float 0xBF53D82280000000>, <2 x float> zeroinitializer)
  %83 = getelementptr inbounds nuw i8, ptr %43, i64 64
  %84 = load float, ptr %83, align 32
  %85 = insertelement <2 x float> poison, float %84, i64 0
  %86 = shufflevector <2 x float> %85, <2 x float> poison, <2 x i32> zeroinitializer
  %87 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %86, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %47)
  %88 = getelementptr inbounds nuw i8, ptr %43, i64 68
  %89 = load float, ptr %88, align 4
  %90 = insertelement <2 x float> poison, float %89, i64 0
  %91 = shufflevector <2 x float> %90, <2 x float> poison, <2 x i32> zeroinitializer
  %92 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %91, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %52)
  %93 = getelementptr inbounds nuw i8, ptr %43, i64 72
  %94 = load float, ptr %93, align 8
  %95 = insertelement <2 x float> poison, float %94, i64 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %57)
  %98 = getelementptr inbounds nuw i8, ptr %43, i64 76
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i64 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %62)
  %103 = getelementptr inbounds nuw i8, ptr %43, i64 80
  %104 = load float, ptr %103, align 16
  %105 = insertelement <2 x float> poison, float %104, i64 0
  %106 = shufflevector <2 x float> %105, <2 x float> poison, <2 x i32> zeroinitializer
  %107 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %106, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %67)
  %108 = getelementptr inbounds nuw i8, ptr %43, i64 84
  %109 = load float, ptr %108, align 4
  %110 = insertelement <2 x float> poison, float %109, i64 0
  %111 = shufflevector <2 x float> %110, <2 x float> poison, <2 x i32> zeroinitializer
  %112 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %111, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %72)
  %113 = getelementptr inbounds nuw i8, ptr %43, i64 88
  %114 = load float, ptr %113, align 8
  %115 = insertelement <2 x float> poison, float %114, i64 0
  %116 = shufflevector <2 x float> %115, <2 x float> poison, <2 x i32> zeroinitializer
  %117 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %116, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %77)
  %118 = getelementptr inbounds nuw i8, ptr %43, i64 92
  %119 = load float, ptr %118, align 4
  %120 = insertelement <2 x float> poison, float %119, i64 0
  %121 = shufflevector <2 x float> %120, <2 x float> poison, <2 x i32> zeroinitializer
  %122 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %121, <2 x float> <float 0xBFAD403A40000000, float 0xBF97FF8520000000>, <2 x float> %82)
  %123 = fadd contract <2 x float> %14, %87, !dbg !164
  %124 = fadd contract <2 x float> %18, %92, !dbg !164
  %125 = fadd contract <2 x float> %22, %97, !dbg !164
  %126 = fadd contract <2 x float> %26, %102, !dbg !164
  %127 = fadd contract <2 x float> %30, %107, !dbg !164
  %128 = fadd contract <2 x float> %34, %112, !dbg !164
  %129 = fadd contract <2 x float> %38, %117, !dbg !164
  %130 = fadd contract <2 x float> %42, %122, !dbg !164
  %131 = getelementptr [4 x i8], ptr %8, i64 %12, !dbg !164
  store <2 x float> %123, ptr %131, align 64, !dbg !164
  %132 = getelementptr [4 x i8], ptr %8, i64 %16, !dbg !164
  store <2 x float> %124, ptr %132, align 8, !dbg !164
  %133 = getelementptr [4 x i8], ptr %8, i64 %20, !dbg !164
  store <2 x float> %125, ptr %133, align 16, !dbg !164
  %134 = getelementptr [4 x i8], ptr %8, i64 %24, !dbg !164
  store <2 x float> %126, ptr %134, align 8, !dbg !164
  %135 = getelementptr [4 x i8], ptr %8, i64 %28, !dbg !164
  store <2 x float> %127, ptr %135, align 32, !dbg !164
  %136 = getelementptr [4 x i8], ptr %8, i64 %32, !dbg !164
  store <2 x float> %128, ptr %136, align 8, !dbg !164
  %137 = getelementptr [4 x i8], ptr %8, i64 %36, !dbg !164
  store <2 x float> %129, ptr %137, align 16, !dbg !164
  %138 = getelementptr [4 x i8], ptr %8, i64 %40, !dbg !164
  store <2 x float> %130, ptr %138, align 8, !dbg !164
  ret i32 0, !dbg !165
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_7_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !166 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !167
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !167
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !167
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !167
  %5 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !168
  %6 = load ptr, ptr %5, align 8, !dbg !168
  %7 = getelementptr i8, ptr %6, i64 128, !dbg !168
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !168
  %8 = load i32, ptr %2, align 16, !dbg !169
  %9 = zext i32 %8 to i64, !dbg !169
  %10 = shl nuw nsw i64 %9, 2, !dbg !169
  %11 = getelementptr [4 x i8], ptr %4, i64 %10, !dbg !169
  %12 = load <2 x float>, ptr %11, align 16, !dbg !169
  %13 = or disjoint i64 %10, 2, !dbg !169
  %14 = getelementptr [4 x i8], ptr %4, i64 %13, !dbg !169
  %15 = load <2 x float>, ptr %14, align 8, !dbg !169
  %16 = fmul contract <2 x float> %12, %12, !dbg !170
  %17 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %16), !dbg !170
  %18 = fmul contract <2 x float> %15, %15, !dbg !170
  %19 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %18), !dbg !170
  %20 = insertelement <2 x float> poison, float %17, i64 0, !dbg !170
  %21 = insertelement <2 x float> %20, float %19, i64 1, !dbg !170
  %22 = fmul <2 x float> %21, splat (float 5.000000e-01), !dbg !171
  %23 = fadd contract <2 x float> %22, splat (float 0x3EE4F8B580000000), !dbg !172
  %24 = tail call <2 x float> @llvm.sqrt.v2f32(<2 x float> %23), !dbg !173
  %25 = fdiv <2 x float> splat (float 1.000000e+00), %24, !dbg !173
  %26 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !173
  %27 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !173
  %28 = fmul contract <2 x float> %12, %26, !dbg !174
  %29 = fmul contract <2 x float> %15, %27, !dbg !174
  %30 = fadd contract <2 x float> %28, zeroinitializer, !dbg !175
  %31 = fadd contract <2 x float> %29, zeroinitializer, !dbg !175
  %32 = getelementptr [4 x i8], ptr %7, i64 %10, !dbg !175
  store <2 x float> %30, ptr %32, align 16, !dbg !175
  %33 = getelementptr [4 x i8], ptr %7, i64 %13, !dbg !175
  store <2 x float> %31, ptr %33, align 8, !dbg !175
  ret i32 0, !dbg !176
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_8_matmul_16x8x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !177 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !178
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !178
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !178
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !178
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !178
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !179
  %7 = load ptr, ptr %6, align 8, !dbg !179
  %8 = getelementptr i8, ptr %7, i64 384, !dbg !179
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !179
  %9 = load i32, ptr %2, align 16, !dbg !180
  %10 = zext i32 %9 to i64, !dbg !180
  %11 = shl nuw nsw i64 %10, 3, !dbg !180
  %.idx45 = shl nuw nsw i64 %10, 6
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx45
  %13 = load float, ptr %12, align 64
  %14 = insertelement <8 x float> poison, float %13, i64 0
  %15 = shufflevector <8 x float> %14, <8 x float> poison, <8 x i32> zeroinitializer
  %16 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %15, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %17 = or disjoint i64 %11, 1, !dbg !181
  %.idx46 = shl nuw nsw i64 %17, 3
  %18 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx46
  %19 = load float, ptr %18, align 8
  %20 = insertelement <8 x float> poison, float %19, i64 0
  %21 = shufflevector <8 x float> %20, <8 x float> poison, <8 x i32> zeroinitializer
  %22 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %21, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %23 = or disjoint i64 %11, 2, !dbg !181
  %.idx47 = shl nuw nsw i64 %23, 3
  %24 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx47
  %25 = load float, ptr %24, align 16
  %26 = insertelement <8 x float> poison, float %25, i64 0
  %27 = shufflevector <8 x float> %26, <8 x float> poison, <8 x i32> zeroinitializer
  %28 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %27, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %29 = or disjoint i64 %11, 3, !dbg !181
  %.idx48 = shl nuw nsw i64 %29, 3
  %30 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx48
  %31 = load float, ptr %30, align 8
  %32 = insertelement <8 x float> poison, float %31, i64 0
  %33 = shufflevector <8 x float> %32, <8 x float> poison, <8 x i32> zeroinitializer
  %34 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %33, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %35 = or disjoint i64 %11, 4, !dbg !181
  %.idx49 = shl nuw nsw i64 %35, 3
  %36 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx49
  %37 = load float, ptr %36, align 32
  %38 = insertelement <8 x float> poison, float %37, i64 0
  %39 = shufflevector <8 x float> %38, <8 x float> poison, <8 x i32> zeroinitializer
  %40 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %39, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %41 = or disjoint i64 %11, 5, !dbg !181
  %.idx50 = shl nuw nsw i64 %41, 3
  %42 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx50
  %43 = load float, ptr %42, align 8
  %44 = insertelement <8 x float> poison, float %43, i64 0
  %45 = shufflevector <8 x float> %44, <8 x float> poison, <8 x i32> zeroinitializer
  %46 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %45, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %47 = or disjoint i64 %11, 6, !dbg !181
  %.idx51 = shl nuw nsw i64 %47, 3
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx51
  %49 = load float, ptr %48, align 16
  %50 = insertelement <8 x float> poison, float %49, i64 0
  %51 = shufflevector <8 x float> %50, <8 x float> poison, <8 x i32> zeroinitializer
  %52 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %51, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %53 = or disjoint i64 %11, 7, !dbg !181
  %.idx52 = shl nuw nsw i64 %53, 3
  %54 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx52
  %55 = load float, ptr %54, align 8
  %56 = insertelement <8 x float> poison, float %55, i64 0
  %57 = shufflevector <8 x float> %56, <8 x float> poison, <8 x i32> zeroinitializer
  %58 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %57, <8 x float> <float 0x3F852E5AE0000000, float 0xBF8CC5C1E0000000, float 0xBF74EB2E80000000, float 0x3F8E730F00000000, float 0x3F7AA76420000000, float 0xBF755CBC40000000, float 0x3F919F1B40000000, float 0x3F88278380000000>, <8 x float> zeroinitializer)
  %59 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %60 = load float, ptr %59, align 4
  %61 = insertelement <8 x float> poison, float %60, i64 0
  %62 = shufflevector <8 x float> %61, <8 x float> poison, <8 x i32> zeroinitializer
  %63 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %62, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %16)
  %64 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %65 = load float, ptr %64, align 4
  %66 = insertelement <8 x float> poison, float %65, i64 0
  %67 = shufflevector <8 x float> %66, <8 x float> poison, <8 x i32> zeroinitializer
  %68 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %67, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %22)
  %69 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %70 = load float, ptr %69, align 4
  %71 = insertelement <8 x float> poison, float %70, i64 0
  %72 = shufflevector <8 x float> %71, <8 x float> poison, <8 x i32> zeroinitializer
  %73 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %72, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %28)
  %74 = getelementptr inbounds nuw i8, ptr %30, i64 4
  %75 = load float, ptr %74, align 4
  %76 = insertelement <8 x float> poison, float %75, i64 0
  %77 = shufflevector <8 x float> %76, <8 x float> poison, <8 x i32> zeroinitializer
  %78 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %77, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %34)
  %79 = getelementptr inbounds nuw i8, ptr %36, i64 4
  %80 = load float, ptr %79, align 4
  %81 = insertelement <8 x float> poison, float %80, i64 0
  %82 = shufflevector <8 x float> %81, <8 x float> poison, <8 x i32> zeroinitializer
  %83 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %82, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %40)
  %84 = getelementptr inbounds nuw i8, ptr %42, i64 4
  %85 = load float, ptr %84, align 4
  %86 = insertelement <8 x float> poison, float %85, i64 0
  %87 = shufflevector <8 x float> %86, <8 x float> poison, <8 x i32> zeroinitializer
  %88 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %87, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %46)
  %89 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %90 = load float, ptr %89, align 4
  %91 = insertelement <8 x float> poison, float %90, i64 0
  %92 = shufflevector <8 x float> %91, <8 x float> poison, <8 x i32> zeroinitializer
  %93 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %92, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %52)
  %94 = getelementptr inbounds nuw i8, ptr %54, i64 4
  %95 = load float, ptr %94, align 4
  %96 = insertelement <8 x float> poison, float %95, i64 0
  %97 = shufflevector <8 x float> %96, <8 x float> poison, <8 x i32> zeroinitializer
  %98 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %97, <8 x float> <float 0x3F7010BAA0000000, float 0x3F92ECC020000000, float 0x3F88302280000000, float 0x3F9A455040000000, float 0xBF928799E0000000, float 0xBF94E47EE0000000, float 0xBF9D5FB200000000, float 0xBF639DE640000000>, <8 x float> %58)
  %99 = fmul contract <8 x float> %63, %63, !dbg !182
  %100 = fmul contract <8 x float> %68, %68, !dbg !182
  %101 = fmul contract <8 x float> %73, %73, !dbg !182
  %102 = fmul contract <8 x float> %78, %78, !dbg !182
  %103 = fmul contract <8 x float> %83, %83, !dbg !182
  %104 = fmul contract <8 x float> %88, %88, !dbg !182
  %105 = fmul contract <8 x float> %93, %93, !dbg !182
  %106 = fmul contract <8 x float> %98, %98, !dbg !182
  %107 = fmul contract <8 x float> %63, %99, !dbg !182
  %108 = fmul contract <8 x float> %68, %100, !dbg !182
  %109 = fmul contract <8 x float> %73, %101, !dbg !182
  %110 = fmul contract <8 x float> %78, %102, !dbg !182
  %111 = fmul contract <8 x float> %83, %103, !dbg !182
  %112 = fmul contract <8 x float> %88, %104, !dbg !182
  %113 = fmul contract <8 x float> %93, %105, !dbg !182
  %114 = fmul contract <8 x float> %98, %106, !dbg !182
  %115 = fmul contract <8 x float> %107, splat (float 0x3FA6E4E260000000), !dbg !183
  %116 = fmul contract <8 x float> %108, splat (float 0x3FA6E4E260000000), !dbg !183
  %117 = fmul contract <8 x float> %109, splat (float 0x3FA6E4E260000000), !dbg !183
  %118 = fmul contract <8 x float> %110, splat (float 0x3FA6E4E260000000), !dbg !183
  %119 = fmul contract <8 x float> %111, splat (float 0x3FA6E4E260000000), !dbg !183
  %120 = fmul contract <8 x float> %112, splat (float 0x3FA6E4E260000000), !dbg !183
  %121 = fmul contract <8 x float> %113, splat (float 0x3FA6E4E260000000), !dbg !183
  %122 = fmul contract <8 x float> %114, splat (float 0x3FA6E4E260000000), !dbg !183
  %123 = fadd contract <8 x float> %63, %115, !dbg !184
  %124 = fadd contract <8 x float> %68, %116, !dbg !184
  %125 = fadd contract <8 x float> %73, %117, !dbg !184
  %126 = fadd contract <8 x float> %78, %118, !dbg !184
  %127 = fadd contract <8 x float> %83, %119, !dbg !184
  %128 = fadd contract <8 x float> %88, %120, !dbg !184
  %129 = fadd contract <8 x float> %93, %121, !dbg !184
  %130 = fadd contract <8 x float> %98, %122, !dbg !184
  %131 = fmul contract <8 x float> %123, splat (float 0x3FE9884520000000), !dbg !185
  %132 = fmul contract <8 x float> %124, splat (float 0x3FE9884520000000), !dbg !185
  %133 = fmul contract <8 x float> %125, splat (float 0x3FE9884520000000), !dbg !185
  %134 = fmul contract <8 x float> %126, splat (float 0x3FE9884520000000), !dbg !185
  %135 = fmul contract <8 x float> %127, splat (float 0x3FE9884520000000), !dbg !185
  %136 = fmul contract <8 x float> %128, splat (float 0x3FE9884520000000), !dbg !185
  %137 = fmul contract <8 x float> %129, splat (float 0x3FE9884520000000), !dbg !185
  %138 = fmul contract <8 x float> %130, splat (float 0x3FE9884520000000), !dbg !185
  %.inv = fcmp oge <8 x float> %131, splat (float 0x401FFEC880000000), !dbg !186
  %139 = select <8 x i1> %.inv, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %131, !dbg !186
  %.inv23 = fcmp oge <8 x float> %132, splat (float 0x401FFEC880000000), !dbg !186
  %140 = select <8 x i1> %.inv23, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %132, !dbg !186
  %.inv24 = fcmp oge <8 x float> %133, splat (float 0x401FFEC880000000), !dbg !186
  %141 = select <8 x i1> %.inv24, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %133, !dbg !186
  %.inv25 = fcmp oge <8 x float> %134, splat (float 0x401FFEC880000000), !dbg !186
  %142 = select <8 x i1> %.inv25, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %134, !dbg !186
  %.inv26 = fcmp oge <8 x float> %135, splat (float 0x401FFEC880000000), !dbg !186
  %143 = select <8 x i1> %.inv26, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %135, !dbg !186
  %.inv27 = fcmp oge <8 x float> %136, splat (float 0x401FFEC880000000), !dbg !186
  %144 = select <8 x i1> %.inv27, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %136, !dbg !186
  %.inv28 = fcmp oge <8 x float> %137, splat (float 0x401FFEC880000000), !dbg !186
  %145 = select <8 x i1> %.inv28, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %137, !dbg !186
  %.inv29 = fcmp oge <8 x float> %138, splat (float 0x401FFEC880000000), !dbg !186
  %146 = select <8 x i1> %.inv29, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %138, !dbg !186
  %.inv30 = fcmp ole <8 x float> %139, splat (float 0xC01FFEC880000000), !dbg !186
  %147 = select <8 x i1> %.inv30, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %139, !dbg !186
  %.inv31 = fcmp ole <8 x float> %140, splat (float 0xC01FFEC880000000), !dbg !186
  %148 = select <8 x i1> %.inv31, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %140, !dbg !186
  %.inv32 = fcmp ole <8 x float> %141, splat (float 0xC01FFEC880000000), !dbg !186
  %149 = select <8 x i1> %.inv32, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %141, !dbg !186
  %.inv33 = fcmp ole <8 x float> %142, splat (float 0xC01FFEC880000000), !dbg !186
  %150 = select <8 x i1> %.inv33, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %142, !dbg !186
  %.inv34 = fcmp ole <8 x float> %143, splat (float 0xC01FFEC880000000), !dbg !186
  %151 = select <8 x i1> %.inv34, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %143, !dbg !186
  %.inv35 = fcmp ole <8 x float> %144, splat (float 0xC01FFEC880000000), !dbg !186
  %152 = select <8 x i1> %.inv35, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %144, !dbg !186
  %.inv36 = fcmp ole <8 x float> %145, splat (float 0xC01FFEC880000000), !dbg !186
  %153 = select <8 x i1> %.inv36, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %145, !dbg !186
  %.inv37 = fcmp ole <8 x float> %146, splat (float 0xC01FFEC880000000), !dbg !186
  %154 = select <8 x i1> %.inv37, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %146, !dbg !186
  %155 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %131), !dbg !186
  %156 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %132), !dbg !186
  %157 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %133), !dbg !186
  %158 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %134), !dbg !186
  %159 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %135), !dbg !186
  %160 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %136), !dbg !186
  %161 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %137), !dbg !186
  %162 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %138), !dbg !186
  %163 = fcmp olt <8 x float> %155, splat (float 0x3F3A36E2E0000000), !dbg !186
  %164 = fcmp olt <8 x float> %156, splat (float 0x3F3A36E2E0000000), !dbg !186
  %165 = fcmp olt <8 x float> %157, splat (float 0x3F3A36E2E0000000), !dbg !186
  %166 = fcmp olt <8 x float> %158, splat (float 0x3F3A36E2E0000000), !dbg !186
  %167 = fcmp olt <8 x float> %159, splat (float 0x3F3A36E2E0000000), !dbg !186
  %168 = fcmp olt <8 x float> %160, splat (float 0x3F3A36E2E0000000), !dbg !186
  %169 = fcmp olt <8 x float> %161, splat (float 0x3F3A36E2E0000000), !dbg !186
  %170 = fcmp olt <8 x float> %162, splat (float 0x3F3A36E2E0000000), !dbg !186
  %171 = fmul contract <8 x float> %147, %147, !dbg !186
  %172 = fmul contract <8 x float> %148, %148, !dbg !186
  %173 = fmul contract <8 x float> %149, %149, !dbg !186
  %174 = fmul contract <8 x float> %150, %150, !dbg !186
  %175 = fmul contract <8 x float> %151, %151, !dbg !186
  %176 = fmul contract <8 x float> %152, %152, !dbg !186
  %177 = fmul contract <8 x float> %153, %153, !dbg !186
  %178 = fmul contract <8 x float> %154, %154, !dbg !186
  %179 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %180 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %181 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %182 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %183 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %184 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %185 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %186 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !186
  %187 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %179, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %188 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %180, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %189 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %181, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %190 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %182, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %191 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %183, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %192 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %184, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %193 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %185, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %194 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %186, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !186
  %195 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %187, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %196 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %188, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %197 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %189, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %198 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %190, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %199 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %191, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %200 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %192, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %201 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %193, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %202 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %194, <8 x float> splat (float 0x3E6B800820000000)), !dbg !186
  %203 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %195, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %204 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %196, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %205 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %197, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %206 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %198, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %207 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %199, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %208 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %200, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %209 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %201, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %210 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %202, <8 x float> splat (float 0x3EEF286940000000)), !dbg !186
  %211 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %203, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %212 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %204, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %213 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %205, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %214 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %206, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %215 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %207, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %216 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %208, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %217 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %209, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %218 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %210, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !186
  %219 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %211, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %220 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %212, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %221 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %213, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %222 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %214, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %223 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %215, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %224 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %216, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %225 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %217, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %226 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %218, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !186
  %227 = fmul contract <8 x float> %147, %219, !dbg !186
  %228 = fmul contract <8 x float> %148, %220, !dbg !186
  %229 = fmul contract <8 x float> %149, %221, !dbg !186
  %230 = fmul contract <8 x float> %150, %222, !dbg !186
  %231 = fmul contract <8 x float> %151, %223, !dbg !186
  %232 = fmul contract <8 x float> %152, %224, !dbg !186
  %233 = fmul contract <8 x float> %153, %225, !dbg !186
  %234 = fmul contract <8 x float> %154, %226, !dbg !186
  %235 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %236 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %237 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %238 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %239 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %240 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %241 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %242 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !186
  %243 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %235, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %244 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %236, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %245 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %237, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %246 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %238, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %247 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %239, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %248 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %240, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %249 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %241, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %250 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %242, <8 x float> splat (float 0x3F629540A0000000)), !dbg !186
  %251 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %243, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %252 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %244, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %253 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %245, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %254 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %246, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %255 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %247, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %256 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %248, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %257 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %249, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %258 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %250, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !186
  %259 = fdiv <8 x float> %227, %251, !dbg !186
  %260 = fdiv <8 x float> %228, %252, !dbg !186
  %261 = fdiv <8 x float> %229, %253, !dbg !186
  %262 = fdiv <8 x float> %230, %254, !dbg !186
  %263 = fdiv <8 x float> %231, %255, !dbg !186
  %264 = fdiv <8 x float> %232, %256, !dbg !186
  %265 = fdiv <8 x float> %233, %257, !dbg !186
  %266 = fdiv <8 x float> %234, %258, !dbg !186
  %267 = select <8 x i1> %163, <8 x float> %147, <8 x float> %259, !dbg !186
  %268 = select <8 x i1> %164, <8 x float> %148, <8 x float> %260, !dbg !186
  %269 = select <8 x i1> %165, <8 x float> %149, <8 x float> %261, !dbg !186
  %270 = select <8 x i1> %166, <8 x float> %150, <8 x float> %262, !dbg !186
  %271 = select <8 x i1> %167, <8 x float> %151, <8 x float> %263, !dbg !186
  %272 = select <8 x i1> %168, <8 x float> %152, <8 x float> %264, !dbg !186
  %273 = select <8 x i1> %169, <8 x float> %153, <8 x float> %265, !dbg !186
  %274 = select <8 x i1> %170, <8 x float> %154, <8 x float> %266, !dbg !186
  %275 = fadd contract <8 x float> %267, splat (float 1.000000e+00), !dbg !187
  %276 = fadd contract <8 x float> %268, splat (float 1.000000e+00), !dbg !187
  %277 = fadd contract <8 x float> %269, splat (float 1.000000e+00), !dbg !187
  %278 = fadd contract <8 x float> %270, splat (float 1.000000e+00), !dbg !187
  %279 = fadd contract <8 x float> %271, splat (float 1.000000e+00), !dbg !187
  %280 = fadd contract <8 x float> %272, splat (float 1.000000e+00), !dbg !187
  %281 = fadd contract <8 x float> %273, splat (float 1.000000e+00), !dbg !187
  %282 = fadd contract <8 x float> %274, splat (float 1.000000e+00), !dbg !187
  %283 = fmul contract <8 x float> %63, splat (float 5.000000e-01), !dbg !188
  %284 = fmul contract <8 x float> %68, splat (float 5.000000e-01), !dbg !188
  %285 = fmul contract <8 x float> %73, splat (float 5.000000e-01), !dbg !188
  %286 = fmul contract <8 x float> %78, splat (float 5.000000e-01), !dbg !188
  %287 = fmul contract <8 x float> %83, splat (float 5.000000e-01), !dbg !188
  %288 = fmul contract <8 x float> %88, splat (float 5.000000e-01), !dbg !188
  %289 = fmul contract <8 x float> %93, splat (float 5.000000e-01), !dbg !188
  %290 = fmul contract <8 x float> %98, splat (float 5.000000e-01), !dbg !188
  %291 = fmul contract <8 x float> %283, %275, !dbg !181
  %292 = fmul contract <8 x float> %284, %276, !dbg !181
  %293 = fmul contract <8 x float> %285, %277, !dbg !181
  %294 = fmul contract <8 x float> %286, %278, !dbg !181
  %295 = fmul contract <8 x float> %287, %279, !dbg !181
  %296 = fmul contract <8 x float> %288, %280, !dbg !181
  %297 = fmul contract <8 x float> %289, %281, !dbg !181
  %298 = fmul contract <8 x float> %290, %282, !dbg !181
  %.idx = shl nuw nsw i64 %10, 8, !dbg !181
  %299 = getelementptr i8, ptr %8, i64 %.idx, !dbg !181
  store <8 x float> %291, ptr %299, align 64, !dbg !181
  %.idx38 = shl nuw nsw i64 %17, 5, !dbg !181
  %300 = getelementptr i8, ptr %8, i64 %.idx38, !dbg !181
  store <8 x float> %292, ptr %300, align 32, !dbg !181
  %.idx39 = shl nuw nsw i64 %23, 5, !dbg !181
  %301 = getelementptr i8, ptr %8, i64 %.idx39, !dbg !181
  store <8 x float> %293, ptr %301, align 64, !dbg !181
  %.idx40 = shl nuw nsw i64 %29, 5, !dbg !181
  %302 = getelementptr i8, ptr %8, i64 %.idx40, !dbg !181
  store <8 x float> %294, ptr %302, align 32, !dbg !181
  %.idx41 = shl nuw nsw i64 %35, 5, !dbg !181
  %303 = getelementptr i8, ptr %8, i64 %.idx41, !dbg !181
  store <8 x float> %295, ptr %303, align 64, !dbg !181
  %.idx42 = shl nuw nsw i64 %41, 5, !dbg !181
  %304 = getelementptr i8, ptr %8, i64 %.idx42, !dbg !181
  store <8 x float> %296, ptr %304, align 32, !dbg !181
  %.idx43 = shl nuw nsw i64 %47, 5, !dbg !181
  %305 = getelementptr i8, ptr %8, i64 %.idx43, !dbg !181
  store <8 x float> %297, ptr %305, align 64, !dbg !181
  %.idx44 = shl nuw nsw i64 %53, 5, !dbg !181
  %306 = getelementptr i8, ptr %8, i64 %.idx44, !dbg !181
  store <8 x float> %298, ptr %306, align 32, !dbg !181
  ret i32 0, !dbg !189
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_9_matmul_16x2x8_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !190 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !191
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !191
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !191
  %5 = getelementptr i8, ptr %4, i64 384, !dbg !191
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !191
  %6 = getelementptr i8, ptr %4, i64 256, !dbg !192
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !192
  %7 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !193
  %8 = load ptr, ptr %7, align 8, !dbg !193
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !193
  %9 = load i32, ptr %2, align 16, !dbg !194
  %10 = zext i32 %9 to i64, !dbg !194
  %11 = shl nuw nsw i64 %10, 3, !dbg !194
  %12 = shl nuw nsw i64 %10, 4, !dbg !195
  %13 = getelementptr [4 x i8], ptr %6, i64 %12, !dbg !195
  %14 = load <2 x float>, ptr %13, align 64, !dbg !195
  %15 = or disjoint i64 %11, 1, !dbg !195
  %16 = shl nuw nsw i64 %15, 1, !dbg !195
  %17 = getelementptr [4 x i8], ptr %6, i64 %16, !dbg !195
  %18 = load <2 x float>, ptr %17, align 8, !dbg !195
  %19 = or disjoint i64 %11, 2, !dbg !195
  %20 = shl nuw nsw i64 %19, 1, !dbg !195
  %21 = getelementptr [4 x i8], ptr %6, i64 %20, !dbg !195
  %22 = load <2 x float>, ptr %21, align 16, !dbg !195
  %23 = or disjoint i64 %11, 3, !dbg !195
  %24 = shl nuw nsw i64 %23, 1, !dbg !195
  %25 = getelementptr [4 x i8], ptr %6, i64 %24, !dbg !195
  %26 = load <2 x float>, ptr %25, align 8, !dbg !195
  %27 = or disjoint i64 %11, 4, !dbg !195
  %28 = shl nuw nsw i64 %27, 1, !dbg !195
  %29 = getelementptr [4 x i8], ptr %6, i64 %28, !dbg !195
  %30 = load <2 x float>, ptr %29, align 32, !dbg !195
  %31 = or disjoint i64 %11, 5, !dbg !195
  %32 = shl nuw nsw i64 %31, 1, !dbg !195
  %33 = getelementptr [4 x i8], ptr %6, i64 %32, !dbg !195
  %34 = load <2 x float>, ptr %33, align 8, !dbg !195
  %35 = or disjoint i64 %11, 6, !dbg !195
  %36 = shl nuw nsw i64 %35, 1, !dbg !195
  %37 = getelementptr [4 x i8], ptr %6, i64 %36, !dbg !195
  %38 = load <2 x float>, ptr %37, align 16, !dbg !195
  %39 = or disjoint i64 %11, 7, !dbg !195
  %40 = shl nuw nsw i64 %39, 1, !dbg !195
  %41 = getelementptr [4 x i8], ptr %6, i64 %40, !dbg !195
  %42 = load <2 x float>, ptr %41, align 8, !dbg !195
  %.idx = shl nuw nsw i64 %10, 8
  %43 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx
  %44 = load float, ptr %43, align 64
  %45 = insertelement <2 x float> poison, float %44, i64 0
  %46 = shufflevector <2 x float> %45, <2 x float> poison, <2 x i32> zeroinitializer
  %47 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %46, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx23 = shl nuw nsw i64 %15, 5
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx23
  %49 = load float, ptr %48, align 32
  %50 = insertelement <2 x float> poison, float %49, i64 0
  %51 = shufflevector <2 x float> %50, <2 x float> poison, <2 x i32> zeroinitializer
  %52 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %51, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx24 = shl nuw nsw i64 %19, 5
  %53 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx24
  %54 = load float, ptr %53, align 64
  %55 = insertelement <2 x float> poison, float %54, i64 0
  %56 = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> zeroinitializer
  %57 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %56, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx25 = shl nuw nsw i64 %23, 5
  %58 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx25
  %59 = load float, ptr %58, align 32
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %61, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx26 = shl nuw nsw i64 %27, 5
  %63 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx26
  %64 = load float, ptr %63, align 64
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx27 = shl nuw nsw i64 %31, 5
  %68 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx27
  %69 = load float, ptr %68, align 32
  %70 = insertelement <2 x float> poison, float %69, i64 0
  %71 = shufflevector <2 x float> %70, <2 x float> poison, <2 x i32> zeroinitializer
  %72 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %71, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx28 = shl nuw nsw i64 %35, 5
  %73 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx28
  %74 = load float, ptr %73, align 64
  %75 = insertelement <2 x float> poison, float %74, i64 0
  %76 = shufflevector <2 x float> %75, <2 x float> poison, <2 x i32> zeroinitializer
  %77 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %76, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %.idx29 = shl nuw nsw i64 %39, 5
  %78 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx29
  %79 = load float, ptr %78, align 32
  %80 = insertelement <2 x float> poison, float %79, i64 0
  %81 = shufflevector <2 x float> %80, <2 x float> poison, <2 x i32> zeroinitializer
  %82 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %81, <2 x float> <float 0xBFA3D00440000000, float 0x3F9AE9EFA0000000>, <2 x float> zeroinitializer)
  %83 = getelementptr inbounds nuw i8, ptr %43, i64 4
  %84 = load float, ptr %83, align 4
  %85 = insertelement <2 x float> poison, float %84, i64 0
  %86 = shufflevector <2 x float> %85, <2 x float> poison, <2 x i32> zeroinitializer
  %87 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %86, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %47)
  %88 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %89 = load float, ptr %88, align 4
  %90 = insertelement <2 x float> poison, float %89, i64 0
  %91 = shufflevector <2 x float> %90, <2 x float> poison, <2 x i32> zeroinitializer
  %92 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %91, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %52)
  %93 = getelementptr inbounds nuw i8, ptr %53, i64 4
  %94 = load float, ptr %93, align 4
  %95 = insertelement <2 x float> poison, float %94, i64 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %57)
  %98 = getelementptr inbounds nuw i8, ptr %58, i64 4
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i64 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %62)
  %103 = getelementptr inbounds nuw i8, ptr %63, i64 4
  %104 = load float, ptr %103, align 4
  %105 = insertelement <2 x float> poison, float %104, i64 0
  %106 = shufflevector <2 x float> %105, <2 x float> poison, <2 x i32> zeroinitializer
  %107 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %106, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %67)
  %108 = getelementptr inbounds nuw i8, ptr %68, i64 4
  %109 = load float, ptr %108, align 4
  %110 = insertelement <2 x float> poison, float %109, i64 0
  %111 = shufflevector <2 x float> %110, <2 x float> poison, <2 x i32> zeroinitializer
  %112 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %111, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %72)
  %113 = getelementptr inbounds nuw i8, ptr %73, i64 4
  %114 = load float, ptr %113, align 4
  %115 = insertelement <2 x float> poison, float %114, i64 0
  %116 = shufflevector <2 x float> %115, <2 x float> poison, <2 x i32> zeroinitializer
  %117 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %116, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %77)
  %118 = getelementptr inbounds nuw i8, ptr %78, i64 4
  %119 = load float, ptr %118, align 4
  %120 = insertelement <2 x float> poison, float %119, i64 0
  %121 = shufflevector <2 x float> %120, <2 x float> poison, <2 x i32> zeroinitializer
  %122 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %121, <2 x float> <float 0xBF712326E0000000, float 0x3F82E7E1A0000000>, <2 x float> %82)
  %123 = getelementptr inbounds nuw i8, ptr %43, i64 8
  %124 = load float, ptr %123, align 8
  %125 = insertelement <2 x float> poison, float %124, i64 0
  %126 = shufflevector <2 x float> %125, <2 x float> poison, <2 x i32> zeroinitializer
  %127 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %126, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %87)
  %128 = getelementptr inbounds nuw i8, ptr %48, i64 8
  %129 = load float, ptr %128, align 8
  %130 = insertelement <2 x float> poison, float %129, i64 0
  %131 = shufflevector <2 x float> %130, <2 x float> poison, <2 x i32> zeroinitializer
  %132 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %131, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %92)
  %133 = getelementptr inbounds nuw i8, ptr %53, i64 8
  %134 = load float, ptr %133, align 8
  %135 = insertelement <2 x float> poison, float %134, i64 0
  %136 = shufflevector <2 x float> %135, <2 x float> poison, <2 x i32> zeroinitializer
  %137 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %136, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %97)
  %138 = getelementptr inbounds nuw i8, ptr %58, i64 8
  %139 = load float, ptr %138, align 8
  %140 = insertelement <2 x float> poison, float %139, i64 0
  %141 = shufflevector <2 x float> %140, <2 x float> poison, <2 x i32> zeroinitializer
  %142 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %141, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %102)
  %143 = getelementptr inbounds nuw i8, ptr %63, i64 8
  %144 = load float, ptr %143, align 8
  %145 = insertelement <2 x float> poison, float %144, i64 0
  %146 = shufflevector <2 x float> %145, <2 x float> poison, <2 x i32> zeroinitializer
  %147 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %146, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %107)
  %148 = getelementptr inbounds nuw i8, ptr %68, i64 8
  %149 = load float, ptr %148, align 8
  %150 = insertelement <2 x float> poison, float %149, i64 0
  %151 = shufflevector <2 x float> %150, <2 x float> poison, <2 x i32> zeroinitializer
  %152 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %151, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %112)
  %153 = getelementptr inbounds nuw i8, ptr %73, i64 8
  %154 = load float, ptr %153, align 8
  %155 = insertelement <2 x float> poison, float %154, i64 0
  %156 = shufflevector <2 x float> %155, <2 x float> poison, <2 x i32> zeroinitializer
  %157 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %156, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %117)
  %158 = getelementptr inbounds nuw i8, ptr %78, i64 8
  %159 = load float, ptr %158, align 8
  %160 = insertelement <2 x float> poison, float %159, i64 0
  %161 = shufflevector <2 x float> %160, <2 x float> poison, <2 x i32> zeroinitializer
  %162 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %161, <2 x float> <float 0xBF515CA0C0000000, float 0x3F9871AA00000000>, <2 x float> %122)
  %163 = getelementptr inbounds nuw i8, ptr %43, i64 12
  %164 = load float, ptr %163, align 4
  %165 = insertelement <2 x float> poison, float %164, i64 0
  %166 = shufflevector <2 x float> %165, <2 x float> poison, <2 x i32> zeroinitializer
  %167 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %166, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %127)
  %168 = getelementptr inbounds nuw i8, ptr %48, i64 12
  %169 = load float, ptr %168, align 4
  %170 = insertelement <2 x float> poison, float %169, i64 0
  %171 = shufflevector <2 x float> %170, <2 x float> poison, <2 x i32> zeroinitializer
  %172 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %171, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %132)
  %173 = getelementptr inbounds nuw i8, ptr %53, i64 12
  %174 = load float, ptr %173, align 4
  %175 = insertelement <2 x float> poison, float %174, i64 0
  %176 = shufflevector <2 x float> %175, <2 x float> poison, <2 x i32> zeroinitializer
  %177 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %176, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %137)
  %178 = getelementptr inbounds nuw i8, ptr %58, i64 12
  %179 = load float, ptr %178, align 4
  %180 = insertelement <2 x float> poison, float %179, i64 0
  %181 = shufflevector <2 x float> %180, <2 x float> poison, <2 x i32> zeroinitializer
  %182 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %181, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %142)
  %183 = getelementptr inbounds nuw i8, ptr %63, i64 12
  %184 = load float, ptr %183, align 4
  %185 = insertelement <2 x float> poison, float %184, i64 0
  %186 = shufflevector <2 x float> %185, <2 x float> poison, <2 x i32> zeroinitializer
  %187 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %186, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %147)
  %188 = getelementptr inbounds nuw i8, ptr %68, i64 12
  %189 = load float, ptr %188, align 4
  %190 = insertelement <2 x float> poison, float %189, i64 0
  %191 = shufflevector <2 x float> %190, <2 x float> poison, <2 x i32> zeroinitializer
  %192 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %191, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %152)
  %193 = getelementptr inbounds nuw i8, ptr %73, i64 12
  %194 = load float, ptr %193, align 4
  %195 = insertelement <2 x float> poison, float %194, i64 0
  %196 = shufflevector <2 x float> %195, <2 x float> poison, <2 x i32> zeroinitializer
  %197 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %196, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %157)
  %198 = getelementptr inbounds nuw i8, ptr %78, i64 12
  %199 = load float, ptr %198, align 4
  %200 = insertelement <2 x float> poison, float %199, i64 0
  %201 = shufflevector <2 x float> %200, <2 x float> poison, <2 x i32> zeroinitializer
  %202 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %201, <2 x float> <float 0x3F817F4E40000000, float 0x3F45818120000000>, <2 x float> %162)
  %203 = getelementptr inbounds nuw i8, ptr %43, i64 16
  %204 = load float, ptr %203, align 16
  %205 = insertelement <2 x float> poison, float %204, i64 0
  %206 = shufflevector <2 x float> %205, <2 x float> poison, <2 x i32> zeroinitializer
  %207 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %206, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %167)
  %208 = getelementptr inbounds nuw i8, ptr %48, i64 16
  %209 = load float, ptr %208, align 16
  %210 = insertelement <2 x float> poison, float %209, i64 0
  %211 = shufflevector <2 x float> %210, <2 x float> poison, <2 x i32> zeroinitializer
  %212 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %211, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %172)
  %213 = getelementptr inbounds nuw i8, ptr %53, i64 16
  %214 = load float, ptr %213, align 16
  %215 = insertelement <2 x float> poison, float %214, i64 0
  %216 = shufflevector <2 x float> %215, <2 x float> poison, <2 x i32> zeroinitializer
  %217 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %216, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %177)
  %218 = getelementptr inbounds nuw i8, ptr %58, i64 16
  %219 = load float, ptr %218, align 16
  %220 = insertelement <2 x float> poison, float %219, i64 0
  %221 = shufflevector <2 x float> %220, <2 x float> poison, <2 x i32> zeroinitializer
  %222 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %221, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %182)
  %223 = getelementptr inbounds nuw i8, ptr %63, i64 16
  %224 = load float, ptr %223, align 16
  %225 = insertelement <2 x float> poison, float %224, i64 0
  %226 = shufflevector <2 x float> %225, <2 x float> poison, <2 x i32> zeroinitializer
  %227 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %226, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %187)
  %228 = getelementptr inbounds nuw i8, ptr %68, i64 16
  %229 = load float, ptr %228, align 16
  %230 = insertelement <2 x float> poison, float %229, i64 0
  %231 = shufflevector <2 x float> %230, <2 x float> poison, <2 x i32> zeroinitializer
  %232 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %231, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %192)
  %233 = getelementptr inbounds nuw i8, ptr %73, i64 16
  %234 = load float, ptr %233, align 16
  %235 = insertelement <2 x float> poison, float %234, i64 0
  %236 = shufflevector <2 x float> %235, <2 x float> poison, <2 x i32> zeroinitializer
  %237 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %236, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %197)
  %238 = getelementptr inbounds nuw i8, ptr %78, i64 16
  %239 = load float, ptr %238, align 16
  %240 = insertelement <2 x float> poison, float %239, i64 0
  %241 = shufflevector <2 x float> %240, <2 x float> poison, <2 x i32> zeroinitializer
  %242 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %241, <2 x float> <float 0xBF66F9C720000000, float 0x3FB0FAB2A0000000>, <2 x float> %202)
  %243 = getelementptr inbounds nuw i8, ptr %43, i64 20
  %244 = load float, ptr %243, align 4
  %245 = insertelement <2 x float> poison, float %244, i64 0
  %246 = shufflevector <2 x float> %245, <2 x float> poison, <2 x i32> zeroinitializer
  %247 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %246, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %207)
  %248 = getelementptr inbounds nuw i8, ptr %48, i64 20
  %249 = load float, ptr %248, align 4
  %250 = insertelement <2 x float> poison, float %249, i64 0
  %251 = shufflevector <2 x float> %250, <2 x float> poison, <2 x i32> zeroinitializer
  %252 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %251, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %212)
  %253 = getelementptr inbounds nuw i8, ptr %53, i64 20
  %254 = load float, ptr %253, align 4
  %255 = insertelement <2 x float> poison, float %254, i64 0
  %256 = shufflevector <2 x float> %255, <2 x float> poison, <2 x i32> zeroinitializer
  %257 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %256, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %217)
  %258 = getelementptr inbounds nuw i8, ptr %58, i64 20
  %259 = load float, ptr %258, align 4
  %260 = insertelement <2 x float> poison, float %259, i64 0
  %261 = shufflevector <2 x float> %260, <2 x float> poison, <2 x i32> zeroinitializer
  %262 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %261, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %222)
  %263 = getelementptr inbounds nuw i8, ptr %63, i64 20
  %264 = load float, ptr %263, align 4
  %265 = insertelement <2 x float> poison, float %264, i64 0
  %266 = shufflevector <2 x float> %265, <2 x float> poison, <2 x i32> zeroinitializer
  %267 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %266, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %227)
  %268 = getelementptr inbounds nuw i8, ptr %68, i64 20
  %269 = load float, ptr %268, align 4
  %270 = insertelement <2 x float> poison, float %269, i64 0
  %271 = shufflevector <2 x float> %270, <2 x float> poison, <2 x i32> zeroinitializer
  %272 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %271, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %232)
  %273 = getelementptr inbounds nuw i8, ptr %73, i64 20
  %274 = load float, ptr %273, align 4
  %275 = insertelement <2 x float> poison, float %274, i64 0
  %276 = shufflevector <2 x float> %275, <2 x float> poison, <2 x i32> zeroinitializer
  %277 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %276, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %237)
  %278 = getelementptr inbounds nuw i8, ptr %78, i64 20
  %279 = load float, ptr %278, align 4
  %280 = insertelement <2 x float> poison, float %279, i64 0
  %281 = shufflevector <2 x float> %280, <2 x float> poison, <2 x i32> zeroinitializer
  %282 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %281, <2 x float> <float 0xBF73016300000000, float 0x3FA6574200000000>, <2 x float> %242)
  %283 = getelementptr inbounds nuw i8, ptr %43, i64 24
  %284 = load float, ptr %283, align 8
  %285 = insertelement <2 x float> poison, float %284, i64 0
  %286 = shufflevector <2 x float> %285, <2 x float> poison, <2 x i32> zeroinitializer
  %287 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %286, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %247)
  %288 = getelementptr inbounds nuw i8, ptr %48, i64 24
  %289 = load float, ptr %288, align 8
  %290 = insertelement <2 x float> poison, float %289, i64 0
  %291 = shufflevector <2 x float> %290, <2 x float> poison, <2 x i32> zeroinitializer
  %292 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %291, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %252)
  %293 = getelementptr inbounds nuw i8, ptr %53, i64 24
  %294 = load float, ptr %293, align 8
  %295 = insertelement <2 x float> poison, float %294, i64 0
  %296 = shufflevector <2 x float> %295, <2 x float> poison, <2 x i32> zeroinitializer
  %297 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %296, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %257)
  %298 = getelementptr inbounds nuw i8, ptr %58, i64 24
  %299 = load float, ptr %298, align 8
  %300 = insertelement <2 x float> poison, float %299, i64 0
  %301 = shufflevector <2 x float> %300, <2 x float> poison, <2 x i32> zeroinitializer
  %302 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %301, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %262)
  %303 = getelementptr inbounds nuw i8, ptr %63, i64 24
  %304 = load float, ptr %303, align 8
  %305 = insertelement <2 x float> poison, float %304, i64 0
  %306 = shufflevector <2 x float> %305, <2 x float> poison, <2 x i32> zeroinitializer
  %307 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %306, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %267)
  %308 = getelementptr inbounds nuw i8, ptr %68, i64 24
  %309 = load float, ptr %308, align 8
  %310 = insertelement <2 x float> poison, float %309, i64 0
  %311 = shufflevector <2 x float> %310, <2 x float> poison, <2 x i32> zeroinitializer
  %312 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %311, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %272)
  %313 = getelementptr inbounds nuw i8, ptr %73, i64 24
  %314 = load float, ptr %313, align 8
  %315 = insertelement <2 x float> poison, float %314, i64 0
  %316 = shufflevector <2 x float> %315, <2 x float> poison, <2 x i32> zeroinitializer
  %317 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %316, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %277)
  %318 = getelementptr inbounds nuw i8, ptr %78, i64 24
  %319 = load float, ptr %318, align 8
  %320 = insertelement <2 x float> poison, float %319, i64 0
  %321 = shufflevector <2 x float> %320, <2 x float> poison, <2 x i32> zeroinitializer
  %322 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %321, <2 x float> <float 0x3F95E146E0000000, float 0x3F710DFE80000000>, <2 x float> %282)
  %323 = getelementptr inbounds nuw i8, ptr %43, i64 28
  %324 = load float, ptr %323, align 4
  %325 = insertelement <2 x float> poison, float %324, i64 0
  %326 = shufflevector <2 x float> %325, <2 x float> poison, <2 x i32> zeroinitializer
  %327 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %326, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %287)
  %328 = getelementptr inbounds nuw i8, ptr %48, i64 28
  %329 = load float, ptr %328, align 4
  %330 = insertelement <2 x float> poison, float %329, i64 0
  %331 = shufflevector <2 x float> %330, <2 x float> poison, <2 x i32> zeroinitializer
  %332 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %331, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %292)
  %333 = getelementptr inbounds nuw i8, ptr %53, i64 28
  %334 = load float, ptr %333, align 4
  %335 = insertelement <2 x float> poison, float %334, i64 0
  %336 = shufflevector <2 x float> %335, <2 x float> poison, <2 x i32> zeroinitializer
  %337 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %336, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %297)
  %338 = getelementptr inbounds nuw i8, ptr %58, i64 28
  %339 = load float, ptr %338, align 4
  %340 = insertelement <2 x float> poison, float %339, i64 0
  %341 = shufflevector <2 x float> %340, <2 x float> poison, <2 x i32> zeroinitializer
  %342 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %341, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %302)
  %343 = getelementptr inbounds nuw i8, ptr %63, i64 28
  %344 = load float, ptr %343, align 4
  %345 = insertelement <2 x float> poison, float %344, i64 0
  %346 = shufflevector <2 x float> %345, <2 x float> poison, <2 x i32> zeroinitializer
  %347 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %346, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %307)
  %348 = getelementptr inbounds nuw i8, ptr %68, i64 28
  %349 = load float, ptr %348, align 4
  %350 = insertelement <2 x float> poison, float %349, i64 0
  %351 = shufflevector <2 x float> %350, <2 x float> poison, <2 x i32> zeroinitializer
  %352 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %351, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %312)
  %353 = getelementptr inbounds nuw i8, ptr %73, i64 28
  %354 = load float, ptr %353, align 4
  %355 = insertelement <2 x float> poison, float %354, i64 0
  %356 = shufflevector <2 x float> %355, <2 x float> poison, <2 x i32> zeroinitializer
  %357 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %317)
  %358 = getelementptr inbounds nuw i8, ptr %78, i64 28
  %359 = load float, ptr %358, align 4
  %360 = insertelement <2 x float> poison, float %359, i64 0
  %361 = shufflevector <2 x float> %360, <2 x float> poison, <2 x i32> zeroinitializer
  %362 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %361, <2 x float> <float 0x3F90CB13A0000000, float 0x3F88E3BDA0000000>, <2 x float> %322)
  %363 = fadd contract <2 x float> %14, %327, !dbg !196
  %364 = fadd contract <2 x float> %18, %332, !dbg !196
  %365 = fadd contract <2 x float> %22, %337, !dbg !196
  %366 = fadd contract <2 x float> %26, %342, !dbg !196
  %367 = fadd contract <2 x float> %30, %347, !dbg !196
  %368 = fadd contract <2 x float> %34, %352, !dbg !196
  %369 = fadd contract <2 x float> %38, %357, !dbg !196
  %370 = fadd contract <2 x float> %42, %362, !dbg !196
  %371 = getelementptr [4 x i8], ptr %8, i64 %12, !dbg !196
  store <2 x float> %363, ptr %371, align 64, !dbg !196
  %372 = getelementptr [4 x i8], ptr %8, i64 %16, !dbg !196
  store <2 x float> %364, ptr %372, align 8, !dbg !196
  %373 = getelementptr [4 x i8], ptr %8, i64 %20, !dbg !196
  store <2 x float> %365, ptr %373, align 16, !dbg !196
  %374 = getelementptr [4 x i8], ptr %8, i64 %24, !dbg !196
  store <2 x float> %366, ptr %374, align 8, !dbg !196
  %375 = getelementptr [4 x i8], ptr %8, i64 %28, !dbg !196
  store <2 x float> %367, ptr %375, align 32, !dbg !196
  %376 = getelementptr [4 x i8], ptr %8, i64 %32, !dbg !196
  store <2 x float> %368, ptr %376, align 8, !dbg !196
  %377 = getelementptr [4 x i8], ptr %8, i64 %36, !dbg !196
  store <2 x float> %369, ptr %377, align 16, !dbg !196
  %378 = getelementptr [4 x i8], ptr %8, i64 %40, !dbg !196
  store <2 x float> %370, ptr %378, align 8, !dbg !196
  ret i32 0, !dbg !197
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_11_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !198 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !199
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !199
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !199
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !199
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !199
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !200
  %7 = load ptr, ptr %6, align 8, !dbg !200
  %8 = getelementptr i8, ptr %7, i64 256, !dbg !200
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !200
  %9 = load i32, ptr %2, align 16, !dbg !201
  %10 = zext i32 %9 to i64, !dbg !201
  %11 = shl nuw nsw i64 %10, 2, !dbg !201
  %12 = getelementptr [4 x i8], ptr %5, i64 %11, !dbg !201
  %13 = load <2 x float>, ptr %12, align 16, !dbg !201
  %14 = or disjoint i64 %11, 2, !dbg !201
  %15 = getelementptr [4 x i8], ptr %5, i64 %14, !dbg !201
  %16 = load <2 x float>, ptr %15, align 8, !dbg !201
  %17 = fmul contract <2 x float> %13, %13, !dbg !202
  %18 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %17), !dbg !202
  %19 = fmul contract <2 x float> %16, %16, !dbg !202
  %20 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %19), !dbg !202
  %21 = insertelement <2 x float> poison, float %18, i64 0, !dbg !202
  %22 = insertelement <2 x float> %21, float %20, i64 1, !dbg !202
  %23 = fmul <2 x float> %22, splat (float 5.000000e-01), !dbg !203
  %24 = fadd contract <2 x float> %23, splat (float 0x3EE4F8B580000000), !dbg !204
  %25 = tail call <2 x float> @llvm.sqrt.v2f32(<2 x float> %24), !dbg !205
  %26 = fdiv <2 x float> splat (float 1.000000e+00), %25, !dbg !205
  %27 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !205
  %28 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !205
  %29 = fmul contract <2 x float> %13, %27, !dbg !206
  %30 = fmul contract <2 x float> %16, %28, !dbg !206
  %31 = fadd contract <2 x float> %29, zeroinitializer, !dbg !207
  %32 = fadd contract <2 x float> %30, zeroinitializer, !dbg !207
  %33 = getelementptr [4 x i8], ptr %8, i64 %11, !dbg !207
  store <2 x float> %31, ptr %33, align 16, !dbg !207
  %34 = getelementptr [4 x i8], ptr %8, i64 %14, !dbg !207
  store <2 x float> %32, ptr %34, align 8, !dbg !207
  ret i32 0, !dbg !208
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_12_matmul_16x6x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !209 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !210
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !210
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !210
  %5 = getelementptr i8, ptr %4, i64 256, !dbg !210
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !210
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !211
  %7 = load ptr, ptr %6, align 8, !dbg !211
  %8 = getelementptr i8, ptr %7, i64 384, !dbg !211
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !211
  %9 = load i32, ptr %2, align 16, !dbg !212
  %10 = zext i32 %9 to i64, !dbg !212
  %11 = shl nuw nsw i64 %10, 3, !dbg !212
  %.idx30 = shl nuw nsw i64 %10, 6
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx30
  %13 = load float, ptr %12, align 64
  %14 = insertelement <6 x float> poison, float %13, i64 0
  %15 = shufflevector <6 x float> %14, <6 x float> poison, <6 x i32> zeroinitializer
  %16 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %15, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %17 = or disjoint i64 %11, 1, !dbg !213
  %.idx31 = shl nuw nsw i64 %17, 3
  %18 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx31
  %19 = load float, ptr %18, align 8
  %20 = insertelement <6 x float> poison, float %19, i64 0
  %21 = shufflevector <6 x float> %20, <6 x float> poison, <6 x i32> zeroinitializer
  %22 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %21, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %23 = or disjoint i64 %11, 2, !dbg !213
  %.idx32 = shl nuw nsw i64 %23, 3
  %24 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx32
  %25 = load float, ptr %24, align 16
  %26 = insertelement <6 x float> poison, float %25, i64 0
  %27 = shufflevector <6 x float> %26, <6 x float> poison, <6 x i32> zeroinitializer
  %28 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %27, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %29 = or disjoint i64 %11, 3, !dbg !213
  %.idx33 = shl nuw nsw i64 %29, 3
  %30 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx33
  %31 = load float, ptr %30, align 8
  %32 = insertelement <6 x float> poison, float %31, i64 0
  %33 = shufflevector <6 x float> %32, <6 x float> poison, <6 x i32> zeroinitializer
  %34 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %33, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %35 = or disjoint i64 %11, 4, !dbg !213
  %.idx34 = shl nuw nsw i64 %35, 3
  %36 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx34
  %37 = load float, ptr %36, align 32
  %38 = insertelement <6 x float> poison, float %37, i64 0
  %39 = shufflevector <6 x float> %38, <6 x float> poison, <6 x i32> zeroinitializer
  %40 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %39, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %41 = or disjoint i64 %11, 5, !dbg !213
  %.idx35 = shl nuw nsw i64 %41, 3
  %42 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx35
  %43 = load float, ptr %42, align 8
  %44 = insertelement <6 x float> poison, float %43, i64 0
  %45 = shufflevector <6 x float> %44, <6 x float> poison, <6 x i32> zeroinitializer
  %46 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %45, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %47 = or disjoint i64 %11, 6, !dbg !213
  %.idx36 = shl nuw nsw i64 %47, 3
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx36
  %49 = load float, ptr %48, align 16
  %50 = insertelement <6 x float> poison, float %49, i64 0
  %51 = shufflevector <6 x float> %50, <6 x float> poison, <6 x i32> zeroinitializer
  %52 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %51, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %53 = or disjoint i64 %11, 7, !dbg !213
  %.idx37 = shl nuw nsw i64 %53, 3
  %54 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx37
  %55 = load float, ptr %54, align 8
  %56 = insertelement <6 x float> poison, float %55, i64 0
  %57 = shufflevector <6 x float> %56, <6 x float> poison, <6 x i32> zeroinitializer
  %58 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %57, <6 x float> <float 0x3F86439480000000, float 0x3F7BC91A40000000, float 0xBF75F6D060000000, float 0xBF51B18C00000000, float 0xBF8BF20FC0000000, float 0x3F5D1A7840000000>, <6 x float> zeroinitializer)
  %59 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %60 = load float, ptr %59, align 4
  %61 = insertelement <6 x float> poison, float %60, i64 0
  %62 = shufflevector <6 x float> %61, <6 x float> poison, <6 x i32> zeroinitializer
  %63 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %62, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %16)
  %64 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %65 = load float, ptr %64, align 4
  %66 = insertelement <6 x float> poison, float %65, i64 0
  %67 = shufflevector <6 x float> %66, <6 x float> poison, <6 x i32> zeroinitializer
  %68 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %67, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %22)
  %69 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %70 = load float, ptr %69, align 4
  %71 = insertelement <6 x float> poison, float %70, i64 0
  %72 = shufflevector <6 x float> %71, <6 x float> poison, <6 x i32> zeroinitializer
  %73 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %72, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %28)
  %74 = getelementptr inbounds nuw i8, ptr %30, i64 4
  %75 = load float, ptr %74, align 4
  %76 = insertelement <6 x float> poison, float %75, i64 0
  %77 = shufflevector <6 x float> %76, <6 x float> poison, <6 x i32> zeroinitializer
  %78 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %77, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %34)
  %79 = getelementptr inbounds nuw i8, ptr %36, i64 4
  %80 = load float, ptr %79, align 4
  %81 = insertelement <6 x float> poison, float %80, i64 0
  %82 = shufflevector <6 x float> %81, <6 x float> poison, <6 x i32> zeroinitializer
  %83 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %82, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %40)
  %84 = getelementptr inbounds nuw i8, ptr %42, i64 4
  %85 = load float, ptr %84, align 4
  %86 = insertelement <6 x float> poison, float %85, i64 0
  %87 = shufflevector <6 x float> %86, <6 x float> poison, <6 x i32> zeroinitializer
  %88 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %87, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %46)
  %89 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %90 = load float, ptr %89, align 4
  %91 = insertelement <6 x float> poison, float %90, i64 0
  %92 = shufflevector <6 x float> %91, <6 x float> poison, <6 x i32> zeroinitializer
  %93 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %92, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %52)
  %94 = getelementptr inbounds nuw i8, ptr %54, i64 4
  %95 = load float, ptr %94, align 4
  %96 = insertelement <6 x float> poison, float %95, i64 0
  %97 = shufflevector <6 x float> %96, <6 x float> poison, <6 x i32> zeroinitializer
  %98 = tail call <6 x float> @llvm.fmuladd.v6f32(<6 x float> %97, <6 x float> <float 0xBF78244DA0000000, float 0xBF96A8A7E0000000, float 0xBF57FDC5A0000000, float 0x3F923D6660000000, float 0x3F78F02E40000000, float 0xBF72558EE0000000>, <6 x float> %58)
  %.idx = mul nuw nsw i64 %10, 192, !dbg !213
  %99 = getelementptr i8, ptr %8, i64 %.idx, !dbg !213
  store <6 x float> %63, ptr %99, align 64, !dbg !213
  %.idx23 = mul nuw nsw i64 %17, 24, !dbg !213
  %100 = getelementptr i8, ptr %8, i64 %.idx23, !dbg !213
  store <6 x float> %68, ptr %100, align 8, !dbg !213
  %.idx24 = mul nuw nsw i64 %23, 24, !dbg !213
  %101 = getelementptr i8, ptr %8, i64 %.idx24, !dbg !213
  store <6 x float> %73, ptr %101, align 16, !dbg !213
  %.idx25 = mul nuw nsw i64 %29, 24, !dbg !213
  %102 = getelementptr i8, ptr %8, i64 %.idx25, !dbg !213
  store <6 x float> %78, ptr %102, align 8, !dbg !213
  %.idx26 = mul nuw nsw i64 %35, 24, !dbg !213
  %103 = getelementptr i8, ptr %8, i64 %.idx26, !dbg !213
  store <6 x float> %83, ptr %103, align 32, !dbg !213
  %.idx27 = mul nuw nsw i64 %41, 24, !dbg !213
  %104 = getelementptr i8, ptr %8, i64 %.idx27, !dbg !213
  store <6 x float> %88, ptr %104, align 8, !dbg !213
  %.idx28 = mul nuw nsw i64 %47, 24, !dbg !213
  %105 = getelementptr i8, ptr %8, i64 %.idx28, !dbg !213
  store <6 x float> %93, ptr %105, align 16, !dbg !213
  %.idx29 = mul nuw nsw i64 %53, 24, !dbg !213
  %106 = getelementptr i8, ptr %8, i64 %.idx29, !dbg !213
  store <6 x float> %98, ptr %106, align 8, !dbg !213
  ret i32 0, !dbg !214
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_14_matmul_16x2x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !215 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !216
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !216
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !216
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !216
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !216
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !217
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !218
  %7 = load ptr, ptr %6, align 8, !dbg !218
  %8 = getelementptr i8, ptr %7, i64 256, !dbg !218
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !218
  %9 = load i32, ptr %2, align 16, !dbg !219
  %10 = zext i32 %9 to i64, !dbg !219
  %11 = shl nuw nsw i64 %10, 3, !dbg !219
  %12 = shl nuw nsw i64 %10, 4, !dbg !220
  %13 = getelementptr [4 x i8], ptr %4, i64 %12, !dbg !220
  %14 = load <2 x float>, ptr %13, align 64, !dbg !220
  %15 = or disjoint i64 %11, 1, !dbg !220
  %16 = shl nuw nsw i64 %15, 1, !dbg !220
  %17 = getelementptr [4 x i8], ptr %4, i64 %16, !dbg !220
  %18 = load <2 x float>, ptr %17, align 8, !dbg !220
  %19 = or disjoint i64 %11, 2, !dbg !220
  %20 = shl nuw nsw i64 %19, 1, !dbg !220
  %21 = getelementptr [4 x i8], ptr %4, i64 %20, !dbg !220
  %22 = load <2 x float>, ptr %21, align 16, !dbg !220
  %23 = or disjoint i64 %11, 3, !dbg !220
  %24 = shl nuw nsw i64 %23, 1, !dbg !220
  %25 = getelementptr [4 x i8], ptr %4, i64 %24, !dbg !220
  %26 = load <2 x float>, ptr %25, align 8, !dbg !220
  %27 = or disjoint i64 %11, 4, !dbg !220
  %28 = shl nuw nsw i64 %27, 1, !dbg !220
  %29 = getelementptr [4 x i8], ptr %4, i64 %28, !dbg !220
  %30 = load <2 x float>, ptr %29, align 32, !dbg !220
  %31 = or disjoint i64 %11, 5, !dbg !220
  %32 = shl nuw nsw i64 %31, 1, !dbg !220
  %33 = getelementptr [4 x i8], ptr %4, i64 %32, !dbg !220
  %34 = load <2 x float>, ptr %33, align 8, !dbg !220
  %35 = or disjoint i64 %11, 6, !dbg !220
  %36 = shl nuw nsw i64 %35, 1, !dbg !220
  %37 = getelementptr [4 x i8], ptr %4, i64 %36, !dbg !220
  %38 = load <2 x float>, ptr %37, align 16, !dbg !220
  %39 = or disjoint i64 %11, 7, !dbg !220
  %40 = shl nuw nsw i64 %39, 1, !dbg !220
  %41 = getelementptr [4 x i8], ptr %4, i64 %40, !dbg !220
  %42 = load <2 x float>, ptr %41, align 8, !dbg !220
  %43 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %11
  %44 = load float, ptr %43, align 32
  %45 = insertelement <2 x float> poison, float %44, i64 0
  %46 = shufflevector <2 x float> %45, <2 x float> poison, <2 x i32> zeroinitializer
  %47 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %46, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %48 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %15
  %49 = load float, ptr %48, align 4
  %50 = insertelement <2 x float> poison, float %49, i64 0
  %51 = shufflevector <2 x float> %50, <2 x float> poison, <2 x i32> zeroinitializer
  %52 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %51, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %53 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %19
  %54 = load float, ptr %53, align 8
  %55 = insertelement <2 x float> poison, float %54, i64 0
  %56 = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> zeroinitializer
  %57 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %56, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %58 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %23
  %59 = load float, ptr %58, align 4
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %61, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %63 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %27
  %64 = load float, ptr %63, align 16
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %68 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %31
  %69 = load float, ptr %68, align 4
  %70 = insertelement <2 x float> poison, float %69, i64 0
  %71 = shufflevector <2 x float> %70, <2 x float> poison, <2 x i32> zeroinitializer
  %72 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %71, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %73 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %35
  %74 = load float, ptr %73, align 8
  %75 = insertelement <2 x float> poison, float %74, i64 0
  %76 = shufflevector <2 x float> %75, <2 x float> poison, <2 x i32> zeroinitializer
  %77 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %76, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %78 = getelementptr inbounds nuw [4 x i8], ptr %5, i64 %39
  %79 = load float, ptr %78, align 4
  %80 = insertelement <2 x float> poison, float %79, i64 0
  %81 = shufflevector <2 x float> %80, <2 x float> poison, <2 x i32> zeroinitializer
  %82 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %81, <2 x float> <float 0x3F7E5A98A0000000, float 0x3F853F9CA0000000>, <2 x float> zeroinitializer)
  %83 = getelementptr inbounds nuw i8, ptr %43, i64 64
  %84 = load float, ptr %83, align 32
  %85 = insertelement <2 x float> poison, float %84, i64 0
  %86 = shufflevector <2 x float> %85, <2 x float> poison, <2 x i32> zeroinitializer
  %87 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %86, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %47)
  %88 = getelementptr inbounds nuw i8, ptr %43, i64 68
  %89 = load float, ptr %88, align 4
  %90 = insertelement <2 x float> poison, float %89, i64 0
  %91 = shufflevector <2 x float> %90, <2 x float> poison, <2 x i32> zeroinitializer
  %92 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %91, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %52)
  %93 = getelementptr inbounds nuw i8, ptr %43, i64 72
  %94 = load float, ptr %93, align 8
  %95 = insertelement <2 x float> poison, float %94, i64 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %57)
  %98 = getelementptr inbounds nuw i8, ptr %43, i64 76
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i64 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %62)
  %103 = getelementptr inbounds nuw i8, ptr %43, i64 80
  %104 = load float, ptr %103, align 16
  %105 = insertelement <2 x float> poison, float %104, i64 0
  %106 = shufflevector <2 x float> %105, <2 x float> poison, <2 x i32> zeroinitializer
  %107 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %106, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %67)
  %108 = getelementptr inbounds nuw i8, ptr %43, i64 84
  %109 = load float, ptr %108, align 4
  %110 = insertelement <2 x float> poison, float %109, i64 0
  %111 = shufflevector <2 x float> %110, <2 x float> poison, <2 x i32> zeroinitializer
  %112 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %111, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %72)
  %113 = getelementptr inbounds nuw i8, ptr %43, i64 88
  %114 = load float, ptr %113, align 8
  %115 = insertelement <2 x float> poison, float %114, i64 0
  %116 = shufflevector <2 x float> %115, <2 x float> poison, <2 x i32> zeroinitializer
  %117 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %116, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %77)
  %118 = getelementptr inbounds nuw i8, ptr %43, i64 92
  %119 = load float, ptr %118, align 4
  %120 = insertelement <2 x float> poison, float %119, i64 0
  %121 = shufflevector <2 x float> %120, <2 x float> poison, <2 x i32> zeroinitializer
  %122 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %121, <2 x float> <float 0x3F92D937E0000000, float 0xBF95926AA0000000>, <2 x float> %82)
  %123 = fadd contract <2 x float> %14, %87, !dbg !221
  %124 = fadd contract <2 x float> %18, %92, !dbg !221
  %125 = fadd contract <2 x float> %22, %97, !dbg !221
  %126 = fadd contract <2 x float> %26, %102, !dbg !221
  %127 = fadd contract <2 x float> %30, %107, !dbg !221
  %128 = fadd contract <2 x float> %34, %112, !dbg !221
  %129 = fadd contract <2 x float> %38, %117, !dbg !221
  %130 = fadd contract <2 x float> %42, %122, !dbg !221
  %131 = getelementptr [4 x i8], ptr %8, i64 %12, !dbg !221
  store <2 x float> %123, ptr %131, align 64, !dbg !221
  %132 = getelementptr [4 x i8], ptr %8, i64 %16, !dbg !221
  store <2 x float> %124, ptr %132, align 8, !dbg !221
  %133 = getelementptr [4 x i8], ptr %8, i64 %20, !dbg !221
  store <2 x float> %125, ptr %133, align 16, !dbg !221
  %134 = getelementptr [4 x i8], ptr %8, i64 %24, !dbg !221
  store <2 x float> %126, ptr %134, align 8, !dbg !221
  %135 = getelementptr [4 x i8], ptr %8, i64 %28, !dbg !221
  store <2 x float> %127, ptr %135, align 32, !dbg !221
  %136 = getelementptr [4 x i8], ptr %8, i64 %32, !dbg !221
  store <2 x float> %128, ptr %136, align 8, !dbg !221
  %137 = getelementptr [4 x i8], ptr %8, i64 %36, !dbg !221
  store <2 x float> %129, ptr %137, align 16, !dbg !221
  %138 = getelementptr [4 x i8], ptr %8, i64 %40, !dbg !221
  store <2 x float> %130, ptr %138, align 8, !dbg !221
  ret i32 0, !dbg !222
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_16_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !223 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !224
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !224
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !224
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !224
  %5 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !225
  %6 = load ptr, ptr %5, align 8, !dbg !225
  %7 = getelementptr i8, ptr %6, i64 128, !dbg !225
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !225
  %8 = load i32, ptr %2, align 16, !dbg !226
  %9 = zext i32 %8 to i64, !dbg !226
  %10 = shl nuw nsw i64 %9, 2, !dbg !226
  %11 = getelementptr [4 x i8], ptr %4, i64 %10, !dbg !226
  %12 = load <2 x float>, ptr %11, align 16, !dbg !226
  %13 = or disjoint i64 %10, 2, !dbg !226
  %14 = getelementptr [4 x i8], ptr %4, i64 %13, !dbg !226
  %15 = load <2 x float>, ptr %14, align 8, !dbg !226
  %16 = fmul contract <2 x float> %12, %12, !dbg !227
  %17 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %16), !dbg !227
  %18 = fmul contract <2 x float> %15, %15, !dbg !227
  %19 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %18), !dbg !227
  %20 = insertelement <2 x float> poison, float %17, i64 0, !dbg !227
  %21 = insertelement <2 x float> %20, float %19, i64 1, !dbg !227
  %22 = fmul <2 x float> %21, splat (float 5.000000e-01), !dbg !228
  %23 = fadd contract <2 x float> %22, splat (float 0x3EE4F8B580000000), !dbg !229
  %24 = tail call <2 x float> @llvm.sqrt.v2f32(<2 x float> %23), !dbg !230
  %25 = fdiv <2 x float> splat (float 1.000000e+00), %24, !dbg !230
  %26 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !230
  %27 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !230
  %28 = fmul contract <2 x float> %12, %26, !dbg !231
  %29 = fmul contract <2 x float> %15, %27, !dbg !231
  %30 = fadd contract <2 x float> %28, zeroinitializer, !dbg !232
  %31 = fadd contract <2 x float> %29, zeroinitializer, !dbg !232
  %32 = getelementptr [4 x i8], ptr %7, i64 %10, !dbg !232
  store <2 x float> %30, ptr %32, align 16, !dbg !232
  %33 = getelementptr [4 x i8], ptr %7, i64 %13, !dbg !232
  store <2 x float> %31, ptr %33, align 8, !dbg !232
  ret i32 0, !dbg !233
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_17_matmul_16x8x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !234 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !235
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !235
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !235
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !235
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !235
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !236
  %7 = load ptr, ptr %6, align 8, !dbg !236
  %8 = getelementptr i8, ptr %7, i64 384, !dbg !236
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !236
  %9 = load i32, ptr %2, align 16, !dbg !237
  %10 = zext i32 %9 to i64, !dbg !237
  %11 = shl nuw nsw i64 %10, 3, !dbg !237
  %.idx45 = shl nuw nsw i64 %10, 6
  %12 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx45
  %13 = load float, ptr %12, align 64
  %14 = insertelement <8 x float> poison, float %13, i64 0
  %15 = shufflevector <8 x float> %14, <8 x float> poison, <8 x i32> zeroinitializer
  %16 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %15, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %17 = or disjoint i64 %11, 1, !dbg !238
  %.idx46 = shl nuw nsw i64 %17, 3
  %18 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx46
  %19 = load float, ptr %18, align 8
  %20 = insertelement <8 x float> poison, float %19, i64 0
  %21 = shufflevector <8 x float> %20, <8 x float> poison, <8 x i32> zeroinitializer
  %22 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %21, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %23 = or disjoint i64 %11, 2, !dbg !238
  %.idx47 = shl nuw nsw i64 %23, 3
  %24 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx47
  %25 = load float, ptr %24, align 16
  %26 = insertelement <8 x float> poison, float %25, i64 0
  %27 = shufflevector <8 x float> %26, <8 x float> poison, <8 x i32> zeroinitializer
  %28 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %27, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %29 = or disjoint i64 %11, 3, !dbg !238
  %.idx48 = shl nuw nsw i64 %29, 3
  %30 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx48
  %31 = load float, ptr %30, align 8
  %32 = insertelement <8 x float> poison, float %31, i64 0
  %33 = shufflevector <8 x float> %32, <8 x float> poison, <8 x i32> zeroinitializer
  %34 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %33, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %35 = or disjoint i64 %11, 4, !dbg !238
  %.idx49 = shl nuw nsw i64 %35, 3
  %36 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx49
  %37 = load float, ptr %36, align 32
  %38 = insertelement <8 x float> poison, float %37, i64 0
  %39 = shufflevector <8 x float> %38, <8 x float> poison, <8 x i32> zeroinitializer
  %40 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %39, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %41 = or disjoint i64 %11, 5, !dbg !238
  %.idx50 = shl nuw nsw i64 %41, 3
  %42 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx50
  %43 = load float, ptr %42, align 8
  %44 = insertelement <8 x float> poison, float %43, i64 0
  %45 = shufflevector <8 x float> %44, <8 x float> poison, <8 x i32> zeroinitializer
  %46 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %45, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %47 = or disjoint i64 %11, 6, !dbg !238
  %.idx51 = shl nuw nsw i64 %47, 3
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx51
  %49 = load float, ptr %48, align 16
  %50 = insertelement <8 x float> poison, float %49, i64 0
  %51 = shufflevector <8 x float> %50, <8 x float> poison, <8 x i32> zeroinitializer
  %52 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %51, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %53 = or disjoint i64 %11, 7, !dbg !238
  %.idx52 = shl nuw nsw i64 %53, 3
  %54 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx52
  %55 = load float, ptr %54, align 8
  %56 = insertelement <8 x float> poison, float %55, i64 0
  %57 = shufflevector <8 x float> %56, <8 x float> poison, <8 x i32> zeroinitializer
  %58 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %57, <8 x float> <float 0x3F9837C840000000, float 0x3F97DA9C80000000, float 0x3F8B359CC0000000, float 0x3F8AF25400000000, float 0xBF994859E0000000, float 0xBF606047A0000000, float 0x3F784A6300000000, float 0xBF94BCDB80000000>, <8 x float> zeroinitializer)
  %59 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %60 = load float, ptr %59, align 4
  %61 = insertelement <8 x float> poison, float %60, i64 0
  %62 = shufflevector <8 x float> %61, <8 x float> poison, <8 x i32> zeroinitializer
  %63 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %62, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %16)
  %64 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %65 = load float, ptr %64, align 4
  %66 = insertelement <8 x float> poison, float %65, i64 0
  %67 = shufflevector <8 x float> %66, <8 x float> poison, <8 x i32> zeroinitializer
  %68 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %67, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %22)
  %69 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %70 = load float, ptr %69, align 4
  %71 = insertelement <8 x float> poison, float %70, i64 0
  %72 = shufflevector <8 x float> %71, <8 x float> poison, <8 x i32> zeroinitializer
  %73 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %72, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %28)
  %74 = getelementptr inbounds nuw i8, ptr %30, i64 4
  %75 = load float, ptr %74, align 4
  %76 = insertelement <8 x float> poison, float %75, i64 0
  %77 = shufflevector <8 x float> %76, <8 x float> poison, <8 x i32> zeroinitializer
  %78 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %77, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %34)
  %79 = getelementptr inbounds nuw i8, ptr %36, i64 4
  %80 = load float, ptr %79, align 4
  %81 = insertelement <8 x float> poison, float %80, i64 0
  %82 = shufflevector <8 x float> %81, <8 x float> poison, <8 x i32> zeroinitializer
  %83 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %82, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %40)
  %84 = getelementptr inbounds nuw i8, ptr %42, i64 4
  %85 = load float, ptr %84, align 4
  %86 = insertelement <8 x float> poison, float %85, i64 0
  %87 = shufflevector <8 x float> %86, <8 x float> poison, <8 x i32> zeroinitializer
  %88 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %87, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %46)
  %89 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %90 = load float, ptr %89, align 4
  %91 = insertelement <8 x float> poison, float %90, i64 0
  %92 = shufflevector <8 x float> %91, <8 x float> poison, <8 x i32> zeroinitializer
  %93 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %92, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %52)
  %94 = getelementptr inbounds nuw i8, ptr %54, i64 4
  %95 = load float, ptr %94, align 4
  %96 = insertelement <8 x float> poison, float %95, i64 0
  %97 = shufflevector <8 x float> %96, <8 x float> poison, <8 x i32> zeroinitializer
  %98 = tail call <8 x float> @llvm.fmuladd.v8f32(<8 x float> %97, <8 x float> <float 0xBFA2B81740000000, float 0x3FA1759D80000000, float 0xBF53DE13A0000000, float 0xBF95516600000000, float 0x3F93BE1940000000, float 0xBF733C0AC0000000, float 0xBF8A6C1920000000, float 0xBFA90C7F60000000>, <8 x float> %58)
  %99 = fmul contract <8 x float> %63, %63, !dbg !239
  %100 = fmul contract <8 x float> %68, %68, !dbg !239
  %101 = fmul contract <8 x float> %73, %73, !dbg !239
  %102 = fmul contract <8 x float> %78, %78, !dbg !239
  %103 = fmul contract <8 x float> %83, %83, !dbg !239
  %104 = fmul contract <8 x float> %88, %88, !dbg !239
  %105 = fmul contract <8 x float> %93, %93, !dbg !239
  %106 = fmul contract <8 x float> %98, %98, !dbg !239
  %107 = fmul contract <8 x float> %63, %99, !dbg !239
  %108 = fmul contract <8 x float> %68, %100, !dbg !239
  %109 = fmul contract <8 x float> %73, %101, !dbg !239
  %110 = fmul contract <8 x float> %78, %102, !dbg !239
  %111 = fmul contract <8 x float> %83, %103, !dbg !239
  %112 = fmul contract <8 x float> %88, %104, !dbg !239
  %113 = fmul contract <8 x float> %93, %105, !dbg !239
  %114 = fmul contract <8 x float> %98, %106, !dbg !239
  %115 = fmul contract <8 x float> %107, splat (float 0x3FA6E4E260000000), !dbg !240
  %116 = fmul contract <8 x float> %108, splat (float 0x3FA6E4E260000000), !dbg !240
  %117 = fmul contract <8 x float> %109, splat (float 0x3FA6E4E260000000), !dbg !240
  %118 = fmul contract <8 x float> %110, splat (float 0x3FA6E4E260000000), !dbg !240
  %119 = fmul contract <8 x float> %111, splat (float 0x3FA6E4E260000000), !dbg !240
  %120 = fmul contract <8 x float> %112, splat (float 0x3FA6E4E260000000), !dbg !240
  %121 = fmul contract <8 x float> %113, splat (float 0x3FA6E4E260000000), !dbg !240
  %122 = fmul contract <8 x float> %114, splat (float 0x3FA6E4E260000000), !dbg !240
  %123 = fadd contract <8 x float> %63, %115, !dbg !241
  %124 = fadd contract <8 x float> %68, %116, !dbg !241
  %125 = fadd contract <8 x float> %73, %117, !dbg !241
  %126 = fadd contract <8 x float> %78, %118, !dbg !241
  %127 = fadd contract <8 x float> %83, %119, !dbg !241
  %128 = fadd contract <8 x float> %88, %120, !dbg !241
  %129 = fadd contract <8 x float> %93, %121, !dbg !241
  %130 = fadd contract <8 x float> %98, %122, !dbg !241
  %131 = fmul contract <8 x float> %123, splat (float 0x3FE9884520000000), !dbg !242
  %132 = fmul contract <8 x float> %124, splat (float 0x3FE9884520000000), !dbg !242
  %133 = fmul contract <8 x float> %125, splat (float 0x3FE9884520000000), !dbg !242
  %134 = fmul contract <8 x float> %126, splat (float 0x3FE9884520000000), !dbg !242
  %135 = fmul contract <8 x float> %127, splat (float 0x3FE9884520000000), !dbg !242
  %136 = fmul contract <8 x float> %128, splat (float 0x3FE9884520000000), !dbg !242
  %137 = fmul contract <8 x float> %129, splat (float 0x3FE9884520000000), !dbg !242
  %138 = fmul contract <8 x float> %130, splat (float 0x3FE9884520000000), !dbg !242
  %.inv = fcmp oge <8 x float> %131, splat (float 0x401FFEC880000000), !dbg !243
  %139 = select <8 x i1> %.inv, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %131, !dbg !243
  %.inv23 = fcmp oge <8 x float> %132, splat (float 0x401FFEC880000000), !dbg !243
  %140 = select <8 x i1> %.inv23, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %132, !dbg !243
  %.inv24 = fcmp oge <8 x float> %133, splat (float 0x401FFEC880000000), !dbg !243
  %141 = select <8 x i1> %.inv24, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %133, !dbg !243
  %.inv25 = fcmp oge <8 x float> %134, splat (float 0x401FFEC880000000), !dbg !243
  %142 = select <8 x i1> %.inv25, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %134, !dbg !243
  %.inv26 = fcmp oge <8 x float> %135, splat (float 0x401FFEC880000000), !dbg !243
  %143 = select <8 x i1> %.inv26, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %135, !dbg !243
  %.inv27 = fcmp oge <8 x float> %136, splat (float 0x401FFEC880000000), !dbg !243
  %144 = select <8 x i1> %.inv27, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %136, !dbg !243
  %.inv28 = fcmp oge <8 x float> %137, splat (float 0x401FFEC880000000), !dbg !243
  %145 = select <8 x i1> %.inv28, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %137, !dbg !243
  %.inv29 = fcmp oge <8 x float> %138, splat (float 0x401FFEC880000000), !dbg !243
  %146 = select <8 x i1> %.inv29, <8 x float> splat (float 0x401FFEC880000000), <8 x float> %138, !dbg !243
  %.inv30 = fcmp ole <8 x float> %139, splat (float 0xC01FFEC880000000), !dbg !243
  %147 = select <8 x i1> %.inv30, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %139, !dbg !243
  %.inv31 = fcmp ole <8 x float> %140, splat (float 0xC01FFEC880000000), !dbg !243
  %148 = select <8 x i1> %.inv31, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %140, !dbg !243
  %.inv32 = fcmp ole <8 x float> %141, splat (float 0xC01FFEC880000000), !dbg !243
  %149 = select <8 x i1> %.inv32, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %141, !dbg !243
  %.inv33 = fcmp ole <8 x float> %142, splat (float 0xC01FFEC880000000), !dbg !243
  %150 = select <8 x i1> %.inv33, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %142, !dbg !243
  %.inv34 = fcmp ole <8 x float> %143, splat (float 0xC01FFEC880000000), !dbg !243
  %151 = select <8 x i1> %.inv34, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %143, !dbg !243
  %.inv35 = fcmp ole <8 x float> %144, splat (float 0xC01FFEC880000000), !dbg !243
  %152 = select <8 x i1> %.inv35, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %144, !dbg !243
  %.inv36 = fcmp ole <8 x float> %145, splat (float 0xC01FFEC880000000), !dbg !243
  %153 = select <8 x i1> %.inv36, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %145, !dbg !243
  %.inv37 = fcmp ole <8 x float> %146, splat (float 0xC01FFEC880000000), !dbg !243
  %154 = select <8 x i1> %.inv37, <8 x float> splat (float 0xC01FFEC880000000), <8 x float> %146, !dbg !243
  %155 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %131), !dbg !243
  %156 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %132), !dbg !243
  %157 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %133), !dbg !243
  %158 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %134), !dbg !243
  %159 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %135), !dbg !243
  %160 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %136), !dbg !243
  %161 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %137), !dbg !243
  %162 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %138), !dbg !243
  %163 = fcmp olt <8 x float> %155, splat (float 0x3F3A36E2E0000000), !dbg !243
  %164 = fcmp olt <8 x float> %156, splat (float 0x3F3A36E2E0000000), !dbg !243
  %165 = fcmp olt <8 x float> %157, splat (float 0x3F3A36E2E0000000), !dbg !243
  %166 = fcmp olt <8 x float> %158, splat (float 0x3F3A36E2E0000000), !dbg !243
  %167 = fcmp olt <8 x float> %159, splat (float 0x3F3A36E2E0000000), !dbg !243
  %168 = fcmp olt <8 x float> %160, splat (float 0x3F3A36E2E0000000), !dbg !243
  %169 = fcmp olt <8 x float> %161, splat (float 0x3F3A36E2E0000000), !dbg !243
  %170 = fcmp olt <8 x float> %162, splat (float 0x3F3A36E2E0000000), !dbg !243
  %171 = fmul contract <8 x float> %147, %147, !dbg !243
  %172 = fmul contract <8 x float> %148, %148, !dbg !243
  %173 = fmul contract <8 x float> %149, %149, !dbg !243
  %174 = fmul contract <8 x float> %150, %150, !dbg !243
  %175 = fmul contract <8 x float> %151, %151, !dbg !243
  %176 = fmul contract <8 x float> %152, %152, !dbg !243
  %177 = fmul contract <8 x float> %153, %153, !dbg !243
  %178 = fmul contract <8 x float> %154, %154, !dbg !243
  %179 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %180 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %181 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %182 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %183 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %184 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %185 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %186 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> splat (float 0xBCB3E4B800000000), <8 x float> splat (float 0x3D4C266FC0000000)), !dbg !243
  %187 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %179, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %188 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %180, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %189 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %181, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %190 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %182, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %191 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %183, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %192 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %184, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %193 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %185, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %194 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %186, <8 x float> splat (float 0xBDD7A6FFE0000000)), !dbg !243
  %195 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %187, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %196 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %188, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %197 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %189, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %198 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %190, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %199 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %191, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %200 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %192, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %201 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %193, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %202 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %194, <8 x float> splat (float 0x3E6B800820000000)), !dbg !243
  %203 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %195, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %204 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %196, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %205 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %197, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %206 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %198, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %207 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %199, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %208 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %200, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %209 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %201, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %210 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %202, <8 x float> splat (float 0x3EEF286940000000)), !dbg !243
  %211 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %203, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %212 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %204, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %213 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %205, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %214 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %206, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %215 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %207, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %216 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %208, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %217 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %209, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %218 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %210, <8 x float> splat (float 0x3F44E1BDA0000000)), !dbg !243
  %219 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %211, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %220 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %212, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %221 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %213, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %222 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %214, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %223 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %215, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %224 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %216, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %225 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %217, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %226 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %218, <8 x float> splat (float 0x3F740B3B80000000)), !dbg !243
  %227 = fmul contract <8 x float> %147, %219, !dbg !243
  %228 = fmul contract <8 x float> %148, %220, !dbg !243
  %229 = fmul contract <8 x float> %149, %221, !dbg !243
  %230 = fmul contract <8 x float> %150, %222, !dbg !243
  %231 = fmul contract <8 x float> %151, %223, !dbg !243
  %232 = fmul contract <8 x float> %152, %224, !dbg !243
  %233 = fmul contract <8 x float> %153, %225, !dbg !243
  %234 = fmul contract <8 x float> %154, %226, !dbg !243
  %235 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %236 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %237 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %238 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %239 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %240 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %241 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %242 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> splat (float 0x3EB41A7B00000000), <8 x float> splat (float 0x3F1F12BAC0000000)), !dbg !243
  %243 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %235, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %244 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %236, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %245 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %237, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %246 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %238, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %247 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %239, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %248 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %240, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %249 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %241, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %250 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %242, <8 x float> splat (float 0x3F629540A0000000)), !dbg !243
  %251 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %171, <8 x float> %243, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %252 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %172, <8 x float> %244, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %253 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %173, <8 x float> %245, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %254 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %174, <8 x float> %246, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %255 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %175, <8 x float> %247, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %256 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %176, <8 x float> %248, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %257 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %177, <8 x float> %249, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %258 = tail call <8 x float> @llvm.fma.v8f32(<8 x float> %178, <8 x float> %250, <8 x float> splat (float 0x3F740B3BA0000000)), !dbg !243
  %259 = fdiv <8 x float> %227, %251, !dbg !243
  %260 = fdiv <8 x float> %228, %252, !dbg !243
  %261 = fdiv <8 x float> %229, %253, !dbg !243
  %262 = fdiv <8 x float> %230, %254, !dbg !243
  %263 = fdiv <8 x float> %231, %255, !dbg !243
  %264 = fdiv <8 x float> %232, %256, !dbg !243
  %265 = fdiv <8 x float> %233, %257, !dbg !243
  %266 = fdiv <8 x float> %234, %258, !dbg !243
  %267 = select <8 x i1> %163, <8 x float> %147, <8 x float> %259, !dbg !243
  %268 = select <8 x i1> %164, <8 x float> %148, <8 x float> %260, !dbg !243
  %269 = select <8 x i1> %165, <8 x float> %149, <8 x float> %261, !dbg !243
  %270 = select <8 x i1> %166, <8 x float> %150, <8 x float> %262, !dbg !243
  %271 = select <8 x i1> %167, <8 x float> %151, <8 x float> %263, !dbg !243
  %272 = select <8 x i1> %168, <8 x float> %152, <8 x float> %264, !dbg !243
  %273 = select <8 x i1> %169, <8 x float> %153, <8 x float> %265, !dbg !243
  %274 = select <8 x i1> %170, <8 x float> %154, <8 x float> %266, !dbg !243
  %275 = fadd contract <8 x float> %267, splat (float 1.000000e+00), !dbg !244
  %276 = fadd contract <8 x float> %268, splat (float 1.000000e+00), !dbg !244
  %277 = fadd contract <8 x float> %269, splat (float 1.000000e+00), !dbg !244
  %278 = fadd contract <8 x float> %270, splat (float 1.000000e+00), !dbg !244
  %279 = fadd contract <8 x float> %271, splat (float 1.000000e+00), !dbg !244
  %280 = fadd contract <8 x float> %272, splat (float 1.000000e+00), !dbg !244
  %281 = fadd contract <8 x float> %273, splat (float 1.000000e+00), !dbg !244
  %282 = fadd contract <8 x float> %274, splat (float 1.000000e+00), !dbg !244
  %283 = fmul contract <8 x float> %63, splat (float 5.000000e-01), !dbg !245
  %284 = fmul contract <8 x float> %68, splat (float 5.000000e-01), !dbg !245
  %285 = fmul contract <8 x float> %73, splat (float 5.000000e-01), !dbg !245
  %286 = fmul contract <8 x float> %78, splat (float 5.000000e-01), !dbg !245
  %287 = fmul contract <8 x float> %83, splat (float 5.000000e-01), !dbg !245
  %288 = fmul contract <8 x float> %88, splat (float 5.000000e-01), !dbg !245
  %289 = fmul contract <8 x float> %93, splat (float 5.000000e-01), !dbg !245
  %290 = fmul contract <8 x float> %98, splat (float 5.000000e-01), !dbg !245
  %291 = fmul contract <8 x float> %283, %275, !dbg !238
  %292 = fmul contract <8 x float> %284, %276, !dbg !238
  %293 = fmul contract <8 x float> %285, %277, !dbg !238
  %294 = fmul contract <8 x float> %286, %278, !dbg !238
  %295 = fmul contract <8 x float> %287, %279, !dbg !238
  %296 = fmul contract <8 x float> %288, %280, !dbg !238
  %297 = fmul contract <8 x float> %289, %281, !dbg !238
  %298 = fmul contract <8 x float> %290, %282, !dbg !238
  %.idx = shl nuw nsw i64 %10, 8, !dbg !238
  %299 = getelementptr i8, ptr %8, i64 %.idx, !dbg !238
  store <8 x float> %291, ptr %299, align 64, !dbg !238
  %.idx38 = shl nuw nsw i64 %17, 5, !dbg !238
  %300 = getelementptr i8, ptr %8, i64 %.idx38, !dbg !238
  store <8 x float> %292, ptr %300, align 32, !dbg !238
  %.idx39 = shl nuw nsw i64 %23, 5, !dbg !238
  %301 = getelementptr i8, ptr %8, i64 %.idx39, !dbg !238
  store <8 x float> %293, ptr %301, align 64, !dbg !238
  %.idx40 = shl nuw nsw i64 %29, 5, !dbg !238
  %302 = getelementptr i8, ptr %8, i64 %.idx40, !dbg !238
  store <8 x float> %294, ptr %302, align 32, !dbg !238
  %.idx41 = shl nuw nsw i64 %35, 5, !dbg !238
  %303 = getelementptr i8, ptr %8, i64 %.idx41, !dbg !238
  store <8 x float> %295, ptr %303, align 64, !dbg !238
  %.idx42 = shl nuw nsw i64 %41, 5, !dbg !238
  %304 = getelementptr i8, ptr %8, i64 %.idx42, !dbg !238
  store <8 x float> %296, ptr %304, align 32, !dbg !238
  %.idx43 = shl nuw nsw i64 %47, 5, !dbg !238
  %305 = getelementptr i8, ptr %8, i64 %.idx43, !dbg !238
  store <8 x float> %297, ptr %305, align 64, !dbg !238
  %.idx44 = shl nuw nsw i64 %53, 5, !dbg !238
  %306 = getelementptr i8, ptr %8, i64 %.idx44, !dbg !238
  store <8 x float> %298, ptr %306, align 32, !dbg !238
  ret i32 0, !dbg !246
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_18_matmul_16x2x8_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !247 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !248
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !248
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !248
  %5 = getelementptr i8, ptr %4, i64 384, !dbg !248
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !248
  %6 = getelementptr i8, ptr %4, i64 256, !dbg !249
  call void @llvm.assume(i1 true) [ "align"(ptr %6, i64 64) ], !dbg !249
  %7 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !250
  %8 = load ptr, ptr %7, align 8, !dbg !250
  call void @llvm.assume(i1 true) [ "align"(ptr %8, i64 64) ], !dbg !250
  %9 = load i32, ptr %2, align 16, !dbg !251
  %10 = zext i32 %9 to i64, !dbg !251
  %11 = shl nuw nsw i64 %10, 3, !dbg !251
  %12 = shl nuw nsw i64 %10, 4, !dbg !252
  %13 = getelementptr [4 x i8], ptr %6, i64 %12, !dbg !252
  %14 = load <2 x float>, ptr %13, align 64, !dbg !252
  %15 = or disjoint i64 %11, 1, !dbg !252
  %16 = shl nuw nsw i64 %15, 1, !dbg !252
  %17 = getelementptr [4 x i8], ptr %6, i64 %16, !dbg !252
  %18 = load <2 x float>, ptr %17, align 8, !dbg !252
  %19 = or disjoint i64 %11, 2, !dbg !252
  %20 = shl nuw nsw i64 %19, 1, !dbg !252
  %21 = getelementptr [4 x i8], ptr %6, i64 %20, !dbg !252
  %22 = load <2 x float>, ptr %21, align 16, !dbg !252
  %23 = or disjoint i64 %11, 3, !dbg !252
  %24 = shl nuw nsw i64 %23, 1, !dbg !252
  %25 = getelementptr [4 x i8], ptr %6, i64 %24, !dbg !252
  %26 = load <2 x float>, ptr %25, align 8, !dbg !252
  %27 = or disjoint i64 %11, 4, !dbg !252
  %28 = shl nuw nsw i64 %27, 1, !dbg !252
  %29 = getelementptr [4 x i8], ptr %6, i64 %28, !dbg !252
  %30 = load <2 x float>, ptr %29, align 32, !dbg !252
  %31 = or disjoint i64 %11, 5, !dbg !252
  %32 = shl nuw nsw i64 %31, 1, !dbg !252
  %33 = getelementptr [4 x i8], ptr %6, i64 %32, !dbg !252
  %34 = load <2 x float>, ptr %33, align 8, !dbg !252
  %35 = or disjoint i64 %11, 6, !dbg !252
  %36 = shl nuw nsw i64 %35, 1, !dbg !252
  %37 = getelementptr [4 x i8], ptr %6, i64 %36, !dbg !252
  %38 = load <2 x float>, ptr %37, align 16, !dbg !252
  %39 = or disjoint i64 %11, 7, !dbg !252
  %40 = shl nuw nsw i64 %39, 1, !dbg !252
  %41 = getelementptr [4 x i8], ptr %6, i64 %40, !dbg !252
  %42 = load <2 x float>, ptr %41, align 8, !dbg !252
  %.idx = shl nuw nsw i64 %10, 8
  %43 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx
  %44 = load float, ptr %43, align 64
  %45 = insertelement <2 x float> poison, float %44, i64 0
  %46 = shufflevector <2 x float> %45, <2 x float> poison, <2 x i32> zeroinitializer
  %47 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %46, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx23 = shl nuw nsw i64 %15, 5
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx23
  %49 = load float, ptr %48, align 32
  %50 = insertelement <2 x float> poison, float %49, i64 0
  %51 = shufflevector <2 x float> %50, <2 x float> poison, <2 x i32> zeroinitializer
  %52 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %51, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx24 = shl nuw nsw i64 %19, 5
  %53 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx24
  %54 = load float, ptr %53, align 64
  %55 = insertelement <2 x float> poison, float %54, i64 0
  %56 = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> zeroinitializer
  %57 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %56, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx25 = shl nuw nsw i64 %23, 5
  %58 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx25
  %59 = load float, ptr %58, align 32
  %60 = insertelement <2 x float> poison, float %59, i64 0
  %61 = shufflevector <2 x float> %60, <2 x float> poison, <2 x i32> zeroinitializer
  %62 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %61, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx26 = shl nuw nsw i64 %27, 5
  %63 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx26
  %64 = load float, ptr %63, align 64
  %65 = insertelement <2 x float> poison, float %64, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx27 = shl nuw nsw i64 %31, 5
  %68 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx27
  %69 = load float, ptr %68, align 32
  %70 = insertelement <2 x float> poison, float %69, i64 0
  %71 = shufflevector <2 x float> %70, <2 x float> poison, <2 x i32> zeroinitializer
  %72 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %71, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx28 = shl nuw nsw i64 %35, 5
  %73 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx28
  %74 = load float, ptr %73, align 64
  %75 = insertelement <2 x float> poison, float %74, i64 0
  %76 = shufflevector <2 x float> %75, <2 x float> poison, <2 x i32> zeroinitializer
  %77 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %76, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %.idx29 = shl nuw nsw i64 %39, 5
  %78 = getelementptr inbounds nuw i8, ptr %5, i64 %.idx29
  %79 = load float, ptr %78, align 32
  %80 = insertelement <2 x float> poison, float %79, i64 0
  %81 = shufflevector <2 x float> %80, <2 x float> poison, <2 x i32> zeroinitializer
  %82 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %81, <2 x float> <float 0x3F8BC424E0000000, float 0xBFA0CCECC0000000>, <2 x float> zeroinitializer)
  %83 = getelementptr inbounds nuw i8, ptr %43, i64 4
  %84 = load float, ptr %83, align 4
  %85 = insertelement <2 x float> poison, float %84, i64 0
  %86 = shufflevector <2 x float> %85, <2 x float> poison, <2 x i32> zeroinitializer
  %87 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %86, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %47)
  %88 = getelementptr inbounds nuw i8, ptr %48, i64 4
  %89 = load float, ptr %88, align 4
  %90 = insertelement <2 x float> poison, float %89, i64 0
  %91 = shufflevector <2 x float> %90, <2 x float> poison, <2 x i32> zeroinitializer
  %92 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %91, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %52)
  %93 = getelementptr inbounds nuw i8, ptr %53, i64 4
  %94 = load float, ptr %93, align 4
  %95 = insertelement <2 x float> poison, float %94, i64 0
  %96 = shufflevector <2 x float> %95, <2 x float> poison, <2 x i32> zeroinitializer
  %97 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %96, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %57)
  %98 = getelementptr inbounds nuw i8, ptr %58, i64 4
  %99 = load float, ptr %98, align 4
  %100 = insertelement <2 x float> poison, float %99, i64 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %101, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %62)
  %103 = getelementptr inbounds nuw i8, ptr %63, i64 4
  %104 = load float, ptr %103, align 4
  %105 = insertelement <2 x float> poison, float %104, i64 0
  %106 = shufflevector <2 x float> %105, <2 x float> poison, <2 x i32> zeroinitializer
  %107 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %106, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %67)
  %108 = getelementptr inbounds nuw i8, ptr %68, i64 4
  %109 = load float, ptr %108, align 4
  %110 = insertelement <2 x float> poison, float %109, i64 0
  %111 = shufflevector <2 x float> %110, <2 x float> poison, <2 x i32> zeroinitializer
  %112 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %111, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %72)
  %113 = getelementptr inbounds nuw i8, ptr %73, i64 4
  %114 = load float, ptr %113, align 4
  %115 = insertelement <2 x float> poison, float %114, i64 0
  %116 = shufflevector <2 x float> %115, <2 x float> poison, <2 x i32> zeroinitializer
  %117 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %116, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %77)
  %118 = getelementptr inbounds nuw i8, ptr %78, i64 4
  %119 = load float, ptr %118, align 4
  %120 = insertelement <2 x float> poison, float %119, i64 0
  %121 = shufflevector <2 x float> %120, <2 x float> poison, <2 x i32> zeroinitializer
  %122 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %121, <2 x float> <float 0x3F498B8800000000, float 0xBF8DA57520000000>, <2 x float> %82)
  %123 = getelementptr inbounds nuw i8, ptr %43, i64 8
  %124 = load float, ptr %123, align 8
  %125 = insertelement <2 x float> poison, float %124, i64 0
  %126 = shufflevector <2 x float> %125, <2 x float> poison, <2 x i32> zeroinitializer
  %127 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %126, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %87)
  %128 = getelementptr inbounds nuw i8, ptr %48, i64 8
  %129 = load float, ptr %128, align 8
  %130 = insertelement <2 x float> poison, float %129, i64 0
  %131 = shufflevector <2 x float> %130, <2 x float> poison, <2 x i32> zeroinitializer
  %132 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %131, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %92)
  %133 = getelementptr inbounds nuw i8, ptr %53, i64 8
  %134 = load float, ptr %133, align 8
  %135 = insertelement <2 x float> poison, float %134, i64 0
  %136 = shufflevector <2 x float> %135, <2 x float> poison, <2 x i32> zeroinitializer
  %137 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %136, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %97)
  %138 = getelementptr inbounds nuw i8, ptr %58, i64 8
  %139 = load float, ptr %138, align 8
  %140 = insertelement <2 x float> poison, float %139, i64 0
  %141 = shufflevector <2 x float> %140, <2 x float> poison, <2 x i32> zeroinitializer
  %142 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %141, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %102)
  %143 = getelementptr inbounds nuw i8, ptr %63, i64 8
  %144 = load float, ptr %143, align 8
  %145 = insertelement <2 x float> poison, float %144, i64 0
  %146 = shufflevector <2 x float> %145, <2 x float> poison, <2 x i32> zeroinitializer
  %147 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %146, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %107)
  %148 = getelementptr inbounds nuw i8, ptr %68, i64 8
  %149 = load float, ptr %148, align 8
  %150 = insertelement <2 x float> poison, float %149, i64 0
  %151 = shufflevector <2 x float> %150, <2 x float> poison, <2 x i32> zeroinitializer
  %152 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %151, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %112)
  %153 = getelementptr inbounds nuw i8, ptr %73, i64 8
  %154 = load float, ptr %153, align 8
  %155 = insertelement <2 x float> poison, float %154, i64 0
  %156 = shufflevector <2 x float> %155, <2 x float> poison, <2 x i32> zeroinitializer
  %157 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %156, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %117)
  %158 = getelementptr inbounds nuw i8, ptr %78, i64 8
  %159 = load float, ptr %158, align 8
  %160 = insertelement <2 x float> poison, float %159, i64 0
  %161 = shufflevector <2 x float> %160, <2 x float> poison, <2 x i32> zeroinitializer
  %162 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %161, <2 x float> <float 0xBF8DCA4920000000, float 0xBF8A0AF260000000>, <2 x float> %122)
  %163 = getelementptr inbounds nuw i8, ptr %43, i64 12
  %164 = load float, ptr %163, align 4
  %165 = insertelement <2 x float> poison, float %164, i64 0
  %166 = shufflevector <2 x float> %165, <2 x float> poison, <2 x i32> zeroinitializer
  %167 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %166, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %127)
  %168 = getelementptr inbounds nuw i8, ptr %48, i64 12
  %169 = load float, ptr %168, align 4
  %170 = insertelement <2 x float> poison, float %169, i64 0
  %171 = shufflevector <2 x float> %170, <2 x float> poison, <2 x i32> zeroinitializer
  %172 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %171, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %132)
  %173 = getelementptr inbounds nuw i8, ptr %53, i64 12
  %174 = load float, ptr %173, align 4
  %175 = insertelement <2 x float> poison, float %174, i64 0
  %176 = shufflevector <2 x float> %175, <2 x float> poison, <2 x i32> zeroinitializer
  %177 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %176, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %137)
  %178 = getelementptr inbounds nuw i8, ptr %58, i64 12
  %179 = load float, ptr %178, align 4
  %180 = insertelement <2 x float> poison, float %179, i64 0
  %181 = shufflevector <2 x float> %180, <2 x float> poison, <2 x i32> zeroinitializer
  %182 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %181, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %142)
  %183 = getelementptr inbounds nuw i8, ptr %63, i64 12
  %184 = load float, ptr %183, align 4
  %185 = insertelement <2 x float> poison, float %184, i64 0
  %186 = shufflevector <2 x float> %185, <2 x float> poison, <2 x i32> zeroinitializer
  %187 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %186, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %147)
  %188 = getelementptr inbounds nuw i8, ptr %68, i64 12
  %189 = load float, ptr %188, align 4
  %190 = insertelement <2 x float> poison, float %189, i64 0
  %191 = shufflevector <2 x float> %190, <2 x float> poison, <2 x i32> zeroinitializer
  %192 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %191, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %152)
  %193 = getelementptr inbounds nuw i8, ptr %73, i64 12
  %194 = load float, ptr %193, align 4
  %195 = insertelement <2 x float> poison, float %194, i64 0
  %196 = shufflevector <2 x float> %195, <2 x float> poison, <2 x i32> zeroinitializer
  %197 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %196, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %157)
  %198 = getelementptr inbounds nuw i8, ptr %78, i64 12
  %199 = load float, ptr %198, align 4
  %200 = insertelement <2 x float> poison, float %199, i64 0
  %201 = shufflevector <2 x float> %200, <2 x float> poison, <2 x i32> zeroinitializer
  %202 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %201, <2 x float> <float 0xBF804CCA80000000, float 0xBF938889E0000000>, <2 x float> %162)
  %203 = getelementptr inbounds nuw i8, ptr %43, i64 16
  %204 = load float, ptr %203, align 16
  %205 = insertelement <2 x float> poison, float %204, i64 0
  %206 = shufflevector <2 x float> %205, <2 x float> poison, <2 x i32> zeroinitializer
  %207 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %206, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %167)
  %208 = getelementptr inbounds nuw i8, ptr %48, i64 16
  %209 = load float, ptr %208, align 16
  %210 = insertelement <2 x float> poison, float %209, i64 0
  %211 = shufflevector <2 x float> %210, <2 x float> poison, <2 x i32> zeroinitializer
  %212 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %211, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %172)
  %213 = getelementptr inbounds nuw i8, ptr %53, i64 16
  %214 = load float, ptr %213, align 16
  %215 = insertelement <2 x float> poison, float %214, i64 0
  %216 = shufflevector <2 x float> %215, <2 x float> poison, <2 x i32> zeroinitializer
  %217 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %216, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %177)
  %218 = getelementptr inbounds nuw i8, ptr %58, i64 16
  %219 = load float, ptr %218, align 16
  %220 = insertelement <2 x float> poison, float %219, i64 0
  %221 = shufflevector <2 x float> %220, <2 x float> poison, <2 x i32> zeroinitializer
  %222 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %221, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %182)
  %223 = getelementptr inbounds nuw i8, ptr %63, i64 16
  %224 = load float, ptr %223, align 16
  %225 = insertelement <2 x float> poison, float %224, i64 0
  %226 = shufflevector <2 x float> %225, <2 x float> poison, <2 x i32> zeroinitializer
  %227 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %226, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %187)
  %228 = getelementptr inbounds nuw i8, ptr %68, i64 16
  %229 = load float, ptr %228, align 16
  %230 = insertelement <2 x float> poison, float %229, i64 0
  %231 = shufflevector <2 x float> %230, <2 x float> poison, <2 x i32> zeroinitializer
  %232 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %231, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %192)
  %233 = getelementptr inbounds nuw i8, ptr %73, i64 16
  %234 = load float, ptr %233, align 16
  %235 = insertelement <2 x float> poison, float %234, i64 0
  %236 = shufflevector <2 x float> %235, <2 x float> poison, <2 x i32> zeroinitializer
  %237 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %236, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %197)
  %238 = getelementptr inbounds nuw i8, ptr %78, i64 16
  %239 = load float, ptr %238, align 16
  %240 = insertelement <2 x float> poison, float %239, i64 0
  %241 = shufflevector <2 x float> %240, <2 x float> poison, <2 x i32> zeroinitializer
  %242 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %241, <2 x float> <float 0x3FA32CDF60000000, float 0x3F84A29EC0000000>, <2 x float> %202)
  %243 = getelementptr inbounds nuw i8, ptr %43, i64 20
  %244 = load float, ptr %243, align 4
  %245 = insertelement <2 x float> poison, float %244, i64 0
  %246 = shufflevector <2 x float> %245, <2 x float> poison, <2 x i32> zeroinitializer
  %247 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %246, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %207)
  %248 = getelementptr inbounds nuw i8, ptr %48, i64 20
  %249 = load float, ptr %248, align 4
  %250 = insertelement <2 x float> poison, float %249, i64 0
  %251 = shufflevector <2 x float> %250, <2 x float> poison, <2 x i32> zeroinitializer
  %252 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %251, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %212)
  %253 = getelementptr inbounds nuw i8, ptr %53, i64 20
  %254 = load float, ptr %253, align 4
  %255 = insertelement <2 x float> poison, float %254, i64 0
  %256 = shufflevector <2 x float> %255, <2 x float> poison, <2 x i32> zeroinitializer
  %257 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %256, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %217)
  %258 = getelementptr inbounds nuw i8, ptr %58, i64 20
  %259 = load float, ptr %258, align 4
  %260 = insertelement <2 x float> poison, float %259, i64 0
  %261 = shufflevector <2 x float> %260, <2 x float> poison, <2 x i32> zeroinitializer
  %262 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %261, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %222)
  %263 = getelementptr inbounds nuw i8, ptr %63, i64 20
  %264 = load float, ptr %263, align 4
  %265 = insertelement <2 x float> poison, float %264, i64 0
  %266 = shufflevector <2 x float> %265, <2 x float> poison, <2 x i32> zeroinitializer
  %267 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %266, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %227)
  %268 = getelementptr inbounds nuw i8, ptr %68, i64 20
  %269 = load float, ptr %268, align 4
  %270 = insertelement <2 x float> poison, float %269, i64 0
  %271 = shufflevector <2 x float> %270, <2 x float> poison, <2 x i32> zeroinitializer
  %272 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %271, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %232)
  %273 = getelementptr inbounds nuw i8, ptr %73, i64 20
  %274 = load float, ptr %273, align 4
  %275 = insertelement <2 x float> poison, float %274, i64 0
  %276 = shufflevector <2 x float> %275, <2 x float> poison, <2 x i32> zeroinitializer
  %277 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %276, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %237)
  %278 = getelementptr inbounds nuw i8, ptr %78, i64 20
  %279 = load float, ptr %278, align 4
  %280 = insertelement <2 x float> poison, float %279, i64 0
  %281 = shufflevector <2 x float> %280, <2 x float> poison, <2 x i32> zeroinitializer
  %282 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %281, <2 x float> <float 0x3F83746E60000000, float 0xBF81ED3BA0000000>, <2 x float> %242)
  %283 = getelementptr inbounds nuw i8, ptr %43, i64 24
  %284 = load float, ptr %283, align 8
  %285 = insertelement <2 x float> poison, float %284, i64 0
  %286 = shufflevector <2 x float> %285, <2 x float> poison, <2 x i32> zeroinitializer
  %287 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %286, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %247)
  %288 = getelementptr inbounds nuw i8, ptr %48, i64 24
  %289 = load float, ptr %288, align 8
  %290 = insertelement <2 x float> poison, float %289, i64 0
  %291 = shufflevector <2 x float> %290, <2 x float> poison, <2 x i32> zeroinitializer
  %292 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %291, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %252)
  %293 = getelementptr inbounds nuw i8, ptr %53, i64 24
  %294 = load float, ptr %293, align 8
  %295 = insertelement <2 x float> poison, float %294, i64 0
  %296 = shufflevector <2 x float> %295, <2 x float> poison, <2 x i32> zeroinitializer
  %297 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %296, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %257)
  %298 = getelementptr inbounds nuw i8, ptr %58, i64 24
  %299 = load float, ptr %298, align 8
  %300 = insertelement <2 x float> poison, float %299, i64 0
  %301 = shufflevector <2 x float> %300, <2 x float> poison, <2 x i32> zeroinitializer
  %302 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %301, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %262)
  %303 = getelementptr inbounds nuw i8, ptr %63, i64 24
  %304 = load float, ptr %303, align 8
  %305 = insertelement <2 x float> poison, float %304, i64 0
  %306 = shufflevector <2 x float> %305, <2 x float> poison, <2 x i32> zeroinitializer
  %307 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %306, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %267)
  %308 = getelementptr inbounds nuw i8, ptr %68, i64 24
  %309 = load float, ptr %308, align 8
  %310 = insertelement <2 x float> poison, float %309, i64 0
  %311 = shufflevector <2 x float> %310, <2 x float> poison, <2 x i32> zeroinitializer
  %312 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %311, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %272)
  %313 = getelementptr inbounds nuw i8, ptr %73, i64 24
  %314 = load float, ptr %313, align 8
  %315 = insertelement <2 x float> poison, float %314, i64 0
  %316 = shufflevector <2 x float> %315, <2 x float> poison, <2 x i32> zeroinitializer
  %317 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %316, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %277)
  %318 = getelementptr inbounds nuw i8, ptr %78, i64 24
  %319 = load float, ptr %318, align 8
  %320 = insertelement <2 x float> poison, float %319, i64 0
  %321 = shufflevector <2 x float> %320, <2 x float> poison, <2 x i32> zeroinitializer
  %322 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %321, <2 x float> <float 0x3F89AB9BC0000000, float 0xBF72E39BA0000000>, <2 x float> %282)
  %323 = getelementptr inbounds nuw i8, ptr %43, i64 28
  %324 = load float, ptr %323, align 4
  %325 = insertelement <2 x float> poison, float %324, i64 0
  %326 = shufflevector <2 x float> %325, <2 x float> poison, <2 x i32> zeroinitializer
  %327 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %326, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %287)
  %328 = getelementptr inbounds nuw i8, ptr %48, i64 28
  %329 = load float, ptr %328, align 4
  %330 = insertelement <2 x float> poison, float %329, i64 0
  %331 = shufflevector <2 x float> %330, <2 x float> poison, <2 x i32> zeroinitializer
  %332 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %331, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %292)
  %333 = getelementptr inbounds nuw i8, ptr %53, i64 28
  %334 = load float, ptr %333, align 4
  %335 = insertelement <2 x float> poison, float %334, i64 0
  %336 = shufflevector <2 x float> %335, <2 x float> poison, <2 x i32> zeroinitializer
  %337 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %336, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %297)
  %338 = getelementptr inbounds nuw i8, ptr %58, i64 28
  %339 = load float, ptr %338, align 4
  %340 = insertelement <2 x float> poison, float %339, i64 0
  %341 = shufflevector <2 x float> %340, <2 x float> poison, <2 x i32> zeroinitializer
  %342 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %341, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %302)
  %343 = getelementptr inbounds nuw i8, ptr %63, i64 28
  %344 = load float, ptr %343, align 4
  %345 = insertelement <2 x float> poison, float %344, i64 0
  %346 = shufflevector <2 x float> %345, <2 x float> poison, <2 x i32> zeroinitializer
  %347 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %346, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %307)
  %348 = getelementptr inbounds nuw i8, ptr %68, i64 28
  %349 = load float, ptr %348, align 4
  %350 = insertelement <2 x float> poison, float %349, i64 0
  %351 = shufflevector <2 x float> %350, <2 x float> poison, <2 x i32> zeroinitializer
  %352 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %351, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %312)
  %353 = getelementptr inbounds nuw i8, ptr %73, i64 28
  %354 = load float, ptr %353, align 4
  %355 = insertelement <2 x float> poison, float %354, i64 0
  %356 = shufflevector <2 x float> %355, <2 x float> poison, <2 x i32> zeroinitializer
  %357 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %356, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %317)
  %358 = getelementptr inbounds nuw i8, ptr %78, i64 28
  %359 = load float, ptr %358, align 4
  %360 = insertelement <2 x float> poison, float %359, i64 0
  %361 = shufflevector <2 x float> %360, <2 x float> poison, <2 x i32> zeroinitializer
  %362 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %361, <2 x float> <float 0xBF8D895D40000000, float 0x3F5C295820000000>, <2 x float> %322)
  %363 = fadd contract <2 x float> %14, %327, !dbg !253
  %364 = fadd contract <2 x float> %18, %332, !dbg !253
  %365 = fadd contract <2 x float> %22, %337, !dbg !253
  %366 = fadd contract <2 x float> %26, %342, !dbg !253
  %367 = fadd contract <2 x float> %30, %347, !dbg !253
  %368 = fadd contract <2 x float> %34, %352, !dbg !253
  %369 = fadd contract <2 x float> %38, %357, !dbg !253
  %370 = fadd contract <2 x float> %42, %362, !dbg !253
  %371 = getelementptr [4 x i8], ptr %8, i64 %12, !dbg !253
  store <2 x float> %363, ptr %371, align 64, !dbg !253
  %372 = getelementptr [4 x i8], ptr %8, i64 %16, !dbg !253
  store <2 x float> %364, ptr %372, align 8, !dbg !253
  %373 = getelementptr [4 x i8], ptr %8, i64 %20, !dbg !253
  store <2 x float> %365, ptr %373, align 16, !dbg !253
  %374 = getelementptr [4 x i8], ptr %8, i64 %24, !dbg !253
  store <2 x float> %366, ptr %374, align 8, !dbg !253
  %375 = getelementptr [4 x i8], ptr %8, i64 %28, !dbg !253
  store <2 x float> %367, ptr %375, align 32, !dbg !253
  %376 = getelementptr [4 x i8], ptr %8, i64 %32, !dbg !253
  store <2 x float> %368, ptr %376, align 8, !dbg !253
  %377 = getelementptr [4 x i8], ptr %8, i64 %36, !dbg !253
  store <2 x float> %369, ptr %377, align 16, !dbg !253
  %378 = getelementptr [4 x i8], ptr %8, i64 %40, !dbg !253
  store <2 x float> %370, ptr %378, align 8, !dbg !253
  ret i32 0, !dbg !254
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_20_reduction_16x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #1 !dbg !255 {
  %.elt19 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !256
  %.unpack20 = load ptr, ptr %.elt19, align 16, !dbg !256
  %4 = load ptr, ptr %.unpack20, align 8, !dbg !256
  %5 = getelementptr i8, ptr %4, i64 128, !dbg !256
  call void @llvm.assume(i1 true) [ "align"(ptr %5, i64 64) ], !dbg !256
  %6 = getelementptr i8, ptr %.unpack20, i64 8, !dbg !257
  %7 = load ptr, ptr %6, align 8, !dbg !257
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !257
  %8 = load i32, ptr %2, align 16, !dbg !258
  %9 = zext i32 %8 to i64, !dbg !258
  %10 = shl nuw nsw i64 %9, 2, !dbg !258
  %11 = getelementptr [4 x i8], ptr %5, i64 %10, !dbg !258
  %12 = load <2 x float>, ptr %11, align 16, !dbg !258
  %13 = or disjoint i64 %10, 2, !dbg !258
  %14 = getelementptr [4 x i8], ptr %5, i64 %13, !dbg !258
  %15 = load <2 x float>, ptr %14, align 8, !dbg !258
  %16 = fmul contract <2 x float> %12, %12, !dbg !259
  %17 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %16), !dbg !259
  %18 = fmul contract <2 x float> %15, %15, !dbg !259
  %19 = tail call float @llvm.vector.reduce.fadd.v2f32(float 0.000000e+00, <2 x float> %18), !dbg !259
  %20 = insertelement <2 x float> poison, float %17, i64 0, !dbg !259
  %21 = insertelement <2 x float> %20, float %19, i64 1, !dbg !259
  %22 = fmul <2 x float> %21, splat (float 5.000000e-01), !dbg !260
  %23 = fadd contract <2 x float> %22, splat (float 0x3EE4F8B580000000), !dbg !261
  %24 = tail call <2 x float> @llvm.sqrt.v2f32(<2 x float> %23), !dbg !262
  %25 = fdiv <2 x float> splat (float 1.000000e+00), %24, !dbg !262
  %26 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> zeroinitializer, !dbg !262
  %27 = shufflevector <2 x float> %25, <2 x float> poison, <2 x i32> <i32 1, i32 1>, !dbg !262
  %28 = fmul contract <2 x float> %12, %26, !dbg !263
  %29 = fmul contract <2 x float> %15, %27, !dbg !263
  %30 = fadd contract <2 x float> %28, zeroinitializer, !dbg !264
  %31 = fadd contract <2 x float> %29, zeroinitializer, !dbg !264
  %32 = getelementptr [4 x i8], ptr %7, i64 %10, !dbg !264
  store <2 x float> %30, ptr %32, align 16, !dbg !264
  %33 = getelementptr [4 x i8], ptr %7, i64 %13, !dbg !264
  store <2 x float> %31, ptr %33, align 8, !dbg !264
  ret i32 0, !dbg !265
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none)
define internal noundef i32 @"main$async_dispatch_21_batch_matmul_1x16x50257x2_f32"(ptr noalias nonnull readnone align 16 captures(none) %0, ptr noalias noundef nonnull readonly align 16 captures(none) %1, ptr noalias noundef nonnull readonly align 16 captures(none) %2) #0 !dbg !266 {
  %.elt20 = getelementptr inbounds nuw i8, ptr %1, i64 32, !dbg !267
  %.unpack21 = load ptr, ptr %.elt20, align 16, !dbg !267
  %4 = load ptr, ptr %.unpack21, align 8, !dbg !267
  call void @llvm.assume(i1 true) [ "align"(ptr %4, i64 64) ], !dbg !267
  %5 = getelementptr i8, ptr %.unpack21, i64 8, !dbg !268
  %6 = load ptr, ptr %5, align 8, !dbg !268
  %7 = getelementptr i8, ptr %6, i64 128, !dbg !268
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 64) ], !dbg !268
  %8 = getelementptr i8, ptr %.unpack21, i64 16, !dbg !269
  %9 = load ptr, ptr %8, align 8, !dbg !269
  call void @llvm.assume(i1 true) [ "align"(ptr %9, i64 64) ], !dbg !269
  %10 = load i32, ptr %2, align 16, !dbg !270
  %11 = zext i32 %10 to i64, !dbg !270
  %12 = shl nuw nsw i64 %11, 6, !dbg !270
  %13 = sub nsw i64 50257, %12, !dbg !270
  %14 = tail call i64 @llvm.smin.i64(i64 %13, i64 64), !dbg !270
  %15 = icmp ult i32 %10, 786
  br label %.preheader, !dbg !270

.preheader:                                       ; preds = %3, %._crit_edge
  %16 = phi i1 [ true, %3 ], [ false, %._crit_edge ]
  %17 = phi i64 [ 0, %3 ], [ 8, %._crit_edge ]
  br i1 %15, label %.lr.ph, label %._crit_edge, !dbg !270

.lr.ph:                                           ; preds = %.preheader
  %.idx = mul nuw nsw i64 %17, 201028
  %18 = getelementptr i8, ptr %9, i64 %.idx
  %19 = or disjoint i64 %17, 1
  %.idx24 = mul nuw nsw i64 %19, 201028
  %20 = getelementptr i8, ptr %9, i64 %.idx24
  %21 = or disjoint i64 %17, 2
  %.idx25 = mul nuw nsw i64 %21, 201028
  %22 = getelementptr i8, ptr %9, i64 %.idx25
  %23 = or disjoint i64 %17, 3
  %.idx26 = mul nuw nsw i64 %23, 201028
  %24 = getelementptr i8, ptr %9, i64 %.idx26
  %25 = or disjoint i64 %17, 4
  %.idx27 = mul nuw nsw i64 %25, 201028
  %26 = getelementptr i8, ptr %9, i64 %.idx27
  %27 = or disjoint i64 %17, 5
  %.idx28 = mul nuw nsw i64 %27, 201028
  %28 = getelementptr i8, ptr %9, i64 %.idx28
  %29 = or disjoint i64 %17, 6
  %.idx29 = mul nuw nsw i64 %29, 201028
  %30 = getelementptr i8, ptr %9, i64 %.idx29
  %31 = or disjoint i64 %17, 7
  %.idx30 = mul nuw nsw i64 %31, 201028
  %32 = getelementptr i8, ptr %9, i64 %.idx30
  %.idx31 = shl nuw nsw i64 %17, 3
  %33 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx31
  %.idx32 = shl nuw nsw i64 %19, 3
  %34 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx32
  %.idx33 = shl nuw nsw i64 %21, 3
  %35 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx33
  %.idx34 = shl nuw nsw i64 %23, 3
  %36 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx34
  %.idx35 = shl nuw nsw i64 %25, 3
  %37 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx35
  %.idx36 = shl nuw nsw i64 %27, 3
  %38 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx36
  %.idx37 = shl nuw nsw i64 %29, 3
  %39 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx37
  %.idx38 = shl nuw nsw i64 %31, 3
  %40 = getelementptr inbounds nuw i8, ptr %4, i64 %.idx38
  %41 = getelementptr inbounds nuw i8, ptr %33, i64 4
  %42 = getelementptr inbounds nuw i8, ptr %34, i64 4
  %43 = getelementptr inbounds nuw i8, ptr %35, i64 4
  %44 = getelementptr inbounds nuw i8, ptr %36, i64 4
  %45 = getelementptr inbounds nuw i8, ptr %37, i64 4
  %46 = getelementptr inbounds nuw i8, ptr %38, i64 4
  %47 = getelementptr inbounds nuw i8, ptr %39, i64 4
  %48 = getelementptr inbounds nuw i8, ptr %40, i64 4
  br label %49, !dbg !270

49:                                               ; preds = %.lr.ph, %49
  %50 = phi i64 [ 0, %.lr.ph ], [ %150, %49 ]
  %51 = sub nsw i64 %14, %50, !dbg !270
  %52 = tail call i64 @llvm.smin.i64(i64 %51, i64 29), !dbg !270
  %53 = trunc i64 %52 to i32, !dbg !271
  %54 = insertelement <29 x i32> poison, i32 %53, i64 0, !dbg !271
  %55 = shufflevector <29 x i32> %54, <29 x i32> poison, <29 x i32> zeroinitializer, !dbg !271
  %56 = icmp sgt <29 x i32> %55, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28>, !dbg !271
  %57 = add nuw nsw i64 %50, %12, !dbg !271
  %58 = getelementptr [4 x i8], ptr %18, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %58, <29 x i1> %56), !dbg !271
  %59 = getelementptr [4 x i8], ptr %20, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %59, <29 x i1> %56), !dbg !271
  %60 = getelementptr [4 x i8], ptr %22, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %60, <29 x i1> %56), !dbg !271
  %61 = getelementptr [4 x i8], ptr %24, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %61, <29 x i1> %56), !dbg !271
  %62 = getelementptr [4 x i8], ptr %26, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %62, <29 x i1> %56), !dbg !271
  %63 = getelementptr [4 x i8], ptr %28, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %63, <29 x i1> %56), !dbg !271
  %64 = getelementptr [4 x i8], ptr %30, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %64, <29 x i1> %56), !dbg !271
  %65 = getelementptr [4 x i8], ptr %32, i64 %57, !dbg !271
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> zeroinitializer, ptr align 4 %65, <29 x i1> %56), !dbg !271
  %66 = getelementptr [4 x i8], ptr %7, i64 %57, !dbg !270
  %67 = tail call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %66, <29 x i1> %56, <29 x float> poison), !dbg !270
  %68 = getelementptr i8, ptr %66, i64 201028, !dbg !270
  %69 = tail call <29 x float> @llvm.masked.load.v29f32.p0(ptr align 4 %68, <29 x i1> %56, <29 x float> poison), !dbg !270
  %70 = load float, ptr %33, align 64
  %71 = insertelement <29 x float> poison, float %70, i64 0
  %72 = shufflevector <29 x float> %71, <29 x float> poison, <29 x i32> zeroinitializer
  %73 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %72, <29 x float> %67, <29 x float> zeroinitializer)
  %74 = select <29 x i1> %56, <29 x float> %73, <29 x float> zeroinitializer
  %75 = load float, ptr %34, align 8
  %76 = insertelement <29 x float> poison, float %75, i64 0
  %77 = shufflevector <29 x float> %76, <29 x float> poison, <29 x i32> zeroinitializer
  %78 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %77, <29 x float> %67, <29 x float> zeroinitializer)
  %79 = select <29 x i1> %56, <29 x float> %78, <29 x float> zeroinitializer
  %80 = load float, ptr %35, align 16
  %81 = insertelement <29 x float> poison, float %80, i64 0
  %82 = shufflevector <29 x float> %81, <29 x float> poison, <29 x i32> zeroinitializer
  %83 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %82, <29 x float> %67, <29 x float> zeroinitializer)
  %84 = select <29 x i1> %56, <29 x float> %83, <29 x float> zeroinitializer
  %85 = load float, ptr %36, align 8
  %86 = insertelement <29 x float> poison, float %85, i64 0
  %87 = shufflevector <29 x float> %86, <29 x float> poison, <29 x i32> zeroinitializer
  %88 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %87, <29 x float> %67, <29 x float> zeroinitializer)
  %89 = select <29 x i1> %56, <29 x float> %88, <29 x float> zeroinitializer
  %90 = load float, ptr %37, align 32
  %91 = insertelement <29 x float> poison, float %90, i64 0
  %92 = shufflevector <29 x float> %91, <29 x float> poison, <29 x i32> zeroinitializer
  %93 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %92, <29 x float> %67, <29 x float> zeroinitializer)
  %94 = select <29 x i1> %56, <29 x float> %93, <29 x float> zeroinitializer
  %95 = load float, ptr %38, align 8
  %96 = insertelement <29 x float> poison, float %95, i64 0
  %97 = shufflevector <29 x float> %96, <29 x float> poison, <29 x i32> zeroinitializer
  %98 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %97, <29 x float> %67, <29 x float> zeroinitializer)
  %99 = select <29 x i1> %56, <29 x float> %98, <29 x float> zeroinitializer
  %100 = load float, ptr %39, align 16
  %101 = insertelement <29 x float> poison, float %100, i64 0
  %102 = shufflevector <29 x float> %101, <29 x float> poison, <29 x i32> zeroinitializer
  %103 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %102, <29 x float> %67, <29 x float> zeroinitializer)
  %104 = select <29 x i1> %56, <29 x float> %103, <29 x float> zeroinitializer
  %105 = load float, ptr %40, align 8
  %106 = insertelement <29 x float> poison, float %105, i64 0
  %107 = shufflevector <29 x float> %106, <29 x float> poison, <29 x i32> zeroinitializer
  %108 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %107, <29 x float> %67, <29 x float> zeroinitializer)
  %109 = select <29 x i1> %56, <29 x float> %108, <29 x float> zeroinitializer
  %110 = load float, ptr %41, align 4
  %111 = insertelement <29 x float> poison, float %110, i64 0
  %112 = shufflevector <29 x float> %111, <29 x float> poison, <29 x i32> zeroinitializer
  %113 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %112, <29 x float> %69, <29 x float> %74)
  %114 = select <29 x i1> %56, <29 x float> %113, <29 x float> zeroinitializer
  %115 = load float, ptr %42, align 4
  %116 = insertelement <29 x float> poison, float %115, i64 0
  %117 = shufflevector <29 x float> %116, <29 x float> poison, <29 x i32> zeroinitializer
  %118 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %117, <29 x float> %69, <29 x float> %79)
  %119 = select <29 x i1> %56, <29 x float> %118, <29 x float> zeroinitializer
  %120 = load float, ptr %43, align 4
  %121 = insertelement <29 x float> poison, float %120, i64 0
  %122 = shufflevector <29 x float> %121, <29 x float> poison, <29 x i32> zeroinitializer
  %123 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %122, <29 x float> %69, <29 x float> %84)
  %124 = select <29 x i1> %56, <29 x float> %123, <29 x float> zeroinitializer
  %125 = load float, ptr %44, align 4
  %126 = insertelement <29 x float> poison, float %125, i64 0
  %127 = shufflevector <29 x float> %126, <29 x float> poison, <29 x i32> zeroinitializer
  %128 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %127, <29 x float> %69, <29 x float> %89)
  %129 = select <29 x i1> %56, <29 x float> %128, <29 x float> zeroinitializer
  %130 = load float, ptr %45, align 4
  %131 = insertelement <29 x float> poison, float %130, i64 0
  %132 = shufflevector <29 x float> %131, <29 x float> poison, <29 x i32> zeroinitializer
  %133 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %132, <29 x float> %69, <29 x float> %94)
  %134 = select <29 x i1> %56, <29 x float> %133, <29 x float> zeroinitializer
  %135 = load float, ptr %46, align 4
  %136 = insertelement <29 x float> poison, float %135, i64 0
  %137 = shufflevector <29 x float> %136, <29 x float> poison, <29 x i32> zeroinitializer
  %138 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %137, <29 x float> %69, <29 x float> %99)
  %139 = select <29 x i1> %56, <29 x float> %138, <29 x float> zeroinitializer
  %140 = load float, ptr %47, align 4
  %141 = insertelement <29 x float> poison, float %140, i64 0
  %142 = shufflevector <29 x float> %141, <29 x float> poison, <29 x i32> zeroinitializer
  %143 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %142, <29 x float> %69, <29 x float> %104)
  %144 = select <29 x i1> %56, <29 x float> %143, <29 x float> zeroinitializer
  %145 = load float, ptr %48, align 4
  %146 = insertelement <29 x float> poison, float %145, i64 0
  %147 = shufflevector <29 x float> %146, <29 x float> poison, <29 x i32> zeroinitializer
  %148 = tail call <29 x float> @llvm.fmuladd.v29f32(<29 x float> %147, <29 x float> %69, <29 x float> %109)
  %149 = select <29 x i1> %56, <29 x float> %148, <29 x float> zeroinitializer
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %114, ptr align 4 %58, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %119, ptr align 4 %59, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %124, ptr align 4 %60, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %129, ptr align 4 %61, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %134, ptr align 4 %62, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %139, ptr align 4 %63, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %144, ptr align 4 %64, <29 x i1> %56)
  tail call void @llvm.masked.store.v29f32.p0(<29 x float> %149, ptr align 4 %65, <29 x i1> %56)
  %150 = add nuw nsw i64 %50, 29, !dbg !270
  %151 = icmp slt i64 %150, %14, !dbg !270
  br i1 %151, label %49, label %._crit_edge, !dbg !270

._crit_edge:                                      ; preds = %49, %.preheader
  br i1 %16, label %.preheader, label %152, !dbg !270

152:                                              ; preds = %._crit_edge
  ret i32 0, !dbg !272
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v2f32(float, <2 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.sqrt.v2f32(<2 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <6 x float> @llvm.fmuladd.v6f32(<6 x float>, <6 x float>, <6 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fmaximum.v16f32(<16 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fma.v2f32(<2 x float>, <2 x float>, <2 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.floor.v2f32(<2 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fma.v16f32(<16 x float>, <16 x float>, <16 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.floor.v16f32(<16 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v16f32(float, <16 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fmuladd.v8f32(<8 x float>, <8 x float>, <8 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fma.v8f32(<8 x float>, <8 x float>, <8 x float>) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v29f32.p0(<29 x float>, ptr captures(none), <29 x i1>) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <29 x float> @llvm.masked.load.v29f32.p0(ptr captures(none), <29 x i1>, <29 x float>) #5

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <29 x float> @llvm.fmuladd.v29f32(<29 x float>, <29 x float>, <29 x float>) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local dllexport ptr @iree_hal_executable_library_query(i32 %0, ptr readnone captures(none) %1) local_unnamed_addr #6 {
entry:
  %2 = icmp eq i32 %0, 6
  %3 = select i1 %2, ptr @iree_hal_executable_library_query_v0, ptr null
  ret ptr %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @iree_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #7 {
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
define internal signext i16 @iree_f2h_ieee(float noundef %0) local_unnamed_addr #7 {
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
define internal float @__gnu_h2f_ieee(i16 noundef signext %0) local_unnamed_addr #7 {
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
define internal float @__extendhfsf2(float noundef %0) local_unnamed_addr #7 {
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
define internal signext i16 @__gnu_f2h_ieee(float noundef %0) local_unnamed_addr #7 {
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
define internal float @__truncsfhf2(float noundef %0) local_unnamed_addr #7 {
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
  store i16 %36, ptr %2, align 4, !tbaa !273
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #8

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal double @__extendhfdf2(float noundef %0) local_unnamed_addr #7 {
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
define internal float @__truncdfhf2(double noundef %0) local_unnamed_addr #7 {
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
  store i16 %37, ptr %2, align 4, !tbaa !273
  %.0..0..0..0. = load float, ptr %2, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  ret float %.0..0..0..0.
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef double @fma(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #7 {
  %4 = tail call double @llvm.fmuladd.f64(double %0, double %1, double %2)
  ret double %4
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef float @__math_invalidf(float noundef %0) local_unnamed_addr #10 {
  %2 = fsub float %0, %0
  %3 = fdiv float %2, %2
  ret float %3
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_oflowf(i32 noundef %0) local_unnamed_addr #11 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x4600000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #11 {
  %3 = alloca float, align 4
  %.not = icmp eq i32 %0, 0
  %4 = fneg float %1
  %5 = select i1 %.not, float %1, float %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store volatile float %5, ptr %3, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %3, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %6 = fmul float %1, %.0..0..0..0..0..0..0..0..0..0..i
  ret float %6
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @__math_uflowf(i32 noundef %0) local_unnamed_addr #11 {
  %2 = alloca float, align 4
  %.not.i = icmp eq i32 %0, 0
  %3 = select i1 %.not.i, float 0x3A00000000000000, float 0xBA00000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float %3, ptr %2, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..i.i = load volatile float, ptr %2, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  %4 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..i.i, 0x3A00000000000000
  ret float %4
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @ceilf(float noundef %0) local_unnamed_addr #11 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !275
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
  store volatile float %24, ptr %2, align 4, !tbaa !275
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
define internal float @expf(float noundef %0) local_unnamed_addr #11 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = fpext float %0 to double
  %5 = bitcast float %0 to i32
  %6 = lshr i32 %5, 20
  %7 = and i32 %6, 2047
  %.not = icmp samesign ult i32 %7, 1067
  br i1 %.not, label %21, label %8, !prof !277

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
  store volatile float 0x4600000000000000, ptr %3, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %3, align 4, !tbaa !275
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %16 = fmul float %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i, 0x4600000000000000
  br label %39

17:                                               ; preds = %13
  %18 = fcmp olt float %0, 0xC059FE3680000000
  br i1 %18, label %19, label %21

19:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  store volatile float 0x3A00000000000000, ptr %2, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i3 = load volatile float, ptr %2, align 4, !tbaa !275
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
  %29 = load i64, ptr %28, align 8, !tbaa !278
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
define internal noundef i32 @feclearexcept(i32 noundef %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @feraiseexcept(i32 noundef %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fetestexcept(i32 noundef %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetround() local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @__fesetround(i32 noundef %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fegetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal noundef i32 @fesetenv(ptr noundef readnone captures(none) %0) local_unnamed_addr #10 {
  ret i32 0
}

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @floorf(float noundef %0) local_unnamed_addr #11 {
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
  store volatile float %16, ptr %3, align 4, !tbaa !275
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
  store volatile float %23, ptr %2, align 4, !tbaa !275
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
define internal float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #10 {
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
define internal float @fmodf(float noundef %0, float noundef %1) local_unnamed_addr #12 {
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
declare float @llvm.fabs.f32(float) #9

; Function Attrs: inlinehint nofree nosync nounwind memory(argmem: readwrite)
define internal float @frexpf(float noundef %0, ptr noundef captures(none) %1) local_unnamed_addr #13 {
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
  %9 = tail call float @frexpf(float noundef %8, ptr noundef %1) #15
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

; Function Attrs: inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal float @ldexpf(float noundef %0, i32 noundef %1) local_unnamed_addr #10 {
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
define internal float @scalbnf(float noundef %0, i32 noundef %1) local_unnamed_addr #10 {
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
declare i32 @llvm.umin.i32(i32, i32) #9

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #9

; Function Attrs: inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite)
define internal float @powf(float noundef %0, float noundef %1) local_unnamed_addr #11 {
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
  br i1 %or.cond99, label %.critedge, label %76, !prof !280

.critedge:                                        ; preds = %2
  %12 = add i32 %.pre, -1
  %13 = icmp ult i32 %12, -16777217
  br i1 %13, label %30, label %14, !prof !277

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
  br i1 %33, label %49, label %34, !prof !277

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
  store volatile float %48, ptr %5, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..i = load volatile float, ptr %5, align 4, !tbaa !275
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
  %85 = load double, ptr %84, align 8, !tbaa !281
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 8
  %87 = load double, ptr %86, align 8, !tbaa !284
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
  br i1 %104, label %105, label %115, !prof !285

105:                                              ; preds = %76
  %106 = fcmp ogt double %101, 0x405FFFFFFFD1D571
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %.not.i.i = icmp eq i32 %.050, 0
  %108 = select i1 %.not.i.i, float 0x4600000000000000, float 0xC600000000000000
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store volatile float %108, ptr %4, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i = load volatile float, ptr %4, align 4, !tbaa !275
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
  store volatile float %113, ptr %3, align 4, !tbaa !275
  %.0..0..0..0..0..0..0..0..0..0..0..0..0..0..i.i.i6 = load volatile float, ptr %3, align 4, !tbaa !275
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
  %122 = load i64, ptr %121, align 8, !tbaa !278
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
define internal noundef float @rintf(float noundef %0) local_unnamed_addr #10 {
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
define internal float @roundf(float noundef %0) local_unnamed_addr #11 {
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
  store volatile float %9, ptr %2, align 4, !tbaa !275
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #14

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: write, target_mem0: none, target_mem1: none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read) "frame-pointer"="all" "hot" "no-builtins" "nonlazybind" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "nonlazybind" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { inlinehint mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #11 = { inlinehint nofree norecurse nounwind memory(inaccessiblemem: readwrite) }
attributes #12 = { inlinehint nofree norecurse nosync nounwind memory(none) }
attributes #13 = { inlinehint nofree nosync nounwind memory(argmem: readwrite) }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { inlinehint }

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
!128 = !DILocation(line: 19, column: 8, scope: !125)
!129 = !DILocation(line: 20, column: 8, scope: !125)
!130 = !DILocation(line: 25, column: 8, scope: !125)
!131 = !DILocation(line: 27, column: 10, scope: !125)
!132 = !DILocation(line: 32, column: 10, scope: !125)
!133 = !DILocation(line: 33, column: 10, scope: !125)
!134 = !DILocation(line: 37, column: 8, scope: !125)
!135 = distinct !DISubprogram(name: "main$async_dispatch_2_reduction_16x2_f32", linkageName: "main$async_dispatch_2_reduction_16x2_f32", scope: !5, file: !5, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !4)
!136 = !DILocation(line: 16, column: 8, scope: !135)
!137 = !DILocation(line: 17, column: 8, scope: !135)
!138 = !DILocation(line: 22, column: 8, scope: !135)
!139 = !DILocation(line: 25, column: 10, scope: !135)
!140 = !DILocation(line: 30, column: 10, scope: !135)
!141 = !DILocation(line: 31, column: 10, scope: !135)
!142 = !DILocation(line: 32, column: 10, scope: !135)
!143 = !DILocation(line: 33, column: 10, scope: !135)
!144 = !DILocation(line: 35, column: 10, scope: !135)
!145 = !DILocation(line: 39, column: 8, scope: !135)
!146 = distinct !DISubprogram(name: "main$async_dispatch_3_matmul_16x6x2_f32", linkageName: "main$async_dispatch_3_matmul_16x6x2_f32", scope: !7, file: !7, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !6)
!147 = !DILocation(line: 14, column: 8, scope: !146)
!148 = !DILocation(line: 15, column: 8, scope: !146)
!149 = !DILocation(line: 19, column: 8, scope: !146)
!150 = !DILocation(line: 22, column: 10, scope: !146)
!151 = !DILocation(line: 26, column: 8, scope: !146)
!152 = distinct !DISubprogram(name: "main$async_dispatch_4_attention_2x16x16", linkageName: "main$async_dispatch_4_attention_2x16x16", scope: !9, file: !9, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8)
!153 = !DILocation(line: 13, column: 8, scope: !152)
!154 = !DILocation(line: 14, column: 8, scope: !152)
!155 = !DILocation(line: 15, column: 8, scope: !152)
!156 = !DILocation(line: 21, column: 8, scope: !152)
!157 = !DILocation(line: 26, column: 8, scope: !152)
!158 = distinct !DISubprogram(name: "main$async_dispatch_5_matmul_16x2x2_f32", linkageName: "main$async_dispatch_5_matmul_16x2x2_f32", scope: !11, file: !11, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10)
!159 = !DILocation(line: 15, column: 8, scope: !158)
!160 = !DILocation(line: 16, column: 8, scope: !158)
!161 = !DILocation(line: 17, column: 8, scope: !158)
!162 = !DILocation(line: 22, column: 8, scope: !158)
!163 = !DILocation(line: 23, column: 8, scope: !158)
!164 = !DILocation(line: 26, column: 10, scope: !158)
!165 = !DILocation(line: 30, column: 8, scope: !158)
!166 = distinct !DISubprogram(name: "main$async_dispatch_7_reduction_16x2_f32", linkageName: "main$async_dispatch_7_reduction_16x2_f32", scope: !13, file: !13, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !12)
!167 = !DILocation(line: 16, column: 8, scope: !166)
!168 = !DILocation(line: 17, column: 8, scope: !166)
!169 = !DILocation(line: 22, column: 8, scope: !166)
!170 = !DILocation(line: 25, column: 10, scope: !166)
!171 = !DILocation(line: 30, column: 10, scope: !166)
!172 = !DILocation(line: 31, column: 10, scope: !166)
!173 = !DILocation(line: 32, column: 10, scope: !166)
!174 = !DILocation(line: 33, column: 10, scope: !166)
!175 = !DILocation(line: 35, column: 10, scope: !166)
!176 = !DILocation(line: 39, column: 8, scope: !166)
!177 = distinct !DISubprogram(name: "main$async_dispatch_8_matmul_16x8x2_f32", linkageName: "main$async_dispatch_8_matmul_16x8x2_f32", scope: !15, file: !15, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !14)
!178 = !DILocation(line: 19, column: 8, scope: !177)
!179 = !DILocation(line: 20, column: 8, scope: !177)
!180 = !DILocation(line: 24, column: 8, scope: !177)
!181 = !DILocation(line: 35, column: 10, scope: !177)
!182 = !DILocation(line: 28, column: 10, scope: !177)
!183 = !DILocation(line: 29, column: 10, scope: !177)
!184 = !DILocation(line: 30, column: 10, scope: !177)
!185 = !DILocation(line: 31, column: 10, scope: !177)
!186 = !DILocation(line: 32, column: 10, scope: !177)
!187 = !DILocation(line: 33, column: 10, scope: !177)
!188 = !DILocation(line: 34, column: 10, scope: !177)
!189 = !DILocation(line: 39, column: 8, scope: !177)
!190 = distinct !DISubprogram(name: "main$async_dispatch_9_matmul_16x2x8_f32", linkageName: "main$async_dispatch_9_matmul_16x2x8_f32", scope: !17, file: !17, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !16)
!191 = !DILocation(line: 15, column: 8, scope: !190)
!192 = !DILocation(line: 16, column: 8, scope: !190)
!193 = !DILocation(line: 17, column: 8, scope: !190)
!194 = !DILocation(line: 22, column: 8, scope: !190)
!195 = !DILocation(line: 23, column: 8, scope: !190)
!196 = !DILocation(line: 26, column: 10, scope: !190)
!197 = !DILocation(line: 30, column: 8, scope: !190)
!198 = distinct !DISubprogram(name: "main$async_dispatch_11_reduction_16x2_f32", linkageName: "main$async_dispatch_11_reduction_16x2_f32", scope: !19, file: !19, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18)
!199 = !DILocation(line: 16, column: 8, scope: !198)
!200 = !DILocation(line: 17, column: 8, scope: !198)
!201 = !DILocation(line: 22, column: 8, scope: !198)
!202 = !DILocation(line: 25, column: 10, scope: !198)
!203 = !DILocation(line: 30, column: 10, scope: !198)
!204 = !DILocation(line: 31, column: 10, scope: !198)
!205 = !DILocation(line: 32, column: 10, scope: !198)
!206 = !DILocation(line: 33, column: 10, scope: !198)
!207 = !DILocation(line: 35, column: 10, scope: !198)
!208 = !DILocation(line: 39, column: 8, scope: !198)
!209 = distinct !DISubprogram(name: "main$async_dispatch_12_matmul_16x6x2_f32", linkageName: "main$async_dispatch_12_matmul_16x6x2_f32", scope: !21, file: !21, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20)
!210 = !DILocation(line: 14, column: 8, scope: !209)
!211 = !DILocation(line: 15, column: 8, scope: !209)
!212 = !DILocation(line: 19, column: 8, scope: !209)
!213 = !DILocation(line: 22, column: 10, scope: !209)
!214 = !DILocation(line: 26, column: 8, scope: !209)
!215 = distinct !DISubprogram(name: "main$async_dispatch_14_matmul_16x2x2_f32", linkageName: "main$async_dispatch_14_matmul_16x2x2_f32", scope: !23, file: !23, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22)
!216 = !DILocation(line: 15, column: 8, scope: !215)
!217 = !DILocation(line: 16, column: 8, scope: !215)
!218 = !DILocation(line: 17, column: 8, scope: !215)
!219 = !DILocation(line: 22, column: 8, scope: !215)
!220 = !DILocation(line: 23, column: 8, scope: !215)
!221 = !DILocation(line: 26, column: 10, scope: !215)
!222 = !DILocation(line: 30, column: 8, scope: !215)
!223 = distinct !DISubprogram(name: "main$async_dispatch_16_reduction_16x2_f32", linkageName: "main$async_dispatch_16_reduction_16x2_f32", scope: !25, file: !25, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !24)
!224 = !DILocation(line: 16, column: 8, scope: !223)
!225 = !DILocation(line: 17, column: 8, scope: !223)
!226 = !DILocation(line: 22, column: 8, scope: !223)
!227 = !DILocation(line: 25, column: 10, scope: !223)
!228 = !DILocation(line: 30, column: 10, scope: !223)
!229 = !DILocation(line: 31, column: 10, scope: !223)
!230 = !DILocation(line: 32, column: 10, scope: !223)
!231 = !DILocation(line: 33, column: 10, scope: !223)
!232 = !DILocation(line: 35, column: 10, scope: !223)
!233 = !DILocation(line: 39, column: 8, scope: !223)
!234 = distinct !DISubprogram(name: "main$async_dispatch_17_matmul_16x8x2_f32", linkageName: "main$async_dispatch_17_matmul_16x8x2_f32", scope: !27, file: !27, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !26)
!235 = !DILocation(line: 19, column: 8, scope: !234)
!236 = !DILocation(line: 20, column: 8, scope: !234)
!237 = !DILocation(line: 24, column: 8, scope: !234)
!238 = !DILocation(line: 35, column: 10, scope: !234)
!239 = !DILocation(line: 28, column: 10, scope: !234)
!240 = !DILocation(line: 29, column: 10, scope: !234)
!241 = !DILocation(line: 30, column: 10, scope: !234)
!242 = !DILocation(line: 31, column: 10, scope: !234)
!243 = !DILocation(line: 32, column: 10, scope: !234)
!244 = !DILocation(line: 33, column: 10, scope: !234)
!245 = !DILocation(line: 34, column: 10, scope: !234)
!246 = !DILocation(line: 39, column: 8, scope: !234)
!247 = distinct !DISubprogram(name: "main$async_dispatch_18_matmul_16x2x8_f32", linkageName: "main$async_dispatch_18_matmul_16x2x8_f32", scope: !29, file: !29, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !28)
!248 = !DILocation(line: 15, column: 8, scope: !247)
!249 = !DILocation(line: 16, column: 8, scope: !247)
!250 = !DILocation(line: 17, column: 8, scope: !247)
!251 = !DILocation(line: 22, column: 8, scope: !247)
!252 = !DILocation(line: 23, column: 8, scope: !247)
!253 = !DILocation(line: 26, column: 10, scope: !247)
!254 = !DILocation(line: 30, column: 8, scope: !247)
!255 = distinct !DISubprogram(name: "main$async_dispatch_20_reduction_16x2_f32", linkageName: "main$async_dispatch_20_reduction_16x2_f32", scope: !31, file: !31, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !30)
!256 = !DILocation(line: 16, column: 8, scope: !255)
!257 = !DILocation(line: 17, column: 8, scope: !255)
!258 = !DILocation(line: 22, column: 8, scope: !255)
!259 = !DILocation(line: 25, column: 10, scope: !255)
!260 = !DILocation(line: 30, column: 10, scope: !255)
!261 = !DILocation(line: 31, column: 10, scope: !255)
!262 = !DILocation(line: 32, column: 10, scope: !255)
!263 = !DILocation(line: 33, column: 10, scope: !255)
!264 = !DILocation(line: 35, column: 10, scope: !255)
!265 = !DILocation(line: 39, column: 8, scope: !255)
!266 = distinct !DISubprogram(name: "main$async_dispatch_21_batch_matmul_1x16x50257x2_f32", linkageName: "main$async_dispatch_21_batch_matmul_1x16x50257x2_f32", scope: !33, file: !33, line: 1, type: !42, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !32)
!267 = !DILocation(line: 12, column: 8, scope: !266)
!268 = !DILocation(line: 13, column: 8, scope: !266)
!269 = !DILocation(line: 14, column: 8, scope: !266)
!270 = !DILocation(line: 19, column: 8, scope: !266)
!271 = !DILocation(line: 9, column: 8, scope: !266)
!272 = !DILocation(line: 21, column: 8, scope: !266)
!273 = !{!274, !274, i64 0}
!274 = !{!"short", !39, i64 0}
!275 = !{!276, !276, i64 0}
!276 = !{!"float", !39, i64 0}
!277 = !{!"branch_weights", !"expected", i32 2000, i32 1}
!278 = !{!279, !279, i64 0}
!279 = !{!"long", !39, i64 0}
!280 = !{!"branch_weights", i32 4001, i32 4000000}
!281 = !{!282, !283, i64 0}
!282 = !{!"", !283, i64 0, !283, i64 8}
!283 = !{!"double", !39, i64 0}
!284 = !{!282, !283, i64 8}
!285 = !{!"branch_weights", !"expected", i32 1, i32 2000}
