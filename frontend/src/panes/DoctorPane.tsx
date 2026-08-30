import type {Artifact} from '../api/artifact';
import {FindingsList} from '../components/FindingsList';

/**
 * The Optimization Doctor as a dockable pane (DESIGN-DOC section 4.5).
 *
 * Reads `artifact.diagnosis`, which ingest bakes in at build time -- so the static site can
 * show a diagnosis with no server running. The Sandbox's live POST /diagnose returns the same
 * shape, which is why both can share FindingsList.
 *
 * Clicking a finding's location opens a stage pane on that stage, matching how EvidencePane
 * navigates: panes are independent, so "go there" means "give me a pane showing it" rather
 * than repointing someone else's pane.
 */

interface DoctorPaneProps {
  artifact: Artifact;
  onNavigateToStage: (stageId: string) => void;
}

export function DoctorPane({artifact, onNavigateToStage}: DoctorPaneProps) {
  const diagnosis = artifact.diagnosis;

  if (!diagnosis?.findings) {
    return (
      <div className="pane">
        <div className="pane-header">
          <span className="pane-header-title">Optimization Doctor</span>
        </div>
        <div className="pane-body pane-body-scroll">
          <p className="findings-empty">
            No diagnosis in this artifact. Rebuild it with <code>npm run artifact</code>.
          </p>
        </div>
      </div>
    );
  }

  const {summary, findings, rules_run: rulesRun, notes} = diagnosis;

  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">Optimization Doctor</span>
        <span className="pane-header-meta">{summary.headline}</span>
      </div>
      <div className="pane-body pane-body-scroll">
        <FindingsList
          findings={findings}
          onJumpToStage={(stageName) => {
            // Findings carry a stage *name*; panes address stages by id.
            const stage = artifact.stages.find((s) => s.name === stageName);
            if (stage) onNavigateToStage(stage.id);
          }}
        />

        <details className="doctor-rules">
          <summary>What was checked ({rulesRun?.length ?? 0} rules)</summary>
          <ul>
            {(rulesRun ?? []).map((rule) => (
              <li key={rule.id}>
                <strong>{rule.title}</strong> — {rule.looks_for}
              </li>
            ))}
          </ul>
        </details>

        {notes?.length > 0 && (
          <ul className="doctor-notes">
            {notes.map((note: string) => (
              <li key={note}>{note}</li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
