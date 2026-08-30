import type {ComponentContainer} from 'golden-layout';
import {useEffect, useMemo, useState} from 'react';

import type {Artifact, Phase} from '../api/artifact';
import {PHASE_TITLES} from '../api/artifact';
import {StageViewerBody} from './StageViewerBody';
import {useStageViewer} from './useStageViewer';
import {ViewerControls} from './ViewerControls';

/**
 * "Step through one phase" -- the pipeline rail's drill-down. Rather than opening every
 * stage in a phase as its own pane, this is one pane that walks its stages in order, either
 * one at a time (prev/next) or by jumping directly to one on the mini rail.
 */

export interface PhaseFlowPaneState {
  phase: Phase;
}

interface PhaseFlowPaneProps {
  artifact: Artifact;
  phase: Phase;
  container: ComponentContainer;
  onSelectStage: (stageId: string | null) => void;
}

export function PhaseFlowPane({artifact, phase, container, onSelectStage}: PhaseFlowPaneProps) {
  const stagesInPhase = useMemo(() => artifact.stages.filter(s => s.phase === phase), [artifact, phase]);
  const [index, setIndex] = useState(0);
  const stage = stagesInPhase[Math.min(index, stagesInPhase.length - 1)];

  useEffect(() => {
    onSelectStage(stage.id);
    return () => onSelectStage(null);
  }, [onSelectStage, stage.id]);

  const viewer = useStageViewer(artifact, stage);

  useEffect(() => {
    container.setTitle(`${PHASE_TITLES[phase]} (${index + 1}/${stagesInPhase.length})`);
  }, [container, phase, index, stagesInPhase.length]);

  return (
    <div className="pane">
      <div className="stage-pane-chrome">
        <div className="pane-header stage-pane-header">
          <span
            className="stage-phase-tag"
            style={{['--phase-color' as string]: `var(--phase-${phase})`}}
          >
            <span className="phase-swatch" aria-hidden="true" />
            {PHASE_TITLES[phase]}
          </span>
          <div className="phase-stepper-nav">
            <button
              type="button"
              onClick={() => setIndex(i => i - 1)}
              disabled={index === 0}
              aria-label="Previous stage in this phase"
              title="Previous stage in this phase"
            >
              ‹
            </button>
            <span className="phase-stepper-count">
              {index + 1} / {stagesInPhase.length}
            </span>
            <button
              type="button"
              onClick={() => setIndex(i => i + 1)}
              disabled={index === stagesInPhase.length - 1}
              aria-label="Next stage in this phase"
              title="Next stage in this phase"
            >
              ›
            </button>
          </div>
          <span className="phase-stepper-title">
            {stage.title}
            {stage.kind === 'pass' && <span className="pass-badge">pass</span>}
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
        <div className="phase-mini-rail" role="list" aria-label={`Stages in ${PHASE_TITLES[phase]}`}>
          {stagesInPhase.map((s, i) => (
            <button
              key={s.id}
              type="button"
              role="listitem"
              className={
                `phase-mini-rail-segment${s.kind === 'pass' ? ' phase-mini-rail-segment-pass' : ''}` +
                (i === index ? ' active' : '')
              }
              style={{['--phase-color' as string]: `var(--phase-${phase})`}}
              title={s.title}
              onClick={() => setIndex(i)}
            />
          ))}
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
      />
    </div>
  );
}
