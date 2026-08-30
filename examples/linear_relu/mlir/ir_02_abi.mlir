module @module {
  util.global private @__auto.constant_128_128_torch.float32 = dense_resource<__auto.constant_128_128_torch.float32> : tensor<128x128xf32> loc("ir_00_torch_input.mlir":2:3)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.fence, %arg2: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %cst = arith.constant 0.000000e+00 : f32 loc("ir_00_torch_input.mlir":6:10)
    %cst_0 = arith.constant dense_resource<torch_tensor_128_torch.float32> : tensor<128xf32> loc("ir_00_torch_input.mlir":9:10)
    %0 = hal.tensor.import wait(%arg1) => %arg0 : !hal.buffer_view -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":3:19)
    %__auto.constant_128_128_torch.float32 = util.global.load @__auto.constant_128_128_torch.float32 : tensor<128x128xf32> loc("ir_00_torch_input.mlir":4:46)
    %1 = tensor.empty() : tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
    %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
    %3 = linalg.matmul ins(%0, %__auto.constant_128_128_torch.float32 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%2 : tensor<128x128xf32>) -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":6:10)
    %4 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%3, %cst_0 : tensor<128x128xf32>, tensor<128xf32>) outs(%1 : tensor<128x128xf32>) {
    ^bb0(%in: f32 loc("ir_00_torch_input.mlir":6:10), %in_1: f32 loc("ir_00_torch_input.mlir":9:10), %out: f32 loc("ir_00_torch_input.mlir":9:10)):
      %8 = arith.addf %in, %in_1 : f32 loc("ir_00_torch_input.mlir":9:10)
      linalg.yield %8 : f32 loc("ir_00_torch_input.mlir":9:10)
    } -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":9:10)
    %5 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = ["parallel", "parallel"]} ins(%4 : tensor<128x128xf32>) outs(%1 : tensor<128x128xf32>) {
    ^bb0(%in: f32 loc("ir_00_torch_input.mlir":9:10), %out: f32 loc("ir_00_torch_input.mlir":10:10)):
      %8 = arith.cmpf ugt, %in, %cst : f32 loc("ir_00_torch_input.mlir":10:10)
      %9 = arith.select %8, %in, %cst : f32 loc("ir_00_torch_input.mlir":10:10)
      linalg.yield %9 : f32 loc("ir_00_torch_input.mlir":10:10)
    } -> tensor<128x128xf32> loc("ir_00_torch_input.mlir":10:10)
    %6 = hal.tensor.barrier join(%5 : tensor<128x128xf32>) => %arg2 : !hal.fence loc("ir_00_torch_input.mlir":3:3)
    %7 = hal.tensor.export %6 : tensor<128x128xf32> -> !hal.buffer_view loc("ir_00_torch_input.mlir":3:3)
    util.return %7 : !hal.buffer_view loc("ir_00_torch_input.mlir":11:5)
  } loc("ir_00_torch_input.mlir":3:3)
  util.func public @main(%arg0: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub} {
    %0 = util.null : !hal.fence loc("ir_00_torch_input.mlir":3:3)
    %c-1_i32 = arith.constant -1 : i32 loc("ir_00_torch_input.mlir":3:3)
    %c0 = arith.constant 0 : index loc("ir_00_torch_input.mlir":3:3)
    %device_0 = hal.devices.get %c0 : !hal.device loc("ir_00_torch_input.mlir":3:3)
    %fence = hal.fence.create device(%device_0 : !hal.device) flags("None") : !hal.fence loc("ir_00_torch_input.mlir":3:3)
    %1 = util.call @main$async(%arg0, %0, %fence) : (!hal.buffer_view, !hal.fence, !hal.fence) -> !hal.buffer_view loc("ir_00_torch_input.mlir":3:3)
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32 loc("ir_00_torch_input.mlir":3:3)
    util.return %1 : !hal.buffer_view loc("ir_00_torch_input.mlir":3:3)
  } loc("ir_00_torch_input.mlir":3:3)
} loc("ir_00_torch_input.mlir":1:1)