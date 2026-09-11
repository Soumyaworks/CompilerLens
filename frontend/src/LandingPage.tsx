import {useEffect, useState} from 'react';

import type {WorkloadIndex, WorkloadSummary} from './api/artifact';
import {ArtifactMissingError, fetchIndex} from './api/client';
import {SandboxUnavailableError, startExplore, userFacingError, waitForJob} from './api/sandbox';

/**
 * Workload picker shown before entering the explorer.
 *
 * A dedicated screen rather than a persistent top-bar dropdown: choosing a workload swaps
 * out the entire golden-layout workspace underneath it, so treating it as a full navigation
 * rather than an in-place control keeps that transition honest.
 */

interface LandingPageProps {
  onSelect: (workloadId: string) => void;
  onOpenSandbox?: () => void;
}

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
        <p>
          <code>npm run artifact</code>
        </p>
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

function WorkloadCard({workload, onSelect}: {workload: WorkloadSummary; onSelect: () => void}) {
  return (
    <div className="workload-card">
      <div className="workload-card-head">
        <h3>{workload.title}</h3>
        <span className="workload-card-source">{workload.source_entry}</span>
      </div>
      <p className="workload-card-description">{workload.description}</p>
      {workload.source_preview && <pre className="workload-card-preview">{workload.source_preview}</pre>}
      <div className="workload-card-stats">
        <span>{workload.stage_count} stages</span>
        <span>{workload.op_count.toLocaleString()} ops</span>
        <span>{workload.evidence_count} evidence items</span>
      </div>
      <button type="button" className="workload-card-open" onClick={onSelect}>
        Open →
      </button>
    </div>
  );
}

export function LandingPage({onSelect, onOpenSandbox}: LandingPageProps) {
  const [index, setIndex] = useState<WorkloadIndex | null>(null);
  const [error, setError] = useState<{missing: boolean; message: string} | null>(null);
  const [searchOpen, setSearchOpen] = useState(false);
  const [modelId, setModelId] = useState('');
  const [searchStatus, setSearchStatus] = useState('');
  const [searching, setSearching] = useState(false);

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

  if (error) {
    return error.missing ? <IndexMissing /> : <LoadError message={error.message} />;
  }
  if (!index) {
    return <Loading />;
  }

  async function exploreModel() {
    const trimmed = modelId.trim();
    if (!trimmed) {
      setSearchStatus('Enter a Hugging Face model id, for example prajjwal1/bert-tiny.');
      return;
    }
    setSearching(true);
    setSearchStatus('Preparing full compiler pipeline… this can take a minute for a new model.');
    try {
      const {job_id} = await startExplore(trimmed);
      const result = await waitForJob(job_id, (job) => {
        if (job.compile_seconds) setSearchStatus(`Compiling… ${job.compile_seconds}s elapsed`);
      }, 900);
      if (result.status === 'failed' || !result.artifact_id) {
        setSearchStatus(`Compilation failed: ${userFacingError(result.error, 'No artifact was produced.')}`);
        return;
      }
      setSearchStatus('Compiled. Opening the new pipeline…');
      onSelect(result.artifact_id);
    } catch (cause) {
      const message = cause instanceof SandboxUnavailableError
        ? cause.message
        : userFacingError(cause);
      setSearchStatus(message);
    } finally {
      setSearching(false);
    }
  }

  return (
    <div className="landing">
      <header className="landing-header">
        <div className="landing-title-row">
          <h1>CompilerLens</h1>
          <button type="button" className="model-search-icon" aria-label="Compile a Hugging Face model" title="Compile a Hugging Face model" onClick={() => setSearchOpen(true)}>
            <span aria-hidden="true">⌕</span>
          </button>
        </div>
        <p className="tagline">Understand what your compiler did.</p>
        {onOpenSandbox && (
          <button type="button" className="sandbox-entry" onClick={onOpenSandbox}>
            Open the Compiler Sandbox →
            <small>change a flag, recompile for real, measure the difference</small>
          </button>
        )}
      </header>
      {searchOpen && (
        <section className="model-search" aria-label="Compile Hugging Face model">
          <div className="model-search-heading">
            <div><strong>Explore a Hugging Face model</strong><small>Compile it end-to-end, then open its pipeline in CompilerLens.</small></div>
            <button type="button" className="model-search-close" aria-label="Close search" onClick={() => setSearchOpen(false)}>×</button>
          </div>
          <div className="model-search-form">
            <input autoFocus value={modelId} disabled={searching} onChange={(event) => setModelId(event.target.value)} onKeyDown={(event) => { if (event.key === 'Enter') void exploreModel(); }} placeholder="organization/model-id" aria-label="Hugging Face model id" />
            <button type="button" className="workload-card-open" disabled={searching} onClick={() => void exploreModel()}>{searching ? 'Compiling…' : 'Compile & open →'}</button>
          </div>
          <p className="model-search-hint">Try <code>hf-internal-testing/tiny-random-BertModel</code> for a small first run.</p>
          {searchStatus && <p className="model-search-status" role="status">{searchStatus}</p>}
        </section>
      )}
      <div className="workload-grid">
        {index.workloads.map(workload => (
          <WorkloadCard key={workload.id} workload={workload} onSelect={() => onSelect(workload.id)} />
        ))}
      </div>
    </div>
  );
}
