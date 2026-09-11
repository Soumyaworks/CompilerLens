import type {Artifact, Stage} from '../api/artifact';
import {IRViewer} from '../components/IRViewer';

/**
 * The workload's PyTorch source, read-only (DESIGN-DOC section 4.1's entry point).
 *
 * The Compiler Explorer analogue of the source editor pane -- fixed rather than editable in
 * Stage 1, since there is no live compile yet, but occupying the same role: the thing every
 * other pane's output is in service of explaining.
 */

interface SourcePaneProps {
  stage: Stage;
  artifact?: Artifact;
  onOpenLineage?: (sourceLine: string) => void;
}

export function SourcePane({stage, artifact, onOpenLineage}: SourcePaneProps) {
  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">{stage.title}</span>
        <span className="pane-header-path">{stage.source_path}</span>
      </div>
      <div className="pane-body">
        <IRViewer
          stage={stage}
          showLocations={true}
          lineage={artifact?.lineage}
          onLineageClick={onOpenLineage}
        />
      </div>
    </div>
  );
}
