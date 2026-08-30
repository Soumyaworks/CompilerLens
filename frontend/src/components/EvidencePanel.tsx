import type {Evidence, EvidenceStatus, Stage} from '../api/artifact';

/**
 * Compiler evidence (DESIGN-DOC section 8).
 *
 * Every item is a fact the compiler stated about itself, and every item names the stage it
 * was read from and links there. This panel is the foundation the Optimization Doctor
 * (Stage 3) and the AI explanation layer (Stage 4) are built on: an explanation that
 * cannot point at its source is exactly what this project exists to replace.
 *
 * Status is carried by an icon AND a colour, never colour alone.
 */

const STATUS_ICON: Record<EvidenceStatus, string> = {
  success: '●',
  missed: '▲',
  info: '○',
};

const STATUS_TEXT: Record<EvidenceStatus, string> = {
  success: 'confirmed',
  missed: 'missed optimization',
  info: 'informational',
};

interface EvidencePanelProps {
  evidence: Evidence[];
  stages: Stage[];
  onNavigate: (stageId: string) => void;
}

export function EvidencePanel({evidence, stages, onNavigate}: EvidencePanelProps) {
  if (evidence.length === 0) return null;

  const stageTitle = (id: string) => stages.find(s => s.id === id)?.title ?? id;

  return (
    <section className="side-section">
      <div className="side-title">Compiler evidence</div>
      {evidence.map(item => (
        <div className="evidence-item" key={item.id}>
          <div className="evidence-head">
            <span
              className="evidence-icon"
              data-status={item.status}
              title={STATUS_TEXT[item.status]}
              aria-label={STATUS_TEXT[item.status]}
            >
              {STATUS_ICON[item.status]}
            </span>
            <span className="evidence-label">{item.label}</span>
          </div>
          <div className="evidence-value">{item.value}</div>
          <div className="evidence-source">
            from{' '}
            <button type="button" onClick={() => onNavigate(item.source_stage)}>
              {stageTitle(item.source_stage)}
            </button>
            {item.source_detail && ` · ${item.source_detail}`}
          </div>
        </div>
      ))}
    </section>
  );
}
