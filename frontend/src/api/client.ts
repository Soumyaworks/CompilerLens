import type {Artifact, WorkloadIndex} from './artifact';

/**
 * Artifact loading.
 *
 * Stage 1 fetches static `artifacts/<id>.json` files produced by `npm run artifact`. When
 * Stage 5 adds live compilation, only this module changes: the backend will return the
 * identical shape from POST /compile, so nothing downstream of here needs to know the
 * difference.
 */

const INDEX_URL = '/artifacts/index.json';

export class ArtifactMissingError extends Error {}

export async function fetchIndex(): Promise<WorkloadIndex> {
  let response: Response;
  try {
    response = await fetch(INDEX_URL);
  } catch (cause) {
    throw new Error(`Could not reach ${INDEX_URL}: ${String(cause)}`);
  }

  if (response.status === 404) {
    throw new ArtifactMissingError('artifacts/index.json has not been generated yet');
  }
  if (!response.ok) {
    throw new Error(`${INDEX_URL} returned ${response.status} ${response.statusText}`);
  }

  const index = (await response.json()) as WorkloadIndex;
  if (!index.workloads?.length) {
    throw new Error('artifacts/index.json lists no workloads');
  }
  return index;
}

export async function fetchArtifact(workloadId: string): Promise<Artifact> {
  const url = `/artifacts/${workloadId}.json`;
  let response: Response;
  try {
    response = await fetch(url);
  } catch (cause) {
    throw new Error(`Could not reach ${url}: ${String(cause)}`);
  }

  if (response.status === 404) {
    throw new ArtifactMissingError(`${url} has not been generated yet`);
  }
  if (!response.ok) {
    throw new Error(`${url} returned ${response.status} ${response.statusText}`);
  }

  const artifact = (await response.json()) as Artifact;
  if (!artifact.stages?.length) {
    throw new Error(`${url} contains no stages`);
  }
  return artifact;
}
