import torch


class MiniTransformerBlock(torch.nn.Module):
    def __init__(self, d_model=64, n_heads=4, d_ff=128):
        super().__init__()
        self.qkv = torch.nn.Linear(d_model, d_model * 3)
        self.out_proj = torch.nn.Linear(d_model, d_model)
        self.norm1 = torch.nn.LayerNorm(d_model)
        self.ff1 = torch.nn.Linear(d_model, d_ff)
        self.ff2 = torch.nn.Linear(d_ff, d_model)
        self.norm2 = torch.nn.LayerNorm(d_model)
        self.n_heads = n_heads

    def forward(self, x):
        qkv = self.qkv(x)
        q, k, v = qkv.chunk(3, dim=-1)
        attn_scores = torch.softmax((q @ k.transpose(-2, -1)) / (q.shape[-1] ** 0.5), dim=-1)
        attn_out = attn_scores @ v
        x = self.norm1(x + self.out_proj(attn_out))
        ff_out = self.ff2(torch.relu(self.ff1(x)))
        return self.norm2(x + ff_out)


def build_module():
    return MiniTransformerBlock()


def example_inputs():
    return (torch.randn(16, 64),)
