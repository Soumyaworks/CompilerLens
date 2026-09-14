import type {ComponentContainer} from 'golden-layout';
import {GoldenLayout} from 'golden-layout';
import {useEffect, useMemo, useRef, useState} from 'react';

import type {Artifact, Phase, Stage} from './api/artifact';
import {PHASE_TITLES} from './api/artifact';
import {ArtifactMissingError, fetchArtifact} from './api/client';
import {registerReactPane} from './golden-layout/react-bridge';
import {LineageExplorerPage} from './LineageExplorerPage';
import {EvidencePane} from './panes/EvidencePane';
import {LineagePane} from './panes/LineagePane';
import type {LineagePaneState} from './panes/LineagePane';
import {NotesPane} from './panes/NotesPane';
import type {PhaseFlowPaneState} from './panes/PhaseFlowPane';
import {PhaseFlowPane} from './panes/PhaseFlowPane';
import {SourcePane} from './panes/SourcePane';
import type {StagePaneState} from './panes/StagePane';
import {StagePane} from './panes/StagePane';
import {PipelineRail} from './PipelineRail';

/**
 * The golden-layout workspace for one workload, styled after Compiler Explorer: a source
 * pane plus independently addable,
 * draggable, resizable, dockable output panes, all reading the same artifact.
 */

interface WorkspaceProps {
  workloadId: string;
  onBack: () => void;
  onOpenArchitecture: () => void;
  initialLineageLine?: number;
}

function Loading() {
  return (
    <div className="centered">
      <p style={{color: 'var(--text-muted)'}}>Loading artifact…</p>
    </div>
  );
}

function ArtifactMissing({workloadId}: {workloadId: string}) {
  return (
    <div className="centered">
      <div className="error-box">
        <h2>No artifact yet</h2>
        <p>
          The frontend reads a normalized artifact produced by the ingest layer. Generate it
          from the vendored dumps:
        </p>
        <p>
          <code>npm run artifact</code>
        </p>
        <p style={{color: 'var(--text-muted)'}}>
          This writes <code>frontend/public/artifacts/{workloadId}.json</code>, then reload the
          page.
        </p>
      </div>
    </div>
  );
}

function LoadError({message}: {message: string}) {
  return (
    <div className="centered">
      <div className="error-box">
        <h2>Could not load artifact</h2>
        <p>{message}</p>
      </div>
    </div>
  );
}

function defaultLayoutConfig(artifact: Artifact) {
  const source = artifact.stages.find(s => s.name === 'pytorch-source') ?? artifact.stages[0];
  const early = artifact.stages.find(s => s.kind === 'phase' && s.id !== source.id) ?? artifact.stages[1];
  const late =
    [...artifact.stages].reverse().find(s => s.kind === 'phase' && s.id !== early.id) ?? early;

  const stageComponent = (stage: Stage) => ({
    type: 'component' as const,
    componentType: 'stage',
    componentState: {stageId: stage.id} satisfies StagePaneState,
    title: stage.title,
    size: '28%',
  });

  return {
    root: {
      type: 'row' as const,
      content: [
        {
          type: 'component' as const,
          componentType: 'source',
          title: source.title,
          size: '22%',
        },
        stageComponent(early),
        stageComponent(late),
        {
          type: 'component' as const,
          componentType: 'evidence',
          title: 'Evidence',
          size: '22%',
        },
      ],
    },
  };
}

export function Workspace({workloadId, onBack, onOpenArchitecture, initialLineageLine}: WorkspaceProps) {
  const [artifact, setArtifact] = useState<Artifact | null>(null);
  const [error, setError] = useState<{missing: boolean; message: string} | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const layoutRef = useRef<GoldenLayout | null>(null);
  const addMenuRef = useRef<HTMLDivElement>(null);
  const [addMenuOpen, setAddMenuOpen] = useState(false);
  // Whether the dedicated Lineage page (LineageExplorerPage) is showing instead of the
  // golden-layout workspace. The workspace's container div and PipelineRail stay mounted
  // (just hidden) rather than unmounted, so golden-layout's instance -- tied to that DOM
  // node -- survives toggling back and forth.
  const [lineageExplorerOpen, setLineageExplorerOpen] = useState(initialLineageLine != null);
  // Which stage each currently-open stage pane is showing, keyed by its own container --
  // purely for the pipeline rail's "you are here" markers. Panes register themselves
  // (StagePane's onSelectStage) rather than this being lifted, controlled state, since
  // every stage pane otherwise stays fully independent.
  const [paneSelections, setPaneSelections] = useState<Map<ComponentContainer, string>>(
    () => new Map(),
  );
  const activeStageIds = useMemo(() => new Set(paneSelections.values()), [paneSelections]);

  useEffect(() => {
    if (!addMenuOpen) return;

    function closeAddMenuOnOutsidePointer(event: PointerEvent) {
      if (!addMenuRef.current?.contains(event.target as Node)) {
        setAddMenuOpen(false);
      }
    }

    function closeAddMenuOnEscape(event: KeyboardEvent) {
      if (event.key === 'Escape') setAddMenuOpen(false);
    }

    document.addEventListener('pointerdown', closeAddMenuOnOutsidePointer);
    document.addEventListener('keydown', closeAddMenuOnEscape);
    return () => {
      document.removeEventListener('pointerdown', closeAddMenuOnOutsidePointer);
      document.removeEventListener('keydown', closeAddMenuOnEscape);
    };
  }, [addMenuOpen]);

  useEffect(() => {
    let cancelled = false;
    setArtifact(null);
    setError(null);
    setPaneSelections(new Map());
    fetchArtifact(workloadId)
      .then(loaded => {
        if (!cancelled) setArtifact(loaded);
      })
      .catch((cause: unknown) => {
        if (cancelled) return;
        setError({
          missing: cause instanceof ArtifactMissingError,
          message: cause instanceof Error ? cause.message : String(cause),
        });
      });
    return () => {
      cancelled = true;
    };
  }, [workloadId]);

  // Not memoized: cheap, and every consumer (the rail, EvidencePane's registration below)
  // only ever calls it from an event handler or effect, never diffs it for stability.
  function navigateToStage(stageId: string, revealLine?: number, highlightLines?: number[]) {
    const stage = artifact?.stages.find(s => s.id === stageId);
    layoutRef.current?.addComponent(
      'stage',
      {stageId, revealLine, highlightLines} satisfies StagePaneState,
      stage?.title,
    );
  }

  function openPhaseFlow(phase: Phase) {
    layoutRef.current?.addComponent('phase', {phase} satisfies PhaseFlowPaneState, PHASE_TITLES[phase]);
  }

  // Shared by every pane type that reports its current stage for the rail's "you are here"
  // markers, keyed by the pane's own container so closing/switching one never clobbers
  // another's entry.
  function reportSelection(container: ComponentContainer, stageId: string | null) {
    setPaneSelections(prev => {
      const next = new Map(prev);
      if (stageId === null) next.delete(container);
      else next.set(container, stageId);
      return next;
    });
  }

  useEffect(() => {
    if (!artifact || !containerRef.current) return;

    const layout = new GoldenLayout(containerRef.current);
    layout.resizeWithContainerAutomatically = true;
    layoutRef.current = layout;

    registerReactPane<undefined>(layout, 'source', (_state, _container: ComponentContainer) => {
      const source = artifact.stages.find(s => s.name === 'pytorch-source') ?? artifact.stages[0];
      return (
        <SourcePane
          stage={source}
          artifact={artifact}
          onOpenLineage={sourceLine => {
            layoutRef.current?.addComponent(
              'lineage',
              {sourceLine} satisfies LineagePaneState,
              `Lineage (line ${sourceLine})`,
            );
          }}
        />
      );
    });
    registerReactPane<StagePaneState>(layout, 'stage', (state, container) => (
      <StagePane
        artifact={artifact}
        initialState={state}
        container={container}
        onSelectStage={stageId => reportSelection(container, stageId)}
      />
    ));
    registerReactPane<PhaseFlowPaneState>(layout, 'phase', (state, container) => (
      <PhaseFlowPane
        artifact={artifact}
        phase={state?.phase ?? artifact.stages[0].phase}
        container={container}
        onSelectStage={stageId => reportSelection(container, stageId)}
      />
    ));
    registerReactPane<undefined>(layout, 'evidence', () => (
      <EvidencePane artifact={artifact} onNavigateToStage={navigateToStage} />
    ));
    registerReactPane<LineagePaneState>(layout, 'lineage', (state) => (
      <LineagePane
        artifact={artifact}
        initialState={state}
        onJumpToStage={(stageId, lines) => {
          navigateToStage(stageId, lines[0], lines);
        }}
      />
    ));
    registerReactPane<undefined>(layout, 'notes', () => <NotesPane notes={artifact.notes} />);

    layout.loadLayout(defaultLayoutConfig(artifact) as Parameters<GoldenLayout['loadLayout']>[0]);

    return () => {
      layout.destroy();
      layoutRef.current = null;
    };
  }, [artifact]);

  if (error) {
    return error.missing ? <ArtifactMissing workloadId={workloadId} /> : <LoadError message={error.message} />;
  }
  if (!artifact) {
    return <Loading />;
  }

  const {target} = artifact;

  return (
    <div className="workspace">
      <header className="topbar">
        <button type="button" className="back-button" onClick={onBack}>
          ← Workloads
        </button>
        <h1>
          CompilerLens <span>· {artifact.compilation_id}</span>
        </h1>
        <div className="topbar-meta">
          {target.backend && (
            <span className="chip">
              <span className="chip-key">backend</span>
              <span className="chip-value">{target.backend}</span>
            </span>
          )}
          {target.cpu && (
            <span className="chip">
              <span className="chip-key">cpu</span>
              <span className="chip-value">{target.cpu}</span>
            </span>
          )}
          {target.native_vector_size && (
            <span className="chip">
              <span className="chip-key">vector</span>
              <span className="chip-value">{target.native_vector_size}B</span>
            </span>
          )}
          <div className="add-pane-menu" ref={addMenuRef}>
            <button
              type="button"
              className="add-pane-button"
              onClick={() => setAddMenuOpen(open => !open)}
              aria-expanded={addMenuOpen}
            >
              + Add pane
            </button>
            {addMenuOpen && (
              <div className="add-pane-dropdown" onClick={() => setAddMenuOpen(false)}>
                <button
                  type="button"
                  onClick={() =>
                    layoutRef.current?.addComponent(
                      'stage',
                      {stageId: artifact.stages[0].id} satisfies StagePaneState,
                      artifact.stages[0].title,
                    )
                  }
                >
                  Stage viewer
                </button>
                <button
                  type="button"
                  onClick={() => layoutRef.current?.addComponent('evidence', undefined, 'Evidence')}
                >
                  Evidence
                </button>
                <button
                  type="button"
                  disabled={artifact.notes.length === 0}
                  onClick={() => layoutRef.current?.addComponent('notes', undefined, 'Notes')}
                >
                  Notes ({artifact.notes.length})
                </button>
              </div>
            )}
          </div>
          <button
            type="button"
            className="lineage-explorer-button architecture-topbar-button"
            onClick={onOpenArchitecture}
          >
            Model Architecture
          </button>
          <button
            type="button"
            className="lineage-explorer-button"
            disabled={!artifact.lineage?.lines || Object.keys(artifact.lineage.lines).length === 0}
            onClick={() => setLineageExplorerOpen(true)}
            title={
              artifact.lineage?.summary?.source_lines_covered
                ? `${artifact.lineage.summary.source_lines_covered} source lines, ${artifact.lineage.summary.total_anchored_ops.toLocaleString()} operations`
                : 'No lineage data in this artifact'
            }
          >
            Operation Lineage
          </button>
        </div>
      </header>
      {/* PipelineRail and the golden-layout container stay as direct grid children (the grid
          has exactly 3 explicit row tracks -- see .workspace's CSS comment) and are hidden
          individually via style rather than merged into one wrapper, which would collapse
          them into a single "auto" row instead of the golden-layout container's required
          "1fr" row. The overlay below is `position: fixed`, which removes it from the grid's
          placement entirely, so it can't perturb this regardless of whether it's open. */}
      <div style={{display: lineageExplorerOpen ? 'none' : undefined}}>
        <PipelineRail artifact={artifact} activeStageIds={activeStageIds} onOpenPhase={openPhaseFlow} />
      </div>
      <div
        className="golden-layout-container"
        ref={containerRef}
        style={{display: lineageExplorerOpen ? 'none' : undefined}}
      />
      {lineageExplorerOpen && (
        <div className="lineage-explorer-overlay">
          <LineageExplorerPage
            artifact={artifact}
            initialSourceLine={initialLineageLine != null ? String(initialLineageLine) : undefined}
            onBack={() => setLineageExplorerOpen(false)}
          />
        </div>
      )}
    </div>
  );
}
