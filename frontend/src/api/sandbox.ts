/**
 * Client for the live-compile Sandbox API (backend/api/app.py).
 *
 * Distinct from api/client.ts, which fetches pre-generated static artifacts. This one talks to
 * a running server, so every call can fail in ways a static fetch cannot -- the server may not
 * be running at all. `SandboxUnavailableError` exists so the UI can say "start the server"
 * instead of showing a generic network error.
 */

/**
 * Where the Sandbox API lives.
 *
 * Derived from the page's own hostname rather than hardcoded to localhost: the frontend is
 * commonly served from a remote box, and a hardcoded 127.0.0.1 would make the *browser* look
 * for the API on the viewer's own machine instead of the one running the compiler.
 *
 * Override with VITE_SANDBOX_API when the API is somewhere else entirely.
 */
const BASE =
  import.meta.env.VITE_SANDBOX_API ??
  `${window.location.protocol}//${window.location.hostname}:8000`;

export class SandboxUnavailableError extends Error {}

export interface OptionSpec {
  flag: string;
  values: string[];
  default: string;
  label: string;
  why: string;
}

export interface Bench {
  median_ms: number;
  mean_ms: number;
  stddev_ms: number;
  cv_percent: number;
  repetitions: number;
  reliable: boolean;
  aslr_enabled: boolean;
  load_average: number;
  notes: string[];
}

// The Doctor's shapes are identical whether they came from a static artifact or from the live
// /diagnose endpoint, so they live in api/artifact.ts. Imported for use below and re-exported
// so Sandbox consumers have one place to import from.
import type {Diagnosis, Finding} from './artifact';

export type {Diagnosis, Finding};

export interface Job {
  job_id: string;
  status: 'running' | 'done' | 'failed';
  model_id: string;
  options: Record<string, string>;
  flags: string[];
  stages_available: string[];
  stage_errors: Record<string, string>;
  signals: Record<string, number>;
  compile_seconds: number | null;
  model_info: Record<string, unknown> | null;
  bench: Bench | null;
  diagnosis: Diagnosis | null;
  error: string | null;
}

async function call<T>(path: string, init?: RequestInit): Promise<T> {
  let response: Response;
  try {
    response = await fetch(`${BASE}${path}`, {
      ...init,
      headers: {'Content-Type': 'application/json', ...(init?.headers ?? {})},
    });
  } catch {
    throw new SandboxUnavailableError(
      `Cannot reach the Sandbox API at ${BASE}. Start it with: python -m backend.api.run_server`,
    );
  }
  if (!response.ok) {
    const detail = await response.text().catch(() => '');
    throw new Error(`${path} returned ${response.status}: ${detail.slice(0, 300)}`);
  }
  return (await response.json()) as T;
}

export function fetchOptions() {
  return call<{options: Record<string, OptionSpec>; stages: string[]}>('/options');
}

export function startCompile(body: {
  model_id: string;
  seq_len: number;
  stages: string[];
  options: Record<string, string>;
  want_asm: boolean;
}) {
  return call<{job_id: string; status: string}>('/compile', {method: 'POST', body: JSON.stringify(body)});
}

export function fetchJob(jobId: string) {
  return call<Job>(`/compile/${jobId}`);
}

export async function fetchStage(jobId: string, stage: string): Promise<string> {
  const response = await fetch(`${BASE}/compile/${jobId}/stage/${stage}`);
  if (!response.ok) throw new Error(`stage ${stage} unavailable (${response.status})`);
  return response.text();
}

export function benchmarkJob(jobId: string, repetitions = 5) {
  return call<Bench>(`/compile/${jobId}/benchmark`, {
    method: 'POST',
    body: JSON.stringify({repetitions}),
  });
}

export function diagnoseJob(jobId: string) {
  return call<Diagnosis>(`/compile/${jobId}/diagnose`, {method: 'POST'});
}

/** Poll until the job leaves `running`. Compiles are ~1-7s, so a short interval is fine. */
export async function waitForJob(jobId: string, onTick?: (job: Job) => void): Promise<Job> {
  for (let attempt = 0; attempt < 120; attempt += 1) {
    const job = await fetchJob(jobId);
    onTick?.(job);
    if (job.status !== 'running') return job;
    await new Promise((resolve) => setTimeout(resolve, 700));
  }
  throw new Error('compile did not finish within 84s');
}
