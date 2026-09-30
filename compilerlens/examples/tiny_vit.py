"""Offline vision-encoder demo: random weights and synthetic image tensors."""
import torch
from transformers import ViTConfig, ViTModel

from compilerlens.models.adapters import ADAPTERS, ViTWrapper


def build_module():
    config = ViTConfig(image_size=8, patch_size=4, num_channels=3, hidden_size=8,
                       intermediate_size=16, num_hidden_layers=1, num_attention_heads=2)
    config._attn_implementation = 'eager'
    return ViTWrapper(ViTModel(config)).eval()


def example_inputs():
    return (torch.randn(1, 3, 8, 8),)


def model_info():
    return {'model_id': 'tiny_vit', 'model_type': 'vit', 'weights': 'random',
            'seq_len': None, 'causal': False,
            **ADAPTERS['vit'].metadata(None, (torch.empty(1, 3, 8, 8, device='meta'),))}
