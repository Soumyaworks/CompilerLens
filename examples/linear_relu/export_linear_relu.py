import torch
import iree.turbine.aot as aot


class LinearReluModule(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.weight = torch.nn.Parameter(torch.randn(128, 128))
        self.bias = torch.nn.Parameter(torch.randn(128))

    def forward(self, x):
        return torch.relu(x @ self.weight + self.bias)


model = LinearReluModule()
example_args = (torch.randn(128, 128),)
export_output = aot.export(model, *example_args)

with open("ir_00_torch_input.mlir", "w") as f:
    f.write(str(export_output.mlir_module))

print("Wrote ir_00_torch_input.mlir")
