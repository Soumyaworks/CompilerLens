"""Build CompilerLens artifacts from workload dump directories.

Usage:
    python3 -m ingest.build --all --out-dir frontend/public/artifacts
    python3 -m ingest.build examples/matmul --out /tmp/one-off.json   # ad hoc, unregistered

Stage 5 (live compilation) will call build_artifact() directly after invoking iree-compile
into a temporary directory, which is why the file-reading and the artifact-shaping are kept
separate here.
"""

from __future__ import annotations

import argparse
import dataclasses
import json
import re
import sys
from pathlib import Path

from . import llvm_parser, mlir_parser, pass_log
from .schema import Artifact, Evidence, Operation, Stage, StageDiff
from .workloads import WORKLOADS
from .workloads.base import PassTrackSpec, WorkloadSpec

# --- evidence patterns -------------------------------------------------------------------
# Each of these reads a fact the compiler stated about itself. We never infer these; if the
# pattern does not match, the evidence is simply absent.

_TRANSLATION_INFO = re.compile(r"translation_info\s*=\s*#iree_codegen\.translation_info<\s*pipeline\s*=\s*(\w+)")
_LOWERING_TILES = re.compile(r"(cache_parallel|distribution|vector_common_parallel|vector_reduction)\s*=\s*\[([\d,\s]*)\]")
_TARGET_CPU = re.compile(r'\bcpu\s*=\s*"([^"]+)"')
_TARGET_TRIPLE = re.compile(r'target_triple\s*=\s*"([^"]+)"')
_NATIVE_VECTOR_SIZE = re.compile(r"native_vector_size\s*=\s*(\d+)")

_F32_BYTES = 4

# Named linalg ops that are structural rather than a "primary" compute op -- present in
# essentially every dispatch regardless of fusion, so their presence alone is not evidence
# of anything.
_LINALG_STRUCTURAL = frozenset({"linalg.generic", "linalg.yield", "linalg.fill", "linalg.index"})


def _fusion_evidence(kernel: Stage) -> tuple[str, str] | None:
    """(primary op name, epilogue arith ops) if the dispatch fuses an elementwise epilogue
    onto a primary compute op in the same kernel, else None.

    This is DESIGN-DOC section 4.5's "successful fusion" analysis, generically: any dispatch
    containing both a named compute op (matmul, conv, ...) and a linalg.generic is fusing
    something into that op's dispatch, and the arith ops inside the generic's body -- read
    directly from the op list between it and its linalg.yield, not guessed at -- say what.
    """
    ops = kernel.ops
    primary = [o for o in ops if o.name.startswith("linalg.") and o.name not in _LINALG_STRUCTURAL]
    generic_index = next((i for i, o in enumerate(ops) if o.name == "linalg.generic"), None)
    if not primary or generic_index is None:
        return None

    yield_index = next(
        (i for i in range(generic_index, len(ops)) if ops[i].name == "linalg.yield"), len(ops)
    )
    epilogue_ops = sorted({o.name for o in ops[generic_index:yield_index] if o.name.startswith("arith.")})
    if not epilogue_ops:
        return None
    return primary[0].name, ", ".join(epilogue_ops)


def _make_stage(
    *,
    stage_id: str,
    index: int,
    name: str,
    title: str,
    phase: str,
    language: str,
    source_path: str,
    text: str,
    description: str,
    track: str,
    kind: str = "phase",
    pass_name: str | None = None,
    pass_arg: str | None = None,
    parent_stage: str | None = None,
    gap_note: str | None = None,
) -> Stage:
    """Assemble a Stage, parsing its text according to its language."""
    if language == "mlir":
        raw_ops = mlir_parser.parse_operations(text, stage_id)
        histogram_label = "Dialects"
    elif language == "llvm":
        raw_ops = llvm_parser.parse_llvm_ir(text, stage_id)
        histogram_label = "Instruction classes"
    elif language == "asm":
        raw_ops = llvm_parser.parse_asm(text, stage_id)
        histogram_label = "Register widths"
    else:  # Python source: displayed verbatim, no operation model.
        raw_ops = []
        histogram_label = ""

    return Stage(
        id=stage_id,
        index=index,
        name=name,
        title=title,
        phase=phase,
        language=language,
        source_path=source_path,
        text=text,
        line_count=len(text.splitlines()),
        byte_size=len(text.encode()),
        op_count=len(raw_ops),
        op_histogram=llvm_parser.histogram(raw_ops, "dialect") if raw_ops else {},
        histogram_label=histogram_label,
        ops=[Operation(**op) for op in raw_ops],
        description=description,
        kind=kind,
        track=track,
        pass_name=pass_name,
        pass_arg=pass_arg,
        parent_stage=parent_stage,
        gap_note=gap_note,
    )


def _build_pass_stages(
    root: Path,
    repo_relative: str,
    spec: PassTrackSpec,
    start_index: int,
    parent_stage: str,
) -> tuple[list[Stage], str | None]:
    """Sub-stages for one pass track, plus a note about what was filtered out."""
    log_path = root / spec.log_path
    if not log_path.exists():
        print(f"  warning: missing {spec.log_path}, skipping pass track", file=sys.stderr)
        return [], None

    all_dumps = pass_log.parse_pass_log(log_path.read_text(errors="replace"))
    track_dumps = pass_log.select_track(all_dumps, spec.scope_contains)
    changed = [d for d in track_dumps if d.changed]

    stages: list[Stage] = []
    for offset, dump in enumerate(changed):
        stages.append(
            _make_stage(
                stage_id=f"s{start_index + offset:03d}",
                index=start_index + offset,
                name=f"pass-{dump.index}-{dump.display_name}",
                title=dump.display_name,
                phase=spec.phase,
                language="mlir",
                source_path=f"{repo_relative}/{spec.log_path}",
                text=dump.text,
                description=spec.description,
                track=spec.track,
                kind="pass",
                pass_name=dump.pass_name,
                pass_arg=dump.pass_arg,
                parent_stage=parent_stage,
            )
        )

    skipped = len(track_dumps) - len(changed)
    note = None
    if skipped:
        note = (
            f"{spec.log_path} recorded {len(track_dumps)} pass snapshots for this function; "
            f"{len(changed)} are shown and {skipped} are hidden because those passes ran but "
            f"left the IR unchanged."
        )
    return stages, note


def _build_stages(workload: WorkloadSpec, root: Path, repo_relative: str) -> tuple[list[Stage], list[str]]:
    """Phase dumps, with pass sub-stages spliced in after the phases they belong to."""
    tracks_by_anchor: dict[str, list[PassTrackSpec]] = {}
    for spec in workload.pass_tracks:
        tracks_by_anchor.setdefault(spec.insert_after, []).append(spec)

    stages: list[Stage] = []
    notes: list[str] = []

    for spec in workload.stages:
        path = root / spec.relative_path
        if not path.exists():
            print(f"  warning: missing {spec.relative_path}, skipping stage", file=sys.stderr)
            continue

        stages.append(
            _make_stage(
                stage_id=f"s{len(stages):03d}",
                index=len(stages),
                name=spec.name,
                title=spec.title,
                phase=spec.phase,
                language=spec.language,
                source_path=f"{repo_relative}/{spec.relative_path}",
                text=path.read_text(errors="replace"),
                description=spec.description,
                track=spec.track,
                gap_note=spec.gap_note,
            )
        )

        for track_spec in tracks_by_anchor.get(spec.name, []):
            pass_stages, note = _build_pass_stages(
                root, repo_relative, track_spec, len(stages), parent_stage=spec.name
            )
            stages.extend(pass_stages)
            if note:
                notes.append(note)

    return stages, notes


def _build_diffs(stages: list[Stage]) -> list[StageDiff]:
    """Summarise each adjacent pair that is comparable.

    A diff requires the same language *and* the same track. Comparing across tracks would
    assert a succession the compiler never performed: the whole-module phase dumps, the
    extracted device kernel, and the per-pass snapshots of a single function are three
    different views, and the stage list interleaves them.
    """
    diffs: list[StageDiff] = []
    for previous, current in zip(stages, stages[1:]):
        if previous.language != current.language or previous.track != current.track:
            continue

        previous_names = {op.name for op in previous.ops}
        current_names = {op.name for op in current.ops}
        previous_groups = set(previous.op_histogram)
        current_groups = set(current.op_histogram)

        added = sorted(current_names - previous_names)
        removed = sorted(previous_names - current_names)
        groups_added = sorted(current_groups - previous_groups)
        groups_removed = sorted(previous_groups - current_groups)
        ir_changed = previous.text != current.text

        if not ir_changed:
            summary = "No change: this phase left the IR untouched."
        else:
            # op_delta is already a structured field, so it is deliberately not repeated
            # here -- consumers format it themselves and the UI renders it as a signed chip.
            parts = []
            if groups_added:
                parts.append("introduces " + ", ".join(groups_added))
            if groups_removed:
                parts.append("eliminates " + ", ".join(groups_removed))
            if added and not groups_added:
                kinds = "kind" if len(added) == 1 else "kinds"
                parts.append(f"{len(added)} new op {kinds}")
            summary = "; ".join(parts) if parts else "Textual changes only."

        diffs.append(
            StageDiff(
                from_stage=previous.id,
                to_stage=current.id,
                op_delta=current.op_count - previous.op_count,
                groups_added=groups_added,
                groups_removed=groups_removed,
                ops_added=added,
                ops_removed=removed,
                ir_changed=ir_changed,
                summary=summary,
            )
        )
    return diffs


def _find_stage(stages: list[Stage], name: str) -> Stage | None:
    return next((s for s in stages if s.name == name), None)


# The per-operation index is by far the largest part of the artifact. It is retained only
# where something downstream actually consumes it: the lineage engine (Stage 2) matches on
# operations in the whole-module *phase* dumps. LLVM and assembly operations are consumed
# here at build time to derive evidence, and per-pass snapshots are read as IR rather than
# as an op index, so neither needs to ship. Counts and histograms survive in both cases.
_OPS_RETAINED_LANGUAGES = frozenset({"mlir"})


def _keeps_op_index(stage: Stage) -> bool:
    return stage.language in _OPS_RETAINED_LANGUAGES and stage.kind == "phase"


def _trim_op_index(stages: list[Stage]) -> str | None:
    """Drop op lists nothing downstream needs. Returns a note describing what was cut.

    Always reports what it removed: a viewer that silently discards data is the opposite of
    what this project is for.
    """
    dropped_ops = 0
    dropped_stages = 0
    for stage in stages:
        if _keeps_op_index(stage) or not stage.ops:
            continue
        dropped_ops += len(stage.ops)
        dropped_stages += 1
        stage.ops = []

    if not dropped_ops:
        return None
    return (
        f"The per-operation index was omitted for {dropped_stages} stages "
        f"({dropped_ops} operations) to keep the artifact small -- the LLVM, assembly, and "
        f"per-pass stages. Operation counts, histograms, and the full IR text for those "
        f"stages are unaffected."
    )


def _build_evidence(stages: list[Stage]) -> tuple[list[Evidence], dict]:
    """Recover the compiler's own statements about what it decided to do.

    Everything returned here is a quotation, not an inference. Stage 3's Optimization
    Doctor and Stage 4's AI layer are both built strictly on top of this.
    """
    evidence: list[Evidence] = []
    target: dict = {}
    counter = 0

    def add(kind: str, label: str, value: str, stage: Stage, detail: str, status: str = "info") -> None:
        nonlocal counter
        counter += 1
        evidence.append(
            Evidence(
                id=f"e{counter:02d}",
                kind=kind,
                label=label,
                value=value,
                source_stage=stage.id,
                source_detail=detail,
                status=status,
            )
        )

    # --- target capabilities, from the executable variant declaration --------------------
    kernel = _find_stage(stages, "dispatch-kernel")
    native_vector_bytes: int | None = None
    if kernel:
        if match := _TARGET_CPU.search(kernel.text):
            target["cpu"] = match.group(1)
            add("target", "Target CPU", match.group(1), kernel, "hal.executable.variant target")
        if match := _TARGET_TRIPLE.search(kernel.text):
            target["triple"] = match.group(1)
            add("target", "Target triple", match.group(1), kernel, "hal.executable.variant target")
        if match := _NATIVE_VECTOR_SIZE.search(kernel.text):
            native_vector_bytes = int(match.group(1))
            target["native_vector_size"] = native_vector_bytes
            add(
                "target",
                "Native vector size",
                f"{native_vector_bytes} bytes ({native_vector_bytes // _F32_BYTES} x f32)",
                kernel,
                "native_vector_size attribute",
            )
    target.setdefault("backend", "llvm-cpu")

    if kernel and (fusion := _fusion_evidence(kernel)):
        primary_name, epilogue_ops = fusion
        add(
            "fusion",
            "Fused epilogue",
            f"linalg.generic ({epilogue_ops}) in the same dispatch as {primary_name}",
            kernel,
            "dispatch kernel MLIR: a linalg.generic epilogue alongside the primary compute op",
            status="success",
        )

    # --- the compiler's stated codegen plan ---------------------------------------------
    # These are `info`, not `success`. An attribute in the IR is the compiler *stating its
    # intent* -- that tiling will use these sizes, that this pipeline was selected. Whether the
    # decision paid off is a measurement we do not have here, so calling it a success would be
    # the kind of unsourced claim this project exists to avoid. backend/measure/ is what turns
    # one of these into a verified win; analyzer/ is what flags it as a problem.
    configurations = _find_stage(stages, "executable-configurations")
    if configurations:
        if match := _TRANSLATION_INFO.search(configurations.text):
            add(
                "tiling",
                "Codegen pipeline",
                match.group(1),
                configurations,
                "translation_info attribute -- the plan, not a measured outcome",
                status="info",
            )
        seen_tiles: set[tuple[str, str]] = set()
        for kind, values in _LOWERING_TILES.findall(configurations.text):
            sizes = ", ".join(v.strip() for v in values.split(",") if v.strip())
            if not sizes or (kind, sizes) in seen_tiles:
                continue
            seen_tiles.add((kind, sizes))
            add("tiling", f"Tile sizes ({kind})", f"[{sizes}]", configurations,
                "lowering_config attribute -- the plan, not a measured outcome", status="info")

    # --- what the backend actually emitted ----------------------------------------------
    optimized = _find_stage(stages, "llvm-optimized")
    if optimized:
        widths = llvm_parser.vector_width_summary([op.__dict__ for op in optimized.ops])
        if widths:
            dominant, count = next(iter(widths.items()))
            # An observation about the emitted code, not yet a judgement on it.
            add("vectorization", "Dominant vector type", f"{dominant} ({count} uses)",
                optimized, "LLVM IR vector types", status="info")

            # Cross-check the emitted width against the target's declared capability. When
            # these agree, vectorisation used the full register -- the strongest single
            # claim we can make from this data, precisely because it is two independent
            # sources agreeing rather than one assertion. This one earns "success".
            if native_vector_bytes and (lanes := re.match(r"<(\d+) x float>", dominant)):
                emitted = int(lanes.group(1))
                expected = native_vector_bytes // _F32_BYTES
                if emitted == expected:
                    add(
                        "vectorization",
                        "Vector width matches target",
                        f"{emitted} f32 lanes = full {native_vector_bytes}-byte register",
                        optimized,
                        f"cross-checked against native_vector_size in {kernel.title if kernel else 'kernel'}",
                        status="success",
                    )

    assembly = _find_stage(stages, "target-asm")
    if assembly:
        fma_count = sum(1 for op in assembly.ops if op.name.startswith("vfmadd"))
        if fma_count:
            # Vector FMAs in the final assembly are the arithmetic actually reaching the CPU --
            # an outcome, not a plan, so this one is a genuine success.
            add("instruction-selection", "Vector FMA instructions", f"{fma_count} x vfmadd",
                assembly, "emitted x86-64 assembly", status="success")

    return evidence, target


def build_artifact(workload: WorkloadSpec, root: Path | None = None) -> Artifact:
    """Build one workload's artifact.

    `root` overrides `workload.dump_root` -- used by Stage 5 to point at a fresh temp
    directory from a live compile while reusing the same registered stage/pass-track specs.
    """
    dump_root = root if root is not None else Path(workload.dump_root)
    repo_relative = str(workload.dump_root).rstrip("/")

    stages, stage_notes = _build_stages(workload, dump_root, repo_relative)
    if not stages:
        raise SystemExit(f"no stages found under {dump_root}")

    # Evidence and diffs both read the full op index, so trimming happens only after they
    # have been derived.
    evidence, target = _build_evidence(stages)
    diffs = _build_diffs(stages)
    trim_note = _trim_op_index(stages)

    source_stage = _find_stage(stages, "pytorch-source")
    located = sum(1 for s in stages for op in s.ops if op.source_loc)

    notes = [
        "Operation counts come from a heuristic textual parser, not a real MLIR parser. "
        "The IR itself is displayed verbatim and is always authoritative.",
    ]
    notes.extend(stage_notes)
    if trim_note:
        notes.append(trim_note)
    if located:
        notes.append(
            f"{located} operations carry resolved loc() metadata pointing back to the Torch "
            f"input, which is the anchor the lineage engine will use. Operations showing no "
            f"location had loc(unknown) or a location we could not resolve to a single "
            f"source position; none are guessed."
        )

    artifact = Artifact(
        compilation_id=workload.id,
        stages=stages,
        diffs=diffs,
        evidence=evidence,
        source={
            "kind": "pytorch",
            "entry": workload.source_entry,
            "code": source_stage.text if source_stage else "",
        },
        target=target,
        notes=notes,
    )

    # Run the Doctor here so the static site carries a diagnosis without needing a server.
    # analyzer/ is stdlib-only for exactly this reason. A rule crashing must not take the
    # artifact with it -- the IR is the product, the diagnosis is an addition to it.
    try:
        from analyzer.diagnose import diagnose

        artifact.diagnosis = diagnose(dataclasses.asdict(artifact))
    except Exception as exc:  # noqa: BLE001 - report, never fail the build
        artifact.notes.append(
            f"The Optimization Doctor could not run for this artifact "
            f"({type(exc).__name__}: {exc}). The IR and evidence above are unaffected."
        )

    return artifact


def build_index(workloads: dict[str, WorkloadSpec], artifacts: dict[str, Artifact]) -> dict:
    """The landing page's data source: one summary card per workload.

    A short source preview (not the full program) is enough for a card -- the full source is
    one click away once a workload is opened, via its own artifact's `source.code`.
    """
    entries = []
    for workload_id, workload in workloads.items():
        artifact = artifacts[workload_id]
        source_stage = _find_stage(artifact.stages, "pytorch-source")
        preview_lines = (source_stage.text.splitlines() if source_stage else [])[:12]
        entries.append(
            {
                "id": workload.id,
                "title": workload.title,
                "description": workload.description,
                "source_entry": workload.source_entry,
                "source_preview": "\n".join(preview_lines),
                "stage_count": len(artifact.stages),
                "op_count": sum(s.op_count for s in artifact.stages),
                "evidence_count": len(artifact.evidence),
            }
        )
    return {"workloads": entries}


def main() -> None:
    parser = argparse.ArgumentParser(description="Build CompilerLens artifacts from workload dump directories.")
    parser.add_argument("dump_dir", type=Path, nargs="?", help="ad hoc dump directory (unregistered workload)")
    parser.add_argument("--out", type=Path, help="path to write a single artifact.json (ad hoc mode)")
    parser.add_argument("--all", action="store_true", help="build every registered workload")
    parser.add_argument("--out-dir", type=Path, help="directory to write <id>.json + index.json (--all mode)")
    parser.add_argument("--id", default=None, help="compilation id override (ad hoc mode; defaults to dir name)")
    parser.add_argument("--indent", type=int, default=None, help="pretty-print the JSON")
    args = parser.parse_args()

    if args.all:
        if not args.out_dir:
            raise SystemExit("--all requires --out-dir")
        args.out_dir.mkdir(parents=True, exist_ok=True)

        artifacts: dict[str, Artifact] = {}
        for workload_id, workload in WORKLOADS.items():
            root = Path(workload.dump_root)
            if not root.is_dir():
                print(f"  warning: {root} missing, skipping workload {workload_id}", file=sys.stderr)
                continue
            artifact = build_artifact(workload)
            artifacts[workload_id] = artifact

            out_path = args.out_dir / f"{workload_id}.json"
            out_path.write_text(artifact.to_json(indent=args.indent))
            total_ops = sum(s.op_count for s in artifact.stages)
            print(f"wrote {out_path}  ({out_path.stat().st_size / 1024:.0f} KB)")
            print(f"  {len(artifact.stages)} stages, {total_ops} operations, {len(artifact.evidence)} evidence items")

        if not artifacts:
            raise SystemExit("no workloads built -- check dump directories exist")

        index = build_index({k: v for k, v in WORKLOADS.items() if k in artifacts}, artifacts)
        index_path = args.out_dir / "index.json"
        index_path.write_text(json.dumps(index, indent=args.indent))
        print(f"wrote {index_path}  ({len(index['workloads'])} workloads)")
        return

    if not args.dump_dir or not args.out:
        raise SystemExit("ad hoc mode requires both a dump_dir and --out (or use --all --out-dir)")
    if not args.dump_dir.is_dir():
        raise SystemExit(f"not a directory: {args.dump_dir}")

    # An unregistered directory has no StageSpec/PassTrackSpec of its own. If it happens to
    # share a registered workload's id, reuse that workload's specs against this directory
    # instead -- useful for testing a fresh dump before vendoring it permanently.
    compilation_id = args.id or args.dump_dir.name
    workload = WORKLOADS.get(compilation_id)
    if workload is None:
        raise SystemExit(
            f"'{compilation_id}' is not a registered workload (know: {', '.join(WORKLOADS)}). "
            f"Register it in ingest/workloads/ first, or pass --id of an existing workload "
            f"to test its specs against this directory."
        )

    artifact = build_artifact(workload, root=args.dump_dir)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(artifact.to_json(indent=args.indent))

    total_ops = sum(s.op_count for s in artifact.stages)
    changed = sum(1 for d in artifact.diffs if d.ir_changed)
    print(f"wrote {args.out}  ({args.out.stat().st_size / 1024:.0f} KB)")
    print(f"  {len(artifact.stages)} stages, {total_ops} operations")
    print(f"  {len(artifact.diffs)} comparable diffs ({changed} with IR changes)")
    print(f"  {len(artifact.evidence)} evidence items")


if __name__ == "__main__":
    main()
