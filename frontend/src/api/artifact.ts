/**
 * TypeScript mirror of ingest/schema.py.
 *
 * These types ARE the contract with the compiler side. When ingest/schema.py changes, this
 * file must change with it -- keeping them in sync by hand is the deliberate trade for not
 * needing a codegen step in a 20-day project.
 *
 * See DESIGN-DOC.md section 6.
 */

export type Phase =
  | 'frontend'
  | 'input'
  | 'global'
  | 'flow'
  | 'codegen'
  | 'runtime'
  | 'llvm'
  | 'binary';

/** Drives syntax highlighting in the IR viewer. */
export type Language = 'mlir' | 'llvm' | 'asm' | 'python';

export interface Operation {
  id: string;
  stage_id: string;
  /** 1-based, so the viewer can reveal the line directly. */
  line: number;
  name: string;
  dialect: string;
  results: string[];
  operands: string[];
  types: string[];
  text: string;
  /**
   * Resolved loc() metadata as "file:line:col" -- the Level-1 lineage anchor. Operations
   * derived from the same source construct share this value. Null when the compiler gave
   * loc(unknown) or the location could not be resolved; never guessed.
   */
  source_loc: string | null;
  /** Populated by the lineage engine in Stage 2. */
  lineage_key: string | null;
}

/** An IREE pipeline phase dump, or a single pass snapshot from a pass log. */
export type StageKind = 'phase' | 'pass';

export interface Stage {
  id: string;
  index: number;
  name: string;
  title: string;
  phase: Phase;
  language: Language;
  source_path: string;
  text: string;
  line_count: number;
  byte_size: number;
  op_count: number;
  /** Grouping differs by language; histogram_label says what this counts. */
  op_histogram: Record<string, number>;
  histogram_label: string;
  /** Empty for LLVM, assembly, and per-pass stages -- the index is trimmed from the artifact. */
  ops: Operation[];
  description: string;
  kind: StageKind;
  /**
   * Comparison track. Only stages sharing a track may be diffed: the whole-module phase
   * dumps, the extracted device kernel, and the per-pass snapshots of one function are
   * three different views, and the stage list interleaves them.
   */
  track: string;
  pass_name: string | null;
  pass_arg: string | null;
  /** For kind === 'pass', the phase stage these sub-stages nest under. */
  parent_stage: string | null;
  /** A known discontinuity in the captured pipeline; shown, never hidden. */
  gap_note: string | null;
}

export interface StageDiff {
  from_stage: string;
  to_stage: string;
  op_delta: number;
  groups_added: string[];
  groups_removed: string[];
  ops_added: string[];
  ops_removed: string[];
  ir_changed: boolean;
  summary: string;
}

export type EvidenceStatus = 'success' | 'missed' | 'info';

export interface Evidence {
  id: string;
  kind: string;
  label: string;
  value: string;
  source_stage: string;
  source_detail: string;
  status: EvidenceStatus;
}

/**
 * One Optimization Doctor finding. Mirrors analyzer/rules/base.py's Finding.
 *
 * `confidence` and `measured_cost_ms` exist to stop a finding sounding more certain than it is:
 * a `heuristic` must not read like a `measured`, and a null cost renders as "unmeasured" rather
 * than as zero.
 */
export interface Finding {
  rule_id: string;
  severity: 'missed' | 'suboptimal' | 'info';
  title: string;
  detail: string;
  stage_id: string;
  stage_name: string;
  confidence: 'measured' | 'structural' | 'heuristic';
  evidence: string[];
  line: number | null;
  measured_cost_ms: number | null;
  suggestion: string | null;
}

/** Mirrors analyzer/diagnose.py's return value. */
export interface Diagnosis {
  findings: Finding[];
  summary: {
    total: number;
    by_severity: Record<string, number>;
    measured: number;
    headline: string;
  };
  rules_run: {id: string; title: string; looks_for: string}[];
  notes: string[];
}

/**
 * Modelled per-kernel cost (backend/measure/kernels.py).
 *
 * `basis` is always "modelled": FLOPs come from the shapes in IREE's kernel names, never from
 * timing each kernel. The field exists so the UI cannot forget to say so.
 */
export interface KernelCosts {
  basis: 'modelled';
  kernels: {
    name: string;
    short_name: string;
    kind: string;
    dims: number[];
    flops: number | null;
    bytes_moved: number;
    arithmetic_intensity: number | null;
    bound_by: 'compute' | 'memory' | 'unknown';
    note: string;
    flops_share: number | null;
    bytes_share: number | null;
  }[];
  totals: {
    kernel_count: number;
    total_flops: number;
    total_bytes: number;
    memory_bound_kernels: number;
    arithmetic_intensity: number | null;
  };
  machine: {
    cores: number;
    mhz: number;
    vector_lanes: number;
    peak_gflops: number;
    note: string;
  } | null;
  notes: string[];
}

export interface Artifact {
  compilation_id: string;
  stages: Stage[];
  diffs: StageDiff[];
  evidence: Evidence[];
  source: {kind?: string; entry?: string; code?: string};
  target: {backend?: string; cpu?: string; triple?: string; native_vector_size?: number};
  /** Honest caveats about what this artifact does and does not capture. */
  notes: string[];
  /** Baked in by ingest at build time, so the static site needs no server to show it. */
  diagnosis?: Diagnosis;
  /** Modelled arithmetic and memory cost per dispatch. */
  kernels?: KernelCosts;
  artifact_version: string;
}

/** One landing-page card. Mirrors ingest/build.py's build_index(). */
export interface WorkloadSummary {
  id: string;
  title: string;
  description: string;
  source_entry: string;
  source_preview: string;
  stage_count: number;
  op_count: number;
  evidence_count: number;
}

export interface WorkloadIndex {
  workloads: WorkloadSummary[];
}

export const PHASE_TITLES: Record<Phase, string> = {
  frontend: 'Frontend',
  input: 'Input',
  global: 'Global Optimization',
  flow: 'Flow / Stream',
  codegen: 'Codegen',
  runtime: 'Runtime',
  llvm: 'LLVM',
  binary: 'Binary',
};

export const PHASE_ORDER: Phase[] = [
  'frontend',
  'input',
  'global',
  'flow',
  'codegen',
  'runtime',
  'llvm',
  'binary',
];

export interface PhaseGroup {
  phase: Phase;
  stages: Stage[];
}

/**
 * Group consecutive stages by phase, preserving pipeline order.
 *
 * Used by the stage picker (per-pane dropdown, grouped by phase like Compiler Explorer
 * groups its compiler picker by compiler family) to build its optgroups.
 */
export function groupByPhase(stages: Stage[]): PhaseGroup[] {
  const groups: PhaseGroup[] = [];
  for (const stage of stages) {
    const last = groups.at(-1);
    if (last && last.phase === stage.phase) {
      last.stages.push(stage);
    } else {
      groups.push({phase: stage.phase, stages: [stage]});
    }
  }
  return groups;
}
