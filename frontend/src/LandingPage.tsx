import {useEffect, useState} from 'react';

import type {WorkloadIndex, WorkloadSummary} from './api/artifact';
import {ArtifactMissingError, fetchIndex} from './api/client';
import {SandboxUnavailableError, startExplore, userFacingError, waitForJob} from './api/sandbox';

/** Workload picker and compilation entry point shown before entering the explorer. */

interface LandingPageProps {
  onSelect: (workloadId: string) => void;
  onOpenSandbox?: () => void;
}

interface CompileProgress {
  label: string;
  done: number;
  total: number;
}

const PIPELINE_STAGES = [
  {label: 'PyTorch', phase: 'frontend'},
  {label: 'Torch MLIR', phase: 'input'},
  {label: 'Linalg', phase: 'global'},
  {label: 'Vector', phase: 'codegen'},
  {label: 'LLVM IR', phase: 'llvm'},
  {label: 'Binary', phase: 'binary'},
] as const;

function Loading() {
  return (
    <div className="centered">
      <p style={{color: 'var(--text-muted)'}}>Loading workloads…</p>
    </div>
  );
}

function IndexMissing() {
  return (
    <div className="centered">
      <div className="error-box">
        <h2>No artifacts yet</h2>
        <p>
          The frontend reads normalized artifacts produced by the ingest layer. Generate them
          from the vendored dumps:
        </p>
        <p><code>npm run artifact</code></p>
        <p style={{color: 'var(--text-muted)'}}>
          This writes <code>frontend/public/artifacts/*.json</code>, then reload the page.
        </p>
      </div>
    </div>
  );
}

function LoadError({message}: {message: string}) {
  return (
    <div className="centered">
      <div className="error-box">
        <h2>Could not load workloads</h2>
        <p>{message}</p>
      </div>
    </div>
  );
}

function SearchIcon() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true">
      <circle cx="10.8" cy="10.8" r="6.6" />
      <path d="m16 16 4.2 4.2" />
    </svg>
  );
}

function CompilerPipeline({searching, progress}: {searching: boolean; progress: CompileProgress | null}) {
  const progressRatio = progress && progress.total > 0 ? progress.done / progress.total : 0;
  const activeStage = searching
    ? Math.min(PIPELINE_STAGES.length - 1, Math.floor(progressRatio * PIPELINE_STAGES.length))
    : -1;

  return (
    <div className={`hero-pipeline${searching ? ' is-compiling' : ''}`} aria-label="MLIR compiler lowering pipeline">
      <div className="hero-pipeline-track" aria-hidden="true" />
      {PIPELINE_STAGES.map((stage, index) => (
        <div
          className={`hero-pipeline-stage phase-${stage.phase}${activeStage === index ? ' is-active' : ''}${activeStage > index ? ' is-complete' : ''}`}
          key={stage.label}
        >
          <span className="hero-pipeline-node" aria-hidden="true" />
          <span>{stage.label}</span>
        </div>
      ))}
    </div>
  );
}

function workloadLabels(workload: WorkloadSummary): string[] {
  const text = `${workload.title} ${workload.description}`.toLowerCase();
  let family = 'PyTorch';
  if (text.includes('roberta')) family = 'RoBERTa';
  else if (text.includes('bert')) family = 'BERT';
  else if (text.includes('pythia')) family = 'Pythia';
  else if (text.includes('gpt')) family = 'GPT-2';
  else if (text.includes('matmul')) family = 'Matmul';
  else if (text.includes('linear')) family = 'Linear';

  let shape = 'Module';
  if (text.includes('causal decoder')) shape = 'Decoder';
  else if (text.includes('bidirectional encoder')) shape = 'Encoder';
  else if (text.includes('fusion')) shape = 'Fusion';
  else if (text.includes('matmul')) shape = 'Kernel';

  return [family, shape];
}

function WorkloadCard({workload, onSelect}: {workload: WorkloadSummary; onSelect: () => void}) {
  const labels = workloadLabels(workload);
  return (
    <article
      className="workload-card"
      role="button"
      tabIndex={0}
      aria-label={`Explore ${workload.title} architecture`}
      onClick={onSelect}
      onKeyDown={(event) => {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          onSelect();
        }
      }}
    >
      <div className="workload-card-accent" aria-hidden="true">
        {PIPELINE_STAGES.map(stage => <span className={`phase-${stage.phase}`} key={stage.label} />)}
      </div>
      <div className="workload-card-head">
        <div>
          <div className="workload-card-labels">
            {labels.map(label => <span key={label}>{label}</span>)}
          </div>
          <h3>{workload.title}</h3>
        </div>
        <span className="workload-card-arrow" aria-hidden="true">↗</span>
      </div>
      <p className="workload-card-description">{workload.description}</p>
      {workload.source_preview && (
        <div className="workload-card-preview-wrap">
          <pre className="workload-card-preview">{workload.source_preview}</pre>
        </div>
      )}
      <div className="workload-card-footer">
        <div className="workload-card-stats">
          <span><strong>{workload.stage_count}</strong> stages</span>
          <span><strong>{workload.op_count.toLocaleString()}</strong> ops</span>
          <span><strong>{workload.evidence_count}</strong> insights</span>
        </div>
        <span className="workload-card-open">Explore architecture</span>
      </div>
    </article>
  );
}

export function LandingPage({onSelect, onOpenSandbox}: LandingPageProps) {
  const [index, setIndex] = useState<WorkloadIndex | null>(null);
  const [error, setError] = useState<{missing: boolean; message: string} | null>(null);
  const [modelId, setModelId] = useState('');
  const [searchStatus, setSearchStatus] = useState('');
  const [searching, setSearching] = useState(false);
  const [searchProgress, setSearchProgress] = useState<CompileProgress | null>(null);

  useEffect(() => {
    let cancelled = false;
    fetchIndex()
      .then(loaded => {
        if (!cancelled) setIndex(loaded);
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
  }, []);

  if (error) return error.missing ? <IndexMissing /> : <LoadError message={error.message} />;
  if (!index) return <Loading />;

  const knownModelIds = index.workloads
    .filter(workload => workload.source_entry.includes('/'))
    .map(workload => workload.source_entry);

  async function exploreModel() {
    const trimmed = modelId.trim();
    if (!trimmed) {
      setSearchStatus('Enter a Hugging Face model ID, for example prajjwal1/bert-tiny.');
      return;
    }
    setSearching(true);
    setSearchProgress(null);
    setSearchStatus('Preparing the full compiler pipeline… this can take a minute for a new model.');
    try {
      const {job_id} = await startExplore(trimmed);
      const result = await waitForJob(job_id, (job) => {
        if (job.progress) setSearchProgress(job.progress);
        if (job.compile_seconds) setSearchStatus(`Compiling… ${job.compile_seconds}s elapsed`);
      }, 900);
      if (result.status === 'failed' || !result.artifact_id) {
        setSearchStatus(`Compilation failed: ${userFacingError(result.error, 'No artifact was produced.')}`);
        return;
      }
      setSearchStatus('Compiled. Mapping the model architecture…');
      onSelect(result.artifact_id);
    } catch (cause) {
      const message = cause instanceof SandboxUnavailableError ? cause.message : userFacingError(cause);
      setSearchStatus(message);
    } finally {
      setSearching(false);
      setSearchProgress(null);
    }
  }

  return (
    <main className="landing">
      <section className="landing-hero">
        <div className="landing-grid" aria-hidden="true" />
        <div className="landing-glow landing-glow-left" aria-hidden="true" />
        <div className="landing-glow landing-glow-right" aria-hidden="true" />
        <header className="landing-header">
          <div className="landing-eyebrow"><span /> AI compiler explorer</div>
          <h1>Compiler<span>Lens</span></h1>
          <p className="tagline">See how AI models transform from <strong>PyTorch</strong> to <strong>LLVM</strong>.</p>
          <p className="landing-description">
            Compile a Hugging Face model and explore every intermediate representation,
            transformation, and operation in one connected view.
          </p>
        </header>

        <section className="model-search" aria-label="Compile a Hugging Face model">
          <label htmlFor="landing-model-id">Compile a Hugging Face model</label>
          <div className={`model-search-form${searching ? ' is-searching' : ''}`}>
            <span className="model-search-leading"><SearchIcon /></span>
            <input
              id="landing-model-id"
              list="known-model-ids"
              value={modelId}
              disabled={searching}
              onChange={(event) => setModelId(event.target.value)}
              onKeyDown={(event) => { if (event.key === 'Enter') void exploreModel(); }}
              placeholder="organization/model-id"
              autoComplete="off"
              spellCheck={false}
            />
            <datalist id="known-model-ids">
              {knownModelIds.map(id => <option value={id} key={id} />)}
            </datalist>
            <button type="button" disabled={searching} onClick={() => void exploreModel()}>
              {searching ? <span className="compile-spinner" aria-hidden="true" /> : <SearchIcon />}
              {searching ? 'Compiling…' : 'Compile & explore'}
            </button>
          </div>
          <div className="model-search-meta">
            <span>Try a small model:</span>
            <button type="button" disabled={searching} onClick={() => setModelId('hf-internal-testing/tiny-random-BertModel')}>
              hf-internal-testing/tiny-random-BertModel
            </button>
          </div>
          {searchStatus && (
            <p className={`model-search-status${searchStatus.toLowerCase().includes('fail') ? ' is-error' : ''}`} role="status">
              <span aria-hidden="true">{searchStatus.toLowerCase().includes('fail') ? '!' : '›'}</span>
              {searchStatus}
            </p>
          )}
          {searchProgress && (
            <div className="compile-progress" role="progressbar" aria-valuenow={searchProgress.done} aria-valuemin={0} aria-valuemax={searchProgress.total}>
              <div className="compile-progress-fill" style={{width: `${Math.min(100, (searchProgress.done / searchProgress.total) * 100)}%`}} />
              <span className="compile-progress-label">{searchProgress.label} ({searchProgress.done}/{searchProgress.total})</span>
            </div>
          )}
        </section>

        <CompilerPipeline searching={searching} progress={searchProgress} />

        {onOpenSandbox && (
          <button type="button" className="sandbox-entry" onClick={onOpenSandbox}>
            <span className="sandbox-entry-copy">
              <span className="sandbox-entry-kicker"><span aria-hidden="true" /> Live experimentation</span>
              <strong>Compiler Playground</strong>
              <span className="sandbox-entry-description">
                Take control of the pipeline. Change compiler flags, choose stages, inspect raw IR,
                and compare what each configuration produces.
              </span>
              <span className="sandbox-entry-features" aria-hidden="true">
                <span>Compiler flags</span><span>Stage selection</span><span>IR comparison</span>
              </span>
            </span>
            <span className="sandbox-entry-terminal" aria-hidden="true">
              <span className="sandbox-terminal-bar"><i /><i /><i /><em>compile.config</em></span>
              <span className="sandbox-terminal-line"><b>target</b><em>llvm-cpu</em></span>
              <span className="sandbox-terminal-line"><b>optimize</b><em>-O3</em></span>
              <span className="sandbox-terminal-line"><b>vectorize</b><em className="sandbox-toggle">on</em></span>
              <span className="sandbox-terminal-result"><i /> Ready to compile</span>
            </span>
            <span className="sandbox-entry-cta">Open playground <span aria-hidden="true">→</span></span>
          </button>
        )}
      </section>

      <section className="workload-section" aria-labelledby="workload-heading">
        <div className="workload-section-head">
          <div><span className="section-kicker">Artifact library</span><h2 id="workload-heading">Compiled workloads</h2></div>
          <p>{index.workloads.length} explorable pipeline{index.workloads.length === 1 ? '' : 's'}</p>
        </div>
        <div className="workload-grid">
          {index.workloads.map(workload => (
            <WorkloadCard key={workload.id} workload={workload} onSelect={() => onSelect(workload.id)} />
          ))}
        </div>
      </section>
      <footer className="landing-footer">
        <span>© 2026 CompilerLens</span>
        <span>
          Created by <a href="https://github.com/AnanyaV26" target="_blank" rel="noreferrer">Ananya Varshney</a>
          {' '}and{' '}
          <a href="https://github.com/Soumyaworks" target="_blank" rel="noreferrer">Soumya Banerjee</a>
        </span>
      </footer>
    </main>
  );
}
