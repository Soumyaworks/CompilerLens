module @module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1)
  util.global private @__hoisted_tensor_16x2xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
  util.global private @__hoisted_tensor_1x2x50257xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  flow.executable private @main$async_dispatch_0 {
    flow.executable.export public @main$async_dispatch_0_elementwise_16x2_i64xf32xf32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    builtin.module {
      func.func @main$async_dispatch_0_elementwise_16x2_i64xf32xf32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10), %arg2: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10), %arg3: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)) {
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [50257, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>> -> tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0], sizes = [16], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>> -> tensor<16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %2 = iree_tensor_ext.dispatch.tensor.load %arg2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%1, %2 : tensor<16xi64>, tensor<16x2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10), %in_0: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)):
          %5 = linalg.index 1 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %6 = arith.index_cast %in : i64 to index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %extracted = tensor.extract %0[%6, %5] : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %7 = arith.addf %extracted, %in_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        iree_tensor_ext.dispatch.tensor.store %4, %arg3, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
  flow.executable private @main$async_dispatch_1 {
    flow.executable.export public @main$async_dispatch_1_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    builtin.module {
      func.func @main$async_dispatch_1_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %6 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4 : tensor<16x2xf32>, tensor<16xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %in_1: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %6 = arith.divf %in_1, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %7 = arith.subf %in, %6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  flow.executable private @main$async_dispatch_2 {
    flow.executable.export public @main$async_dispatch_2_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    builtin.module {
      func.func @main$async_dispatch_2_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_1> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %6 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %7 = arith.addf %6, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %6 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %7 = arith.addf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %8 = math.rsqrt %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %9 = arith.mulf %in, %8 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %10 = arith.mulf %9, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %11 = arith.addf %10, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  flow.executable private @main$async_dispatch_3 {
    flow.executable.export public @main$async_dispatch_3_matmul_16x6x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    builtin.module {
      func.func @main$async_dispatch_3_matmul_16x6x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_6_torch.float32> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_6_torch.float32> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %1 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %3 = linalg.matmul ins(%0, %cst : tensor<16x2xf32>, tensor<2x6xf32>) outs(%2 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_1 : tensor<16x6xf32>, tensor<6xf32>) outs(%1 : tensor<16x6xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)):
          %5 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
          linalg.yield %5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        iree_tensor_ext.dispatch.tensor.store %4, %arg1, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
  flow.executable private @main$async_dispatch_4 {
    flow.executable.export public @main$async_dispatch_4_attention_2x16x16 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    builtin.module {
      func.func @main$async_dispatch_4_attention_2x16x16(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)) {
        %cst = arith.constant 1.000000e+00 : f32 loc(unknown)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [16, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %1 = tensor.empty() : tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":79:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 4], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %3 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 2], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %4 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %5 = iree_linalg_ext.attention {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>]} ins(%4, %3, %2, %cst, %0 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<16x2xf32>, f32, tensor<16x16xf32>) outs(%1 : tensor<2x16xf32>) {
        ^bb0(%arg3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)):
          iree_linalg_ext.yield %arg3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        } -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg2, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : tensor<2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
  flow.executable private @main$async_dispatch_5 {
    flow.executable.export public @main$async_dispatch_5_matmul_16x2x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    builtin.module {
      func.func @main$async_dispatch_5_matmul_16x2x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_2_torch.float32> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_2> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %2 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %4 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%0, %cst : tensor<2x16xf32>, tensor<2x2xf32>) outs(%3 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4, %cst_1, %1 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%2 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":118:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)):
          %6 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":123:11)
          %7 = arith.addf %6, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
  flow.executable private @main$async_dispatch_7 {
    flow.executable.export public @main$async_dispatch_7_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    builtin.module {
      func.func @main$async_dispatch_7_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_3> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_4> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
          %6 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %7 = arith.addf %6, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
          %6 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %7 = arith.addf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %8 = math.rsqrt %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %9 = arith.mulf %in, %8 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %10 = arith.mulf %9, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %11 = arith.addf %10, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
  flow.executable private @main$async_dispatch_8 {
    flow.executable.export public @main$async_dispatch_8_matmul_16x8x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    builtin.module {
      func.func @main$async_dispatch_8_matmul_16x8x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_8_torch.float32> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
        %cst_2 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
        %cst_3 = arith.constant 1.000000e+00 : f32 loc(unknown)
        %cst_4 = arith.constant 5.000000e-01 : f32 loc(unknown)
        %cst_5 = arith.constant dense_resource<torch_tensor_8_torch.float32> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11)
        %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %1 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %3 = linalg.matmul ins(%0, %cst : tensor<16x2xf32>, tensor<2x8xf32>) outs(%2 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_5 : tensor<16x8xf32>, tensor<8xf32>) outs(%1 : tensor<16x8xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":147:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
          %5 = arith.addf %in, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":152:11)
          %6 = math.fpowi %5, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":161:11)
          %7 = arith.mulf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
          %8 = arith.addf %5, %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":165:11)
          %9 = arith.mulf %8, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
          %10 = math.tanh %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":168:11)
          %11 = arith.addf %10, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":171:11)
          %12 = arith.mulf %5, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":159:11)
          %13 = arith.mulf %12, %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
        } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
        iree_tensor_ext.dispatch.tensor.store %4, %arg1, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
  flow.executable private @main$async_dispatch_9 {
    flow.executable.export public @main$async_dispatch_9_matmul_16x2x8_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    builtin.module {
      func.func @main$async_dispatch_9_matmul_16x2x8_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)) {
        %cst = arith.constant dense_resource<torch_tensor_8_2_torch.float32> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_5> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %2 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %4 = linalg.matmul ins(%0, %cst : tensor<16x8xf32>, tensor<8x2xf32>) outs(%3 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%1, %4, %cst_1 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%2 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":180:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)):
          %6 = arith.addf %in_2, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":185:11)
          %7 = arith.addf %in, %6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
  flow.executable private @main$async_dispatch_11 {
    flow.executable.export public @main$async_dispatch_11_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    builtin.module {
      func.func @main$async_dispatch_11_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_6> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_7> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
          %6 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %7 = arith.addf %6, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
          %6 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %7 = arith.addf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %8 = math.rsqrt %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %9 = arith.mulf %in, %8 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %10 = arith.mulf %9, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %11 = arith.addf %10, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
  flow.executable private @main$async_dispatch_12 {
    flow.executable.export public @main$async_dispatch_12_matmul_16x6x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    builtin.module {
      func.func @main$async_dispatch_12_matmul_16x6x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_6_torch.float32_1> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_6_torch.float32_1> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %1 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %3 = linalg.matmul ins(%0, %cst : tensor<16x2xf32>, tensor<2x6xf32>) outs(%2 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_1 : tensor<16x6xf32>, tensor<6xf32>) outs(%1 : tensor<16x6xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)):
          %5 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
          linalg.yield %5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
        } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
        iree_tensor_ext.dispatch.tensor.store %4, %arg1, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
  flow.executable private @main$async_dispatch_14 {
    flow.executable.export public @main$async_dispatch_14_matmul_16x2x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    builtin.module {
      func.func @main$async_dispatch_14_matmul_16x2x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)) {
        %cst = arith.constant dense_resource<torch_tensor_2_2_torch.float32_1> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_8> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %2 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %4 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%0, %cst : tensor<2x16xf32>, tensor<2x2xf32>) outs(%3 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4, %cst_1, %1 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%2 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":271:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)):
          %6 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":276:12)
          %7 = arith.addf %6, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
        iree_tensor_ext.dispatch.tensor.store %5, %arg2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
  flow.executable private @main$async_dispatch_16 {
    flow.executable.export public @main$async_dispatch_16_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    builtin.module {
      func.func @main$async_dispatch_16_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_9> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_10> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
          %6 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %7 = arith.addf %6, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
          %6 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %7 = arith.addf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %8 = math.rsqrt %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %9 = arith.mulf %in, %8 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %10 = arith.mulf %9, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %11 = arith.addf %10, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
  flow.executable private @main$async_dispatch_17 {
    flow.executable.export public @main$async_dispatch_17_matmul_16x8x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    builtin.module {
      func.func @main$async_dispatch_17_matmul_16x8x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)) {
        %cst = arith.constant dense_resource<torch_tensor_2_8_torch.float32_1> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
        %cst_2 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
        %cst_3 = arith.constant 1.000000e+00 : f32 loc(unknown)
        %cst_4 = arith.constant 5.000000e-01 : f32 loc(unknown)
        %cst_5 = arith.constant dense_resource<torch_tensor_8_torch.float32_1> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12)
        %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %1 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %3 = linalg.matmul ins(%0, %cst : tensor<16x2xf32>, tensor<2x8xf32>) outs(%2 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_5 : tensor<16x8xf32>, tensor<8xf32>) outs(%1 : tensor<16x8xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":300:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
          %5 = arith.addf %in, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":305:12)
          %6 = math.fpowi %5, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":314:12)
          %7 = arith.mulf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":316:12)
          %8 = arith.addf %5, %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":318:12)
          %9 = arith.mulf %8, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":320:12)
          %10 = math.tanh %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":321:12)
          %11 = arith.addf %10, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":324:12)
          %12 = arith.mulf %5, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":312:12)
          %13 = arith.mulf %12, %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
        } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
        iree_tensor_ext.dispatch.tensor.store %4, %arg1, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
  flow.executable private @main$async_dispatch_18 {
    flow.executable.export public @main$async_dispatch_18_matmul_16x2x8_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    builtin.module {
      func.func @main$async_dispatch_18_matmul_16x2x8_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)) {
        %cst = arith.constant dense_resource<torch_tensor_8_2_torch.float32_1> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_11> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %2 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %4 = linalg.matmul ins(%0, %cst : tensor<16x8xf32>, tensor<8x2xf32>) outs(%3 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%1, %4, %cst_1 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%2 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":333:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)):
          %6 = arith.addf %in_2, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":338:12)
          %7 = arith.addf %in, %6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
        iree_tensor_ext.dispatch.tensor.store %5, %arg2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
  flow.executable private @main$async_dispatch_20 {
    flow.executable.export public @main$async_dispatch_20_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    builtin.module {
      func.func @main$async_dispatch_20_reduction_16x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %arg1: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_12> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_13> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %1 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%0 : tensor<16x2xf32>) outs(%3 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
          %6 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %7 = arith.addf %6, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%0, %4, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%1 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
          %6 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %7 = arith.addf %6, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %8 = math.rsqrt %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %9 = arith.mulf %in, %8 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %10 = arith.mulf %9, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %11 = arith.addf %10, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        iree_tensor_ext.dispatch.tensor.store %5, %arg1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
  flow.executable private @main$async_dispatch_21 {
    flow.executable.export public @main$async_dispatch_21_batch_matmul_1x16x50257x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    builtin.module {
      func.func @main$async_dispatch_21_batch_matmul_1x16x50257x2_f32(%arg0: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %arg1: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12), %arg2: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %0 = iree_tensor_ext.dispatch.tensor.load %arg0, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>> -> tensor<1x16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %1 = iree_tensor_ext.dispatch.tensor.load %arg1, offsets = [0, 0, 0], sizes = [1, 2, 50257], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>> -> tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %2 = tensor.empty() : tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %4 = linalg.batch_matmul ins(%0, %1 : tensor<1x16x2xf32>, tensor<1x2x50257xf32>) outs(%3 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        iree_tensor_ext.dispatch.tensor.store %4, %arg2, offsets = [0, 0, 0], sizes = [1, 16, 50257], strides = [1, 1, 1] : tensor<1x16x50257xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  util.global private @__constant_tensor_50257x2xf32 {inlining_policy = #util.inline.never, stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__auto.constant_50257_2_torch.float32> : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %__constant_tensor_50257x2xf32 = util.global.load immutable @__constant_tensor_50257x2xf32 : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46)
    %__hoisted_tensor_16x2xf32 = util.global.load immutable @__hoisted_tensor_16x2xf32 : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
    %__hoisted_tensor_1x2x50257xf32 = util.global.load immutable @__hoisted_tensor_1x2x50257xf32 : tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    %0 = hal.tensor.import wait(%arg2) => %arg0 : !hal.buffer_view -> tensor<1x16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %1 = hal.tensor.import wait(%arg2) => %arg1 : !hal.buffer_view -> tensor<1x1x16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:55)
    %2 = flow.tensor.reshape %0 : tensor<1x16xi64> -> tensor<16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
    %3 = flow.dispatch @main$async_dispatch_0::@main$async_dispatch_0_elementwise_16x2_i64xf32xf32(%__constant_tensor_50257x2xf32, %2, %__hoisted_tensor_16x2xf32) : (tensor<50257x2xf32>, tensor<16xi64>, tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    %4 = flow.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%3) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    %5 = flow.dispatch @main$async_dispatch_2::@main$async_dispatch_2_reduction_16x2_f32(%4) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    %6 = flow.dispatch @main$async_dispatch_3::@main$async_dispatch_3_matmul_16x6x2_f32(%5) : (tensor<16x2xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    %7 = flow.tensor.reshape %6 : tensor<16x6xf32> -> tensor<1x16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
    %8 = flow.tensor.reshape %1 : tensor<1x1x16x16xf32> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    %9 = flow.dispatch @main$async_dispatch_4::@main$async_dispatch_4_attention_2x16x16(%7, %8) : (tensor<1x16x6xf32>, tensor<16x16xf32>) -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    %10 = flow.dispatch @main$async_dispatch_5::@main$async_dispatch_5_matmul_16x2x2_f32(%9, %3) : (tensor<2x16xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    %11 = flow.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%10) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    %12 = flow.dispatch @main$async_dispatch_7::@main$async_dispatch_7_reduction_16x2_f32(%11) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    %13 = flow.dispatch @main$async_dispatch_8::@main$async_dispatch_8_matmul_16x8x2_f32(%12) : (tensor<16x2xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    %14 = flow.dispatch @main$async_dispatch_9::@main$async_dispatch_9_matmul_16x2x8_f32(%13, %10) : (tensor<16x8xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    %15 = flow.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%14) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    %16 = flow.dispatch @main$async_dispatch_11::@main$async_dispatch_11_reduction_16x2_f32(%15) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    %17 = flow.dispatch @main$async_dispatch_12::@main$async_dispatch_12_matmul_16x6x2_f32(%16) : (tensor<16x2xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    %18 = flow.tensor.reshape %17 : tensor<16x6xf32> -> tensor<1x16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
    %19 = flow.dispatch @main$async_dispatch_4::@main$async_dispatch_4_attention_2x16x16(%18, %8) : (tensor<1x16x6xf32>, tensor<16x16xf32>) -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
    %20 = flow.dispatch @main$async_dispatch_14::@main$async_dispatch_14_matmul_16x2x2_f32(%19, %14) : (tensor<2x16xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    %21 = flow.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%20) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    %22 = flow.dispatch @main$async_dispatch_16::@main$async_dispatch_16_reduction_16x2_f32(%21) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    %23 = flow.dispatch @main$async_dispatch_17::@main$async_dispatch_17_matmul_16x8x2_f32(%22) : (tensor<16x2xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    %24 = flow.dispatch @main$async_dispatch_18::@main$async_dispatch_18_matmul_16x2x8_f32(%23, %20) : (tensor<16x8xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    %25 = flow.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%24) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %26 = flow.dispatch @main$async_dispatch_20::@main$async_dispatch_20_reduction_16x2_f32(%25) : (tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %27 = flow.tensor.reshape %26 : tensor<16x2xf32> -> tensor<1x16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %28 = flow.dispatch @main$async_dispatch_21::@main$async_dispatch_21_batch_matmul_1x16x50257x2_f32(%27, %__hoisted_tensor_1x2x50257xf32) : (tensor<1x16x2xf32>, tensor<1x2x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    %29 = hal.tensor.barrier join(%28 : tensor<1x16x50257xf32>) => %arg3 : !hal.fence loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %30 = hal.tensor.export %29 : tensor<1x16x50257xf32> -> !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    util.return %30 : !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":363:5)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
  util.func public @main(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub} {
    %0 = util.null : !hal.fence loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %c-1_i32 = arith.constant -1 : i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %device_0 = hal.devices.get %c0 : !hal.device loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %fence = hal.fence.create device(%device_0 : !hal.device) flags("None") : !hal.fence loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %1 = util.call @main$async(%arg0, %arg1, %0, %fence) : (!hal.buffer_view, !hal.buffer_view, !hal.fence, !hal.fence) -> !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    util.return %1 : !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1)