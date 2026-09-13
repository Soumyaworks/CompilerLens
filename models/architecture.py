"""Capture a model's module hierarchy and connect it to exported Torch operations.

The important property is provenance, not visual similarity. We use the nn_module_stack
metadata emitted by torch.export and only attach Torch-MLIR line numbers when the complete
ordered operation stream agrees with the exact ExportedProgram passed to Turbine.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

import torch

from ingest.mlir_parser import parse_operations


def export_program(module: torch.nn.Module, example_args: tuple) -> torch.export.ExportedProgram:
    """Perform the same export and decomposition sequence used by Turbine AOT."""
    from iree.turbine.aot import decompositions

    program = torch.export.export(module, args=example_args, strict=True)
    current_decomps = decompositions.current_aot_decompositions()
    return program.run_decompositions(current_decomps) if current_decomps else program


def _normalise_path(path: str) -> str:
    path = path.removeprefix("L__self__")
    path = path.lstrip(".")
    if path in {"", "hf_model"}:
        return "model"
    if path.startswith("hf_model."):
        return path[len("hf_model.") :]
    return path


def _canonical_op(name: str) -> str:
    """Ignore overload spelling while retaining the dialect and operation identity."""
    name = name.removesuffix(".default")
    parts = name.split(".")
    return ".".join(parts[:3]) if len(parts) >= 3 else name


def _fx_op_name(node: torch.fx.Node) -> str | None:
    if node.op != "call_function":
        return None
    target = str(node.target)
    if not target.startswith(("aten.", "prims.")):
        return None
    return f"torch.{target.removesuffix('.default')}"


def _shape_label(value: Any) -> str | None:
    if isinstance(value, torch.Tensor):
        shape = "×".join(str(dim) for dim in value.shape) or "scalar"
        dtype = str(value.dtype).removeprefix("torch.")
        return f"{shape} · {dtype}"
    if isinstance(value, (tuple, list)):
        nested = [_shape_label(item) for item in value]
        labels = [label for label in nested if label]
        return ", ".join(labels[:3]) if labels else None
    return None


def _kind(path: str, type_name: str) -> str:
    text = f"{path} {type_name}".lower()
    leaf = path.rsplit(".", 1)[-1].lower()
    if path == "model":
        return "model"
    if "embedding" in text or leaf in {"wte", "wpe", "embeddings"}:
        return "embedding"
    if "dropout" in text:
        return "dropout"
    if "attention" in text or "attn" in text:
        return "attention"
    if any(token in text for token in ("layernorm", "layer_norm", "rmsnorm", "rms_norm")):
        return "normalization"
    if any(token in text for token in ("mlp", "feedforward", "feed_forward", "intermediate")):
        return "mlp"
    if any(token in leaf for token in ("lm_head", "classifier", "pooler", "score")):
        return "head"
    if any(token in type_name.lower() for token in ("gelu", "relu", "silu", "activation")):
        return "activation"
    if type_name in {"Linear", "Conv1D", "Conv2d"}:
        return "projection"
    if leaf.isdigit() or type_name.lower().endswith(("block", "layer")):
        return "block"
    return "container"


def _label(path: str, type_name: str, kind: str) -> str:
    if path == "model":
        return type_name
    leaf = path.rsplit(".", 1)[-1]
    if leaf.isdigit():
        return f"Block {leaf}"
    aliases = {
        "h": "Transformer Blocks",
        "wte": "Token Embedding",
        "wpe": "Position Embedding",
        "ln_1": "Pre-attention LayerNorm",
        "ln_2": "Pre-MLP LayerNorm",
        "ln_f": "Final LayerNorm",
        "lm_head": "Language Model Head",
        "c_attn": "QKV Projection",
        "c_proj": "Output Projection",
        "c_fc": "Feed-forward Expansion",
    }
    if leaf in aliases:
        return aliases[leaf]
    words = leaf.replace("_", " ").replace("-", " ").split()
    display = " ".join(word.upper() if word in {"q", "k", "v", "mlp"} else word.title() for word in words)
    if kind == "block" and not display.lower().startswith(("block", "layer")):
        display = f"{display} Block"
    return display or type_name


def _module_owner(node: torch.fx.Node, known_paths: set[str]) -> str:
    stack = node.meta.get("nn_module_stack") or {}
    for _key, value in reversed(list(stack.items())):
        raw_path = value[0] if isinstance(value, (tuple, list)) and value else str(value)
        path = _normalise_path(str(raw_path))
        while path != "model":
            if path in known_paths:
                return path
            path = path.rsplit(".", 1)[0] if "." in path else "model"
        if "model" in known_paths:
            return "model"
    return "model"


def _model_facts(root_module: torch.nn.Module, model_info: dict) -> dict:
    config = getattr(root_module, "config", None)

    def first(*names: str):
        for name in names:
            value = getattr(config, name, None) if config is not None else None
            if value is not None:
                return value
        return None

    return {
        "model_id": model_info.get("model_id"),
        "model_type": model_info.get("model_type"),
        "causal": bool(model_info.get("causal")),
        "parameter_count": int(model_info.get("param_count") or sum(p.numel() for p in root_module.parameters())),
        "sequence_length": model_info.get("seq_len"),
        "hidden_size": first("hidden_size", "n_embd", "d_model"),
        "layer_count": first("num_hidden_layers", "n_layer", "num_layers"),
        "attention_heads": first("num_attention_heads", "n_head"),
        "intermediate_size": first("intermediate_size", "n_inner", "ffn_dim"),
        "vocab_size": first("vocab_size") or model_info.get("vocab_size"),
    }


def capture_architecture(
    module: torch.nn.Module,
    exported_program: torch.export.ExportedProgram,
    torch_mlir: str,
    model_info: dict,
) -> dict:
    """Return a JSON-ready architecture graph with exact Torch-line ownership."""
    root_module = getattr(module, "hf_model", module)
    module_rows: dict[str, dict] = {}

    for raw_path, child in root_module.named_modules():
        path = _normalise_path(raw_path)
        direct_params = sum(parameter.numel() for parameter in child.parameters(recurse=False))
        total_params = sum(parameter.numel() for parameter in child.parameters())
        type_name = child.__class__.__name__
        kind = _kind(path, type_name)
        module_rows[path] = {
            "id": path,
            "path": path,
            "label": _label(path, type_name, kind),
            "type": type_name,
            "kind": kind,
            "parent_id": None,
            "children": [],
            "depth": 0 if path == "model" else path.count(".") + 1,
            "direct_parameter_count": direct_params,
            "parameter_count": total_params,
            "direct_source_lines": [],
            "source_lines": [],
            "op_names": {},
            "output_shapes": [],
            "mapping": "unavailable",
            "order": 1_000_000,
        }

    if "model" not in module_rows:
        type_name = root_module.__class__.__name__
        module_rows["model"] = {
            "id": "model", "path": "model", "label": type_name, "type": type_name,
            "kind": "model", "parent_id": None, "children": [], "depth": 0,
            "direct_parameter_count": 0,
            "parameter_count": sum(p.numel() for p in root_module.parameters()),
            "direct_source_lines": [], "source_lines": [], "op_names": {},
            "output_shapes": [], "mapping": "unavailable", "order": 0,
        }

    known_paths = set(module_rows)
    graph_nodes = list(exported_program.graph_module.graph.nodes)
    owners = {node: _module_owner(node, known_paths) for node in graph_nodes if node.op == "call_function"}
    fx_compute = [(node, name) for node in graph_nodes if (name := _fx_op_name(node))]
    mlir_compute = [
        op for op in parse_operations(torch_mlir, "torch-input")
        if op["name"].startswith(("torch.aten.", "torch.prims."))
    ]
    exact_stream = (
        len(fx_compute) == len(mlir_compute)
        and all(
            _canonical_op(fx_name) == _canonical_op(mlir_op["name"])
            for (_node, fx_name), mlir_op in zip(fx_compute, mlir_compute)
        )
    )

    direct_names: dict[str, Counter] = defaultdict(Counter)
    direct_shapes: dict[str, list[str]] = defaultdict(list)
    direct_lines: dict[str, set[int]] = defaultdict(set)
    first_order: dict[str, int] = {}

    for order, node in enumerate(node for node in graph_nodes if node.op == "call_function"):
        owner = owners.get(node, "model")
        first_order.setdefault(owner, order)
        op_name = _fx_op_name(node)
        if op_name:
            direct_names[owner][op_name] += 1
        if shape := _shape_label(node.meta.get("val")):
            if shape not in direct_shapes[owner] and len(direct_shapes[owner]) < 4:
                direct_shapes[owner].append(shape)

    if exact_stream:
        for (node, _fx_name), mlir_op in zip(fx_compute, mlir_compute):
            direct_lines[owners.get(node, "model")].add(int(mlir_op["line"]))

    edges: set[tuple[str, str]] = set()
    for node, target_owner in owners.items():
        for input_node in node.all_input_nodes:
            source_owner = owners.get(input_node)
            if source_owner and source_owner != target_owner:
                edges.add((source_owner, target_owner))

    included = {"model"}
    for path, row in module_rows.items():
        if row["direct_parameter_count"] or path in owners.values() or row["kind"] in {
            "attention", "embedding", "mlp", "normalization", "head", "block"
        }:
            cursor = path
            while True:
                included.add(cursor)
                if cursor == "model":
                    break
                cursor = cursor.rsplit(".", 1)[0] if "." in cursor else "model"

    def nearest_parent(path: str) -> str | None:
        if path == "model":
            return None
        cursor = path.rsplit(".", 1)[0] if "." in path else "model"
        while cursor not in included and cursor != "model":
            cursor = cursor.rsplit(".", 1)[0] if "." in cursor else "model"
        return cursor

    rows = {path: row for path, row in module_rows.items() if path in included}
    for path, row in rows.items():
        row["parent_id"] = nearest_parent(path)
        row["direct_source_lines"] = sorted(direct_lines[path])
        row["source_lines"] = sorted(direct_lines[path])
        row["op_names"] = dict(direct_names[path].most_common(12))
        row["output_shapes"] = direct_shapes[path]
        row["mapping"] = "exact" if exact_stream and direct_lines[path] else "unavailable"
        row["order"] = first_order.get(path, row["order"])
        if row["parent_id"] and row["parent_id"] in rows:
            rows[row["parent_id"]]["children"].append(path)

    by_depth = sorted(rows.values(), key=lambda row: row["depth"], reverse=True)
    for row in by_depth:
        parent_id = row["parent_id"]
        if not parent_id or parent_id not in rows:
            continue
        parent = rows[parent_id]
        parent["source_lines"] = sorted(set(parent["source_lines"]) | set(row["source_lines"]))
        merged = Counter(parent["op_names"])
        merged.update(row["op_names"])
        parent["op_names"] = dict(merged.most_common(12))
        if row["source_lines"] and parent["mapping"] == "unavailable":
            parent["mapping"] = "exact" if exact_stream else "unavailable"
        parent["order"] = min(parent["order"], row["order"])

    for row in rows.values():
        row["children"].sort(key=lambda child_id: (rows[child_id]["order"], child_id))

    filtered_edges = sorted(
        (source, target)
        for source, target in edges
        if source in rows and target in rows and source != target
    )
    return {
        "version": 1,
        "root_id": "model",
        "source": "torch-export",
        "mapping_status": "exact" if exact_stream else "unavailable",
        "mapping_note": (
            "Module ownership comes from torch.export nn_module_stack metadata. The ordered "
            "decomposed FX operation stream exactly matched the Torch MLIR operation stream."
            if exact_stream else
            "The module hierarchy is exact, but the exported operation stream did not match "
            "Torch MLIR exactly, so no layer-to-compiler line mapping was attached."
        ),
        "model": _model_facts(root_module, model_info),
        "nodes": sorted(rows.values(), key=lambda row: (row["order"], row["depth"], row["path"])),
        "edges": [{"source": source, "target": target} for source, target in filtered_edges],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description="Capture architecture metadata for a compiled HF dump")
    parser.add_argument("dump_dir", type=Path)
    args = parser.parse_args()
    info_path = args.dump_dir / "model_info.json"
    if not info_path.is_file():
        raise SystemExit(f"missing {info_path}")

    from iree.turbine import aot
    from models.detect import detect
    from models.hf_wrapper import wrap

    info = json.loads(info_path.read_text())
    detected = detect(
        info["model_id"],
        revision=info.get("revision"),
        seq_len=int(info.get("seq_len") or 16),
    )
    module, example_args, model_info = wrap(detected)
    program = export_program(module, example_args)
    torch_mlir = str(aot.export(program).mlir_module)
    architecture = capture_architecture(module, program, torch_mlir, model_info)
    output = args.dump_dir / "architecture.json"
    output.write_text(json.dumps(architecture, indent=2))
    print(
        f"wrote {output} ({len(architecture['nodes'])} nodes, "
        f"{architecture['mapping_status']} mapping)"
    )


if __name__ == "__main__":
    main()
