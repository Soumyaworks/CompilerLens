import {useEffect, useMemo, useState} from 'react';

import type {Artifact, Stage} from '../api/artifact';
import {hasLocations} from '../api/locations';

export type StageView = 'ir' | 'diff';

/**
 * Shared IR/diff/loc()/stats state for any pane that shows one stage at a time --
 * StagePane's free picker and PhaseFlowPane's stepper both drive this identically, they
 * just disagree on how the current `stage` gets picked.
 */
export function useStageViewer(artifact: Artifact, stage: Stage) {
  const [view, setView] = useState<StageView>('ir');

  // Only a valid comparison when the previous stage shares this stage's language and
  // track -- ingest omits every other pair, so Diff must be unavailable rather than showing
  // a meaningless comparison.
  const previousStage = useMemo(() => {
    if (stage.index === 0) return undefined;
    const candidate = artifact.stages[stage.index - 1];
    if (!candidate) return undefined;
    return candidate.language === stage.language && candidate.track === stage.track
      ? candidate
      : undefined;
  }, [artifact, stage]);

  useEffect(() => {
    if (view === 'diff' && !previousStage) setView('ir');
  }, [view, previousStage]);

  // Never unmount the DiffEditor once it exists -- see the note inside SemanticDiff/
  // IRViewer's sibling comment. Remember the last valid comparison pair and keep feeding it.
  const [lastPair, setLastPair] = useState<{previous: Stage; current: Stage} | null>(null);
  useEffect(() => {
    if (previousStage) setLastPair({previous: previousStage, current: stage});
  }, [stage, previousStage]);

  const diffPair = previousStage ? {previous: previousStage, current: stage} : lastPair;
  const showDiff = view === 'diff' && Boolean(previousStage);

  const [showLocations, setShowLocations] = useState(false);
  const locationsAvailable = stage.language === 'mlir' && hasLocations(stage.text);

  const [statsOpen, setStatsOpen] = useState(false);

  return {
    view,
    setView,
    previousStage,
    diffPair,
    showDiff,
    showLocations,
    setShowLocations,
    locationsAvailable,
    statsOpen,
    setStatsOpen,
  };
}
