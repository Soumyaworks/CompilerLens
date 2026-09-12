import {useState} from 'react';

import type {Artifact, LineageEntry, Operation, Stage} from '../api/artifact';
import {isTraceableAnchorOp, opShapeSignature} from '../api/artifact';

/**
 * The clickable entry point for the dedicated Lineage page (LineageExplorerPage) -- a plain
 * list of the operations present in the anchor stage, in place of clicking a highlighted line
 * in the source code.
 *
 * Excludes scalar constants, global weight declarations, embedded constant tensors, shape-list
 * construction, dialect-bridging casts, and the function signature (`isTraceableAnchorOp`,
 * shared with IRViewer's glyph filter) -- these are arguments and bookkeeping for a real
 * operation, not an operation the user wrote.
 *
 * What remains still repeats heavily on a real model: a 12-layer transformer calls the same
 * shaped `mm`/`layer_norm`/`view` once per layer. Those get clustered by (name, shape
 * signature) into one card each, so repetition reads as "this shape, N times" instead of N
 * near-identical rows -- verified on GPT-2: 564 rows collapse to 42 groups.
 */

interface LineageOperationListProps {
  artifact: Artifact;
  anchorStage: Stage;
  onSelect: (line: string) => void;
}

interface Row {
  op: Operation;
  entry: LineageEntry;
}

interface OpGroup {
  key: string;
  name: string;
  signature: string;
  rows: Row[];
}

function groupRows(rows: Row[]): OpGroup[] {
  const byKey = new Map<string, OpGroup>();
  for (const row of rows) {
    const signature = opShapeSignature(row.op.text);
    const key = `${row.op.name}|${signature}`;
    const existing = byKey.get(key);
    if (existing) {
      existing.rows.push(row);
    } else {
      byKey.set(key, {key, name: row.op.name, signature, rows: [row]});
    }
  }
  return Array.from(byKey.values()).sort((a, b) => a.rows[0].op.line - b.rows[0].op.line);
}

function OperationRow({row, onSelect}: {row: Row; onSelect: (line: string) => void}) {
  const {op, entry} = row;
  return (
    <button type="button" className="lineage-op-row" onClick={() => onSelect(String(op.line))}>
      <span className="lineage-op-row-line">L{op.line}</span>
      <span className="lineage-op-row-text">{op.text || op.name}</span>
      <span className="lineage-op-row-stats">
        {entry.total_ops.toLocaleString()} ops · {entry.stage_count} stages
      </span>
    </button>
  );
}

function OperationGroup({group, onSelect}: {group: OpGroup; onSelect: (line: string) => void}) {
  const [open, setOpen] = useState(false);

  if (group.rows.length === 1) {
    return <OperationRow row={group.rows[0]} onSelect={onSelect} />;
  }

  return (
    <div className="lineage-op-group">
      <button type="button" className="lineage-op-group-toggle" onClick={() => setOpen(o => !o)}>
        <span className="lineage-op-group-name">{group.name}</span>
        <span className="lineage-op-group-signature">{group.signature}</span>
        <span className="lineage-op-group-count">{group.rows.length} occurrences</span>
        <span className="lineage-run-caret">{open ? '▾' : '▸'}</span>
      </button>
      {open && (
        <div className="lineage-op-group-rows">
          {group.rows.map(row => (
            <OperationRow key={row.op.id} row={row} onSelect={onSelect} />
          ))}
        </div>
      )}
    </div>
  );
}

export function LineageOperationList({artifact, anchorStage, onSelect}: LineageOperationListProps) {
  const rows = anchorStage.ops
    .filter(op => isTraceableAnchorOp(op.name) && artifact.lineage?.lines[String(op.line)])
    .map(op => ({op, entry: artifact.lineage!.lines[String(op.line)]}));

  if (rows.length === 0) {
    return (
      <div className="lineage-op-list-empty">
        <p style={{color: 'var(--text-muted)'}}>No traceable operations in this artifact.</p>
      </div>
    );
  }

  const groups = groupRows(rows);

  return (
    <div className="lineage-op-list">
      <div className="lineage-op-list-header">
        <span className="lineage-op-list-title">Operations in {anchorStage.title}</span>
        <span className="lineage-op-list-count">
          {rows.length} traceable{groups.length !== rows.length ? ` · ${groups.length} groups` : ''}
        </span>
      </div>
      <ul className="lineage-op-list-rows">
        {groups.map(group => (
          <li key={group.key}>
            <OperationGroup group={group} onSelect={onSelect} />
          </li>
        ))}
      </ul>
    </div>
  );
}
