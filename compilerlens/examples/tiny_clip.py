"""Offline image-text similarity demo: random weights, no meaningful predictions."""
import torch
from transformers import CLIPConfig, CLIPModel

from compilerlens.models.adapters import ADAPTERS, CLIPWrapper, clip_inputs

PROFILE = {'image_size': [8, 8], 'num_channels': 3, 'vocab_size': 16,
           'bos_token_id': 1, 'eos_token_id': 15}
SEQ_LEN = 4


def build_module():
    text = dict(vocab_size=16, hidden_size=8, intermediate_size=16,
                num_hidden_layers=1, num_attention_heads=2,
                max_position_embeddings=8, bos_token_id=1, eos_token_id=15, pad_token_id=0)
    vision = dict(image_size=8, patch_size=4, num_channels=3, hidden_size=8,
                  intermediate_size=16, num_hidden_layers=1, num_attention_heads=2)
    config = CLIPConfig(text_config=text, vision_config=vision, projection_dim=4)
    config._attn_implementation = 'eager'
    return CLIPWrapper(CLIPModel(config)).eval()


def example_inputs():
    return clip_inputs(PROFILE, SEQ_LEN)


def model_info():
    inputs = (torch.empty(1, SEQ_LEN, dtype=torch.int64, device='meta'),
              torch.empty(1, 3, 8, 8, device='meta'),
              torch.empty(1, 1, SEQ_LEN, SEQ_LEN, device='meta'))
    return {'model_id': 'tiny_clip', 'model_type': 'clip', 'weights': 'random',
            'seq_len': SEQ_LEN, 'vocab_size': 16, 'causal': False,
            **ADAPTERS['clip'].metadata(None, inputs)}
