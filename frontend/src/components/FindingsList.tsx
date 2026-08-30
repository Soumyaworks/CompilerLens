import type {Finding} from '../api/artifact';

/**
 * The Doctor's findings.
 *
 * Two things this component must never do: make a heuristic finding look measured, and show a
 * cost we did not measure. `confidence` is rendered as a visible chip, and a null
 * `measured_cost_ms` reads "unmeasured" rather than being hidden or shown as zero -- the
 * absence of a number is itself information.
 */

const SEVERITY_LABEL: Record<string, string> = {
  missed: 'MISSED',
  suboptimal: 'SUBOPTIMAL',
  info: 'INFO',
};

export function FindingsList({
  findings,
  onJumpToStage,
}: {
  findings: Finding[];
  onJumpToStage?: (stage: string, line: number | null) => void;
}) {
  if (!findings.length) {
    return <p className="findings-empty">No issues detected by the current rules.</p>;
  }

  return (
    <ul className="findings-list">
      {findings.map((finding, index) => (
        <li key={`${finding.rule_id}-${index}`} className={`finding finding-${finding.severity}`}>
          <div className="finding-head">
            <span className={`finding-severity sev-${finding.severity}`}>
              {SEVERITY_LABEL[finding.severity] ?? finding.severity}
            </span>
            <span className={`finding-confidence conf-${finding.confidence}`}>{finding.confidence}</span>
            <h4 className="finding-title">{finding.title}</h4>
          </div>

          <p className="finding-detail">{finding.detail}</p>

          <div className="finding-meta">
            <span className="finding-cost">
              {finding.measured_cost_ms === null
                ? 'cost: unmeasured'
                : `cost: ${finding.measured_cost_ms.toFixed(3)} ms`}
            </span>
            {finding.stage_name && (
              <button
                type="button"
                className="finding-jump"
                onClick={() => onJumpToStage?.(finding.stage_name, finding.line)}
              >
                {finding.stage_name}
                {finding.line ? `:${finding.line}` : ''}
              </button>
            )}
          </div>

          {finding.evidence.length > 0 && (
            <pre className="finding-evidence">{finding.evidence.join('\n')}</pre>
          )}

          {finding.suggestion && (
            <p className="finding-suggestion">
              <strong>Try:</strong> {finding.suggestion}
            </p>
          )}
        </li>
      ))}
    </ul>
  );
}
