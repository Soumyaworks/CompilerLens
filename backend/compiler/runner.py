"""Reusable runner that reproduces the CompilerLens IR-dump pipeline for a
PyTorch module: export -> per-stage MLIR dumps -> LLVM-level dumps -> full
pass-boundary traces.

This mirrors, as a callable, the exact command sequence validated by hand in
experiments/matmul_debug_passes/ and experiments/linear_relu_dumps/.
"""

import json
import shutil
import subprocess
from dataclasses import dataclass, field
from pathlib import Path

import iree.turbine.aot as aot
import torch

DEFAULT_STAGES = (
    "input",
    "abi",
    "preprocessing",
    "global-optimization",
    "dispatch-creation",
    "flow",
    "stream",
    "executable-sources",
    "executable-configurations",
    "executable-targets",
    "hal",
    "vm",
)


@dataclass
class RunConfig:
    target_backend: str = "llvm-cpu"
    target_cpu: str = "host"
    stages: tuple = DEFAULT_STAGES


@dataclass
class RunResult:
    name: str
    output_dir: Path
    manifest_path: Path
    files: list = field(default_factory=list)


class CompilerRunner:
    def __init__(self, config: RunConfig = None):
        self.config = config or RunConfig()
        self.iree_compile = self._require_tool("iree-compile")
        self.iree_opt = self._require_tool("iree-opt")

    @staticmethod
    def _require_tool(name: str) -> str:
        path = shutil.which(name)
        if path is None:
            raise RuntimeError(
                f"'{name}' not found on PATH. Activate the project venv "
                f"(source .venv/bin/activate) before running the compiler runner."
            )
        return path

    def run(self, module: torch.nn.Module, example_input_args: tuple, name: str, output_dir: Path) -> RunResult:
        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
        dumps_dir = output_dir / "dumps"
        dumps_dir.mkdir(parents=True, exist_ok=True)

        manifest = {"name": name, "commands": [], "files": {}}

        torch_input_path = self._export_torch_input(module, example_input_args, output_dir, manifest)
        self._dump_named_stages(torch_input_path, output_dir, manifest)
        self._dump_llvm_intermediates(torch_input_path, output_dir, dumps_dir, manifest)
        self._dump_full_pass_traces(torch_input_path, output_dir, manifest)

        manifest_path = output_dir / "manifest.json"
        manifest_path.write_text(json.dumps(manifest, indent=2))

        return RunResult(
            name=name,
            output_dir=output_dir,
            manifest_path=manifest_path,
            files=sorted(manifest["files"].keys()),
        )

    def _export_torch_input(self, module: torch.nn.Module, example_input_args: tuple, output_dir: Path, manifest: dict) -> Path:
        export_output = aot.export(module, *example_input_args)
        torch_input_path = output_dir / "ir_00_torch_input.mlir"
        torch_input_path.write_text(str(export_output.mlir_module))
        manifest["commands"].append("iree.turbine.aot.export(module, *example_inputs)")
        manifest["files"]["ir_00_torch_input.mlir"] = str(torch_input_path)
        return torch_input_path

    def _dump_named_stages(self, torch_input_path: Path, output_dir: Path, manifest: dict) -> None:
        for i, stage in enumerate(self.config.stages, start=1):
            stage_path = output_dir / f"ir_{i:02d}_{stage}.mlir"
            cmd = [
                self.iree_compile,
                str(torch_input_path),
                f"--iree-hal-target-backends={self.config.target_backend}",
                f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
                "--mlir-print-debuginfo",
                f"--compile-to={stage}",
                "-o",
                str(stage_path),
            ]
            subprocess.run(cmd, capture_output=True, text=True)
            manifest["commands"].append(" ".join(cmd))
            manifest["files"][stage_path.name] = str(stage_path)

    def _dump_llvm_intermediates(self, torch_input_path: Path, output_dir: Path, dumps_dir: Path, manifest: dict) -> None:
        vmfb_path = output_dir / f"{output_dir.name}_compiled_host.vmfb"
        cmd = [
            self.iree_compile,
            str(torch_input_path),
            f"--iree-hal-target-backends={self.config.target_backend}",
            f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
            f"--iree-hal-dump-executable-sources-to={dumps_dir}",
            f"--iree-hal-dump-executable-intermediates-to={dumps_dir}",
            f"--iree-hal-dump-executable-binaries-to={dumps_dir}",
            "--mlir-print-debuginfo",
            "-o",
            str(vmfb_path),
        ]
        subprocess.run(cmd, capture_output=True, text=True)
        manifest["commands"].append(" ".join(cmd))
        manifest["files"][vmfb_path.name] = str(vmfb_path)
        for f in sorted(dumps_dir.iterdir()):
            manifest["files"][f"dumps/{f.name}"] = str(f)

    def _dump_full_pass_traces(self, torch_input_path: Path, output_dir: Path, manifest: dict) -> None:
        step_a_output = output_dir / "step_a_iree_input.mlir"
        step_a_trace = output_dir / "passes_stepA_torch_to_iree.txt"
        cmd_a = [
            self.iree_opt,
            str(torch_input_path),
            "--torch-to-iree",
            "--mlir-print-debuginfo",
            "--mlir-print-ir-after-all",
            "-o",
            str(step_a_output),
        ]
        result_a = subprocess.run(cmd_a, capture_output=True, text=True)
        step_a_trace.write_text(result_a.stderr)
        manifest["commands"].append(" ".join(cmd_a) + " 2> passes_stepA_torch_to_iree.txt")
        manifest["files"][step_a_output.name] = str(step_a_output)
        manifest["files"][step_a_trace.name] = str(step_a_trace)

        final_vm_output = output_dir / "ir_final_vm.mlir"
        step_b_trace = output_dir / "passes_stepB_full_pipeline.txt"
        cmd_b = [
            self.iree_opt,
            str(step_a_output),
            f"--iree-hal-target-backends={self.config.target_backend}",
            f"--iree-llvmcpu-target-cpu={self.config.target_cpu}",
            "--iree-transformation-pipeline",
            "--mlir-print-debuginfo",
            "--mlir-print-ir-after-all",
            "--mlir-elide-elementsattrs-if-larger=8",
            "-o",
            str(final_vm_output),
        ]
        result_b = subprocess.run(cmd_b, capture_output=True, text=True)
        step_b_trace.write_text(result_b.stderr)
        manifest["commands"].append(" ".join(cmd_b) + " 2> passes_stepB_full_pipeline.txt")
        manifest["files"][final_vm_output.name] = str(final_vm_output)
        manifest["files"][step_b_trace.name] = str(step_b_trace)


EXAMPLES = {
    "matmul": "examples.matmul",
    "linear_relu": "examples.linear_relu",
}


def _load_example(name: str):
    import importlib

    if name not in EXAMPLES:
        raise ValueError(f"Unknown example '{name}'. Available: {', '.join(sorted(EXAMPLES))}")
    module = importlib.import_module(EXAMPLES[name])
    return module.build_module(), module.example_inputs()


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Run the CompilerLens dump pipeline for an example workload.")
    parser.add_argument("--example", required=True, choices=sorted(EXAMPLES), help="Name of the example workload to compile.")
    parser.add_argument("--out", required=True, help="Output directory for the generated dumps.")
    args = parser.parse_args()

    torch_module, example_input_args = _load_example(args.example)
    runner = CompilerRunner()
    result = runner.run(torch_module, example_input_args, name=args.example, output_dir=Path(args.out))

    print(f"Wrote {len(result.files)} files to {result.output_dir}")
    print(f"Manifest: {result.manifest_path}")


if __name__ == "__main__":
    main()
