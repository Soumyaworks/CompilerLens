import type {LineageEntry, Stage} from '../api/artifact';
import {PHASE_TITLES} from '../api/artifact';
import '../styles/lineage.css';

interface LineageTimelineProps {
  sourceLine: string;
  lineageEntry: LineageEntry;
  sourceStage: Stage | undefined;
  stages: Stage[];
  onJumpToStage: (stageId: string, lines: number[]) => void;
}

export function LineageTimeline({
  sourceLine,
  lineageEntry,
  sourceStage,
  stages,
  onJumpToStage,
}: LineageTimelineProps) {
  const stageMap = new Map(stages.map(s => [s.id, s]));

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

      <div className="lineage-stages">
        {Object.entries(lineageEntry.stages)
          .sort(([aId], [bId]) => {
            const aStage = stageMap.get(aId);
            const bStage = stageMap.get(bId);
            return (aStage?.index ?? 0) - (bStage?.index ?? 0);
          })
          .map(([stageId, lines]) => {
            const stage = stageMap.get(stageId);
            if (!stage) return null;

            return (
              <div key={stageId} className="lineage-stage-entry">
                <button
                  type="button"
                  className="lineage-stage-button"
                  onClick={() => onJumpToStage(stageId, lines)}
                  title={`Jump to ${stage.title} at lines ${lines.join(', ')}`}
                >
                  <div className="lineage-stage-header">
                    <span className="lineage-stage-name">{stage.title}</span>
                    <span
                      className="lineage-stage-phase"
                      style={{['--phase-color' as string]: `var(--phase-${stage.phase})`}}
                    >
                      {PHASE_TITLES[stage.phase]}
                    </span>
                  </div>
                  {stage.ops.length > 0 && lines[0] > 0 && lines[0] <= stage.ops.length && (
                    <div className="lineage-stage-snippet">
                      <span className="lineage-snippet-label">Op:</span>
                      <span className="lineage-snippet-text">
                        {stage.ops[lines[0] - 1]?.text?.substring(0, 120) || '...'}
                      </span>
                    </div>
                  )}
                </button>
              </div>
            );
          })}
      </div>
    </div>
  );
}
