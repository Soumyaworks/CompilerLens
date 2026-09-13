import {useState} from 'react';

import {ArchitectureExplorerPage} from './ArchitectureExplorerPage';
import {LandingPage} from './LandingPage';
import {SandboxPage} from './SandboxPage';
import {Workspace} from './Workspace';

/**
 * Four screens: the workload picker, model architecture, compiler workspace, and Playground.
 *
 * Still no router. The Playground is a separate screen rather than a pane inside the workspace
 * because it has a different data source (a running server, not a static artifact) and a
 * different failure mode -- the server may simply not be up, which needs its own empty state.
 */
type Screen =
  | {kind: 'landing'}
  | {kind: 'architecture'; workloadId: string}
  | {kind: 'workspace'; workloadId: string; sourceLine?: number}
  | {kind: 'sandbox'};

export function App() {
  const [screen, setScreen] = useState<Screen>({kind: 'landing'});

  if (screen.kind === 'sandbox') {
    return <SandboxPage onBack={() => setScreen({kind: 'landing'})} />;
  }
  if (screen.kind === 'architecture') {
    return (
      <ArchitectureExplorerPage
        workloadId={screen.workloadId}
        onBack={() => setScreen({kind: 'landing'})}
        onOpenPipeline={(sourceLine) => setScreen({kind: 'workspace', workloadId: screen.workloadId, sourceLine})}
      />
    );
  }
  if (screen.kind === 'workspace') {
    return (
      <Workspace
        workloadId={screen.workloadId}
        initialLineageLine={screen.sourceLine}
        onBack={() => setScreen({kind: 'landing'})}
        onOpenArchitecture={() => setScreen({kind: 'architecture', workloadId: screen.workloadId})}
      />
    );
  }
  return (
    <LandingPage
      onSelect={(workloadId) => setScreen({kind: 'architecture', workloadId})}
      onOpenSandbox={() => setScreen({kind: 'sandbox'})}
    />
  );
}
