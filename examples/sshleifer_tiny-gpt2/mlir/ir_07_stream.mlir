module @module attributes {stream.affinity.default = #hal.device.affinity<@__device_0>} {
  util.global private @__device_0 = #hal.device.target<"local", [#hal.executable.target<"llvm-cpu", "embedded-elf-x86_64", {cpu = "znver5", cpu_features = "+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu", data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = "x86_64-unknown-unknown-eabi-elf"}>]> : !hal.device loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1)
  util.global private @__hoisted_tensor_16x2xf32 : !stream.resource<constant> loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12])
  util.initializer {
    %c0 = arith.constant 0 : index loc(unknown)
    %c0_i64 = arith.constant 0 : i64 loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    %0 = stream.timepoint.immediate => !stream.timepoint loc(unknown)
    %buffer_cst = util.buffer.constant {alignment = 64 : index} : !util.buffer = #util.composite<804352xi8, [
    dense_resource<__elided__> : tensor<16x2xf32>,
    dense_resource<__elided__> : tensor<1x2x50257xf32>,
    dense<0> : vector<56xi8>,
    dense_resource<__auto.constant_50257_2_torch.float32> : tensor<50257x2xf32>,
    dense<0> : vector<56xi8>,
]> loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    %c804352 = arith.constant 804352 : index loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    %did_map, %result = stream.resource.try_map on(#hal.device.affinity<@__device_0>) %buffer_cst[%c0] : !util.buffer -> i1, !stream.resource<constant>{%c804352} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    cf.cond_br %did_map, ^bb2(%0, %result : !stream.timepoint, !stream.resource<constant>), ^bb1 loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
  ^bb1:  // pred: ^bb0
    %1 = stream.resource.alloc uninitialized on(#hal.device.affinity<@__device_0>) : !stream.resource<constant>{%c804352} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    %file = stream.file.constant on(#hal.device.affinity<@__device_0>) %buffer_cst[%c0 for %c804352] : !util.buffer{%c804352} -> !stream.file loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    %2 = stream.file.read on(#hal.device.affinity<@__device_0>) await(%0) => %file[%c0_i64], %1[%c0], %c804352 : !stream.file -> !stream.resource<constant>{%c804352} => !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
    cf.br ^bb2(%2, %1 : !stream.timepoint, !stream.resource<constant>) loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
  ^bb2(%3: !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46]), %4: !stream.resource<constant> loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])):  // 2 preds: ^bb0, ^bb1
    %5 = stream.timepoint.await sync %3 => %4 : !stream.resource<constant>{%c804352} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10])
    util.global.store %5, @__hoisted_tensor_16x2xf32 : !stream.resource<constant> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
    util.return loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
  } loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":1:1, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46])
  stream.executable private @main$async_dispatch_0 {
    stream.executable.export public @main$async_dispatch_0_elementwise_16x2_i64xf32xf32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    builtin.module {
      func.func @main$async_dispatch_0_elementwise_16x2_i64xf32xf32(%arg0: !stream.binding {stream.alignment = 64 : index} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10]), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10), %arg2: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)) {
        %c402240 = arith.constant 402240 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %c0 = arith.constant 0 : index loc(unknown)
        %0 = stream.binding.subspan %arg0[%c402240] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46)
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %2 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10)
        %3 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %4 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [50257, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<50257x2xf32>> -> tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %5 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0], sizes = [16], strides = [1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16xi64>> -> tensor<16xi64> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %6 = iree_tensor_ext.dispatch.tensor.load %2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %7 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %6 : tensor<16xi64>, tensor<16x2xf32>) outs(%7 : tensor<16x2xf32>) {
        ^bb0(%in: i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10), %in_0: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":31:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)):
          %9 = linalg.index 1 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %10 = arith.index_cast %in : i64 to index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %extracted = tensor.extract %4[%10, %9] : tensor<50257x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
          %11 = arith.addf %extracted, %in_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        iree_tensor_ext.dispatch.tensor.store %8, %3, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
  stream.executable private @main$async_dispatch_1 {
    stream.executable.export public @main$async_dispatch_1_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    builtin.module {
      func.func @main$async_dispatch_1_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %arg2: i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %arg3: i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %0 = arith.index_castui %arg2 : i32 to index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %1 = arith.index_castui %arg3 : i32 to index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %2:2 = util.assume.int 
            %0[<umin = 0, umax = 0>, <umin = 256, umax = 256, udiv = 256>, <umin = 0, umax = 0>, <umin = 256, umax = 256, udiv = 256>, <umin = 0, umax = 0>], 
            %1[<umin = 128, umax = 128, udiv = 128>, <umin = 0, umax = 0>, <umin = 128, umax = 128, udiv = 128>, <umin = 0, umax = 0>, <umin = 128, umax = 128, udiv = 128>]
          : index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = stream.binding.subspan %arg0[%2#0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %4 = stream.binding.subspan %arg1[%2#1] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = iree_tensor_ext.dispatch.tensor.load %3, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %7 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %8 = linalg.fill ins(%cst : f32) outs(%7 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %9 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%5 : tensor<16x2xf32>) outs(%8 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %11 = arith.addf %in, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %9 : tensor<16x2xf32>, tensor<16xf32>) outs(%6 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %in_1: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %11 = arith.divf %in_1, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %12 = arith.subf %in, %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %12 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        iree_tensor_ext.dispatch.tensor.store %10, %4, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  stream.executable private @main$async_dispatch_2 {
    stream.executable.export public @main$async_dispatch_2_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    builtin.module {
      func.func @main$async_dispatch_2_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_1> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %1 = stream.binding.subspan %arg1[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<16x2xf32>) outs(%5 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %8 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %9 = arith.addf %8, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)):
          %8 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %9 = arith.addf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %10 = math.rsqrt %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %11 = arith.mulf %in, %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %12 = arith.mulf %11, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          %13 = arith.addf %12, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
  stream.executable private @main$async_dispatch_3 {
    stream.executable.export public @main$async_dispatch_3_matmul_16x6x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    builtin.module {
      func.func @main$async_dispatch_3_matmul_16x6x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_6_torch.float32> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_6_torch.float32> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %0 = stream.binding.subspan %arg0[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %1 = stream.binding.subspan %arg1[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %3 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %5 = linalg.matmul ins(%2, %cst : tensor<16x2xf32>, tensor<2x6xf32>) outs(%4 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %cst_1 : tensor<16x6xf32>, tensor<6xf32>) outs(%3 : tensor<16x6xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":59:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)):
          %7 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        iree_tensor_ext.dispatch.tensor.store %6, %1, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
  stream.executable private @main$async_dispatch_4 {
    stream.executable.export public @main$async_dispatch_4_attention_2x16x16 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    builtin.module {
      func.func @main$async_dispatch_4_attention_2x16x16(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11), %arg2: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)) {
        %cst = arith.constant 1.000000e+00 : f32 loc(unknown)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %0 = stream.binding.subspan %arg0[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":61:11)
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %2 = stream.binding.subspan %arg2[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %3 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x16xf32>> -> tensor<16x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %4 = tensor.empty() : tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":79:11)
        %5 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 4], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %6 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 2], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %7 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x6xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":70:13)
        %8 = iree_linalg_ext.attention {indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> ()>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>]} ins(%7, %6, %5, %cst, %3 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<16x2xf32>, f32, tensor<16x16xf32>) outs(%4 : tensor<2x16xf32>) {
        ^bb0(%arg3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)):
          iree_linalg_ext.yield %arg3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        } -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        iree_tensor_ext.dispatch.tensor.store %8, %2, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : tensor<2x16xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
  stream.executable private @main$async_dispatch_5 {
    stream.executable.export public @main$async_dispatch_5_matmul_16x2x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    builtin.module {
      func.func @main$async_dispatch_5_matmul_16x2x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10]), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_2_torch.float32> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_2> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
        %1 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
        %2 = stream.binding.subspan %arg1[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %5 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %6 = linalg.fill ins(%cst_0 : f32) outs(%5 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %7 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%3, %cst : tensor<2x16xf32>, tensor<2x2xf32>) outs(%6 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%7, %cst_1, %4 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%5 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":118:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":121:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)):
          %9 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":123:11)
          %10 = arith.addf %9, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
          linalg.yield %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11)
        iree_tensor_ext.dispatch.tensor.store %8, %2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
  stream.executable private @main$async_dispatch_7 {
    stream.executable.export public @main$async_dispatch_7_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    builtin.module {
      func.func @main$async_dispatch_7_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_3> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_4> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %1 = stream.binding.subspan %arg1[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<16x2xf32>) outs(%5 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
          %8 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %9 = arith.addf %8, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          linalg.yield %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)):
          %8 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %9 = arith.addf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %10 = math.rsqrt %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %11 = arith.mulf %in, %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %12 = arith.mulf %11, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          %13 = arith.addf %12, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
  stream.executable private @main$async_dispatch_8 {
    stream.executable.export public @main$async_dispatch_8_matmul_16x8x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    builtin.module {
      func.func @main$async_dispatch_8_matmul_16x8x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_8_torch.float32> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
        %cst_2 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
        %cst_3 = arith.constant 1.000000e+00 : f32 loc(unknown)
        %cst_4 = arith.constant 5.000000e-01 : f32 loc(unknown)
        %cst_5 = arith.constant dense_resource<torch_tensor_8_torch.float32> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11)
        %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
        %1 = stream.binding.subspan %arg1[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %3 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %5 = linalg.matmul ins(%2, %cst : tensor<16x2xf32>, tensor<2x8xf32>) outs(%4 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %cst_5 : tensor<16x8xf32>, tensor<8xf32>) outs(%3 : tensor<16x8xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":147:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":150:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
          %7 = arith.addf %in, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":152:11)
          %8 = math.fpowi %7, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":161:11)
          %9 = arith.mulf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
          %10 = arith.addf %7, %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":165:11)
          %11 = arith.mulf %10, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
          %12 = math.tanh %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":168:11)
          %13 = arith.addf %12, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":171:11)
          %14 = arith.mulf %7, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":159:11)
          %15 = arith.mulf %14, %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
          linalg.yield %15 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
        } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":172:11)
        iree_tensor_ext.dispatch.tensor.store %6, %1, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
  stream.executable private @main$async_dispatch_9 {
    stream.executable.export public @main$async_dispatch_9_matmul_16x2x8_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    builtin.module {
      func.func @main$async_dispatch_9_matmul_16x2x8_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11]), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)) {
        %cst = arith.constant dense_resource<torch_tensor_8_2_torch.float32> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_5> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %0 = stream.binding.subspan %arg0[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %1 = stream.binding.subspan %arg0[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %2 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %5 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %6 = linalg.fill ins(%cst_0 : f32) outs(%5 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %7 = linalg.matmul ins(%3, %cst : tensor<16x8xf32>, tensor<8x2xf32>) outs(%6 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4, %7, %cst_1 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%5 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":132:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":180:11), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":183:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)):
          %9 = arith.addf %in_2, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":185:11)
          %10 = arith.addf %in, %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
          linalg.yield %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11)
        iree_tensor_ext.dispatch.tensor.store %8, %2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
  stream.executable private @main$async_dispatch_11 {
    stream.executable.export public @main$async_dispatch_11_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    builtin.module {
      func.func @main$async_dispatch_11_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_6> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_7> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %1 = stream.binding.subspan %arg1[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<16x2xf32>) outs(%5 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
          %8 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %9 = arith.addf %8, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          linalg.yield %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)):
          %8 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %9 = arith.addf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %10 = math.rsqrt %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %11 = arith.mulf %in, %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %12 = arith.mulf %11, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          %13 = arith.addf %12, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
  stream.executable private @main$async_dispatch_12 {
    stream.executable.export public @main$async_dispatch_12_matmul_16x6x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    builtin.module {
      func.func @main$async_dispatch_12_matmul_16x6x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)) {
        %cst = arith.constant dense_resource<torch_tensor_2_6_torch.float32_1> : tensor<2x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_6_torch.float32_1> : tensor<6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %0 = stream.binding.subspan %arg0[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
        %1 = stream.binding.subspan %arg1[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %3 = tensor.empty() : tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
        %5 = linalg.matmul ins(%2, %cst : tensor<16x2xf32>, tensor<2x6xf32>) outs(%4 : tensor<16x6xf32>) -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %cst_1 : tensor<16x6xf32>, tensor<6xf32>) outs(%3 : tensor<16x6xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":212:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)):
          %7 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
          linalg.yield %7 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
        } -> tensor<16x6xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":214:11)
        iree_tensor_ext.dispatch.tensor.store %6, %1, offsets = [0, 0], sizes = [16, 6], strides = [1, 1] : tensor<16x6xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x6xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
  stream.executable private @main$async_dispatch_14 {
    stream.executable.export public @main$async_dispatch_14_matmul_16x2x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    builtin.module {
      func.func @main$async_dispatch_14_matmul_16x2x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11]), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)) {
        %cst = arith.constant dense_resource<torch_tensor_2_2_torch.float32_1> : tensor<2x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_8> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
        %1 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
        %2 = stream.binding.subspan %arg1[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [2, 16], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<2x16xf32>> -> tensor<2x16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %5 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %6 = linalg.fill ins(%cst_0 : f32) outs(%5 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %7 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%3, %cst : tensor<2x16xf32>, tensor<2x2xf32>) outs(%6 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%7, %cst_1, %4 : tensor<16x2xf32>, tensor<2xf32>, tensor<16x2xf32>) outs(%5 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":271:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":274:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":194:11), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)):
          %9 = arith.addf %in, %in_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":276:12)
          %10 = arith.addf %9, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
          linalg.yield %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12)
        iree_tensor_ext.dispatch.tensor.store %8, %2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
  stream.executable private @main$async_dispatch_16 {
    stream.executable.export public @main$async_dispatch_16_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    builtin.module {
      func.func @main$async_dispatch_16_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_9> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_10> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %1 = stream.binding.subspan %arg1[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<16x2xf32>) outs(%5 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
          %8 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %9 = arith.addf %8, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          linalg.yield %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)):
          %8 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %9 = arith.addf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %10 = math.rsqrt %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %11 = arith.mulf %in, %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %12 = arith.mulf %11, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          %13 = arith.addf %12, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
  stream.executable private @main$async_dispatch_17 {
    stream.executable.export public @main$async_dispatch_17_matmul_16x8x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    builtin.module {
      func.func @main$async_dispatch_17_matmul_16x8x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)) {
        %cst = arith.constant dense_resource<torch_tensor_2_8_torch.float32_1> : tensor<2x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant 4.471500e-02 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":163:11)
        %cst_2 = arith.constant 0.797884523 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":167:11)
        %cst_3 = arith.constant 1.000000e+00 : f32 loc(unknown)
        %cst_4 = arith.constant 5.000000e-01 : f32 loc(unknown)
        %cst_5 = arith.constant dense_resource<torch_tensor_8_torch.float32_1> : tensor<8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12)
        %c3_i64 = arith.constant 3 : i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":110:11)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
        %1 = stream.binding.subspan %arg1[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %3 = tensor.empty() : tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %4 = linalg.fill ins(%cst_0 : f32) outs(%3 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
        %5 = linalg.matmul ins(%2, %cst : tensor<16x2xf32>, tensor<2x8xf32>) outs(%4 : tensor<16x8xf32>) -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%5, %cst_5 : tensor<16x8xf32>, tensor<8xf32>) outs(%3 : tensor<16x8xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":300:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":303:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)):
          %7 = arith.addf %in, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":305:12)
          %8 = math.fpowi %7, %c3_i64 : f32, i64 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":314:12)
          %9 = arith.mulf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":316:12)
          %10 = arith.addf %7, %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":318:12)
          %11 = arith.mulf %10, %cst_2 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":320:12)
          %12 = math.tanh %11 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":321:12)
          %13 = arith.addf %12, %cst_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":324:12)
          %14 = arith.mulf %7, %cst_4 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":312:12)
          %15 = arith.mulf %14, %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
          linalg.yield %15 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
        } -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":325:12)
        iree_tensor_ext.dispatch.tensor.store %6, %1, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : tensor<16x8xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
  stream.executable private @main$async_dispatch_18 {
    stream.executable.export public @main$async_dispatch_18_matmul_16x2x8_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    builtin.module {
      func.func @main$async_dispatch_18_matmul_16x2x8_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12]), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)) {
        %cst = arith.constant dense_resource<torch_tensor_8_2_torch.float32_1> : tensor<8x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %cst_0 = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_1 = arith.constant dense_resource<torch_tensor_2_torch.float32_11> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12)
        %c384 = arith.constant 384 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %c256 = arith.constant 256 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %0 = stream.binding.subspan %arg0[%c384] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
        %1 = stream.binding.subspan %arg0[%c256] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
        %2 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 8], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x8xf32>> -> tensor<16x8xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %5 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %6 = linalg.fill ins(%cst_0 : f32) outs(%5 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
        %7 = linalg.matmul ins(%3, %cst : tensor<16x8xf32>, tensor<8x2xf32>) outs(%6 : tensor<16x2xf32>) -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        %8 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4, %7, %cst_1 : tensor<16x2xf32>, tensor<16x2xf32>, tensor<2xf32>) outs(%5 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":285:12), %in_2: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":333:12), %in_3: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":336:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)):
          %9 = arith.addf %in_2, %in_3 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":338:12)
          %10 = arith.addf %in, %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
          linalg.yield %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":347:12)
        iree_tensor_ext.dispatch.tensor.store %8, %2, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
  stream.executable private @main$async_dispatch_20 {
    stream.executable.export public @main$async_dispatch_20_reduction_16x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    builtin.module {
      func.func @main$async_dispatch_20_reduction_16x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_0 = arith.constant 2.000000e+00 : f32 loc(unknown)
        %cst_1 = arith.constant 9.99999974E-6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %cst_2 = arith.constant dense_resource<torch_tensor_2_torch.float32_12> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %cst_3 = arith.constant dense_resource<torch_tensor_2_torch.float32_13> : tensor<2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %c0 = arith.constant 0 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %0 = stream.binding.subspan %arg0[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %1 = stream.binding.subspan %arg1[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %2 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<16x2xf32>> -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %3 = tensor.empty() : tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":14:10)
        %4 = tensor.empty() : tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<16xf32>) -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = ["parallel", "reduction"]} ins(%2 : tensor<16x2xf32>) outs(%5 : tensor<16xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
          %8 = arith.mulf %in, %in : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %9 = arith.addf %8, %out : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          linalg.yield %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        } -> tensor<16xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %7 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%2, %6, %cst_2, %cst_3 : tensor<16x2xf32>, tensor<16xf32>, tensor<2xf32>, tensor<2xf32>) outs(%3 : tensor<16x2xf32>) {
        ^bb0(%in: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_4: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_5: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %in_6: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %out: f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)):
          %8 = arith.divf %in_4, %cst_0 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %9 = arith.addf %8, %cst_1 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %10 = math.rsqrt %9 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %11 = arith.mulf %in, %10 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %12 = arith.mulf %11, %in_5 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          %13 = arith.addf %12, %in_6 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
          linalg.yield %13 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        } -> tensor<16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        iree_tensor_ext.dispatch.tensor.store %7, %1, offsets = [0, 0], sizes = [16, 2], strides = [1, 1] : tensor<16x2xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
  stream.executable private @main$async_dispatch_21 {
    stream.executable.export public @main$async_dispatch_21_batch_matmul_1x16x50257x2_f32 workgroups() -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice() loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      stream.return %x, %y, %z : index, index, index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    builtin.module {
      func.func @main$async_dispatch_21_batch_matmul_1x16x50257x2_f32(%arg0: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12), %arg1: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12), %arg2: !stream.binding {stream.alignment = 64 : index} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)) {
        %cst = arith.constant 0.000000e+00 : f32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
        %c0 = arith.constant 0 : index loc(unknown)
        %c128 = arith.constant 128 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %0 = stream.binding.subspan %arg0[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
        %1 = stream.binding.subspan %arg1[%c128] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %2 = stream.binding.subspan %arg2[%c0] : !stream.binding -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0, 0], sizes = [1, 16, 2], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x16x2xf32>> -> tensor<1x16x2xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0, 0], sizes = [1, 2, 50257], strides = [1, 1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1x2x50257xf32>> -> tensor<1x2x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %5 = tensor.empty() : tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %6 = linalg.fill ins(%cst : f32) outs(%5 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        %7 = linalg.batch_matmul ins(%3, %4 : tensor<1x16x2xf32>, tensor<1x2x50257xf32>) outs(%6 : tensor<1x16x50257xf32>) -> tensor<1x16x50257xf32> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0, 0], sizes = [1, 16, 50257], strides = [1, 1, 1] : tensor<1x16x50257xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1x16x50257xf32>> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
        return loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %c256_i32 = arith.constant 256 : i32 loc(unknown)
    %c128_i32 = arith.constant 128 : i32 loc(unknown)
    %c0_i32 = arith.constant 0 : i32 loc(unknown)
    %c3216448 = arith.constant 3216448 : index loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    %c0 = arith.constant 0 : index loc(unknown)
    %c1024 = arith.constant 1024 : index loc(unknown)
    %c128 = arith.constant 128 : index loc(unknown)
    %c16 = arith.constant 16 : index loc(unknown)
    %c1 = arith.constant 1 : index loc(unknown)
    %c896 = arith.constant 896 : index loc(unknown)
    %c804352 = arith.constant 804352 : index loc(unknown)
    %__hoisted_tensor_16x2xf32 = util.global.load immutable @__hoisted_tensor_16x2xf32 : !stream.resource<constant> loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":9:46)
    %element_type_i64 = hal.element_type<i64> : i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %dense_row_major = hal.encoding_type<dense_row_major> : i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("tensor") shape([%c1, %c16]) type(%element_type_i64) encoding(%dense_row_major) loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %0 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg0 : !hal.buffer_view -> tensor<1x16xi64> in !stream.resource<external>{%c128} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %1 = stream.timepoint.import on(#hal.device.affinity<@__device_0>) %arg2 : (!hal.fence) => !stream.timepoint loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:19)
    %element_type_f32 = hal.element_type<f32> : i32 loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:55)
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("tensor") shape([%c1, %c1, %c16, %c16]) type(%element_type_f32) encoding(%dense_row_major) loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:55)
    %2 = stream.tensor.import on(#hal.device.affinity<@__device_0>) %arg1 : !hal.buffer_view -> tensor<1x1x16x16xf32> in !stream.resource<external>{%c1024} loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:55)
    %result, %result_timepoint = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%1) => !stream.resource<external>{%c3216448} => !stream.timepoint loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    %result_0, %result_timepoint_1 = stream.resource.alloca uninitialized on(#hal.device.affinity<@__device_0>) await(%1) => !stream.resource<transient>{%c896} => !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12])
    %3 = stream.timepoint.join max(%result_timepoint, %result_timepoint_1) => !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10])
    %4 = stream.cmd.execute on(#hal.device.affinity<@__device_0>) await(%3) => with(%__hoisted_tensor_16x2xf32 as %arg4: !stream.resource<constant>{%c804352}, %0 as %arg5: !stream.resource<external>{%c128}, %2 as %arg6: !stream.resource<external>{%c1024}, %result as %arg7: !stream.resource<external>{%c3216448}, %result_0 as %arg8: !stream.resource<transient>{%c896}) {
      stream.cmd.dispatch @main$async_dispatch_0::@main$async_dispatch_0_elementwise_16x2_i64xf32xf32 {
        ro %arg4[%c0 for %c804352] : !stream.resource<constant>{%c804352},
        ro %arg5[%c0 for %c128] : !stream.resource<external>{%c128},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10)
      stream.cmd.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%c0_i32, %c128_i32 : i32, i32) {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      stream.cmd.dispatch @main$async_dispatch_2::@main$async_dispatch_2_reduction_16x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11)
      stream.cmd.dispatch @main$async_dispatch_3::@main$async_dispatch_3_matmul_16x6x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11)
      stream.cmd.dispatch @main$async_dispatch_4::@main$async_dispatch_4_attention_2x16x16 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        ro %arg6[%c0 for %c1024] : !stream.resource<external>{%c1024},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11)
      stream.cmd.dispatch @main$async_dispatch_5::@main$async_dispatch_5_matmul_16x2x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11)
      stream.cmd.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%c256_i32, %c0_i32 : i32, i32) {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      stream.cmd.dispatch @main$async_dispatch_7::@main$async_dispatch_7_reduction_16x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11)
      stream.cmd.dispatch @main$async_dispatch_8::@main$async_dispatch_8_matmul_16x8x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11)
      stream.cmd.dispatch @main$async_dispatch_9::@main$async_dispatch_9_matmul_16x2x8_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11)
      stream.cmd.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%c0_i32, %c128_i32 : i32, i32) {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      stream.cmd.dispatch @main$async_dispatch_11::@main$async_dispatch_11_reduction_16x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11)
      stream.cmd.dispatch @main$async_dispatch_12::@main$async_dispatch_12_matmul_16x6x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11)
      stream.cmd.dispatch @main$async_dispatch_4::@main$async_dispatch_4_attention_2x16x16 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        ro %arg6[%c0 for %c1024] : !stream.resource<external>{%c1024},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12)
      stream.cmd.dispatch @main$async_dispatch_14::@main$async_dispatch_14_matmul_16x2x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12)
      stream.cmd.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%c256_i32, %c0_i32 : i32, i32) {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      stream.cmd.dispatch @main$async_dispatch_16::@main$async_dispatch_16_reduction_16x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12)
      stream.cmd.dispatch @main$async_dispatch_17::@main$async_dispatch_17_matmul_16x8x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12)
      stream.cmd.dispatch @main$async_dispatch_18::@main$async_dispatch_18_matmul_16x2x8_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12)
      stream.cmd.dispatch @main$async_dispatch_1::@main$async_dispatch_1_reduction_16x2_f32(%c0_i32, %c128_i32 : i32, i32) {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      stream.cmd.dispatch @main$async_dispatch_20::@main$async_dispatch_20_reduction_16x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        wo %arg8[%c0 for %c896] : !stream.resource<transient>{%c896}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12)
      stream.cmd.dispatch @main$async_dispatch_21::@main$async_dispatch_21_batch_matmul_1x16x50257x2_f32 {
        ro %arg8[%c0 for %c896] : !stream.resource<transient>{%c896},
        ro %arg4[%c0 for %c804352] : !stream.resource<constant>{%c804352},
        wo %arg7[%c0 for %c3216448] : !stream.resource<external>{%c3216448}
      } loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12)
    } => !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":362:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10])
    %5 = stream.resource.dealloca on(#hal.device.affinity<@__device_0>) await(%4) => %result_0 : !stream.resource<transient>{%c896} => !stream.timepoint loc(fused["/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":39:10, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":48:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":54:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":102:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":116:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":139:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":145:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":178:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":201:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":207:11, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":255:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":269:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":292:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":298:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":331:12, "/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":354:12])
    stream.timepoint.chain_external on(#hal.device.affinity<@__device_0>) %5 => (%arg3 : !hal.fence) loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    %6 = stream.tensor.export on(#hal.device.affinity<@__device_0>) %result : tensor<1x16x50257xf32> in !stream.resource<external>{%c3216448} -> !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":4:3)
    util.return %6 : !hal.buffer_view loc("/local/mnt/workspace/compilers/CompilerLens/examples/sshleifer_tiny-gpt2/_full/ir_00_torch_input.mlir":363:5)
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