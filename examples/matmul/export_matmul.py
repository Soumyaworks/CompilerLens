import torch
import iree.turbine.aot as aot


class MatmulModule(torch.nn.Module):
    def forward(self, a, b):
        return torch.matmul(a, b)


model = MatmulModule()
example_args = (torch.randn(128, 128), torch.randn(128, 128))
export_output = aot.export(model, *example_args)

with open("ir_00_torch_input.mlir", "w") as f:
    f.write(str(export_output.mlir_module))

print("Wrote ir_00_torch_input.mlir")
