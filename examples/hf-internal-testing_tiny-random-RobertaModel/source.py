import torch
import iree.turbine.aot as aot
from transformers import AutoModel

# hf-internal-testing/tiny-random-RobertaModel @ 5f1d755e93e9
# roberta, bidirectional encoder
model = AutoModel.from_pretrained(
    "hf-internal-testing/tiny-random-RobertaModel",
    revision="5f1d755e93e9fe46b9bb90404f1e810515b2410a",
    dtype=torch.float32,  # Turbine's NumPy constant bridge cannot import bfloat16 weights.
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
        return out.last_hidden_state


input_ids = torch.randint(0, 1024, (1, 16))
attention_mask = torch.zeros(1, 1, 16, 16, dtype=torch.float32)

export_output = aot.export(Wrapper(model), input_ids, attention_mask)
