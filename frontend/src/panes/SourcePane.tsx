import type {Artifact, Stage} from '../api/artifact';
import {IRViewer} from '../components/IRViewer';

/**
 * The workload's PyTorch source, read-only (DESIGN-DOC section 4.1's entry point).
 *
 * The Compiler Explorer analogue of the source editor pane -- fixed rather than editable in
 * Stage 1, since there is no live compile yet, but occupying the same role: the thing every
 * other pane's output is in service of explaining.
 *
 * Note: We display torch-input (MLIR) instead of pytorch-source (raw Python) because:
 * - torch-input has operation metadata and lineage information
 * - pytorch-source is just raw code with no compiler-generated operations
 * - Lineage highlighting requires operation data, which only torch-input has
 */

interface SourcePaneProps {
  stage: Stage;
  artifact?: Artifact;
  onOpenLineage?: (sourceLine: string) => void;
}

export function SourcePane({stage, artifact, onOpenLineage}: SourcePaneProps) {
  // If this is the pytorch-source stage, find torch-input instead for lineage highlighting
  const displayStage = stage.name === 'pytorch-source'
    ? artifact?.stages.find(s => s.name === 'torch-input') ?? stage
    : stage;

  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">{displayStage.title}</span>
        <span className="pane-header-path">{displayStage.source_path}</span>
      </div>
      <div className="pane-body">
        <IRViewer
          stage={displayStage}
          showLocations={true}
          lineage={artifact?.lineage}
          onLineageClick={onOpenLineage}
        />
      </div>
    </div>
  );
}
