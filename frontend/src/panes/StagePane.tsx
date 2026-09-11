import type {ComponentContainer} from 'golden-layout';
import {useEffect, useMemo, useState} from 'react';

import type {Artifact, Stage} from '../api/artifact';
import {PHASE_TITLES} from '../api/artifact';
import {StagePicker} from '../widgets/StagePicker';
import {StageViewerBody} from './StageViewerBody';
import {useStageViewer} from './useStageViewer';
import {ViewerControls} from './ViewerControls';

/**
 * The primary pane type: pick any pipeline stage from a searchable, phase-grouped picker,
 * view its IR or diff it against the previous stage in its track.
 *
 * Independent per pane, matching Compiler Explorer's output panes: each one carries its
 * own picker and its own view state, so two stage panes open side by side never fight over
 * a shared selection.
 */

export interface StagePaneState {
  stageId: string;
  revealLine?: number;
  highlightLines?: number[];
}

interface StagePaneProps {
  artifact: Artifact;
  initialState: StagePaneState | undefined;
  container: ComponentContainer;
  /** Reports this pane's current stage to the workspace's pipeline rail; null on unmount. */
  onSelectStage: (stageId: string | null) => void;
}

export function StagePane({artifact, initialState, container, onSelectStage}: StagePaneProps) {
  const [selectedId, setSelectedId] = useState<string>(initialState?.stageId ?? artifact.stages[0].id);

  const stage: Stage = useMemo(
    () => artifact.stages.find(s => s.id === selectedId) ?? artifact.stages[0],
    [artifact, selectedId],
  );

  useEffect(() => {
    onSelectStage(stage.id);
    return () => onSelectStage(null);
  }, [onSelectStage, stage.id]);

  const viewer = useStageViewer(artifact, stage);

  useEffect(() => {
    container.setTitle(stage.title);
  }, [container, stage.title]);

  return (
    <div className="pane">
      {/* Grouped into one child so `.pane`'s 2-row grid (chrome auto, body 1fr) holds --
          extra top-level children beyond the explicit rows would each claim their own
          implicit row, and the body needs the full 1fr row to give the editor real height. */}
      <div className="stage-pane-chrome">
        <div className="pane-header stage-pane-header">
          <StagePicker stages={artifact.stages} value={selectedId} onChange={setSelectedId} />
          {stage.kind === 'pass' && <span className="pass-badge">pass</span>}
          <span
            className="stage-phase-tag"
            style={{['--phase-color' as string]: `var(--phase-${stage.phase})`}}
          >
            <span className="phase-swatch" aria-hidden="true" />
            {PHASE_TITLES[stage.phase]}
          </span>
          <ViewerControls
            view={viewer.view}
            onViewChange={viewer.setView}
            previousStage={viewer.previousStage}
            locationsAvailable={viewer.locationsAvailable}
            showLocations={viewer.showLocations}
            onShowLocationsChange={viewer.setShowLocations}
            statsOpen={viewer.statsOpen}
            onToggleStats={() => viewer.setStatsOpen(open => !open)}
          />
        </div>
        <p className="stage-description">{stage.description}</p>
        {stage.gap_note && (
          <div className="gap-note">
            <span className="gap-note-icon" aria-hidden="true">
              ▲
            </span>
            <span>{stage.gap_note}</span>
          </div>
        )}
      </div>
      <StageViewerBody
        artifact={artifact}
        stage={stage}
        diffPair={viewer.diffPair}
        showDiff={viewer.showDiff}
        showLocations={viewer.showLocations}
        statsOpen={viewer.statsOpen}
        onCloseStats={() => viewer.setStatsOpen(false)}
        revealLine={initialState?.revealLine}
        highlightLines={initialState?.highlightLines}
      />
    </div>
  );
}
