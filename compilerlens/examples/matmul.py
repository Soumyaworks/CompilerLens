import torch


class MatmulModule(torch.nn.Module):
    def forward(self, a, b):
        return torch.matmul(a, b)


def build_module():
    return MatmulModule()


def example_inputs():
    return (torch.randn(128, 128), torch.randn(128, 128))
