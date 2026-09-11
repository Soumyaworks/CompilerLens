import {useState} from 'react';
import type {LineageChange, LineageEntry, LineageHop, Stage} from '../api/artifact';
import {PHASE_TITLES} from '../api/artifact';
import '../styles/lineage.css';

interface LineageTimelineProps {
  sourceLine: string;
  lineageEntry: LineageEntry;
  sourceStage: Stage | undefined;
  stages: Stage[];
  onJumpToStage: (stageId: string, lines: number[]) => void;
}

/**
 * DESIGN-DOC section 4.2's classification, finally rendered. `ingest/lineage.py` decides the
 * label from operation-name/count aggregates; this file only displays it -- see that module's
 * docstring for exactly what each label does and does not claim.
 */
const CHANGE_LABELS: Record<LineageChange, string> = {
  created: 'Created',
  carried: 'Carried',
  modified: 'Modified',
  lowered: 'Lowered',
  fused: 'Fused',
  split: 'Split',
  'track-change': 'View change',
  eliminated: 'Eliminated',
};

type TimelineItem = {kind: 'hop'; hop: LineageHop} | {kind: 'run'; hops: LineageHop[]};

/** Consecutive no-op ("carried") hops collapse into one card -- this is most of the noise. */
function groupHops(hops: LineageHop[]): TimelineItem[] {
  const items: TimelineItem[] = [];
  let run: LineageHop[] = [];
  const flushRun = () => {
    if (run.length === 1) {
      items.push({kind: 'hop', hop: run[0]});
    } else if (run.length > 1) {
      items.push({kind: 'run', hops: run});
    }
    run = [];
  };
  for (const hop of hops) {
    if (hop.change === 'carried') {
      run.push(hop);
    } else {
      flushRun();
      items.push({kind: 'hop', hop});
    }
  }
  flushRun();
  return items;
}

function HopCard({
  hop,
  stageMap,
  jumpLines,
  onJumpToStage,
}: {
  hop: LineageHop;
  stageMap: Map<string, Stage>;
  jumpLines: (stageId: string) => number[];
  onJumpToStage: (stageId: string, lines: number[]) => void;
}) {
  const stage = stageMap.get(hop.stage_id);
  if (!stage) return null;
  const opNames = Object.entries(hop.op_names).slice(0, 6);

  return (
    <div className="lineage-hop">
      <button
        type="button"
        className="lineage-stage-button"
        onClick={() => onJumpToStage(hop.stage_id, jumpLines(hop.stage_id))}
        title={`Jump to ${stage.title}`}
      >
        <div className="lineage-stage-header">
          <span className="lineage-stage-name">{stage.title}</span>
          <span className={`lineage-change-badge change-${hop.change}`}>
            {CHANGE_LABELS[hop.change]}
          </span>
          <span
            className="lineage-stage-phase"
            style={{['--phase-color' as string]: `var(--phase-${stage.phase})`}}
          >
            {PHASE_TITLES[stage.phase]}
          </span>
        </div>

        <p className="lineage-hop-detail">{hop.detail}</p>

        {opNames.length > 0 && (
          <div className="lineage-hop-names">
            {opNames.map(([name, count]) => (
              <span key={name} className="lineage-op-name-tag">
                {name} <span className="lineage-op-count">×{count}</span>
              </span>
            ))}
          </div>
        )}

        {hop.pass_count > 0 && (
          <span className="lineage-pass-chip">
            +{hop.pass_count} intermediate pass snapshot{hop.pass_count === 1 ? '' : 's'} (not
            shown)
          </span>
        )}
      </button>
    </div>
  );
}

function CollapsedRun({
  hops,
  stageMap,
  jumpLines,
  onJumpToStage,
}: {
  hops: LineageHop[];
  stageMap: Map<string, Stage>;
  jumpLines: (stageId: string) => number[];
  onJumpToStage: (stageId: string, lines: number[]) => void;
}) {
  const [open, setOpen] = useState(false);
  const totalPasses = hops.reduce((sum, hop) => sum + hop.pass_count, 0);
  const opCount = hops[0]?.to_count ?? 0;

  return (
    <div className="lineage-hop lineage-run">
      <button type="button" className="lineage-run-toggle" onClick={() => setOpen(o => !o)}>
        <span className="lineage-change-badge change-carried">Carried</span>
        <span className="lineage-run-summary">
          Unchanged through {hops.length} phases ({opCount} op{opCount === 1 ? '' : 's'})
          {totalPasses > 0 ? ` — +${totalPasses} pass snapshots not shown` : ''}
        </span>
        <span className="lineage-run-caret">{open ? '▾' : '▸'}</span>
      </button>
      {open && (
        <div className="lineage-run-detail">
          {hops.map(hop => (
            <HopCard
              key={hop.stage_id}
              hop={hop}
              stageMap={stageMap}
              jumpLines={jumpLines}
              onJumpToStage={onJumpToStage}
            />
          ))}
        </div>
      )}
    </div>
  );
}

export function LineageTimeline({
  sourceLine,
  lineageEntry,
  sourceStage,
  stages,
  onJumpToStage,
}: LineageTimelineProps) {
  const stageMap = new Map(stages.map(s => [s.id, s]));
  const items = groupHops(lineageEntry.hops);
  const jumpLines = (stageId: string) => lineageEntry.stages[stageId] ?? [];

  return (
    <div className="lineage-timeline">
      <div className="lineage-header">
        <div className="lineage-title">
          <span className="lineage-op-name">Source line {sourceLine}</span>
          <span className="lineage-source-loc">
            {sourceStage ? `${sourceStage.title}` : 'torch-input'}
          </span>
        </div>
        <div className="lineage-stats">
          <span className="lineage-stat">
            <span className="lineage-stat-label">Total ops:</span>
            <span className="lineage-stat-value">{lineageEntry.total_ops.toLocaleString()}</span>
          </span>
          <span className="lineage-stat">
            <span className="lineage-stat-label">Stages:</span>
            <span className="lineage-stat-value">{lineageEntry.stage_count}</span>
          </span>
        </div>
      </div>

      <div className="lineage-op-names">
        <span className="lineage-op-names-label">Becomes:</span>
        <div className="lineage-op-names-list">
          {Object.entries(lineageEntry.op_names)
            .slice(0, 12)
            .map(([name, count]) => (
              <span key={name} className="lineage-op-name-tag">
                {name} <span className="lineage-op-count">×{count}</span>
              </span>
            ))}
        </div>
      </div>

      <div className="lineage-hops">
        {items.map((item, index) =>
          item.kind === 'run' ? (
            <CollapsedRun
              key={`run-${index}`}
              hops={item.hops}
              stageMap={stageMap}
              jumpLines={jumpLines}
              onJumpToStage={onJumpToStage}
            />
          ) : (
            <HopCard
              key={item.hop.stage_id}
              hop={item.hop}
              stageMap={stageMap}
              jumpLines={jumpLines}
              onJumpToStage={onJumpToStage}
            />
          )
        )}
      </div>
    </div>
  );
}
