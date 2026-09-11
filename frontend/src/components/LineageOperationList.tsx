import type {Artifact, Stage} from '../api/artifact';

/**
 * The clickable entry point for the dedicated Lineage page (LineageExplorerPage) -- a plain
 * list of the operations present in the anchor stage, in place of clicking a highlighted line
 * in the source code.
 *
 * Excludes `func.func` for the same reason IRViewer's glyph decorations do: its "lineage" is
 * really just every ABI/runtime operation that had no more specific loc() of its own, which
 * is noise, not an operation the user wrote.
 */

interface LineageOperationListProps {
  artifact: Artifact;
  anchorStage: Stage;
  onSelect: (line: string) => void;
}

export function LineageOperationList({artifact, anchorStage, onSelect}: LineageOperationListProps) {
  const rows = anchorStage.ops
    .filter(op => op.name !== 'func.func' && artifact.lineage?.lines[String(op.line)])
    .map(op => ({op, entry: artifact.lineage!.lines[String(op.line)]}));

  if (rows.length === 0) {
    return (
      <div className="lineage-op-list-empty">
        <p style={{color: 'var(--text-muted)'}}>No traceable operations in this artifact.</p>
      </div>
    );
  }

  return (
    <div className="lineage-op-list">
      <div className="lineage-op-list-header">
        <span className="lineage-op-list-title">Operations in {anchorStage.title}</span>
        <span className="lineage-op-list-count">{rows.length} traceable</span>
      </div>
      <ul className="lineage-op-list-rows">
        {rows.map(({op, entry}) => (
          <li key={op.id}>
            <button type="button" className="lineage-op-row" onClick={() => onSelect(String(op.line))}>
              <span className="lineage-op-row-line">L{op.line}</span>
              <span className="lineage-op-row-text">{op.text || op.name}</span>
              <span className="lineage-op-row-stats">
                {entry.total_ops.toLocaleString()} ops · {entry.stage_count} stages
              </span>
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}
