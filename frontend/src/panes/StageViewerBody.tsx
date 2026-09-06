import type {Artifact, Stage} from '../api/artifact';
import {IRViewer} from '../components/IRViewer';
import {SemanticDiff} from '../components/SemanticDiff';
import {StageStats} from '../components/StageStats';

/**
 * The IR/diff viewer plus the on-demand stats drawer -- shared body for any pane driven by
 * `useStageViewer`. See StagePane's note on why stats floats over the viewer instead of
 * reserving a permanent column: a fixed-width sidebar dominated the pane once it got narrow.
 */

interface StageViewerBodyProps {
  artifact: Artifact;
  stage: Stage;
  diffPair: {previous: Stage; current: Stage} | null;
  showDiff: boolean;
  showLocations: boolean;
  statsOpen: boolean;
  onCloseStats: () => void;
  revealLine?: number;
  highlightLines?: number[];
}

export function StageViewerBody({
  artifact,
  stage,
  diffPair,
  showDiff,
  showLocations,
  statsOpen,
  onCloseStats,
  revealLine,
  highlightLines,
}: StageViewerBodyProps) {
  return (
    <div className="pane-body stage-pane-body">
      <IRViewer
        stage={stage}
        hidden={showDiff}
        showLocations={showLocations}
        revealLine={revealLine}
        highlightLines={highlightLines}
      />
      {diffPair && (
        <SemanticDiff
          previous={diffPair.previous}
          current={diffPair.current}
          diff={artifact.diffs.find(
            d => d.from_stage === diffPair.previous.id && d.to_stage === diffPair.current.id,
          )}
          hidden={!showDiff}
          showLocations={showLocations}
        />
      )}
      {statsOpen && (
        <aside className="side stage-pane-stats">
          <button type="button" className="stage-pane-stats-close" onClick={onCloseStats} aria-label="Close stats">
            ×
          </button>
          <StageStats stage={stage} />
        </aside>
      )}
    </div>
  );
}
