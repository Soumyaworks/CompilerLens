hal.executable public @main$async_dispatch_0 {
  hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>) {
    hal.executable.export public @main$async_dispatch_0_matmul_128x128x128_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device loc("ir_00_torch_input.mlir":6:10)) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("ir_00_torch_input.mlir":6:10)
      hal.return %x, %y, %z : index, index, index loc("ir_00_torch_input.mlir":6:10)
    } loc("ir_00_torch_input.mlir":6:10)
    builtin.module {
      func.func @main$async_dispatch_0_matmul_128x128x128_f32() {
        %cst = arith.constant 0.000000e+00 : f32 loc("ir_00_torch_input.mlir":6:10)
        %c0 = arith.constant 0 : index loc(unknown)
        %c512 = arith.constant 512 : index loc("ir_00_torch_input.mlir":6:10)
        %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":3:19)
        %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c512) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":4:46)
        %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags(ReadOnly) : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128xf32>> loc("ir_00_torch_input.mlir":9:10)
        %3 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, ReadOnly>, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":6:10)
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0], sizes = [128], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128xf32>> -> tensor<128xf32> loc("ir_00_torch_input.mlir":6:10)
        %7 = tensor.empty() : tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
        %8 = linalg.fill ins(%cst : f32) outs(%7 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
        %9 = linalg.matmul ins(%4, %5 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%8 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
        %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%9, %6 : tensor<128x128xf32>, tensor<128xf32>) outs(%7 : tensor<128x128xf32>) {
        ^bb0(%in: f32 loc("ir_00_torch_input.mlir":6:10), %in_0: f32 loc("ir_00_torch_input.mlir":9:10), %out: f32 loc("ir_00_torch_input.mlir":10:10)):
          %11 = arith.addf %in, %in_0 : f32 loc("ir_00_torch_input.mlir":9:10)
          %12 = arith.cmpf ugt, %11, %cst : f32 loc("ir_00_torch_input.mlir":10:10)
          %13 = arith.select %12, %11, %cst : f32 loc("ir_00_torch_input.mlir":10:10)
          linalg.yield %13 : f32 loc("ir_00_torch_input.mlir":10:10)
        } -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":10:10)
        iree_tensor_ext.dispatch.tensor.store %10, %3, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : tensor<128x128xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":6:10)
        return loc("ir_00_torch_input.mlir":6:10)
      } loc("ir_00_torch_input.mlir":6:10)
    } loc("ir_00_torch_input.mlir":6:10)
  } loc("ir_00_torch_input.mlir":6:10)
} loc("ir_00_torch_input.mlir":6:10)
