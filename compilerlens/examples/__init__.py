"""Small offline compiler workloads."""
"""Packaged workloads; importing the registry does not load PyTorch or models."""

EXAMPLES = {
    'matmul': 'compilerlens.examples.matmul',
    'linear_relu': 'compilerlens.examples.linear_relu',
    'mini_transformer': 'compilerlens.examples.mini_transformer',
    'tiny_vit': 'compilerlens.examples.tiny_vit',
    'tiny_clip': 'compilerlens.examples.tiny_clip',
}
