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

/** A short message intended for display in the UI. */
export class ApiRequestError extends Error {
  constructor(message: string, readonly status: number) {
    super(message);
    this.name = 'ApiRequestError';
  }
}

/** Last-resort protection for errors returned inside an otherwise successful job response. */
export function userFacingError(error: unknown, fallback = 'The operation failed.'): string {
  const raw = error instanceof Error ? error.message : String(error ?? '');
  const compact = raw.replace(/\s+/g, ' ').trim();
  if (!compact) return fallback;
  if (/unrecognized model (identifier|type)/i.test(compact)) {
    return 'This model architecture is not recognized by the installed Transformers version. Try a supported BERT-like or GPT-like model.';
  }
  return compact.length > 500 ? `${compact.slice(0, 497)}…` : compact;
}

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
  error: string | null;
  artifact_id?: string | null;
  /** Real progress through the `/explore` pipeline -- null for the Sandbox's `/compile`,
   *  which only ever does one stage and doesn't report this. */
  progress?: {label: string; done: number; total: number} | null;
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
    throw new ApiRequestError(await responseMessage(response), response.status);
  }
  return (await response.json()) as T;
}

/** Extract FastAPI's useful `detail` without exposing its JSON envelope or a huge body. */
async function responseMessage(response: Response): Promise<string> {
  const fallback = `Request failed (${response.status})`;
  let body: unknown;
  try {
    body = await response.json();
  } catch {
    return fallback;
  }

  if (!body || typeof body !== 'object' || !('detail' in body)) return fallback;
  const detail = (body as {detail?: unknown}).detail;
  let message = '';
  if (typeof detail === 'string') {
    message = detail;
  } else if (Array.isArray(detail)) {
    // FastAPI/Pydantic validation errors are arrays. Their `msg` fields are the only parts a
    // user can act on; locations, input echoes and URLs are implementation details.
    message = detail
      .map((item) => item && typeof item === 'object' && 'msg' in item ? String(item.msg) : '')
      .filter(Boolean)
      .join(' ');
  }
  return userFacingError(message, fallback);
}

export function fetchOptions() {
  return call<{options: Record<string, OptionSpec>; stages: string[]; models?: string[]}>(
    '/options',
    {cache: 'no-store'},
  );
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

/** Full pipeline compilation used by the landing-page model search. */
export function startExplore(model_id: string, seq_len = 16) {
  return call<{job_id: string; status: string}>('/explore', {
    method: 'POST',
    body: JSON.stringify({model_id, seq_len}),
  });
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

/** Poll until the job leaves `running`. Compiles are ~1-7s, so a short interval is fine. */
export async function waitForJob(jobId: string, onTick?: (job: Job) => void, maxAttempts = 120): Promise<Job> {
  for (let attempt = 0; attempt < maxAttempts; attempt += 1) {
    const job = await fetchJob(jobId);
    onTick?.(job);
    if (job.status !== 'running') return job;
    await new Promise((resolve) => setTimeout(resolve, 700));
  }
  throw new Error(`compile did not finish within ${Math.round(maxAttempts * 0.7)}s`);
}
