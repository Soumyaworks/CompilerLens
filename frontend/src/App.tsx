import {useState} from 'react';

import {LandingPage} from './LandingPage';
import {SandboxPage} from './SandboxPage';
import {Workspace} from './Workspace';

/**
 * Three screens: the workload picker, the static workspace, and the live Compiler Playground.
 *
 * Still no router. The Playground is a separate screen rather than a pane inside the workspace
 * because it has a different data source (a running server, not a static artifact) and a
 * different failure mode -- the server may simply not be up, which needs its own empty state.
 */
type Screen = {kind: 'landing'} | {kind: 'workspace'; workloadId: string} | {kind: 'sandbox'};

export function App() {
  const [screen, setScreen] = useState<Screen>({kind: 'landing'});

  if (screen.kind === 'sandbox') {
    return <SandboxPage onBack={() => setScreen({kind: 'landing'})} />;
  }
  if (screen.kind === 'workspace') {
    return <Workspace workloadId={screen.workloadId} onBack={() => setScreen({kind: 'landing'})} />;
  }
  return (
    <LandingPage
      onSelect={(workloadId) => setScreen({kind: 'workspace', workloadId})}
      onOpenSandbox={() => setScreen({kind: 'sandbox'})}
    />
  );
}
