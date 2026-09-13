import {useEffect, useMemo, useState} from 'react';

import type {ArchitectureNode, Artifact, Phase, Stage} from './api/artifact';
import {PHASE_ORDER, PHASE_TITLES} from './api/artifact';
import {ArtifactMissingError, fetchArtifact} from './api/client';
import './styles/architecture.css';

interface Props {
  workloadId: string;
  onBack: () => void;
  onOpenPipeline: (sourceLine?: number) => void;
}

const KIND_LABELS: Record<string, string> = {
  model: 'Model', container: 'Module', block: 'Transformer block',
  embedding: 'Embedding', attention: 'Attention', normalization: 'Normalization',
  mlp: 'Feed-forward', projection: 'Projection', activation: 'Activation',
  dropout: 'Dropout', layout: 'Shape / layout', elementwise: 'Elementwise',
  head: 'Output head', other: 'Tensor operations',
};

function formatCount(value?: number | null): string {
  if (value == null) return '—';
  if (value >= 1_000_000_000) return (value / 1_000_000_000).toFixed(2) + 'B';
  if (value >= 1_000_000) return (value / 1_000_000).toFixed(value >= 100_000_000 ? 0 : 1) + 'M';
  if (value >= 1_000) return (value / 1_000).toFixed(value >= 100_000 ? 0 : 1) + 'K';
  return value.toLocaleString();
}

function mappingLabel(mapping: string): string {
  if (mapping === 'exact') return 'Mapped from export';
  if (mapping === 'derived') return 'Built from compiler IR';
  return 'Model structure';
}

function NodeGlyph({kind}: {kind: string}) {
  if (kind === 'attention') {
    return <svg viewBox="0 0 24 24"><path d="M4 7h5l3 5 3-5h5M4 17h5l3-5 3 5h5" /><circle cx="4" cy="7" r="1.5" /><circle cx="20" cy="7" r="1.5" /><circle cx="4" cy="17" r="1.5" /><circle cx="20" cy="17" r="1.5" /></svg>;
  }
  if (kind === 'embedding') {
    return <svg viewBox="0 0 24 24"><circle cx="6" cy="7" r="2" /><circle cx="12" cy="12" r="2" /><circle cx="18" cy="6" r="2" /><circle cx="18" cy="18" r="2" /><path d="m7.5 8.3 3 2.4m3-0.2 3-3m-3 6 3 3" /></svg>;
  }
  if (kind === 'normalization') {
    return <svg viewBox="0 0 24 24"><path d="M4 17 9 7l4 10 3-6 4 6M4 20h16" /></svg>;
  }
  if (kind === 'mlp' || kind === 'projection' || kind === 'head') {
    return <svg viewBox="0 0 24 24"><circle cx="5" cy="7" r="1.5" /><circle cx="5" cy="17" r="1.5" /><circle cx="12" cy="5" r="1.5" /><circle cx="12" cy="12" r="1.5" /><circle cx="12" cy="19" r="1.5" /><circle cx="19" cy="8" r="1.5" /><circle cx="19" cy="16" r="1.5" /><path d="m6.5 7 4-2m-4 2 4 5m-4 5 4-5m-4 5 4 2m3-14 4 3m-4 4 4-4m-4 4 4 4m-4 3 4-3" /></svg>;
  }
  if (kind === 'block') {
    return <svg viewBox="0 0 24 24"><rect x="4" y="4" width="16" height="16" rx="3" /><path d="M8 9h8M8 12h8M8 15h5" /></svg>;
  }
  return <svg viewBox="0 0 24 24"><rect x="5" y="5" width="14" height="14" rx="3" /><path d="M9 5v-2m6 2v-2M9 21v-2m6 2v-2M5 9H3m2 6H3m18-6h-2m2 6h-2" /></svg>;
}

interface TreeProps {
  node: ArchitectureNode;
  nodeMap: Map<string, ArchitectureNode>;
  selectedId: string;
  expanded: Set<string>;
  visible: Set<string> | null;
  onSelect: (id: string) => void;
  onToggle: (id: string) => void;
}

function TreeRow({node, nodeMap, selectedId, expanded, visible, onSelect, onToggle}: TreeProps) {
  if (visible && !visible.has(node.id)) return null;
  const children = node.children.map(id => nodeMap.get(id)).filter(Boolean) as ArchitectureNode[];
  const open = expanded.has(node.id);
  return (
    <li>
      <div
        className={'architecture-tree-row kind-' + node.kind + (selectedId === node.id ? ' is-selected' : '')}
        style={{paddingLeft: 10 + node.depth * 13}}
      >
        <button
          type="button"
          className="architecture-tree-toggle"
          disabled={children.length === 0}
          onClick={() => onToggle(node.id)}
          aria-label={(open ? 'Collapse ' : 'Expand ') + node.label}
        >
          {children.length ? (open ? '−' : '+') : '·'}
        </button>
        <button type="button" className="architecture-tree-select" onClick={() => onSelect(node.id)}>
          <span className="architecture-tree-glyph"><NodeGlyph kind={node.kind} /></span>
          <span><strong>{node.label}</strong><small>{node.type}</small></span>
          {node.source_lines.length > 0 && <i>{node.source_lines.length}</i>}
        </button>
      </div>
      {open && children.length > 0 && (
        <ul>
          {children.map(child => (
            <TreeRow
              key={child.id} node={child} nodeMap={nodeMap} selectedId={selectedId}
              expanded={expanded} visible={visible} onSelect={onSelect} onToggle={onToggle}
            />
          ))}
        </ul>
      )}
    </li>
  );
}

function ArchitectureCard({
  node, selected, onSelect, onFocus,
}: {
  node: ArchitectureNode; selected: boolean; onSelect: () => void; onFocus: () => void;
}) {
  return (
    <article
      className={'architecture-node-card kind-' + node.kind + (selected ? ' is-selected' : '')}
      onClick={onSelect}
      onDoubleClick={onFocus}
    >
      <div className="architecture-node-glow" aria-hidden="true" />
      <div className="architecture-node-head">
        <span className="architecture-node-glyph"><NodeGlyph kind={node.kind} /></span>
        <span className={'architecture-map-dot map-' + node.mapping} title={node.mapping + ' compiler mapping'} />
      </div>
      <span className="architecture-node-kind">{KIND_LABELS[node.kind] ?? node.kind}</span>
      <h3>{node.label}</h3>
      <code>{node.path}</code>
      <div className="architecture-node-metrics">
        <span><strong>{formatCount(node.parameter_count)}</strong> params</span>
        <span><strong>{node.source_lines.length}</strong> Torch ops</span>
        <span><strong>{node.compiler_stage_count}</strong> stages</span>
      </div>
      {node.children.length > 0 && (
        <button
          type="button"
          className="architecture-drill-button"
          onClick={event => { event.stopPropagation(); onFocus(); }}
        >
          Explore {node.children.length} submodule{node.children.length === 1 ? '' : 's'} →
        </button>
      )}
    </article>
  );
}

function phaseCoverage(node: ArchitectureNode, stages: Stage[]): Map<Phase, number> {
  const stageMap = new Map(stages.map(stage => [stage.id, stage]));
  const result = new Map<Phase, number>();
  for (const item of node.stage_coverage) {
    const stage = stageMap.get(item.stage_id);
    if (stage) result.set(stage.phase, (result.get(stage.phase) ?? 0) + item.operation_count);
  }
  return result;
}

function Explorer({
  artifact, onBack, onOpenPipeline,
}: {
  artifact: Artifact; onBack: () => void; onOpenPipeline: (sourceLine?: number) => void;
}) {
  const architecture = artifact.architecture!;
  const nodeMap = useMemo(() => new Map(architecture.nodes.map(node => [node.id, node])), [architecture]);
  const root = nodeMap.get(architecture.root_id) ?? architecture.nodes[0];
  const [selectedId, setSelectedId] = useState(root.id);
  const [focusId, setFocusId] = useState(root.id);
  const [query, setQuery] = useState('');
  const [expanded, setExpanded] = useState<Set<string>>(() => new Set([root.id, ...root.children]));
  const selected = nodeMap.get(selectedId) ?? root;
  const focus = nodeMap.get(focusId) ?? root;
  const focusChildren = focus.children.map(id => nodeMap.get(id)).filter(Boolean) as ArchitectureNode[];
  const canvasNodes = focusChildren.length ? focusChildren : [focus];
  const nodeIds = new Set(canvasNodes.map(node => node.id));
  const visibleRoutes = architecture.edges.filter(edge => nodeIds.has(edge.source) && nodeIds.has(edge.target));

  const visible = useMemo(() => {
    const term = query.trim().toLowerCase();
    if (!term) return null;
    const matches = new Set<string>();
    for (const node of architecture.nodes) {
      if ((node.label + ' ' + node.path + ' ' + node.type + ' ' + node.kind).toLowerCase().includes(term)) {
        let cursor: ArchitectureNode | undefined = node;
        while (cursor) {
          matches.add(cursor.id);
          cursor = cursor.parent_id ? nodeMap.get(cursor.parent_id) : undefined;
        }
      }
    }
    return matches;
  }, [architecture.nodes, nodeMap, query]);

  useEffect(() => {
    if (visible) setExpanded(previous => new Set([...previous, ...visible]));
  }, [visible]);

  const breadcrumbs: ArchitectureNode[] = [];
  let breadcrumbCursor: ArchitectureNode | undefined = focus;
  while (breadcrumbCursor) {
    breadcrumbs.unshift(breadcrumbCursor);
    breadcrumbCursor = breadcrumbCursor.parent_id ? nodeMap.get(breadcrumbCursor.parent_id) : undefined;
  }

  const coverage = phaseCoverage(selected, artifact.stages);
  const coveredStages = selected.stage_coverage
    .map(item => ({...item, stage: artifact.stages.find(stage => stage.id === item.stage_id)}))
    .filter(item => item.stage)
    .sort((a, b) => b.operation_count - a.operation_count);
  const firstTraceLine = selected.source_lines.find(line => artifact.lineage?.lines[String(line)]);
  const incomingRoutes = architecture.edges
    .filter(edge => edge.target === selected.id)
    .map(edge => nodeMap.get(edge.source))
    .filter(Boolean) as ArchitectureNode[];
  const outgoingRoutes = architecture.edges
    .filter(edge => edge.source === selected.id)
    .map(edge => nodeMap.get(edge.target))
    .filter(Boolean) as ArchitectureNode[];
  const facts = architecture.model;

  function chooseNode(id: string) {
    setSelectedId(id);
    const node = nodeMap.get(id);
    if (node?.children.length) setExpanded(previous => new Set(previous).add(id));
  }

  return (
    <main className="architecture-explorer">
      <div className="architecture-grid-bg" aria-hidden="true" />
      <div className="architecture-aurora architecture-aurora-a" aria-hidden="true" />
      <div className="architecture-aurora architecture-aurora-b" aria-hidden="true" />

      <header className="architecture-header">
        <button type="button" className="back-button" onClick={onBack}>← Workloads</button>
        <div className="architecture-brand">
          <span className="architecture-kicker">Explore the model</span>
          <h1>{facts.model_id ?? artifact.compilation_id}</h1>
        </div>
        <div className="architecture-header-facts">
          <span><small>Parameters</small><strong>{formatCount(facts.parameter_count)}</strong></span>
          {facts.layer_count != null && <span><small>Layers</small><strong>{facts.layer_count}</strong></span>}
          {facts.hidden_size != null && <span><small>Hidden</small><strong>{facts.hidden_size}</strong></span>}
          {facts.attention_heads != null && <span><small>Heads</small><strong>{facts.attention_heads}</strong></span>}
          <span className={'architecture-trust map-' + architecture.mapping_status}>
            <i /> {mappingLabel(architecture.mapping_status)}
          </span>
        </div>
        <button type="button" className="architecture-pipeline-button" onClick={() => onOpenPipeline()}>
          Open compiler pipeline <span>→</span>
        </button>
      </header>

      <section className="architecture-body">
        <aside className="architecture-sidebar">
          <div className="architecture-sidebar-head"><span>Model structure</span><strong>{architecture.nodes.length} modules</strong></div>
          <label className="architecture-search">
            <svg viewBox="0 0 24 24"><circle cx="10.5" cy="10.5" r="6" /><path d="m15 15 4 4" /></svg>
            <input value={query} onChange={event => setQuery(event.target.value)} placeholder="Search layers and modules…" />
          </label>
          <nav className="architecture-tree" aria-label="Model module hierarchy">
            <ul>
              <TreeRow
                node={root} nodeMap={nodeMap} selectedId={selected.id} expanded={expanded}
                visible={visible} onSelect={chooseNode}
                onToggle={id => setExpanded(previous => {
                  const next = new Set(previous);
                  if (next.has(id)) next.delete(id); else next.add(id);
                  return next;
                })}
              />
            </ul>
          </nav>
          <div className="architecture-provenance">
            <span className={'architecture-map-dot map-' + architecture.mapping_status} />
            <p>{architecture.mapping_note}</p>
          </div>
        </aside>

        <section className="architecture-canvas">
          <div className="architecture-canvas-head">
            <div className="architecture-breadcrumbs">
              {breadcrumbs.map((crumb, index) => (
                <span key={crumb.id}>
                  {index > 0 && <i>›</i>}
                  <button type="button" onClick={() => { setFocusId(crumb.id); chooseNode(crumb.id); }}>
                    {crumb.label}
                  </button>
                </span>
              ))}
            </div>
            <div className="architecture-canvas-hint">
              {visibleRoutes.length > 0 ? `${visibleRoutes.length} observed module route${visibleRoutes.length === 1 ? '' : 's'} · ` : ''}
              Select for details · double-click to step inside
            </div>
          </div>

          <div className="architecture-chip-floor">
            <div className="architecture-input-terminal"><span>Inputs</span><strong>Tokens and attention mask</strong><i /></div>
            <div className="architecture-flow-line" aria-hidden="true" />
            <div className={'architecture-card-flow' + (canvasNodes.length > 7 ? ' is-dense' : '')}>
              {canvasNodes.map((node, index) => (
                <div className="architecture-flow-item" key={node.id}>
                  {index > 0 && <span className="architecture-flow-connector" aria-hidden="true">›</span>}
                  <ArchitectureCard
                    node={node} selected={selected.id === node.id}
                    onSelect={() => chooseNode(node.id)}
                    onFocus={() => { setFocusId(node.id); chooseNode(node.id); }}
                  />
                </div>
              ))}
            </div>
            <div className="architecture-output-terminal"><i /><span>Output</span><strong>{facts.causal ? 'Token logits' : 'Hidden states'}</strong></div>
          </div>

          <div className="architecture-lowering">
            <div className="architecture-lowering-head">
              <div><span>How this module travels through compilation</span><strong>{selected.label}</strong></div>
              <p>{selected.compiler_operation_count.toLocaleString()} operations found across {selected.compiler_stage_count} stages</p>
            </div>
            <div className="architecture-phase-track">
              <div className="architecture-phase-wire" aria-hidden="true" />
              {PHASE_ORDER.map(phase => {
                const count = coverage.get(phase) ?? 0;
                return (
                  <button
                    type="button" key={phase}
                    className={'architecture-phase phase-' + phase + (count ? ' is-covered' : '')}
                    style={{['--phase-color' as string]: 'var(--phase-' + phase + ')'}}
                    disabled={!count} onClick={() => onOpenPipeline(firstTraceLine)}
                  >
                    <i /><span>{PHASE_TITLES[phase]}</span><strong>{count ? count.toLocaleString() : '—'}</strong>
                  </button>
                );
              })}
            </div>
          </div>
        </section>

        <aside className={'architecture-inspector kind-' + selected.kind}>
          <div className="architecture-inspector-accent" />
          <div className="architecture-inspector-title">
            <span className="architecture-node-glyph"><NodeGlyph kind={selected.kind} /></span>
            <div><span>{KIND_LABELS[selected.kind] ?? selected.kind}</span><h2>{selected.label}</h2></div>
          </div>
          <code className="architecture-path">{selected.path}</code>
          <p className="architecture-type">{selected.type}</p>

          <div className="architecture-stat-grid">
            <span><small>Parameters</small><strong>{formatCount(selected.parameter_count)}</strong></span>
            <span><small>Direct params</small><strong>{formatCount(selected.direct_parameter_count)}</strong></span>
            <span><small>Torch lines</small><strong>{selected.source_lines.length}</strong></span>
            <span><small>Compiler ops</small><strong>{selected.compiler_operation_count.toLocaleString()}</strong></span>
          </div>

          {selected.output_shapes.length > 0 && (
            <section className="architecture-inspector-section">
              <h3>Observed outputs</h3>
              <div className="architecture-shapes">{selected.output_shapes.map(shape => <code key={shape}>{shape}</code>)}</div>
            </section>
          )}

          <section className="architecture-inspector-section">
            <h3>Operations in this module</h3>
            <div className="architecture-op-list">
              {Object.entries(selected.op_names).slice(0, 8).map(([name, count]) => (
                <span key={name}><code>{name.replace('torch.aten.', '')}</code><b>×{count}</b></span>
              ))}
              {Object.keys(selected.op_names).length === 0 && <em>No direct tensor operations</em>}
            </div>
          </section>

          {(incomingRoutes.length > 0 || outgoingRoutes.length > 0) && (
            <section className="architecture-inspector-section architecture-route-list">
              <h3>Connected modules</h3>
              {incomingRoutes.slice(0, 4).map(node => (
                <button type="button" key={'in-' + node.id} onClick={() => chooseNode(node.id)}>
                  <i>IN</i><span>{node.label}</span><b>→</b>
                </button>
              ))}
              {outgoingRoutes.slice(0, 4).map(node => (
                <button type="button" key={'out-' + node.id} onClick={() => chooseNode(node.id)}>
                  <i>OUT</i><span>{node.label}</span><b>→</b>
                </button>
              ))}
            </section>
          )}

          <section className="architecture-inspector-section architecture-stage-list">
            <h3>Where it appears in the compiler</h3>
            {coveredStages.slice(0, 6).map(item => (
              <div key={item.stage_id}>
                <i style={{background: 'var(--phase-' + item.stage!.phase + ')'}} />
                <span>{item.stage!.title}</span><strong>{item.operation_count.toLocaleString()}</strong>
              </div>
            ))}
            {coveredStages.length === 0 && <em>No compiler locations survived for this module.</em>}
          </section>

          <div className="architecture-inspector-actions">
            <button type="button" className="primary" disabled={!firstTraceLine} onClick={() => onOpenPipeline(firstTraceLine)}>
              Follow through the compiler <span>→</span>
            </button>
            <button type="button" onClick={() => onOpenPipeline()}>Open full pipeline</button>
          </div>
        </aside>
      </section>
    </main>
  );
}

export function ArchitectureExplorerPage({workloadId, onBack, onOpenPipeline}: Props) {
  const [artifact, setArtifact] = useState<Artifact | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    fetchArtifact(workloadId)
      .then(value => { if (!cancelled) setArtifact(value); })
      .catch((cause: unknown) => {
        if (cancelled) return;
        setError(
          cause instanceof ArtifactMissingError
            ? 'Generate artifacts with npm run artifact, then reload.'
            : cause instanceof Error ? cause.message : String(cause),
        );
      });
    return () => { cancelled = true; };
  }, [workloadId]);

  if (error) return <div className="centered"><div className="error-box"><h2>Architecture unavailable</h2><p>{error}</p></div></div>;
  if (!artifact) return <div className="centered"><p style={{color: 'var(--text-muted)'}}>Mapping model architecture…</p></div>;
  if (!artifact.architecture?.nodes?.length) {
    return (
      <div className="centered"><div className="error-box">
        <h2>No architecture map</h2>
        <p>This artifact predates architecture capture. Regenerate it with <code>npm run artifact</code>.</p>
        <button type="button" className="back-button" onClick={() => onOpenPipeline()}>Open pipeline</button>
      </div></div>
    );
  }
  return <Explorer artifact={artifact} onBack={onBack} onOpenPipeline={onOpenPipeline} />;
}
