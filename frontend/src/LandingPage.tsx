import {useEffect, useState} from 'react';

import type {WorkloadIndex, WorkloadSummary} from './api/artifact';
import {ArtifactMissingError, fetchIndex} from './api/client';

/**
 * Workload picker, shown before entering the explorer (DESIGN-DOC's "pick what you're
 * looking at" entry point, extended to multiple workloads).
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

  return (
    <div className="landing">
      <header className="landing-header">
        <h1>CompilerLens</h1>
        <p className="tagline">Understand what your compiler did.</p>
        {onOpenSandbox && (
          <button type="button" className="sandbox-entry" onClick={onOpenSandbox}>
            Open the Compiler Sandbox →
            <small>change a flag, recompile for real, measure the difference</small>
          </button>
        )}
      </header>
      <div className="workload-grid">
        {index.workloads.map(workload => (
          <WorkloadCard key={workload.id} workload={workload} onSelect={() => onSelect(workload.id)} />
        ))}
      </div>
    </div>
  );
}
