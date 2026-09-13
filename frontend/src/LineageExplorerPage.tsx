import {useMemo, useState} from 'react';

import type {Artifact} from './api/artifact';
import {LineageOperationList} from './components/LineageOperationList';
import {LineageTimeline} from './components/LineageTimeline';
import {IRViewer} from './components/IRViewer';
import './styles/lineage.css';

/**
 * A dedicated page for operation lineage, separate from the golden-layout workspace.
 *
 * The in-workspace Lineage pane (click a highlighted line in the source pane) still exists
 * unchanged -- this is an additional, bigger way to do the same thing: a plain list of
 * operations instead of a highlighted line to notice and click, and a description pane that
 * gets the width instead of whatever golden-layout leaves it.
 *
 * `torch-input` never shows the old glyph-highlight-everything decoration (no `lineage`/
 * `onLineageClick` props reach IRViewer here) -- but picking an operation from the list does
 * scroll to and highlight that one line, and jumping through a hop does the same on whichever
 * stage it lands on. Both go through the same `jumpHighlightLines`/`revealLine` state.
 */

interface LineageExplorerPageProps {
  artifact: Artifact;
  onBack: () => void;
  initialSourceLine?: string;
}

export function LineageExplorerPage({artifact, onBack, initialSourceLine}: LineageExplorerPageProps) {
  const anchorStage = useMemo(
    () => artifact.stages.find(s => s.name === artifact.lineage?.anchor_stage) ?? artifact.stages[0],
    [artifact],
  );
  const stageMap = useMemo(() => new Map(artifact.stages.map(s => [s.id, s])), [artifact]);

  const [selectedStageId, setSelectedStageId] = useState(anchorStage.id);
  const validInitialLine = initialSourceLine && artifact.lineage?.lines[initialSourceLine]
    ? initialSourceLine
    : null;
  const [selectedLine, setSelectedLine] = useState<string | null>(validInitialLine);
  const [jumpHighlightLines, setJumpHighlightLines] = useState<number[] | undefined>(
    validInitialLine ? [Number(validInitialLine)] : undefined,
  );

  const selectedStage = stageMap.get(selectedStageId) ?? anchorStage;
  const lineageEntry = selectedLine ? artifact.lineage?.lines[selectedLine] : undefined;

  function selectOperation(line: string) {
    setSelectedLine(line);
    setSelectedStageId(anchorStage.id);
    setJumpHighlightLines([Number(line)]);
  }

  function backToOperations() {
    setSelectedLine(null);
    setSelectedStageId(anchorStage.id);
    setJumpHighlightLines(undefined);
  }

  function jumpToStage(stageId: string, lines: number[]) {
    setSelectedStageId(stageId);
    setJumpHighlightLines(lines);
  }

  return (
    <div className="lineage-explorer">
      <header className="lineage-explorer-header">
        <button type="button" className="back-button" onClick={onBack}>
          ← Back to workspace
        </button>
        <h1>
          Operation Lineage <span className="muted">· {artifact.compilation_id}</span>
        </h1>
        <span className="lineage-explorer-stage-label">{selectedStage.title}</span>
      </header>

      <div className="lineage-explorer-panes">
        <section className="lineage-explorer-ir">
          <h3>{selectedStage.title}</h3>
          <div className="lineage-explorer-editor">
            <IRViewer
              stage={selectedStage}
              showLocations={false}
              highlightLines={jumpHighlightLines}
              revealLine={jumpHighlightLines?.[0]}
            />
          </div>
        </section>

        <section className="lineage-explorer-detail">
          {selectedLine && lineageEntry ? (
            <>
              <button type="button" className="lineage-back-link" onClick={backToOperations}>
                ← All operations
              </button>
              <LineageTimeline
                sourceLine={selectedLine}
                lineageEntry={lineageEntry}
                sourceStage={anchorStage}
                stages={artifact.stages}
                onJumpToStage={jumpToStage}
              />
            </>
          ) : (
            <LineageOperationList artifact={artifact} anchorStage={anchorStage} onSelect={selectOperation} />
          )}
        </section>
      </div>
    </div>
  );
}
