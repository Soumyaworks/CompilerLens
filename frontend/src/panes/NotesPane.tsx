/**
 * The artifact's own caveats (DESIGN-DOC's honesty requirement), as a dockable pane.
 *
 * Adapted from the old floating NotesPanel: a golden-layout pane already has its own
 * close/drag affordances in its tab, so the dialog-style escape/click-outside dismissal is
 * gone here -- this just fills the container.
 */

interface NotesPaneProps {
  notes: string[];
}

export function NotesPane({notes}: NotesPaneProps) {
  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">What this artifact does not capture</span>
      </div>
      <div className="pane-body pane-body-scroll">
        <p className="notes-intro">
          Recorded by the ingest layer so a gap is never mistaken for a finding.
        </p>
        <ul className="notes-list">
          {notes.map(note => (
            <li key={note}>{note}</li>
          ))}
        </ul>
      </div>
    </div>
  );
}
