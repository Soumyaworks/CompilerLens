import {useMemo, useState} from 'react';

import type {Artifact} from './api/artifact';
import {LineageOperationList} from './components/LineageOperationList';
import {LineageTimeline} from './components/LineageTimeline';
import {IRViewer} from './components/IRViewer';
import {FocusedIRViewer} from './components/FocusedIRViewer';
import {LineageGraph} from './components/LineageGraph';
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
 * focus on that line. Stage jumps show every matching section with expandable context;
 * the operation-list screen and full pipeline editors still show the whole document.
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
  const [view, setView] = useState<'ir' | 'graph'>('ir');
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
    setView('ir');
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
        <div className="lineage-view-toggle" role="group" aria-label="Lineage view">
          <button type="button" aria-pressed={view === 'ir'} onClick={() => setView('ir')}>IR view</button>
          <button type="button" aria-pressed={view === 'graph'} disabled={!lineageEntry}
            title={lineageEntry ? 'Explore source associations across compiler checkpoints' : 'Select an operation first'}
            onClick={() => setView('graph')}>Graph view</button>
        </div>
        <span className="lineage-explorer-stage-label">{selectedStage.title}</span>
      </header>

      {view === 'graph' && selectedLine && lineageEntry ? (
        <LineageGraph key={selectedLine} stages={artifact.stages} entry={lineageEntry}
          sourceLine={selectedLine} selectedStage={selectedStage} onSelect={jumpToStage} onBack={backToOperations} />
      ) : <div className="lineage-explorer-panes">
        <section className="lineage-explorer-ir">
          <h3>{selectedStage.title}</h3>
          <div className="lineage-explorer-editor">
            {selectedLine ? (
              <FocusedIRViewer
                key={`${selectedStage.id}:${selectedLine}`}
                stage={selectedStage}
                highlightLines={jumpHighlightLines ?? []}
              />
            ) : (
              <IRViewer stage={selectedStage} showLocations={false} />
            )}
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
      </div>}
    </div>
  );
}
