import type {Artifact} from '../api/artifact';

/**
 * Modelled per-kernel cost, ranked (DESIGN-DOC section 4.5's performance angle).
 *
 * The header says "modelled" and means it. FLOPs and bytes are derived from the shapes IREE
 * writes into its own kernel names, not from timing each kernel -- see
 * backend/measure/kernels.py for why per-kernel timing could not be obtained honestly
 * (workgroup counts are computed at runtime, and guessed values returned 0.0000 ns for 11 of
 * 12 kernels rather than erroring). Presenting a model as a measurement is the one thing this
 * project cannot afford to do.
 */

export function KernelCostPane({artifact}: {artifact: Artifact}) {
  const kernels = artifact.kernels;

  if (!kernels?.kernels?.length) {
    return (
      <div className="pane">
        <div className="pane-header">
          <span className="pane-header-title">Kernel cost</span>
        </div>
        <div className="pane-body pane-body-scroll">
          <p className="findings-empty">
            No kernel cost model in this artifact. Rebuild with <code>npm run artifact</code>.
          </p>
        </div>
      </div>
    );
  }

  const {totals, machine, notes} = kernels;
  const maxFlops = Math.max(...kernels.kernels.map(k => k.flops ?? 0), 1);

  return (
    <div className="pane">
      <div className="pane-header">
        <span className="pane-header-title">Kernel cost</span>
        <span className="pane-header-meta">modelled, not measured</span>
      </div>
      <div className="pane-body pane-body-scroll">
        <div className="kernel-totals">
          <span>
            <strong>{totals.kernel_count}</strong> kernels
          </span>
          <span>
            <strong>{(totals.total_flops / 1e6).toFixed(2)}</strong> MFLOP
          </span>
          <span>
            <strong>{(totals.total_bytes / 1e6).toFixed(1)}</strong> MB moved
          </span>
          <span title="FLOPs per byte of memory traffic. Below ~10 the workload is bandwidth-limited.">
            AI <strong>{totals.arithmetic_intensity}</strong>
          </span>
          <span>
            <strong>{totals.memory_bound_kernels}</strong> memory-bound
          </span>
        </div>

        {machine && (
          <p className="kernel-machine" title={machine.note}>
            machine peak ≈ <strong>{machine.peak_gflops} GFLOP/s</strong> ({machine.cores} cores ×{' '}
            {machine.mhz.toFixed(0)} MHz × {machine.vector_lanes} lanes × 2)
          </p>
        )}

        <table className="kernel-table">
          <thead>
            <tr>
              <th>kernel</th>
              <th>kind</th>
              <th className="num">MFLOP</th>
              <th className="num">share</th>
              <th className="num">AI</th>
              <th>bound by</th>
            </tr>
          </thead>
          <tbody>
            {kernels.kernels.map(kernel => (
              <tr key={kernel.name} className={`kernel-row bound-${kernel.bound_by}`}>
                <td className="kernel-name" title={kernel.note || kernel.name}>
                  {/* Bar length is share of modelled arithmetic, so the dominant kernels are
                      obvious without reading the numbers. */}
                  <span
                    className="kernel-bar"
                    style={{width: `${((kernel.flops ?? 0) / maxFlops) * 100}%`}}
                  />
                  <span className="kernel-label">{kernel.short_name}</span>
                </td>
                <td>{kernel.kind}</td>
                <td className="num">{kernel.flops ? (kernel.flops / 1e6).toFixed(2) : '—'}</td>
                <td className="num">
                  {kernel.flops_share !== null ? `${(kernel.flops_share * 100).toFixed(1)}%` : '—'}
                </td>
                <td className="num">
                  {kernel.arithmetic_intensity !== null ? kernel.arithmetic_intensity : '—'}
                </td>
                <td>
                  <span className={`bound-chip bound-chip-${kernel.bound_by}`}>{kernel.bound_by}</span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

        <ul className="doctor-notes">
          {(notes ?? []).map(note => (
            <li key={note}>{note}</li>
          ))}
        </ul>
      </div>
    </div>
  );
}
