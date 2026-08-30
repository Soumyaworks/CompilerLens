module @module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device loc("ir_00_torch_input.mlir":1:1)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %0 = hal.tensor.import wait(%arg2) => %arg0 : !hal.buffer_view -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":2:19)
    %1 = hal.tensor.import wait(%arg2) => %arg1 : !hal.buffer_view -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":2:57)
    %2 = flow.dispatch.workgroups(%0, %1) : (tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>>) {
      %cst = arith.constant 0.000000e+00 : f32 loc("ir_00_torch_input.mlir":3:10)
      %5 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
      %6 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<128x128xf32>> -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
      %7 = tensor.empty() : tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
      %8 = linalg.fill ins(%cst : f32) outs(%7 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
      %9 = linalg.matmul ins(%5, %6 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%8 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:10)
      iree_tensor_ext.dispatch.tensor.store %9, %arg6, offsets = [0, 0], sizes = [128, 128], strides = [1, 1] : tensor<128x128xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<128x128xf32>> loc("ir_00_torch_input.mlir":3:10)
      flow.return loc("ir_00_torch_input.mlir":3:10)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("ir_00_torch_input.mlir":3:10)
      flow.return %x, %y, %z : index, index, index loc("ir_00_torch_input.mlir":3:10)
    } loc("ir_00_torch_input.mlir":3:10)
    %3 = hal.tensor.barrier join(%2 : tensor<128x128xf32>) => %arg3 : !hal.fence loc("ir_00_torch_input.mlir":2:3)
    %4 = hal.tensor.export %3 : tensor<128x128xf32> -> !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
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