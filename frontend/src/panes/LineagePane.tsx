import type {Artifact, LineageEntry} from '../api/artifact';
import {LineageTimeline} from '../components/LineageTimeline';

/**
 * Operation lineage explorer (DESIGN-DOC section 4.2, Stage 2).
 *
 * Click a source line to trace it end-to-end through all compilation stages.
 * Shows a timeline of the operation across stages with line numbers and IR snippets.
 */

export interface LineagePaneState {
  sourceLine: string;
}

interface LineagePaneProps {
  artifact: Artifact;
  initialState: LineagePaneState | undefined;
  onJumpToStage: (stageId: string, lines: number[]) => void;
}

export function LineagePane({artifact, initialState, onJumpToStage}: LineagePaneProps) {
  if (!initialState?.sourceLine || !artifact.lineage) {
    return (
      <div className="pane">
        <div className="pane-header">
          <span className="pane-header-title">Lineage</span>
        </div>
        <div className="pane-body pane-body-scroll centered">
          <p style={{color: 'var(--text-muted)'}}>Click a source line to trace its lineage</p>
        </div>
      </div>
    );
  }

  const lineageEntry: LineageEntry | undefined = artifact.lineage.lines[initialState.sourceLine];

  if (!lineageEntry) {
    return (
      <div className="pane">
        <div className="pane-header">
          <span className="pane-header-title">Lineage</span>
        </div>
        <div className="pane-body pane-body-scroll centered">
          <p style={{color: 'var(--text-muted)'}}>No lineage data for line {initialState.sourceLine}</p>
        </div>
      </div>
    );
  }

  const sourceStage = artifact.stages.find(s => s.name === artifact.lineage!.anchor_stage);

  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">Lineage</span>
      </div>
      <div className="pane-body pane-body-scroll">
        <LineageTimeline
          sourceLine={initialState.sourceLine}
          lineageEntry={lineageEntry}
          sourceStage={sourceStage}
          stages={artifact.stages}
          diagnosis={artifact.diagnosis}
          onJumpToStage={onJumpToStage}
        />
      </div>
    </div>
  );
}
