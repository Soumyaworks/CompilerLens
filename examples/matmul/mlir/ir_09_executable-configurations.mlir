module @module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device loc("ir_00_torch_input.mlir":1:1)
  hal.executable private @main$async_dispatch_0 {
    hal.executable.variant public @embedded_elf_x86_64 target(<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>) {
      hal.executable.export public @main$async_dispatch_0_matmul_128x128x128_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device loc("ir_00_torch_input.mlir":3:10)) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("ir_00_torch_input.mlir":3:10)
        hal.return %x, %y, %z : index, index, index loc("ir_00_torch_input.mlir":3:10)
      } loc("ir_00_torch_input.mlir":3:10)
      builtin.module {
        func.func @main$async_dispatch_0_matmul_128x128x128_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = CPUDoubleTilingExpert>} {
          %cst = arith.constant 0.000000e+00 : f32 loc("ir_00_torch_input.mlir":3:10)
          %c0 = arith.constant 0 : index loc(unknown)
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":2:19)
          %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":2:57)
          %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":3:10)
          %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
          %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
          %5 = tensor.empty() : tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
          %6 = linalg.fill {lowering_config = #iree_cpu.lowering_config<vector_common_parallel = [8, 16]>} ins(%cst : f32) outs(%5 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
          %7 = linalg.matmul {lowering_config = #iree_cpu.lowering_config<distribution = [16, 64, 0], vector_common_parallel = [8, 16, 0], vector_reduction = [0, 0, 16]>} ins(%3, %4 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%6 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
          iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : tensor<128x128xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":3:10)
          return loc("ir_00_torch_input.mlir":3:10)
        } loc("ir_00_torch_input.mlir":3:10)
      } loc("ir_00_torch_input.mlir":3:10)
    } loc("ir_00_torch_input.mlir":3:10)
  } loc("ir_00_torch_input.mlir":3:10)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %c0 = arith.constant 0 : index loc(unknown)
    %c65536 = arith.constant 65536 : index loc("ir_00_torch_input.mlir":2:19)
    %c128 = arith.constant 128 : index loc(unknown)
    %element_type_f32 = hal.element_type<f32> : i32 loc("ir_00_torch_input.mlir":2:19)
    %dense_row_major = hal.encoding_type<dense_row_major> : i32 loc("ir_00_torch_input.mlir":2:19)
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("tensor") shape([%c128, %c128]) type(%element_type_f32) encoding(%dense_row_major) loc("ir_00_torch_input.mlir":2:19)
    %0 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<128x128xf32> in !stream.resource<external>{%c65536} loc("ir_00_torch_input.mlir":2:19)
    %1 = stream.timepoint.import on(#hal.device.affinity<@__device_0>) %arg2 : (!hal.fence) => !stream.timepoint loc("ir_00_torch_input.mlir":2:19)
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("tensor") shape([%c128, %c128]) type(%element_type_f32) encoding(%dense_row_major) loc("ir_00_torch_input.mlir":2:57)
    %2 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<128x128xf32> in !stream.resource<external>{%c65536} loc("ir_00_torch_input.mlir":2:57)
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%1) => !stream.resource<external>{%c65536} => !stream.timepoint loc("ir_00_torch_input.mlir":3:10)
    %3 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%result_timepoint) => with(%0 as %arg4: !stream.resource<external>{%c65536}, %2 as %arg5: !stream.resource<external>{%c65536}, %result as %arg6: !stream.resource<external>{%c65536}) {
      stream.cmd.dispatch @main$async_dispatch_0::@embedded_elf_x86_64::@main$async_dispatch_0_matmul_128x128x128_f32 {
        ro %arg4[%c0 for %c65536] : !stream.resource<external>{%c65536},
        ro %arg5[%c0 for %c65536] : !stream.resource<external>{%c65536},
        wo %arg6[%c0 for %c65536] : !stream.resource<external>{%c65536}
      } loc("ir_00_torch_input.mlir":3:10)
    } => !stream.timepoint loc("ir_00_torch_input.mlir":3:10)
    stream.timepoint.chain_external on(#hal.device.affinity<@__device_0>) %3 => (%arg3 : !hal.fence) loc("ir_00_torch_input.mlir":2:3)
    %4 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %result : tensor<128x128xf32> in !stream.resource<external>{%c65536} -> !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
    util.return %4 : !hal.buffer_view loc("ir_00_torch_input.mlir":4:5)
  } loc("ir_00_torch_input.mlir":2:3)
  util.func public @main(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub} {
    %0 = util.null : !hal.fence loc("ir_00_torch_input.mlir":2:3)
    %c-1_i32 = arith.constant -1 : i32 loc("ir_00_torch_input.mlir":2:3)
    %c0 = arith.constant 0 : index loc("ir_00_torch_input.mlir":2:3)
    %device_0 = hal.devices.get %c0 : !hal.device loc("ir_00_torch_input.mlir":2:3)
    %fence = hal.fence.create device(%device_0 : !hal.device) flags("None") : !hal.fence loc("ir_00_torch_input.mlir":2:3)
    %1 = util.call @main$async(%arg0, %arg1, %0, %fence) : (!hal.buffer_view, !hal.buffer_view, !hal.fence, !hal.fence) -> !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32 loc("ir_00_torch_input.mlir":2:3)
    util.return %1 : !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
  } loc("ir_00_torch_input.mlir":2:3)
} loc("ir_00_torch_input.mlir":1:1)