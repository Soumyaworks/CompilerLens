import type {Artifact} from '../api/artifact';
import {EvidencePanel} from '../components/EvidencePanel';

/**
 * Compiler evidence as an independently addable/dockable pane.
 *
 * Clicking a source link opens a stage pane on that stage rather than repointing some
 * fixed pane elsewhere -- panes are independent here, so "navigate" means "show me a pane
 * with that stage" rather than mutating shared state.
 */

interface EvidencePaneProps {
  artifact: Artifact;
  onNavigateToStage: (stageId: string) => void;
}

export function EvidencePane({artifact, onNavigateToStage}: EvidencePaneProps) {
  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">Compiler evidence</span>
      </div>
      <div className="pane-body pane-body-scroll">
        <EvidencePanel
          evidence={artifact.evidence}
          stages={artifact.stages}
          onNavigate={onNavigateToStage}
        />
      </div>
    </div>
  );
}
