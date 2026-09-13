module @module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1)
  util.global private @__hoisted_tensor_16x2xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
  util.global private @__hoisted_tensor_1x2x50257xf32 {stream.affinity.default = #hal.device.affinity<@__device_0>} = dense_resource<__elided__> : tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %cst = arith.constant dense_resource<__auto.constant_50257_2_torch.float32> : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46)
    %__hoisted_tensor_16x2xf32 = util.global.load immutable @__hoisted_tensor_16x2xf32 : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
    %__hoisted_tensor_1x2x50257xf32 = util.global.load immutable @__hoisted_tensor_1x2x50257xf32 : tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    %0 = hal.tensor.import wait(%arg2) => %arg0 : !hal.buffer_view -> tensor<1x16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %1 = hal.tensor.import wait(%arg2) => %arg1 : !hal.buffer_view -> tensor<1x1x16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:55)
    %2 = flow.tensor.reshape %0 : tensor<1x16xi64> -> tensor<16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
    %3 = flow.dispatch.workgroups(%cst, %2, %__hoisted_tensor_16x2xf32) : (tensor<50257x2xf32>, tensor<16xi64>, tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>>, %arg6: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg7: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %c50257 = arith.constant 50257 : index loc(unknown)
      %c0_i64 = arith.constant 0 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":20:10)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [50257, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>> -> tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0], sizes = [16], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>> -> tensor<16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      %33 = iree_tensor_ext.dispatch.tensor.load %arg6, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      %34 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%32, %33 : tensor<16xi64>, tensor<16x2xf32>) outs(%34 : tensor<16x2xf32>) {
      ^bb0(%in: i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10), %in_0: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)):
        %36 = linalg.index 1 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %37 = arith.index_cast %in : i64 to index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %38 = arith.cmpi slt, %37, %c50257 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        cf.assert %38, "index must be smaller than dim size" loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %39 = arith.cmpi sge, %in, %c0_i64 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        cf.assert %39, "index must be larger or equal to 0" loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %extracted = tensor.extract %31[%37, %36] : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %40 = arith.addf %extracted, %in_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        linalg.yield %40 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      iree_tensor_ext.dispatch.tensor.store %35, %arg7, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    %4 = flow.dispatch.workgroups(%3) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
        %37 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        linalg.yield %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<16x2xf32>, tensor<16xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
        %37 = arith.divf %in_2, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %38 = arith.subf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    %5 = flow.dispatch.workgroups(%4) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %cst_2 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_4 = arith.constant dense_resource<torch_tensor_2_torch.float32_1> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
        %37 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %38 = arith.addf %37, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35, %cst_3, %cst_4 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
        %37 = arith.divf %in_5, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %38 = arith.addf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %39 = math.rsqrt %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %40 = arith.mulf %in, %39 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %41 = arith.mulf %40, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %42 = arith.addf %41, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        linalg.yield %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    %6 = flow.dispatch.workgroups(%5) : (tensor<16x2xf32>) -> tensor<16x6xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_6_torch.float32> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_6_torch.float32> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %32 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %33 = linalg.fill ins(%cst_1 : f32) outs(%32 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %34 = linalg.matmul ins(%31, %cst_0 : tensor<16x2xf32>, tensor<2x6xf32>) outs(%33 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%34, %cst_2 : tensor<16x6xf32>, tensor<6xf32>) outs(%32 : tensor<16x6xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)):
        %36 = arith.addf %in, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        linalg.yield %36 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
      } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
      iree_tensor_ext.dispatch.tensor.store %35, %arg5, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    %7 = flow.tensor.reshape %6 : tensor<16x6xf32> -> tensor<1x16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
    %8 = flow.tensor.reshape %1 : tensor<1x1x16x16xf32> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    %9 = flow.dispatch.workgroups(%7, %8) : (tensor<1x16x6xf32>, tensor<16x16xf32>) -> tensor<2x16xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>>) {
      %cst_0 = arith.constant 1.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      %32 = tensor.empty() : tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":79:11)
      %33 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 4], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
      %34 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 2], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
      %35 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
      %36 = iree_linalg_ext.attention {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>]} ins(%35, %34, %33, %cst_0, %31 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<16x2xf32>, f32, tensor<16x16xf32>) outs(%32 : tensor<2x16xf32>) {
      ^bb0(%arg7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)):
        iree_linalg_ext.yield %arg7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      } -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : tensor<2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    %10 = flow.dispatch.workgroups(%9, %3) : (tensor<2x16xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_2_torch.float32> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_2> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %33 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %34 = linalg.fill ins(%cst_1 : f32) outs(%33 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %35 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%31, %cst_0 : tensor<2x16xf32>, tensor<2x2xf32>) outs(%34 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%35, %cst_2, %32 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%33 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":118:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)):
        %37 = arith.addf %in, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":123:11)
        %38 = arith.addf %37, %in_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    %11 = flow.dispatch.workgroups(%10) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
        %37 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        linalg.yield %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<16x2xf32>, tensor<16xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
        %37 = arith.divf %in_2, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %38 = arith.subf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    %12 = flow.dispatch.workgroups(%11) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %cst_2 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_3> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %cst_4 = arith.constant dense_resource<torch_tensor_2_torch.float32_4> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
        %37 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %38 = arith.addf %37, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35, %cst_3, %cst_4 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
        %37 = arith.divf %in_5, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %38 = arith.addf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %39 = math.rsqrt %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %40 = arith.mulf %in, %39 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %41 = arith.mulf %40, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %42 = arith.addf %41, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        linalg.yield %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    %13 = flow.dispatch.workgroups(%12) : (tensor<16x2xf32>) -> tensor<16x8xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_8_torch.float32> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
      %cst_3 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
      %cst_4 = arith.constant 1.000000e+00 : f32 loc(unknown)
      %cst_5 = arith.constant 5.000000e-01 : f32 loc(unknown)
      %cst_6 = arith.constant dense_resource<torch_tensor_8_torch.float32> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11)
      %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %32 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %33 = linalg.fill ins(%cst_1 : f32) outs(%32 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %34 = linalg.matmul ins(%31, %cst_0 : tensor<16x2xf32>, tensor<2x8xf32>) outs(%33 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%34, %cst_6 : tensor<16x8xf32>, tensor<8xf32>) outs(%32 : tensor<16x8xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":147:11), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
        %36 = arith.addf %in, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":152:11)
        %37 = math.fpowi %36, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":161:11)
        %38 = arith.mulf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
        %39 = arith.addf %36, %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":165:11)
        %40 = arith.mulf %39, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
        %41 = math.tanh %40 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":168:11)
        %42 = arith.addf %41, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":171:11)
        %43 = arith.mulf %36, %cst_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":159:11)
        %44 = arith.mulf %43, %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
        linalg.yield %44 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
      } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
      iree_tensor_ext.dispatch.tensor.store %35, %arg5, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    %14 = flow.dispatch.workgroups(%13, %10) : (tensor<16x8xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_8_2_torch.float32> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_5> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      %33 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %34 = linalg.fill ins(%cst_1 : f32) outs(%33 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %35 = linalg.matmul ins(%31, %cst_0 : tensor<16x8xf32>, tensor<8x2xf32>) outs(%34 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%32, %35, %cst_2 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%33 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":180:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)):
        %37 = arith.addf %in_3, %in_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":185:11)
        %38 = arith.addf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    %15 = flow.dispatch.workgroups(%14) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
        %37 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        linalg.yield %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<16x2xf32>, tensor<16xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
        %37 = arith.divf %in_2, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %38 = arith.subf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    %16 = flow.dispatch.workgroups(%15) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %cst_2 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_6> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %cst_4 = arith.constant dense_resource<torch_tensor_2_torch.float32_7> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
        %37 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %38 = arith.addf %37, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35, %cst_3, %cst_4 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
        %37 = arith.divf %in_5, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %38 = arith.addf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %39 = math.rsqrt %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %40 = arith.mulf %in, %39 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %41 = arith.mulf %40, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %42 = arith.addf %41, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        linalg.yield %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    %17 = flow.dispatch.workgroups(%16) : (tensor<16x2xf32>) -> tensor<16x6xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_6_torch.float32_1> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_6_torch.float32_1> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      %32 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %33 = linalg.fill ins(%cst_1 : f32) outs(%32 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      %34 = linalg.matmul ins(%31, %cst_0 : tensor<16x2xf32>, tensor<2x6xf32>) outs(%33 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%34, %cst_2 : tensor<16x6xf32>, tensor<6xf32>) outs(%32 : tensor<16x6xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)):
        %36 = arith.addf %in, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
        linalg.yield %36 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
      } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
      iree_tensor_ext.dispatch.tensor.store %35, %arg5, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    %18 = flow.tensor.reshape %17 : tensor<16x6xf32> -> tensor<1x16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
    %19 = flow.dispatch.workgroups(%18, %8) : (tensor<1x16x6xf32>, tensor<16x16xf32>) -> tensor<2x16xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>>) {
      %cst_0 = arith.constant 1.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      %32 = tensor.empty() : tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":79:11)
      %33 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 4], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":223:14)
      %34 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 2], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":223:14)
      %35 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":223:14)
      %36 = iree_linalg_ext.attention {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>]} ins(%35, %34, %33, %cst_0, %31 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<16x2xf32>, f32, tensor<16x16xf32>) outs(%32 : tensor<2x16xf32>) {
      ^bb0(%arg7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)):
        iree_linalg_ext.yield %arg7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      } -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : tensor<2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
    %20 = flow.dispatch.workgroups(%19, %14) : (tensor<2x16xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_2_torch.float32_1> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_8> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      %33 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %34 = linalg.fill ins(%cst_1 : f32) outs(%33 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %35 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%31, %cst_0 : tensor<2x16xf32>, tensor<2x2xf32>) outs(%34 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%35, %cst_2, %32 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%33 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":271:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)):
        %37 = arith.addf %in, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":276:12)
        %38 = arith.addf %37, %in_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    %21 = flow.dispatch.workgroups(%20) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
        %37 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        linalg.yield %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<16x2xf32>, tensor<16xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
        %37 = arith.divf %in_2, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %38 = arith.subf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    %22 = flow.dispatch.workgroups(%21) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %cst_2 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_9> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %cst_4 = arith.constant dense_resource<torch_tensor_2_torch.float32_10> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
        %37 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %38 = arith.addf %37, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35, %cst_3, %cst_4 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
        %37 = arith.divf %in_5, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %38 = arith.addf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %39 = math.rsqrt %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %40 = arith.mulf %in, %39 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %41 = arith.mulf %40, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %42 = arith.addf %41, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        linalg.yield %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    %23 = flow.dispatch.workgroups(%22) : (tensor<16x2xf32>) -> tensor<16x8xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_2_8_torch.float32_1> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
      %cst_3 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
      %cst_4 = arith.constant 1.000000e+00 : f32 loc(unknown)
      %cst_5 = arith.constant 5.000000e-01 : f32 loc(unknown)
      %cst_6 = arith.constant dense_resource<torch_tensor_8_torch.float32_1> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12)
      %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      %32 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %33 = linalg.fill ins(%cst_1 : f32) outs(%32 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      %34 = linalg.matmul ins(%31, %cst_0 : tensor<16x2xf32>, tensor<2x8xf32>) outs(%33 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%34, %cst_6 : tensor<16x8xf32>, tensor<8xf32>) outs(%32 : tensor<16x8xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":300:12), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
        %36 = arith.addf %in, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":305:12)
        %37 = math.fpowi %36, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":314:12)
        %38 = arith.mulf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":316:12)
        %39 = arith.addf %36, %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":318:12)
        %40 = arith.mulf %39, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":320:12)
        %41 = math.tanh %40 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":321:12)
        %42 = arith.addf %41, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":324:12)
        %43 = arith.mulf %36, %cst_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":312:12)
        %44 = arith.mulf %43, %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
        linalg.yield %44 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
      } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
      iree_tensor_ext.dispatch.tensor.store %35, %arg5, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    %24 = flow.dispatch.workgroups(%23, %20) : (tensor<16x8xf32>, tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant dense_resource<torch_tensor_8_2_torch.float32_1> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      %cst_1 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_11> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      %33 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %34 = linalg.fill ins(%cst_1 : f32) outs(%33 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      %35 = linalg.matmul ins(%31, %cst_0 : tensor<16x8xf32>, tensor<8x2xf32>) outs(%34 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%32, %35, %cst_2 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%33 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":333:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)):
        %37 = arith.addf %in_3, %in_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":338:12)
        %38 = arith.addf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg6, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    %25 = flow.dispatch.workgroups(%24) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
        %37 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        linalg.yield %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35 : tensor<16x2xf32>, tensor<16xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
        %37 = arith.divf %in_2, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %38 = arith.subf %in, %37 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %26 = flow.dispatch.workgroups(%25) : (tensor<16x2xf32>) -> tensor<16x2xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_1 = arith.constant 2.000000e+00 : f32 loc(unknown)
      %cst_2 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_12> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %cst_4 = arith.constant dense_resource<torch_tensor_2_torch.float32_13> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %32 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
      %33 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %35 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%31 : tensor<16x2xf32>) outs(%34 : tensor<16xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
        %37 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %38 = arith.addf %37, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        linalg.yield %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      %36 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%31, %35, %cst_3, %cst_4 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%32 : tensor<16x2xf32>) {
      ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_7: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
        %37 = arith.divf %in_5, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %38 = arith.addf %37, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %39 = math.rsqrt %38 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %40 = arith.mulf %in, %39 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %41 = arith.mulf %40, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %42 = arith.addf %41, %in_7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        linalg.yield %42 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      iree_tensor_ext.dispatch.tensor.store %36, %arg5, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %27 = flow.tensor.reshape %26 : tensor<16x2xf32> -> tensor<1x16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    %28 = flow.dispatch.workgroups(%27, %__hoisted_tensor_1x2x50257xf32) : (tensor<1x16x2xf32>, tensor<1x2x50257xf32>) -> tensor<1x16x50257xf32> =
        (%arg4: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>>, %arg5: !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>>, %arg6: !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>>) {
      %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      %31 = iree_tensor_ext.dispatch.tensor.load %arg4, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>> -> tensor<1x16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      %32 = iree_tensor_ext.dispatch.tensor.load %arg5, offsets = [0, 0, 0], sizes = [1, 2, 50257], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>> -> tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      %33 = tensor.empty() : tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      %34 = linalg.fill ins(%cst_0 : f32) outs(%33 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      %35 = linalg.batch_matmul ins(%31, %32 : tensor<1x16x2xf32>, tensor<1x2x50257xf32>) outs(%34 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      iree_tensor_ext.dispatch.tensor.store %35, %arg6, offsets = [0, 0, 0], sizes = [1, 16, 50257], strides = [1, 1, 1] : tensor<1x16x50257xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      flow.return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } count() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      flow.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
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