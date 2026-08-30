import type {Stage} from '../api/artifact';

/**
 * Per-stage summary: stat tiles plus an operation histogram.
 *
 * Form choices, per the visualization method:
 *
 * - Counts are stat tiles, not one-bar charts. The number IS the chart.
 * - The histogram is horizontal bars in a SINGLE hue. Dialects are nominal categories
 *   with no natural order, so shading each bar by its own size would double-encode
 *   length as colour and waste the only free channel. Length carries magnitude; the
 *   dialect name carries identity.
 * - Every bar is directly labelled with its value, so no value is reachable only by
 *   hovering.
 * - A stage with one group renders as a line of text: a one-bar bar chart is never right.
 */

/** Bars past this point fold into an explicit "other" row -- never silently dropped. */
const MAX_BARS = 8;

interface StageStatsProps {
  stage: Stage;
}

function formatBytes(bytes: number): {value: string; unit: string} {
  if (bytes < 1024) return {value: String(bytes), unit: 'B'};
  return {value: (bytes / 1024).toFixed(bytes < 10240 ? 1 : 0), unit: 'KB'};
}

function StatTile({label, value, unit}: {label: string; value: string; unit?: string}) {
  return (
    <div className="stat-tile">
      <div className="stat-label">{label}</div>
      <div className="stat-value">
        {value}
        {unit && <span className="stat-unit">{unit}</span>}
      </div>
    </div>
  );
}

function Histogram({stage}: {stage: Stage}) {
  const entries = Object.entries(stage.op_histogram);
  if (entries.length === 0) return null;

  // One group is a single number, not a chart.
  if (entries.length === 1) {
    const [name, count] = entries[0];
    return (
      <p className="histogram-single">
        Entirely <strong>{name}</strong> — all {count.toLocaleString()} operations.
      </p>
    );
  }

  const shown = entries.slice(0, MAX_BARS);
  const hidden = entries.slice(MAX_BARS);
  const hiddenOps = hidden.reduce((sum, [, count]) => sum + count, 0);
  const max = Math.max(...shown.map(([, count]) => count));

  return (
    <>
      <div className="histogram">
        {shown.map(([name, count]) => (
          <div className="histogram-row" key={name}>
            <span className="histogram-label" title={name}>
              {name}
            </span>
            <span className="histogram-value">{count.toLocaleString()}</span>
            <div className="histogram-track">
              <div className="histogram-bar" style={{width: `${(count / max) * 100}%`}} />
            </div>
          </div>
        ))}
      </div>
      {hidden.length > 0 && (
        <p className="histogram-other">
          + {hidden.length} more ({hiddenOps.toLocaleString()}{' '}
          {hiddenOps === 1 ? 'operation' : 'operations'})
        </p>
      )}
    </>
  );
}

export function StageStats({stage}: StageStatsProps) {
  const size = formatBytes(stage.byte_size);
  const hasOpModel = stage.op_count > 0;

  return (
    <>
      <section className="side-section">
        <div className="side-title">Stage</div>
        <div className="stat-row">
          <StatTile label="Lines" value={stage.line_count.toLocaleString()} />
          <StatTile label="Size" value={size.value} unit={size.unit} />
          {hasOpModel && <StatTile label="Operations" value={stage.op_count.toLocaleString()} />}
          {hasOpModel && (
            <StatTile label="Groups" value={String(Object.keys(stage.op_histogram).length)} />
          )}
        </div>
      </section>

      {hasOpModel && stage.histogram_label && (
        <section className="side-section">
          <div className="side-title">{stage.histogram_label}</div>
          <Histogram stage={stage} />
        </section>
      )}
    </>
  );
}
