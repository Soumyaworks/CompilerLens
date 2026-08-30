import torch


class LinearReluModule(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.weight = torch.nn.Parameter(torch.randn(128, 128))
        self.bias = torch.nn.Parameter(torch.randn(128))

    def forward(self, x):
        return torch.relu(x @ self.weight + self.bias)


def build_module():
    return LinearReluModule()


def example_inputs():
    return (torch.randn(128, 128),)
