import type {LineageEntry, Phase, Stage} from './artifact';

export interface LoweringNode {
  stage: Stage;
  lines: number[];
  names: Array<[string, number]>;
  preview: string;
}
export interface LoweringLane {track: string; nodes: LoweringNode[]}

/** Checkpoint progression only. Never infer cross-track or operation dependency edges. */
export function buildLoweringGraph(stages: Stage[], entry: LineageEntry, includePasses = false) {
  const hops = new Map(entry.hops.map(hop => [hop.stage_id, hop]));
  // Missing track identity must not accidentally connect unrelated legacy snapshots.
  const trackOf = (stage: Stage) => stage.track || `unclassified:${stage.id}`;
  const relevantTracks = new Set(stages.filter(stage =>
    entry.stages[stage.id]?.length || hops.has(stage.id),
  ).map(trackOf));
  const candidates = stages.filter(stage => relevantTracks.has(trackOf(stage)) && stage.language !== 'python');
  const passCount = candidates.filter(stage => stage.kind === 'pass').length;
  const lanes: LoweringLane[] = [];
  const byTrack = new Map<string, LoweringLane>();
  for (const stage of [...candidates].sort((a, b) => a.index - b.index)) {
    if (stage.kind === 'pass' && !includePasses) continue;
    const track = trackOf(stage);
    let lane = byTrack.get(track);
    if (!lane) {
      lane = {track, nodes: []};
      byTrack.set(track, lane);
      lanes.push(lane);
    }
    const textLines = stage.text.split('\n');
    const lines = [...new Set(entry.stages[stage.id] ?? [])]
      .filter(line => Number.isInteger(line) && line >= 1 && line <= textLines.length).sort((a, b) => a - b);
    const matched = new Set(lines);
    const counts = new Map<string, number>();
    for (const op of stage.ops) {
      if (matched.has(op.line)) counts.set(op.name, (counts.get(op.name) ?? 0) + 1);
    }
    const names = lines.length ? (counts.size ? [...counts] : Object.entries(hops.get(stage.id)?.op_names ?? {})) : [];
    names.sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]));
    lane.nodes.push({stage, lines, names, preview: lines.length ? textLines[lines[0] - 1].trim().slice(0, 180) : ''});
  }
  const edges = lanes.flatMap(lane => lane.nodes.slice(1).map((node, i) => ({from: lane.nodes[i], to: node})));
  return {lanes, edges, passCount,
    nodeCount: lanes.reduce((count, lane) => count + lane.nodes.length, 0)};
}

export interface TreePhase {
  id: string;
  phase: Phase;
  nodes: LoweringNode[];
  x: number;
  y: number;
  height: number;
  open: boolean;
}
export interface TreeBranch {
  track: string;
  phases: TreePhase[];
  x: number;
  y: number;
  height: number;
  open: boolean;
}
export const TRACK_WIDTH = 300;
export const PHASE_HEIGHT = 76;
export const STAGE_HEIGHT = 84;

/** A bounded-width hierarchy: source association -> tracks -> contiguous phase groups.
 * Phase grouping must preserve capture order, including a phase revisited later.
 * Only explicit expansions affect height; hidden pass snapshots never become graph nodes.
 */
export function layoutLoweringTree(
  graph: ReturnType<typeof buildLoweringGraph>,
  openTracks: ReadonlySet<string>, openPhases: ReadonlySet<string>,
) {
  const columns = Math.max(1, Math.min(3, graph.lanes.length));
  const width = 64 + columns * TRACK_WIDTH + (columns - 1) * 36;
  const branches: TreeBranch[] = [];
  let rowY = 156;
  for (let row = 0; row < graph.lanes.length; row += columns) {
    const lanes = graph.lanes.slice(row, row + columns);
    const rowWidth = lanes.length * TRACK_WIDTH + (lanes.length - 1) * 36;
    const offset = (width - rowWidth) / 2;
    for (const [column, lane] of lanes.entries()) {
      const x = offset + column * (TRACK_WIDTH + 36);
      const open = openTracks.has(lane.track);
      const phases: TreePhase[] = [];
      for (const node of lane.nodes) {
        const previous = phases.at(-1);
        if (previous?.phase === node.stage.phase) previous.nodes.push(node);
        else phases.push({id: JSON.stringify([lane.track, node.stage.phase, phases.length]),
          phase: node.stage.phase, nodes: [node], x, y: 0, height: 0, open: false});
      }
      let nextY = rowY + 82;
      for (const phase of phases) {
        phase.open = openPhases.has(phase.id);
        phase.y = nextY;
        phase.height = PHASE_HEIGHT + (phase.open ? phase.nodes.length * STAGE_HEIGHT + 8 : 0);
        nextY += phase.height + 18;
      }
      branches.push({track: lane.track, phases, x, y: rowY, open,
        height: open ? nextY - rowY : 64});
    }
    rowY += Math.max(...branches.slice(-lanes.length).map(branch => branch.height)) + 52;
  }
  return {branches, width, height: Math.max(260, rowY - 20), rootX: (width - TRACK_WIDTH) / 2};
}
