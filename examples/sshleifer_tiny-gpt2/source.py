import torch
import iree.turbine.aot as aot
from transformers import AutoModelForCausalLM

# sshleifer/tiny-gpt2 @ 5f91d94bd9cd
# gpt2, causal decoder
model = AutoModelForCausalLM.from_pretrained(
    "sshleifer/tiny-gpt2",
    revision="5f91d94bd9cd7190a9f3216ff93cd1dd95f2c7be",
).eval()


class Wrapper(torch.nn.Module):
    """Returns a plain tensor, and takes a 4D float mask.

    The 4D mask matters: with a 2D mask, transformers builds the 4D one itself using a
    zero-rank bool tensor that IREE cannot legalize. See models/hf_wrapper.py.
    """

    def __init__(self, hf_model):
        super().__init__()
        self.hf_model = hf_model

    def forward(self, input_ids, attention_mask):
        out = self.hf_model(
            input_ids=input_ids,
            attention_mask=attention_mask,
            use_cache=False,
        )
        return out.logits


input_ids = torch.randint(0, 50257, (1, 16))
attention_mask = torch.full((16, 16), float("-inf")).triu(1).reshape(1, 1, 16, 16)

export_output = aot.export(Wrapper(model), input_ids, attention_mask)
