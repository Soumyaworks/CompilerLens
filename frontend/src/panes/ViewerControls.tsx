import type {Stage} from '../api/artifact';
import type {StageView} from './useStageViewer';

/**
 * IR/Diff toggle, loc() checkbox, and the Stats drawer toggle -- identical in StagePane and
 * PhaseFlowPane, since both are just different ways of picking which stage feeds the same
 * viewer body.
 */

interface ViewerControlsProps {
  view: StageView;
  onViewChange: (view: StageView) => void;
  previousStage: Stage | undefined;
  locationsAvailable: boolean;
  showLocations: boolean;
  onShowLocationsChange: (value: boolean) => void;
  statsOpen: boolean;
  onToggleStats: () => void;
}

export function ViewerControls({
  view,
  onViewChange,
  previousStage,
  locationsAvailable,
  showLocations,
  onShowLocationsChange,
  statsOpen,
  onToggleStats,
}: ViewerControlsProps) {
  return (
    <>
      <div className="view-toggle">
        <button type="button" className={view === 'ir' ? 'active' : ''} onClick={() => onViewChange('ir')}>
          IR
        </button>
        <button
          type="button"
          className={view === 'diff' ? 'active' : ''}
          onClick={() => onViewChange('diff')}
          disabled={!previousStage}
          title={
            previousStage
              ? `Compare against ${previousStage.title}`
              : 'No comparable previous stage: the language or track changes here'
          }
        >
          Diff
        </button>
      </div>
      {locationsAvailable && (
        <label className="loc-toggle" title="loc() is the lineage anchor, but it makes IR harder to read">
          <input
            type="checkbox"
            checked={showLocations}
            onChange={event => onShowLocationsChange(event.target.checked)}
          />
          loc()
        </label>
      )}
      <button
        type="button"
        className={`stats-toggle${statsOpen ? ' active' : ''}`}
        onClick={onToggleStats}
        aria-expanded={statsOpen}
        title="Operation counts and dialect histogram for this stage"
      >
        Stats
      </button>
    </>
  );
}
