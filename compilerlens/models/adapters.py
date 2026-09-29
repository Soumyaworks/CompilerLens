"""Model-family contracts for fixed-shape, CPU/float32 compiler workloads.

These adapters compile tensor forward passes, not tokenization, image decoding,
classification postprocessing, or generation. No processor packages are required.
"""
from __future__ import annotations

from dataclasses import dataclass

import torch


class ViTWrapper(torch.nn.Module):
    def __init__(self, hf_model):
        super().__init__()
        self.hf_model = hf_model

    def forward(self, pixel_values):
        return self.hf_model(pixel_values=pixel_values).last_hidden_state


class CLIPWrapper(torch.nn.Module):
    def __init__(self, hf_model):
        super().__init__()
        self.hf_model = hf_model

    def forward(self, input_ids, pixel_values, attention_mask):
        output = self.hf_model(input_ids=input_ids, pixel_values=pixel_values,
                               attention_mask=attention_mask, return_loss=False)
        return output.image_embeds, output.text_embeds, output.logits_per_image


def vision_inputs(config: dict) -> tuple:
    return (torch.randn(1, config['num_channels'], *config['image_size']),)


def clip_inputs(config: dict, seq_len: int) -> tuple:
    from .hf_wrapper import build_attention_mask

    # Include a real end-of-text marker; CLIP pools at EOS. Legacy CLIP configs
    # with eos_token_id=2 instead pool at the largest token ID in the sequence.
    eos = config['eos_token_id']
    pool_token = config['vocab_size'] - 1 if eos == 2 else eos
    # Exclude EOS from the random interior to keep the selected position stable.
    ids = torch.randint(0, config['vocab_size'] - 1, (1, seq_len))
    ids = ids + (ids >= pool_token).to(ids.dtype)
    ids[0, 0] = config['bos_token_id']
    ids[0, -1] = pool_token
    return ids, vision_inputs(config)[0], build_attention_mask(seq_len, causal=True)


@dataclass(frozen=True)
class ModelAdapter:
    name: str
    model_class: str
    modalities: tuple[str, ...]
    task: str
    input_names: tuple[str, ...]
    output_names: tuple[str, ...]

    def prepare(self, detected, hf_model):
        if self.name == 'vit':
            return ViTWrapper(hf_model), vision_inputs(detected.input_config)
        if self.name == 'clip':
            return CLIPWrapper(hf_model), clip_inputs(detected.input_config, detected.seq_len)
        from .hf_wrapper import HFWrapper, build_example_inputs
        return HFWrapper(hf_model, detected.output_attr), build_example_inputs(detected)

    def metadata(self, detected, inputs) -> dict:
        names = self.output_names or (detected.output_attr,)
        return {
            'adapter': self.name,
            'modalities': list(self.modalities),
            'task': self.task if self.name != 'text' else (
                'causal-lm-forward' if detected.causal else 'text-encoder'),
            'input_profile': {
                'kind': 'synthetic', 'batch_size': 1,
                'preprocessing': 'outside compiled graph; synthetic tensors, not real media',
                'inputs': [{'name': name, 'shape': list(tensor.shape),
                            'dtype': str(tensor.dtype).removeprefix('torch.')}
                           for name, tensor in zip(self.input_names, inputs)],
            },
            'output_names': list(names),
        }


ADAPTERS = {
    'text': ModelAdapter('text', 'AutoModel', ('text',), 'text-encoder',
                         ('input_ids', 'attention_mask'), ()),
    'vit': ModelAdapter('vit', 'ViTModel', ('image',), 'image-encoder',
                        ('pixel_values',), ('last_hidden_state',)),
    'clip': ModelAdapter('clip', 'CLIPModel', ('image', 'text'), 'image-text-similarity',
                         ('input_ids', 'pixel_values', 'attention_mask'),
                         ('image_embeds', 'text_embeds', 'logits_per_image')),
}


def adapter_for(detected) -> ModelAdapter:
    return ADAPTERS[detected.adapter]


def check_parameter_budget(detected, max_parameters: int | None) -> None:
    """Reject oversized new model families before downloading their weights.

    Meta tensors retain shapes but allocate no parameter storage. This is a parameter
    bound, not an estimate of peak compiler memory or disk usage.
    """
    if max_parameters is None or detected.adapter == 'text':
        return
    import transformers
    config_class = transformers.ViTConfig if detected.adapter == 'vit' else transformers.CLIPConfig
    config = config_class.from_dict(detected.model_config)
    config._attn_implementation = 'eager'
    with torch.device('meta'):
        model = getattr(transformers, adapter_for(detected).model_class)(config)
    count = sum(parameter.numel() for parameter in model.parameters())
    if count > max_parameters:
        raise ValueError(f'{count} parameters exceeds the {max_parameters} parameter interactive limit (before weight download)')
