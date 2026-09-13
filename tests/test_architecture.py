from __future__ import annotations

import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace

import torch

from ingest.architecture import build_architecture
from ingest.schema import Operation, Stage
from models.architecture import capture_architecture


class TinyModule(torch.nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.projection = torch.nn.Linear(4, 4)


def exported_relu() -> tuple[TinyModule, SimpleNamespace]:
    module = TinyModule()
    graph = torch.fx.Graph()
    value = graph.placeholder("value")
    relu = graph.call_function(torch.ops.aten.relu.default, (value,))
    relu.meta["nn_module_stack"] = {"projection": ("projection", "Linear")}
    relu.meta["val"] = torch.ones(1, 4)
    graph.output(relu)
    graph_module = torch.fx.GraphModule(module, graph)
    return module, SimpleNamespace(graph_module=graph_module)


class ExactArchitectureTests(unittest.TestCase):
    def test_assigns_lines_only_when_the_whole_operation_stream_matches(self) -> None:
        module, program = exported_relu()
        architecture = capture_architecture(
            module,
            program,  # type: ignore[arg-type]
            "%0 = torch.aten.relu %arg0 : !torch.tensor\n",
            {"model_id": "test/tiny", "model_type": "test", "param_count": 20},
        )

        projection = next(node for node in architecture["nodes"] if node["id"] == "projection")
        self.assertEqual(architecture["mapping_status"], "exact")
        self.assertEqual(projection["direct_source_lines"], [1])
        self.assertEqual(projection["mapping"], "exact")

        mismatch = capture_architecture(
            module,
            program,  # type: ignore[arg-type]
            "%0 = torch.aten.add %arg0, %arg0 : !torch.tensor\n",
            {"model_id": "test/tiny", "model_type": "test", "param_count": 20},
        )
        mismatch_projection = next(node for node in mismatch["nodes"] if node["id"] == "projection")
        self.assertEqual(mismatch["mapping_status"], "unavailable")
        self.assertEqual(mismatch_projection["direct_source_lines"], [])


class ArchitectureFallbackTests(unittest.TestCase):
    def test_old_artifact_gets_labelled_compiler_derived_topology_and_lineage(self) -> None:
        operation = Operation(
            id="s000:op2", stage_id="s000", line=2, name="torch.aten.mm",
            dialect="torch", results=["%0"], operands=["%a", "%b"],
        )
        torch_stage = Stage(
            id="s000", index=0, name="torch-input", title="Torch Input", phase="input",
            language="mlir", source_path="torch.mlir", text="", ops=[operation],
        )
        llvm_stage = Stage(
            id="s001", index=1, name="llvm-ir", title="LLVM IR", phase="llvm",
            language="llvm", source_path="module.ll", text="",
        )
        lineage = {
            "lines": {
                "2": {
                    "stages": {"s000": [2], "s001": [14, 15]},
                }
            }
        }
        workload = SimpleNamespace(title="Legacy Matmul")

        with tempfile.TemporaryDirectory() as directory:
            result = build_architecture(Path(directory), workload, [torch_stage, llvm_stage], lineage)

        self.assertEqual(result["source"], "compiler-ir")
        self.assertEqual(result["mapping_status"], "derived")
        self.assertIn("no nn.Module ownership is claimed", result["mapping_note"])
        mlp = next(node for node in result["nodes"] if node["kind"] == "mlp")
        self.assertEqual(mlp["stage_lines"]["s001"], [14, 15])
        self.assertEqual(mlp["compiler_operation_count"], 3)


if __name__ == "__main__":
    unittest.main()
