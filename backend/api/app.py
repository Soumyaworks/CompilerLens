"""Live compilation API, for the Sandbox.

The Sandbox lets you change a compiler flag and see the result, so the endpoints here are
built around one measured fact: a compile is fast (~0.8-1.2s) but *dumping all 41 stages plus
pass traces is not*. So `POST /compile` takes the list of stages you actually want to look at
and compiles only those. Benchmarking is a separate opt-in call because it costs seconds, and
firing it on every flag change would make the UI feel broken.

Everything here delegates to the same classes the CLI uses -- CompilerRunner, the analyzer
rules, backend.measure -- so there is no second implementation to keep in sync.

In-memory job tracking, no database: DESIGN-DOC section 13 excludes that explicitly. Restarting
the server loses in-flight jobs, which is an acceptable trade for a hackathon MVP and is stated
rather than hidden.
"""

from __future__ import annotations

import shutil
import subprocess
import tempfile
import time
import uuid
from pathlib import Path

from fastapi import BackgroundTasks, FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import PlainTextResponse
from pydantic import BaseModel, Field

REPO_ROOT = Path(__file__).resolve().parents[2]

app = FastAPI(title="CompilerLens Sandbox API")

# Permissive CORS because Vite serves the frontend from a different port in development.
# Would need tightening before any real deployment.
app.add_middleware(
    CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"]
)

# job_id -> job dict. Lost on restart; see module docstring.
JOBS: dict = {}

# Stage name -> the index the runner uses, so a caller can ask for "executable-targets"
# without knowing the file naming.
STAGE_INDEX = {
    "input": "01",
    "abi": "02",
    "preprocessing": "03",
    "global-optimization": "04",
    "dispatch-creation": "05",
    "flow": "06",
    "stream": "07",
    "executable-sources": "08",
    "executable-configurations": "09",
    "executable-targets": "10",
    "hal": "11",
    "vm": "12",
}

# What the Sandbox offers as togglable knobs. Kept server-side so the UI cannot invent a flag
# we have not thought about -- an arbitrary-flag passthrough would be a command injection risk
# and would also let a user produce dumps we cannot interpret.
ALLOWED_FLAGS = {
    "target-cpu": {
        "flag": "--iree-llvmcpu-target-cpu",
        "values": ["host", "generic", "znver4", "znver5", "skylake-avx512", "haswell"],
        "default": "host",
        "label": "Target CPU",
        "why": "Which instruction set the compiler may assume. Measured 26-33x between generic and host.",
    },
    "opt-level": {
        "flag": "--iree-opt-level",
        "values": ["O0", "O1", "O2", "O3"],
        "default": "O2",
        "label": "Optimization level",
        "why": "Global optimization aggressiveness. Measured as making little difference on small models.",
    },
    "data-tiling": {
        "flag": "--iree-opt-data-tiling",
        "values": ["true", "false"],
        "default": "true",
        "label": "Data tiling",
        "why": "Packs tensors into cache-friendly layouts, at the cost of extra layout kernels.",
    },
    "const-eval": {
        "flag": "--iree-opt-const-eval",
        "values": ["true", "false"],
        "default": "true",
        "label": "Constant evaluation",
        "why": "Folds constant subgraphs at compile time instead of at every inference.",
    },
}


class CompileRequest(BaseModel):
    model_id: str
    seq_len: int = 32
    stages: list = Field(default_factory=lambda: ["executable-targets"])
    options: dict = Field(default_factory=dict)  # e.g. {"target-cpu": "generic"}
    want_asm: bool = False


class BenchmarkRequest(BaseModel):
    repetitions: int = 5


def _tool(name: str) -> str:
    path = shutil.which(name)
    if path is None:
        raise HTTPException(status_code=503, detail=f"'{name}' not on PATH; the server needs the project venv active.")
    return path


def _flags_from_options(options: dict) -> list:
    """Validate requested options against the allowlist and build compiler flags."""
    flags = []
    for key, value in options.items():
        spec = ALLOWED_FLAGS.get(key)
        if spec is None:
            raise HTTPException(status_code=400, detail=f"unknown option '{key}'. Allowed: {sorted(ALLOWED_FLAGS)}")
        if str(value) not in spec["values"]:
            raise HTTPException(
                status_code=400,
                detail=f"'{value}' is not a valid {key}. Allowed: {spec['values']}",
            )
        flags.append(f"{spec['flag']}={value}")
    return flags


@app.get("/options")
def options():
    """The knobs the Sandbox may offer, and why each matters."""
    return {"options": ALLOWED_FLAGS, "stages": list(STAGE_INDEX)}


@app.post("/compile")
def compile_model(request: CompileRequest, background: BackgroundTasks):
    unknown = [s for s in request.stages if s not in STAGE_INDEX]
    if unknown:
        raise HTTPException(status_code=400, detail=f"unknown stages: {unknown}. Known: {list(STAGE_INDEX)}")

    flags = _flags_from_options(request.options)
    job_id = str(uuid.uuid4())[:8]
    JOBS[job_id] = {
        "status": "running",
        "model_id": request.model_id,
        "seq_len": request.seq_len,
        "options": request.options,
        "flags": flags,
        "stages": {},
        "bench": None,
        "diagnosis": None,
        "error": None,
        "compile_seconds": None,
        "work_dir": None,
    }
    background.add_task(_run_compile, job_id, request, flags)
    return {"job_id": job_id, "status": "running"}


def _run_compile(job_id: str, request: CompileRequest, flags: list) -> None:
    job = JOBS[job_id]
    started = time.monotonic()
    try:
        import iree.turbine.aot as aot

        from models.detect import detect
        from models.hf_wrapper import wrap

        detected = detect(request.model_id, seq_len=request.seq_len)
        module, example_inputs, model_info = wrap(detected)
        job["model_info"] = model_info

        work_dir = Path(tempfile.mkdtemp(prefix=f"sandbox-{job_id}-"))
        job["work_dir"] = str(work_dir)

        mlir_path = work_dir / "input.mlir"
        mlir_path.write_text(str(aot.export(module, *example_inputs).mlir_module))

        from backend.measure.compare import _input_specs

        job["input_specs"] = _input_specs(example_inputs)

        base = [
            _tool("iree-compile"),
            str(mlir_path),
            "--iree-hal-target-backends=llvm-cpu",
            *flags,
        ]
        if "--iree-llvmcpu-target-cpu" not in " ".join(flags):
            base.append("--iree-llvmcpu-target-cpu=host")

        # The .vmfb, so the job can be benchmarked on request.
        vmfb = work_dir / "module.vmfb"
        vmfb_cmd = list(base)
        if request.want_asm:
            llvm_dir = work_dir / "llvm"
            llvm_dir.mkdir(exist_ok=True)
            vmfb_cmd.append(f"--iree-hal-dump-executable-intermediates-to={llvm_dir}")
        vmfb_cmd += ["-o", str(vmfb)]
        result = subprocess.run(vmfb_cmd, capture_output=True, text=True)
        if result.returncode != 0:
            job["status"] = "failed"
            job["error"] = (result.stderr or "").strip()[:2000]
            return

        # Only the stages that were asked for -- this is what keeps a flag change ~1s.
        for stage in request.stages:
            path = work_dir / f"ir_{STAGE_INDEX[stage]}_{stage}.mlir"
            stage_result = subprocess.run(
                base + ["--mlir-elide-elementsattrs-if-larger=16", f"--compile-to={stage}", "-o", str(path)],
                capture_output=True,
                text=True,
            )
            if stage_result.returncode == 0 and path.is_file():
                job["stages"][stage] = str(path)
            else:
                job.setdefault("stage_errors", {})[stage] = (stage_result.stderr or "").strip()[:600]

        job["signals"] = _signals(work_dir)
        job["compile_seconds"] = round(time.monotonic() - started, 2)
        job["status"] = "done"
    except Exception as exc:
        job["status"] = "failed"
        job["error"] = f"{type(exc).__name__}: {exc}"
        job["compile_seconds"] = round(time.monotonic() - started, 2)


def _signals(work_dir: Path) -> dict:
    from backend.measure.compare import _read_signals

    return _read_signals(work_dir)


@app.get("/compile/{job_id}")
def get_job(job_id: str):
    job = JOBS.get(job_id)
    if job is None:
        raise HTTPException(status_code=404, detail="unknown job_id")
    return {
        "job_id": job_id,
        "status": job["status"],
        "model_id": job["model_id"],
        "options": job["options"],
        "flags": job["flags"],
        "stages_available": sorted(job["stages"]),
        "stage_errors": job.get("stage_errors", {}),
        "signals": job.get("signals", {}),
        "compile_seconds": job["compile_seconds"],
        "model_info": job.get("model_info"),
        "bench": job["bench"],
        "diagnosis": job["diagnosis"],
        "error": job["error"],
    }


@app.get("/compile/{job_id}/stage/{stage}", response_class=PlainTextResponse)
def get_stage(job_id: str, stage: str):
    job = JOBS.get(job_id)
    if job is None:
        raise HTTPException(status_code=404, detail="unknown job_id")
    path = job["stages"].get(stage)
    if path is None:
        raise HTTPException(status_code=404, detail=f"stage '{stage}' not available for this job")
    return Path(path).read_text()


@app.post("/compile/{job_id}/benchmark")
def benchmark_job(job_id: str, request: BenchmarkRequest):
    """Opt-in timing. Separate from /compile because it costs seconds, not milliseconds."""
    job = JOBS.get(job_id)
    if job is None:
        raise HTTPException(status_code=404, detail="unknown job_id")
    if job["status"] != "done":
        raise HTTPException(status_code=409, detail=f"job is '{job['status']}'")

    from backend.measure.bench import BenchmarkError, benchmark_module

    vmfb = Path(job["work_dir"]) / "module.vmfb"
    try:
        result = benchmark_module(vmfb, job["input_specs"], repetitions=request.repetitions)
    except BenchmarkError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

    job["bench"] = result.as_dict()
    return job["bench"]


@app.post("/compile/{job_id}/diagnose")
def diagnose_job(job_id: str):
    """Run the Doctor's rules over this job's compiled stages."""
    job = JOBS.get(job_id)
    if job is None:
        raise HTTPException(status_code=404, detail="unknown job_id")
    if job["status"] != "done":
        raise HTTPException(status_code=409, detail=f"job is '{job['status']}'")

    from analyzer.diagnose import diagnose

    # The rules read an artifact-shaped dict, so present this job's stages in that shape.
    stages = []
    for index, (name, path) in enumerate(sorted(job["stages"].items())):
        stages.append(
            {
                "id": f"s{index:02d}",
                "name": name,
                "title": name.replace("-", " ").title(),
                "language": "mlir",
                "kind": "phase",
                "text": Path(path).read_text(),
                "ops": [],
            }
        )
    job["diagnosis"] = diagnose({"stages": stages})
    return job["diagnosis"]


@app.get("/health")
def health():
    return {"status": "ok", "jobs": len(JOBS)}
