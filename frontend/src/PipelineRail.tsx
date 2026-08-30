import type {Artifact, Phase} from './api/artifact';
import {groupByPhase, PHASE_TITLES} from './api/artifact';

/**
 * A compact, always-visible pipeline flow (DESIGN-DOC section 4.3's transformation timeline,
 * made spatial): one heading per phase, sized by how many stages it holds, ringed when a
 * currently open pane sits somewhere inside it. Clicking a heading opens a PhaseFlowPane --
 * a stepper that walks that phase's stages one at a time -- rather than 55 individual
 * segments each opening their own pane.
 *
 * Deliberately a toolbar strip rather than a pane: it is a 1-D overview every stage pane
 * shares, not a per-pane view -- an addable pane would mean remembering to reopen it, and
 * would default to a squarish rectangle for content that is inherently a thin rail.
 */

interface PipelineRailProps {
  artifact: Artifact;
  activeStageIds: Set<string>;
  onOpenPhase: (phase: Phase) => void;
}

export function PipelineRail({artifact, activeStageIds, onOpenPhase}: PipelineRailProps) {
  const groups = groupByPhase(artifact.stages);

  return (
    <div className="pipeline-rail" role="list" aria-label="Compilation pipeline phases">
      {groups.map(group => {
        const active = group.stages.some(s => activeStageIds.has(s.id));
        const gapNote = group.stages.some(s => s.gap_note);
        return (
          <button
            key={`${group.phase}-${group.stages[0].id}`}
            type="button"
            role="listitem"
            className={`pipeline-rail-heading${active ? ' active' : ''}`}
            style={{
              ['--phase-color' as string]: `var(--phase-${group.phase})`,
              flexGrow: group.stages.length,
            }}
            data-gap={gapNote ? 'true' : undefined}
            title={`${PHASE_TITLES[group.phase]} — ${group.stages.length} stage${group.stages.length === 1 ? '' : 's'}. Click to step through them.`}
            onClick={() => onOpenPhase(group.phase)}
          >
            {PHASE_TITLES[group.phase]}
          </button>
        );
      })}
    </div>
  );
}
