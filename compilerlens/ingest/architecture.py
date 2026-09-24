"""Load architecture sidecars and connect their Torch lines to artifact lineage."""

from __future__ import annotations

import copy
import json
from collections import Counter, defaultdict
from pathlib import Path


_CATEGORY_RULES = [
    ("embedding", "Embeddings", ("embedding",)),
    ("attention", "Attention", ("attention", "softmax", "bmm")),
    ("normalization", "Normalization", ("layer_norm", "batch_norm", "group_norm")),
    ("mlp", "Feed-forward Network", ("linear", "addmm", ".mm", "matmul")),
    ("activation", "Activations", ("gelu", "relu", "silu", "tanh", "sigmoid")),
    ("layout", "Shape & Layout", ("view", "reshape", "transpose", "permute", "flatten")),
    ("elementwise", "Residual & Elementwise", ("add.", "mul.", "div.", "sub.", "pow.")),
]


def _category(op_name: str) -> tuple[str, str]:
    lowered = op_name.lower()
    for kind, label, tokens in _CATEGORY_RULES:
        if any(token in lowered for token in tokens):
            return kind, label
    return "other", "Other Tensor Operations"


def _fallback(stages: list, model_info: dict) -> dict:
    anchor = next((stage for stage in stages if stage.name == "torch-input"), None)
    root_id = "model"
    model_label = model_info.get("model_id") or "Compiled Program"
    grouped: dict[str, dict] = {}
    if anchor:
        for op in anchor.ops:
            if op.name.startswith(("torch.constant.", "util.", "func.")):
                continue
            kind, label = _category(op.name)
            node = grouped.setdefault(
                kind,
                {
                    "id": kind, "path": kind, "label": label,
                    "type": "Compiler operation group", "kind": kind,
                    "parent_id": root_id, "children": [], "depth": 1,
                    "direct_parameter_count": 0, "parameter_count": 0,
                    "direct_source_lines": [], "source_lines": [],
                    "op_names": Counter(), "output_shapes": [],
                    "mapping": "derived", "order": op.line,
                },
            )
            node["source_lines"].append(op.line)
            node["direct_source_lines"].append(op.line)
            node["op_names"][op.name] += 1
            node["order"] = min(node["order"], op.line)

    children = sorted(grouped.values(), key=lambda node: node["order"])
    for node in children:
        node["source_lines"] = sorted(set(node["source_lines"]))
        node["direct_source_lines"] = node["source_lines"]
        node["op_names"] = dict(node["op_names"].most_common(12))

    all_lines = sorted({line for node in children for line in node["source_lines"]})
    root = {
        "id": root_id, "path": root_id, "label": model_label,
        "type": model_info.get("model_type") or "PyTorch program", "kind": "model",
        "parent_id": None, "children": [node["id"] for node in children], "depth": 0,
        "direct_parameter_count": 0, "parameter_count": int(model_info.get("param_count") or 0),
        "direct_source_lines": [], "source_lines": all_lines, "op_names": {},
        "output_shapes": [], "mapping": "derived" if all_lines else "unavailable", "order": 0,
    }
    edges = [
        {"source": children[index]["id"], "target": children[index + 1]["id"]}
        for index in range(len(children) - 1)
    ]
    return {
        "version": 1, "root_id": root_id, "source": "compiler-ir",
        "mapping_status": "derived" if all_lines else "unavailable",
        "mapping_note": (
            "This workload has no torch.export module sidecar. Groups and source-line "
            "membership are derived from recorded Torch operations; no nn.Module ownership "
            "is claimed."
        ),
        "model": {
            "model_id": model_info.get("model_id") or model_label,
            "model_type": model_info.get("model_type"), "causal": bool(model_info.get("causal")),
            "parameter_count": int(model_info.get("param_count") or 0),
            "sequence_length": model_info.get("seq_len"), "hidden_size": None,
            "layer_count": None, "attention_heads": None, "intermediate_size": None,
            "vocab_size": model_info.get("vocab_size"),
        },
        "nodes": [root, *children], "edges": edges,
    }


def _model_info(root: Path, workload) -> dict:
    path = root / "model_info.json"
    if path.is_file():
        try:
            return json.loads(path.read_text())
        except (OSError, ValueError):
            pass
    return {
        "model_id": workload.title, "model_type": None, "param_count": 0,
        "seq_len": None, "causal": False,
    }


def _enrich(architecture: dict, lineage: dict, stages: list) -> dict:
    architecture = copy.deepcopy(architecture)
    lineage_lines = lineage.get("lines", {})
    stage_order = {stage.id: stage.index for stage in stages}

    for node in architecture.get("nodes", []):
        stage_lines: dict[str, set[int]] = defaultdict(set)
        stage_ops: Counter = Counter()
        for source_line in node.get("source_lines", []):
            entry = lineage_lines.get(str(source_line))
            if not entry:
                continue
            for stage_id, lines in entry.get("stages", {}).items():
                stage_lines[stage_id].update(lines)
                stage_ops[stage_id] += len(lines)

        ordered_ids = sorted(stage_lines, key=lambda stage_id: stage_order.get(stage_id, 1_000_000))
        node["stage_lines"] = {
            stage_id: sorted(stage_lines[stage_id])
            for stage_id in ordered_ids
        }
        node["stage_coverage"] = [
            {"stage_id": stage_id, "operation_count": stage_ops[stage_id]}
            for stage_id in ordered_ids
        ]
        node["compiler_stage_count"] = len(ordered_ids)
        node["compiler_operation_count"] = sum(stage_ops.values())

    return architecture


def build_architecture(root: Path, workload, stages: list, lineage: dict) -> dict:
    sidecar = root / "architecture.json"
    architecture = None
    if sidecar.is_file():
        try:
            loaded = json.loads(sidecar.read_text())
            if loaded.get("version") == 1 and loaded.get("nodes"):
                architecture = loaded
        except (OSError, ValueError):
            architecture = None
    if architecture is None:
        architecture = _fallback(stages, _model_info(root, workload))
    return _enrich(architecture, lineage, stages)
