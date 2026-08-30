import type {Bench} from '../api/sandbox';

/**
 * A measured timing, with its uncertainty visible.
 *
 * An unreliable measurement is shown, not suppressed -- but it is visually marked and labelled,
 * so it cannot be mistaken for a result. Hiding it would leave the user wondering why the
 * number vanished; presenting it plainly would be a lie.
 */
export function MetricBar({bench, label}: {bench: Bench | null; label: string}) {
  if (!bench) {
    return (
      <div className="metric metric-empty">
        <span className="metric-label">{label}</span>
        <span className="metric-value">not measured</span>
      </div>
    );
  }

  return (
    <div className={`metric ${bench.reliable ? '' : 'metric-unreliable'}`}>
      <span className="metric-label">{label}</span>
      <span className="metric-value">
        {bench.median_ms.toFixed(3)} <span className="metric-unit">ms</span>
      </span>
      <span className="metric-spread">
        ±{bench.stddev_ms.toFixed(3)} · cv {bench.cv_percent.toFixed(1)}% · n={bench.repetitions}
      </span>
      {!bench.reliable && (
        <span className="metric-warning">
          high variance — treat as indicative, not a result
        </span>
      )}
    </div>
  );
}
