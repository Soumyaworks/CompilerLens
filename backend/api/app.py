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

import json
import logging
import re
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
LOGGER = logging.getLogger(__name__)
_MODEL_ID = re.compile(r"[A-Za-z0-9][A-Za-z0-9._-]*(?:/[A-Za-z0-9][A-Za-z0-9._-]*)?")
_PUBLIC_ERROR_LIMIT = 500
# Full-stage artifacts duplicate a model's constants into textual MLIR. The largest verified
# demo (distilgpt2, 82M parameters) is already hundreds of MB; substantially larger models can
# turn one click into multi-GB files. The lower-level CLI remains available for deliberate runs.
_MAX_EXPLORE_PARAMETERS = 100_000_000


class ExploreModelTooLargeError(RuntimeError):
    pass

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


class ExploreRequest(BaseModel):
    """A full, persisted compilation requested from the landing page."""

    model_id: str = Field(min_length=1, max_length=200)
    seq_len: int = Field(default=16, ge=1, le=512)


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
        "error": None,
        "compile_seconds": None,
        "work_dir": None,
    }
    background.add_task(_run_compile, job_id, request, flags)
    return {"job_id": job_id, "status": "running"}


@app.post("/explore")
def explore_model(request: ExploreRequest, background: BackgroundTasks):
    """Compile a Hub model into the same static artifact the Workspace consumes.

    Unlike the Sandbox's short-lived, selected-stage job, this deliberately retains the
    trimmed dumps under examples/ and updates the public artifact index. This makes a finished
    search a first-class landing-page entry after a refresh or server restart.
    """
    model_id = _normalize_model_id(request.model_id)
    if not _MODEL_ID.fullmatch(model_id):
        raise HTTPException(
            status_code=400,
            detail="Enter a Hugging Face model ID such as organization/model-name or distilgpt2.",
        )
    job_id = str(uuid.uuid4())[:8]
    JOBS[job_id] = {
        "status": "running", "model_id": model_id, "seq_len": request.seq_len,
        "options": {}, "flags": [], "stages": {}, "bench": None,
        "error": None, "compile_seconds": None, "work_dir": None, "artifact_id": None,
    }
    background.add_task(_run_explore, job_id, model_id, request.seq_len)
    return {"job_id": job_id, "status": "running"}


def _run_explore(job_id: str, model_id: str, seq_len: int) -> None:
    """Run the established full dump -> ingest pipeline and publish its artifact."""
    job = JOBS[job_id]
    started = time.monotonic()
    phase = "looking up the model"
    try:
        from backend.compiler.runner import CompilerRunner, RunConfig, TRIM_CODEGEN_PASSES, TRIM_ELIDE_ATTRS
        from ingest.build import build_artifact, build_index
        from ingest.workloads.generated import spec_from_dump_dir
        from models.detect import detect
        from models.hf_wrapper import wrap, wrapper_source

        detected = detect(model_id, seq_len=seq_len)
        phase = "loading the model"
        module, example_inputs, model_info = wrap(detected)
        param_count = int(model_info.get("param_count") or 0)
        if param_count > _MAX_EXPLORE_PARAMETERS:
            raise ExploreModelTooLargeError(
                f"{param_count} parameters exceeds the {_MAX_EXPLORE_PARAMETERS} parameter interactive limit"
            )
        output_dir = REPO_ROOT / "examples" / detected.slug
        phase = "exporting and compiling the model"
        runner = CompilerRunner(RunConfig(
            layout="ingest", elide_attrs_larger_than=TRIM_ELIDE_ATTRS,
            pass_log_after=TRIM_CODEGEN_PASSES,
        ))
        result = runner.run(module, example_inputs, name=detected.slug, output_dir=output_dir, model_info=model_info)
        manifest = json.loads(result.manifest_path.read_text())
        if manifest.get("errors"):
            raise RuntimeError(_compiler_failure_message(manifest["errors"]))

        phase = "building the CompilerLens artifact"
        (output_dir / "source.py").write_text(wrapper_source(detected))
        (output_dir / "model_info.json").write_text(json.dumps(model_info, indent=2))
        spec = spec_from_dump_dir(output_dir, model_info)
        artifact = build_artifact(spec, root=output_dir)
        artifacts_dir = REPO_ROOT / "frontend" / "public" / "artifacts"
        artifacts_dir.mkdir(parents=True, exist_ok=True)
        artifact_path = artifacts_dir / f"{spec.id}.json"
        artifact_path.write_text(artifact.to_json())

        index_path = artifacts_dir / "index.json"
        existing = json.loads(index_path.read_text()) if index_path.is_file() else {"workloads": []}
        entry = build_index({spec.id: spec}, {spec.id: artifact})["workloads"][0]
        existing["workloads"] = [w for w in existing.get("workloads", []) if w.get("id") != spec.id] + [entry]
        index_path.write_text(json.dumps(existing))
        # As in scripts/compile_hf_model.py, the untrimmed export only exists so IREE can
        # compile it. Keeping it would duplicate large model weights for no viewer benefit.
        full_dir = output_dir / "_full"
        if full_dir.is_dir():
            shutil.rmtree(full_dir)
        job.update(status="done", model_info=model_info, artifact_id=spec.id)
    except Exception as exc:  # noqa: BLE001 - a background job must report its failure
        # The UI gets an actionable, bounded explanation. Keep the complete exception and
        # traceback in the server terminal for developers diagnosing an unfamiliar model.
        LOGGER.exception("Explore job %s failed while %s (%s)", job_id, phase, model_id)
        job.update(status="failed", error=_friendly_explore_error(exc, model_id, phase))
    finally:
        job["compile_seconds"] = round(time.monotonic() - started, 2)


def _normalize_model_id(value: str) -> str:
    """Accept either a Hub repository ID or a pasted huggingface.co model URL."""
    model_id = value.strip().rstrip("/")
    prefix = "https://huggingface.co/"
    if model_id.startswith(prefix):
        parts = model_id[len(prefix):].split("/")
        # Ignore URL suffixes such as /tree/main. Official repositories can have a single
        # segment; community repositories normally have owner/name.
        if len(parts) > 1 and parts[1] not in {"blob", "commit", "discussions", "resolve", "tree"}:
            model_id = "/".join(parts[:2])
        else:
            model_id = parts[0] if parts else ""
    return model_id


def _one_line(value: object, limit: int = _PUBLIC_ERROR_LIMIT) -> str:
    return re.sub(r"\s+", " ", str(value)).strip()[:limit]


def _compiler_failure_message(errors: list[dict]) -> str:
    first = errors[0] if errors else {}
    stage = first.get("stage", "an IREE stage")
    stderr = str(first.get("stderr") or "")
    # MLIR diagnostics often begin with command chatter. Prefer the first actual error line.
    lines = [line.strip() for line in stderr.splitlines() if line.strip()]
    diagnostic = next((line for line in lines if "error:" in line.lower()), lines[0] if lines else "")
    suffix = f" The compiler reported: {_one_line(diagnostic, 220)}" if diagnostic else ""
    extra = len(errors) - 1
    more = f" ({extra} additional stage failure{'s' if extra != 1 else ''} recorded.)" if extra else ""
    return f"IREE could not compile stage {stage}.{suffix}{more}"


def _friendly_explore_error(exc: Exception, model_id: str, phase: str) -> str:
    """Convert dependency/compiler exceptions into stable messages suitable for the UI."""
    raw = _one_line(exc, 2000)
    lower = raw.lower()
    kind = type(exc).__name__.lower()

    if isinstance(exc, ExploreModelTooLargeError):
        count_match = re.search(r"(\d+) parameters", raw)
        count = int(count_match.group(1)) if count_match else 0
        size = f" ({count / 1_000_000:.0f}M parameters)" if count else ""
        return (
            f"'{model_id}' is too large for interactive full-pipeline capture{size}. "
            "Use a model below 100M parameters; larger models can generate multi-gigabyte IR artifacts."
        )
    if any(token in lower or token in kind for token in ("repository not found", "not found", "404")):
        return (
            f"We couldn't find a public Hugging Face model named '{model_id}'. "
            "Check the spelling, or sign in on the server if the model is private or gated."
        )
    if any(token in lower or token in kind for token in ("gatedrepo", "gated repo", "401", "403", "unauthorized", "forbidden")):
        return (
            f"'{model_id}' requires Hugging Face access or authentication. "
            "Request access to the model and authenticate the server before trying again."
        )
    if any(token in lower for token in ("connection", "timed out", "timeout", "offline", "name resolution")):
        return "CompilerLens could not reach Hugging Face. Check the server's network connection and try again."
    if "no vocab_size" in lower:
        return (
            f"'{model_id}' is not a supported text model. CompilerLens currently expects a model "
            "that accepts token IDs, such as a BERT-like encoder or GPT-like decoder."
        )
    if "encoder-decoder" in lower or "decoder_input_ids" in lower:
        return (
            f"'{model_id}' is an encoder-decoder model, which is not supported yet. "
            "Try an encoder-only BERT-like model or a decoder-only GPT-like model."
        )
    if "unrecognized model identifier" in lower or "unrecognized model type" in lower:
        return (
            f"Hugging Face found '{model_id}', but its model architecture is not recognized by "
            "the installed Transformers version. Try a supported BERT-like or GPT-like model."
        )
    if raw.startswith("IREE could not compile stage"):
        return _one_line(raw)
    if phase == "loading the model":
        return (
            f"Hugging Face found '{model_id}', but CompilerLens could not load it with the current "
            "text-model adapter. See the API terminal for the technical details."
        )
    if phase == "exporting and compiling the model":
        return (
            f"'{model_id}' loaded, but its PyTorch operations could not be exported or compiled by "
            "the current IREE pipeline. See the API terminal for the failing operation."
        )
    if phase == "building the CompilerLens artifact":
        return "The model compiled, but CompilerLens could not build its visualization artifact. See the API terminal."
    return f"CompilerLens could not process '{model_id}'. See the API terminal for technical details."


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
        "error": job["error"],
        "artifact_id": job.get("artifact_id"),
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


@app.get("/health")
def health():
    return {"status": "ok", "jobs": len(JOBS)}
