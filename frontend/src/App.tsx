import {useState} from 'react';

import {LandingPage} from './LandingPage';
import {Workspace} from './Workspace';

/**
 * Thin switch between the landing page and the workspace (DESIGN-DOC's entry point,
 * extended to multiple workloads). No router: there are exactly two screens.
 */
export function App() {
  const [workloadId, setWorkloadId] = useState<string | null>(null);

  if (!workloadId) {
    return <LandingPage onSelect={setWorkloadId} />;
  }
  return <Workspace workloadId={workloadId} onBack={() => setWorkloadId(null)} />;
}
