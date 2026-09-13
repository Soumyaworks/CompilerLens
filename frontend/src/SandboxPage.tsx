import {useEffect, useMemo, useRef, useState} from 'react';
import * as monaco from 'monaco-editor';

import {
  type Job,
  type OptionSpec,
  SandboxUnavailableError,
  benchmarkJob,
  fetchOptions,
  fetchStage,
  startCompile,
  waitForJob,
} from './api/sandbox';
import {MetricBar} from './components/MetricBar';
import {THEME_NAME, monacoLanguage} from './monaco/setup';

/**
 * The Sandbox: change a compiler flag, recompile for real, see what changed.
 *
 * This is the screen that turns the project from something you read into something you use. It
 * works because a compile is fast (~1-3s measured) as long as we only ask for the stages on
 * screen -- the 41-stage dump pipeline is what takes minutes, not the compiler.
 *
 * Timing is a separate button rather than automatic: benchmarking costs seconds, and running it
 * on every flag change would make the UI feel broken.
 */

const FALLBACK_MODELS = [
  'hf-internal-testing/tiny-random-BertModel',
  'prajjwal1/bert-tiny',
  'sshleifer/tiny-gpt2',
  'distilgpt2',
];

const STAGES = ['executable-targets', 'executable-sources', 'executable-configurations', 'flow', 'vm'];

export function SandboxPage({onBack}: {onBack: () => void}) {
  const [options, setOptions] = useState<Record<string, OptionSpec> | null>(null);
  const [unavailable, setUnavailable] = useState<string | null>(null);

  const [models, setModels] = useState(FALLBACK_MODELS);
  const [modelId, setModelId] = useState(FALLBACK_MODELS[0]);
  const [seqLen, setSeqLen] = useState(16);
  const [stage, setStage] = useState(STAGES[0]);
  const [choices, setChoices] = useState<Record<string, string>>({});

  const [job, setJob] = useState<Job | null>(null);
  const [busy, setBusy] = useState(false);
  const [status, setStatus] = useState('');
  const [ir, setIr] = useState('');
  // Kept so a flag flip can be compared against the previous compile rather than forgotten.
  const [previous, setPrevious] = useState<{options: Record<string, string>; job: Job} | null>(null);

  const editorHost = useRef<HTMLDivElement | null>(null);
  const editorRef = useRef<monaco.editor.IStandaloneCodeEditor | null>(null);

  useEffect(() => {
    fetchOptions()
      .then((payload) => {
        setOptions(payload.options);
        const availableModels = payload.models?.length ? payload.models : FALLBACK_MODELS;
        setModels(availableModels);
        setModelId((current) => availableModels.includes(current) ? current : availableModels[0]);
        setChoices(
          Object.fromEntries(Object.entries(payload.options).map(([key, spec]) => [key, spec.default])),
        );
      })
      .catch((error) => setUnavailable(String(error.message ?? error)));
  }, []);

  useEffect(() => {
    if (!editorHost.current || editorRef.current) return;
    editorRef.current = monaco.editor.create(editorHost.current, {
      value: '',
      language: 'mlir',
      theme: THEME_NAME,
      readOnly: true,
      automaticLayout: true,
      minimap: {enabled: true},
      fontSize: 12,
      scrollBeyondLastLine: false,
    });
    return () => {
      editorRef.current?.dispose();
      editorRef.current = null;
    };
  }, []);

  useEffect(() => {
    const editor = editorRef.current;
    if (!editor) return;
    const model = editor.getModel();
    if (model) {
      monaco.editor.setModelLanguage(model, monacoLanguage('mlir'));
    }
    editor.setValue(ir);
  }, [ir, stage]);

  const speedup = useMemo(() => {
    if (!previous?.job.bench || !job?.bench) return null;
    return previous.job.bench.median_ms / job.bench.median_ms;
  }, [previous, job]);

  async function compile() {
    setBusy(true);
    setStatus('compiling…');
    try {
      if (job?.bench) setPrevious({options: job.options, job});
      const {job_id} = await startCompile({
        model_id: modelId,
        seq_len: seqLen,
        stages: [stage],
        options: choices,
        want_asm: true,
      });
      const finished = await waitForJob(job_id);
      setJob(finished);
      if (finished.status === 'failed') {
        setStatus(`failed: ${finished.error?.split('\n')[0] ?? 'unknown error'}`);
        setIr(finished.error ?? '');
        return;
      }
      setStatus(`compiled in ${finished.compile_seconds}s`);
      setIr(await fetchStage(job_id, stage));
    } catch (error) {
      const message = error instanceof SandboxUnavailableError ? error.message : String(error);
      setStatus(message);
    } finally {
      setBusy(false);
    }
  }

  async function measure() {
    if (!job || job.status !== 'done') return;
    setBusy(true);
    setStatus('benchmarking (5 runs)…');
    try {
      const bench = await benchmarkJob(job.job_id, 5);
      setJob({...job, bench});
      setStatus(`measured ${bench.median_ms.toFixed(3)} ms`);
    } catch (error) {
      setStatus(String(error));
    } finally {
      setBusy(false);
    }
  }

  if (unavailable) {
    return (
      <div className="sandbox-unavailable">
        <button type="button" className="back-button" onClick={onBack}>
          ← Workloads
        </button>
        <h2>Sandbox API not running</h2>
        <p>{unavailable}</p>
        <pre>{'source .venv/bin/activate\npython -m backend.api.run_server'}</pre>
        <p className="muted">
          The landing page and workspace do not need this server — they read pre-generated
          artifacts. Only the Sandbox compiles on demand.
        </p>
      </div>
    );
  }

  return (
    <div className="sandbox">
      <header className="sandbox-header">
        <button type="button" className="back-button" onClick={onBack}>
          ← Workloads
        </button>
        <h1>
          Compiler Sandbox <span className="muted">— change a flag, recompile, measure</span>
        </h1>
        <span className="sandbox-status">{busy ? '⏳ ' : ''}{status}</span>
      </header>

      <div className="sandbox-body">
        <aside className="sandbox-controls">
          <label className="control">
            <span>Model</span>
            <select value={modelId} onChange={(e) => setModelId(e.target.value)}>
              {models.map((m) => (
                <option key={m} value={m}>{m}</option>
              ))}
            </select>
            <small className="control-why">
              Defaults plus models from successful persisted compilations.
            </small>
          </label>

          <label className="control">
            <span>Sequence length</span>
            <select value={seqLen} onChange={(e) => setSeqLen(Number(e.target.value))}>
              {[8, 16, 32, 64].map((n) => (
                <option key={n} value={n}>{n}</option>
              ))}
            </select>
          </label>

          <label className="control">
            <span>Stage to view</span>
            <select value={stage} onChange={(e) => setStage(e.target.value)}>
              {STAGES.map((s) => (
                <option key={s} value={s}>{s}</option>
              ))}
            </select>
          </label>

          <h3 className="control-heading">Compiler flags</h3>
          {options &&
            Object.entries(options).map(([key, spec]) => (
              <label className="control" key={key} title={spec.why}>
                <span>{spec.label}</span>
                <select
                  value={choices[key] ?? spec.default}
                  onChange={(e) => setChoices({...choices, [key]: e.target.value})}
                >
                  {spec.values.map((value) => (
                    <option key={value} value={value}>{value}</option>
                  ))}
                </select>
                <small className="control-why">{spec.why}</small>
              </label>
            ))}

          <div className="sandbox-actions">
            <button type="button" className="primary" onClick={compile} disabled={busy}>
              Compile
            </button>
            <button type="button" onClick={measure} disabled={busy || job?.status !== 'done'}>
              Measure
            </button>
          </div>
        </aside>

        <main className="sandbox-main">
          <div className="sandbox-metrics">
            <MetricBar bench={job?.bench ?? null} label="this compile" />
            {previous && <MetricBar bench={previous.job.bench} label="previous compile" />}
            {speedup && Number.isFinite(speedup) && (
              <div className="metric metric-delta">
                <span className="metric-label">change</span>
                <span className="metric-value">
                  {speedup >= 1 ? `${speedup.toFixed(2)}×` : `${(1 / speedup).toFixed(2)}×`}
                </span>
                <span className="metric-spread">{speedup >= 1 ? 'faster' : 'slower'} than previous</span>
              </div>
            )}
          </div>

          {job?.signals && Object.keys(job.signals).length > 0 && (
            <div className="sandbox-signals">
              {Object.entries(job.signals).map(([key, value]) => (
                <span key={key} className="signal-chip">
                  {key.replace(/_/g, ' ')}: <strong>{value}</strong>
                </span>
              ))}
            </div>
          )}

          <section className="sandbox-ir">
            <h3>{stage}</h3>
            <div className="sandbox-editor" ref={editorHost} />
          </section>
        </main>
      </div>
    </div>
  );
}
