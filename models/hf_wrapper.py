"""Wrap a HuggingFace model so it can be traced by torch.export / iree-turbine.

Two things need fixing about a stock HF model before it will export:

1. `forward()` returns a ModelOutput object; the exporter needs a plain tensor.

2. The attention mask must be passed as a **4D float** tensor, not the usual 2D int one.
   This is not cosmetic. Given a 2D mask, transformers (>=5.x) builds the 4D mask itself via
   `masking_utils.create_bidirectional_mask` -> `and_masks`, whose seed value is
   `q_idx.new_ones((), dtype=torch.bool)`. That traces to a zero-rank i1
   `torch.vtensor.literal`, which IREE's torch-to-iree legalization rejects outright
   ("failed to legalize operation 'torch.vtensor.literal'"), killing the compile before the
   input phase. Patching `and_masks` only moves the failure to
   `torch.aten.__and__.Tensor` on broadcast bool shapes, which is equally unsupported.

   Passing a 4D mask makes `_preprocess_mask_arguments` return it as-is, so that whole
   boolean mask factory never runs. Verified: prajjwal1/bert-tiny compiles all the way to a
   .vmfb this way and produces zero new_ones/__and__/tensor<i1> ops.

   If a future transformers release stops short-circuiting on 4D masks, this breaks and the
   error above is the symptom to look for.
"""

from __future__ import annotations

import torch

from models.detect import DetectedModel


class HFWrapper(torch.nn.Module):
    def __init__(self, hf_model, output_attr: str):
        super().__init__()
        self.hf_model = hf_model
        self.output_attr = output_attr

    def forward(self, input_ids, attention_mask):
        output = self.hf_model(input_ids=input_ids, attention_mask=attention_mask, use_cache=False)
        return getattr(output, self.output_attr)


def build_attention_mask(seq_len: int, causal: bool) -> torch.Tensor:
    """A 4D additive float mask: 0.0 where attention is allowed, -inf where it is not."""
    if causal:
        return torch.full((seq_len, seq_len), float("-inf")).triu(1).reshape(1, 1, seq_len, seq_len)
    return torch.zeros(1, 1, seq_len, seq_len, dtype=torch.float32)


def build_example_inputs(detected: DetectedModel) -> tuple[torch.Tensor, torch.Tensor]:
    input_ids = torch.randint(0, detected.vocab_size, (1, detected.seq_len))
    return input_ids, build_attention_mask(detected.seq_len, detected.causal)


def wrap(detected: DetectedModel) -> tuple[HFWrapper, tuple, dict]:
    """Load, wrap, and build inputs for a detected model.

    Returns (module, example_inputs, model_info) where model_info goes into the manifest and
    into the generated ingest spec.
    """
    # Export in float32 even when Hub weights are stored as bfloat16. Turbine currently
    # materializes parameter constants through NumPy, whose PyTorch bridge rejects bf16.
    # Loading directly in f32 avoids that importer failure (at the cost of larger memory use).
    hf_model = detected.load_model(dtype=torch.float32)
    module = HFWrapper(hf_model, detected.output_attr)
    example_inputs = build_example_inputs(detected)
    model_info = {
        "model_id": detected.model_id,
        "revision": detected.revision,
        "model_type": detected.model_type,
        "causal": detected.causal,
        "seq_len": detected.seq_len,
        "vocab_size": detected.vocab_size,
        "param_count": sum(p.numel() for p in hf_model.parameters()),
        "compile_dtype": "float32",
        "detected_via": detected.detected_via,
    }
    return module, example_inputs, model_info


def wrapper_source(detected: DetectedModel) -> str:
    """The equivalent standalone PyTorch program, for the artifact's source stage.

    The frontend shows this as the "PyTorch Source" stage, so it has to be something a
    reader could actually run -- not a description of what we did.
    """
    model_class = "AutoModelForCausalLM" if detected.causal else "AutoModel"
    if detected.causal:
        mask_expr = (
            f'torch.full(({detected.seq_len}, {detected.seq_len}), float("-inf"))'
            f".triu(1).reshape(1, 1, {detected.seq_len}, {detected.seq_len})"
        )
    else:
        mask_expr = f"torch.zeros(1, 1, {detected.seq_len}, {detected.seq_len}, dtype=torch.float32)"

    return f'''import torch
import iree.turbine.aot as aot
from transformers import {model_class}

# {detected.model_id} @ {detected.revision[:12]}
# {detected.model_type}, {"causal decoder" if detected.causal else "bidirectional encoder"}
model = {model_class}.from_pretrained(
    "{detected.model_id}",
    revision="{detected.revision}",
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
        return out.{detected.output_attr}


input_ids = torch.randint(0, {detected.vocab_size}, (1, {detected.seq_len}))
attention_mask = {mask_expr}

export_output = aot.export(Wrapper(model), input_ids, attention_mask)
'''
