/**
 * TypeScript mirror of ingest/schema.py.
 *
 * These types ARE the contract with the compiler side. When ingest/schema.py changes, this
 * file must change with it -- keeping them in sync by hand is the deliberate trade for not
 * needing a codegen step.
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
 * What happened to an operation between two phase checkpoints.
 * `created`/`track-change`/`untraceable` are not really "changes" so much as origin, view-
 * switch, and absence markers. `changed` deliberately does not say *how* -- a count/name-set
 * delta alone cannot support naming a specific compiler mechanism (split/fuse/lower/modify);
 * a real case read an opaque-compilation event as "fusion" this way. See ingest/lineage.py.
 */
export type LineageChange = 'created' | 'carried' | 'changed' | 'track-change' | 'untraceable';

export type LineageConfidence = 'definitional' | 'structural' | 'heuristic';

export interface LineageHop {
  kind: 'origin' | 'transition' | 'track-change' | 'elimination';
  /** The stage this hop lands on (for `elimination`, the stage where it is no longer found). */
  stage_id: string;
  from_stage: string | null;
  change: LineageChange;
  confidence: LineageConfidence;
  from_count: number | null;
  to_count: number;
  op_names: Record<string, number>;
  /** Backend-generated, human-readable explanation of this hop -- see ingest/lineage.py. */
  detail: string;
  /** Intermediate --mlir-print-ir-after-all pass snapshots folded into this hop, not listed. */
  pass_count: number;
}

export interface LineageEntry {
  source_text: string;
  total_ops: number;
  stage_count: number;
  stages: Record<string, number[]>;
  op_names: Record<string, number>;
  /** Classified phase-to-phase trace -- see ingest/lineage.py's module docstring. */
  hops: LineageHop[];
}

export interface Lineage {
  anchor_stage: string;
  level: number;
  lines: Record<string, LineageEntry>;
  summary: {source_lines_covered: number; total_anchored_ops: number};
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
  /** Level-1 operation lineage: source line -> operations across all stages. */
  lineage?: Lineage;
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

// Anchor-stage (torch-input) operations that are declarations/literals/plumbing feeding a
// real operation, not an operation a user wrote: scalar constants, global weight
// declarations, embedded constant tensors, shape-list construction, dialect-bridging casts,
// and the function signature itself. Shared by the source pane's glyph filter and the
// Lineage Explorer's operation list so the two can't drift apart -- see IRViewer.tsx's
// earlier `sourceLineNum < 3` bug, which was exactly this kind of rule duplicated and
// hardcoded in one place while being wrong in the other.
const NON_TRACEABLE_ANCHOR_OPS = new Set([
  'func.func',
  'util.global',
  'util.global.load',
  'torch.vtensor.literal',
  'torch.prim.ListConstruct',
  'torch_c.from_builtin_tensor',
]);

export function isTraceableAnchorOp(opName: string): boolean {
  return !NON_TRACEABLE_ANCHOR_OPS.has(opName) && !opName.startsWith('torch.constant.');
}

// The type signature is everything after the last top-level " : " -- MLIR's own convention
// for "operands : types". Used only to cluster same-shape occurrences of the same operation
// in the Lineage Explorer's operation list; falls back to '' (ungrouped by shape, grouped by
// name alone) if the text doesn't match, which just means a slightly less compressed list,
// never a wrong one.
export function opShapeSignature(text: string): string {
  const idx = text.lastIndexOf(' : ');
  return idx === -1 ? '' : text.slice(idx + 3).trim();
}
