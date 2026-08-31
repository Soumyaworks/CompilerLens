import type {ComponentContainer} from 'golden-layout';
import {GoldenLayout} from 'golden-layout';
import {useEffect, useMemo, useRef, useState} from 'react';

import type {Artifact, Phase, Stage} from './api/artifact';
import {PHASE_TITLES} from './api/artifact';
import {ArtifactMissingError, fetchArtifact} from './api/client';
import {registerReactPane} from './golden-layout/react-bridge';
import {DoctorPane} from './panes/DoctorPane';
import {EvidencePane} from './panes/EvidencePane';
import {KernelCostPane} from './panes/KernelCostPane';
import {NotesPane} from './panes/NotesPane';
import type {PhaseFlowPaneState} from './panes/PhaseFlowPane';
import {PhaseFlowPane} from './panes/PhaseFlowPane';
import {SourcePane} from './panes/SourcePane';
import type {StagePaneState} from './panes/StagePane';
import {StagePane} from './panes/StagePane';
import {PipelineRail} from './PipelineRail';

/**
 * The golden-layout workspace for one workload (DESIGN-DOC's pipeline explorer, styled
 * after Compiler Explorer's own workspace): a source pane plus independently addable,
 * draggable, resizable, dockable output panes, all reading the same artifact.
 */

interface WorkspaceProps {
  workloadId: string;
  onBack: () => void;
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

export function Workspace({workloadId, onBack}: WorkspaceProps) {
  const [artifact, setArtifact] = useState<Artifact | null>(null);
  const [error, setError] = useState<{missing: boolean; message: string} | null>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const layoutRef = useRef<GoldenLayout | null>(null);
  const [addMenuOpen, setAddMenuOpen] = useState(false);
  // Which stage each currently-open stage pane is showing, keyed by its own container --
  // purely for the pipeline rail's "you are here" markers. Panes register themselves
  // (StagePane's onSelectStage) rather than this being lifted, controlled state, since
  // every stage pane otherwise stays fully independent.
  const [paneSelections, setPaneSelections] = useState<Map<ComponentContainer, string>>(
    () => new Map(),
  );
  const activeStageIds = useMemo(() => new Set(paneSelections.values()), [paneSelections]);

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
  function navigateToStage(stageId: string) {
    const stage = artifact?.stages.find(s => s.id === stageId);
    layoutRef.current?.addComponent('stage', {stageId} satisfies StagePaneState, stage?.title);
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
      return <SourcePane stage={source} />;
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
    registerReactPane<undefined>(layout, 'doctor', () => (
      <DoctorPane artifact={artifact} onNavigateToStage={navigateToStage} />
    ));
    registerReactPane<undefined>(layout, 'kernels', () => <KernelCostPane artifact={artifact} />);
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
          <div className="add-pane-menu">
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
                  disabled={!artifact.diagnosis?.findings?.length}
                  onClick={() => layoutRef.current?.addComponent('doctor', undefined, 'Doctor')}
                  title={
                    artifact.diagnosis?.summary?.headline ??
                    'No diagnosis in this artifact — rebuild with npm run artifact'
                  }
                >
                  Doctor ({artifact.diagnosis?.findings?.length ?? 0})
                </button>
                <button
                  type="button"
                  disabled={!artifact.kernels?.kernels?.length}
                  onClick={() => layoutRef.current?.addComponent('kernels', undefined, 'Kernel cost')}
                  title="Modelled arithmetic and memory cost per dispatch"
                >
                  Kernel cost ({artifact.kernels?.totals?.kernel_count ?? 0})
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
        </div>
      </header>
      <PipelineRail artifact={artifact} activeStageIds={activeStageIds} onOpenPhase={openPhaseFlow} />
      <div className="golden-layout-container" ref={containerRef} />
    </div>
  );
}
