import {useEffect, useId, useMemo, useRef, useState} from 'react';
import type {CSSProperties} from 'react';
import type {LineageEntry, Stage} from '../api/artifact';
import {PHASE_TITLES} from '../api/artifact';
import {buildLoweringGraph, layoutLoweringTree, PHASE_HEIGHT, STAGE_HEIGHT, TRACK_WIDTH} from '../api/lineageGraph';
import {FocusedIRViewer} from './FocusedIRViewer';
import '../styles/lineage-graph.css';

interface Props {
  stages: Stage[];
  entry: LineageEntry;
  sourceLine: string;
  selectedStage: Stage;
  onSelect: (stageId: string, lines: number[]) => void;
  onBack: () => void;
}

function toggle(set: ReadonlySet<string>, key: string) {
  const next = new Set(set);
  if (next.has(key)) next.delete(key); else next.add(key);
  return next;
}

export function LineageGraph({stages, entry, sourceLine, selectedStage, onSelect, onBack}: Props) {
  const [includePasses, setIncludePasses] = useState(false);
  const graph = useMemo(() => buildLoweringGraph(stages, entry, includePasses), [stages, entry, includePasses]);
  // Many-kernel captures start with track summaries instead of hundreds of phase cards.
  const [openTracks, setOpenTracks] = useState(() => new Set(graph.lanes.length <= 3 ? graph.lanes.map(lane => lane.track) : []));
  const [openPhases, setOpenPhases] = useState<Set<string>>(() => new Set());
  const tree = useMemo(() => layoutLoweringTree(graph, openTracks, openPhases), [graph, openTracks, openPhases]);
  const [zoom, setZoom] = useState(1);
  const [inspecting, setInspecting] = useState(false);
  const viewport = useRef<HTMLDivElement>(null);
  const initialFit = useRef(false);
  const fitRequested = useRef(false);
  const drag = useRef<{x: number; y: number; left: number; top: number} | null>(null);
  const marker = `lowering-arrow-${useId().replace(/:/g, '')}`;
  const selectedNode = graph.lanes.flatMap(lane => lane.nodes).find(node => node.stage.id === selectedStage.id);

  // Fit initially, but do not shrink all cards every time a phase is expanded.
  useEffect(() => {
    const el = viewport.current;
    if (!el) return;
    if (!initialFit.current || fitRequested.current) {
      setZoom(Math.max(0.05, Math.min(1, (el.clientWidth - 24) / tree.width, (el.clientHeight - 24) / tree.height)));
      el.scrollTo(0, 0);
      initialFit.current = true;
      fitRequested.current = false;
    }
  }, [tree]);

  useEffect(() => {
    const el = viewport.current;
    if (!el || !inspecting) return;
    const branch = tree.branches.find(branch => branch.phases.some(phase => phase.nodes.some(node => node.stage.id === selectedStage.id)));
    const phase = branch?.phases.find(phase => phase.nodes.some(node => node.stage.id === selectedStage.id));
    if (!branch || !phase) return;
    const index = phase.nodes.findIndex(node => node.stage.id === selectedStage.id);
    const y = !branch.open ? branch.y : !phase.open ? phase.y : phase.y + PHASE_HEIGHT + index * STAGE_HEIGHT;
    const height = branch.open && phase.open ? STAGE_HEIGHT : PHASE_HEIGHT;
    const reveal = () => {
      const left = branch.x * zoom, top = y * zoom;
      if (left < el.scrollLeft || left + TRACK_WIDTH * zoom > el.scrollLeft + el.clientWidth)
        el.scrollLeft = Math.max(0, left - (el.clientWidth - TRACK_WIDTH * zoom) / 2);
      if (top < el.scrollTop || top + height * zoom > el.scrollTop + el.clientHeight)
        el.scrollTop = Math.max(0, top - (el.clientHeight - height * zoom) / 2);
    };
    const observer = new ResizeObserver(reveal);
    observer.observe(el);
    reveal();
    return () => observer.disconnect();
  }, [tree, selectedStage.id, zoom, inspecting]);

  function changeZoom(next: number) {
    const el = viewport.current;
    const value = Math.max(0.05, Math.min(2, next));
    if (el) {
      const x = (el.scrollLeft + el.clientWidth / 2) / zoom;
      const y = (el.scrollTop + el.clientHeight / 2) / zoom;
      setZoom(value);
      requestAnimationFrame(() => {
        el.scrollLeft = x * value - el.clientWidth / 2;
        el.scrollTop = y * value - el.clientHeight / 2;
      });
    } else setZoom(value);
  }
  function fit() {
    const el = viewport.current;
    if (!el) return;
    setZoom(Math.max(0.05, Math.min(1, (el.clientWidth - 24) / tree.width, (el.clientHeight - 24) / tree.height)));
    el.scrollTo(0, 0);
  }
  function collapse() {
    setOpenPhases(new Set());
    setInspecting(false);
    fitRequested.current = true;
  }

  return (
    <div className={`lowering-view${inspecting ? ' is-inspecting' : ''}`}>
      <section className="lowering-map" aria-label="Lowering stage tree">
        <div className="lowering-heading">
          <div><div className="lowering-eyebrow">EXPLORE THE LOWERING</div>
            <h2>One operation. A tree of compiler views.</h2>
            <p>Source line {sourceLine} · {graph.nodeCount} snapshots grouped into {graph.lanes.length} tracks</p></div>
          <button type="button" onClick={onBack}>← All operations</button>
        </div>
        <div className="lowering-controls">
          <div className="lowering-zoom" role="group" aria-label="Graph zoom">
            <button type="button" aria-label="Zoom out" onClick={() => changeZoom(zoom / 1.2)}>−</button>
            <button type="button" aria-label="Reset zoom" onClick={() => changeZoom(1)}>{Math.round(zoom * 100)}%</button>
            <button type="button" aria-label="Zoom in" onClick={() => changeZoom(zoom * 1.2)}>+</button>
            <button type="button" onClick={fit}>Fit graph</button>
          </div>
          <button type="button" onClick={collapse}>Collapse phases</button>
          <label><input type="checkbox" checked={includePasses} disabled={!graph.passCount}
            onChange={event => {setIncludePasses(event.target.checked); setInspecting(false);}} />
            Pass snapshots ({graph.passCount})</label>
          <span>Expand a phase · Select a snapshot · Drag to pan</span>
        </div>
        <div className="lowering-viewport" ref={viewport} tabIndex={0} aria-label="Scrollable stage graph"
          onPointerDown={event => {
            if (event.button !== 0 || (event.target as HTMLElement).closest('button')) return;
            const el = event.currentTarget;
            drag.current = {x: event.clientX, y: event.clientY, left: el.scrollLeft, top: el.scrollTop};
            el.setPointerCapture(event.pointerId);
          }}
          onPointerMove={event => {
            if (!drag.current) return;
            event.currentTarget.scrollLeft = drag.current.left - event.clientX + drag.current.x;
            event.currentTarget.scrollTop = drag.current.top - event.clientY + drag.current.y;
          }}
          onPointerUp={() => {drag.current = null;}}
          onPointerCancel={() => {drag.current = null;}}
          onLostPointerCapture={() => {drag.current = null;}}>
          {!graph.nodeCount && <p className="lowering-empty">No captured checkpoints are available for this source operation.</p>}
          <div className="lowering-size" style={{width: tree.width * zoom, height: tree.height * zoom}}>
            <div className="lowering-canvas" style={{width: tree.width, height: tree.height, transform: `scale(${zoom})`}}>
              <svg className="lowering-edges" width={tree.width} height={tree.height} aria-hidden="true">
                <defs><marker id={marker} viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
                  <path d="M 0 0 L 10 5 L 0 10 z" fill="currentColor" /></marker></defs>
                {tree.branches.map(branch => (
                  <path key={branch.track} className="association-edge"
                    d={branch.y === 156
                      ? `M ${tree.width / 2} 104 V 134 H ${branch.x + TRACK_WIDTH / 2} V ${branch.y}`
                      : `M ${tree.width / 2} 104 V 120 H 12 V ${branch.y - 22} H ${branch.x + TRACK_WIDTH / 2} V ${branch.y}`} />
                ))}
                {tree.branches.filter(branch => branch.open).flatMap(branch => branch.phases.map((phase, index) => {
                  const previous = branch.phases[index - 1];
                  return <path key={phase.id} className={index ? 'checkpoint-edge' : 'association-edge'}
                    markerEnd={index ? `url(#${marker})` : undefined}
                    d={`M ${branch.x + TRACK_WIDTH / 2} ${previous ? previous.y + previous.height : branch.y + 64} V ${phase.y - 3}`} />;
                }))}
              </svg>
              <div className="lowering-root" style={{left: tree.rootX, top: 20, width: TRACK_WIDTH}}>
                <span>SELECTED SOURCE OPERATION</span><strong>Source line {sourceLine}</strong>
                <code title={entry.source_text}>{entry.source_text || 'Compiler-recorded source associations'}</code>
              </div>
              {tree.branches.map(branch => (
                <section className="lowering-branch" key={branch.track} aria-label={`Track ${branch.track}`}>
                  <button type="button" className="lowering-track" aria-expanded={branch.open}
                    style={{left: branch.x, top: branch.y, width: TRACK_WIDTH}}
                    onClick={() => setOpenTracks(current => toggle(current, branch.track))}>
                    <strong title={branch.track}>{branch.open ? '▾' : '▸'} {branch.track}</strong>
                    <span>{branch.phases.length} phase groups · {branch.phases.reduce((sum, phase) => sum + phase.nodes.length, 0)} snapshots</span>
                  </button>
                  {branch.open && branch.phases.map(phase => (
                    <div className="lowering-phase" key={phase.id} data-phase={phase.phase}
                      style={{left: phase.x, top: phase.y, width: TRACK_WIDTH, height: phase.height,
                        '--node-accent': `var(--phase-${phase.phase})`} as CSSProperties}>
                      <button type="button" className="lowering-phase-toggle" aria-expanded={phase.open}
                        aria-label={`${PHASE_TITLES[phase.phase]}: ${phase.nodes.length} snapshots`}
                        onClick={() => setOpenPhases(current => toggle(current, phase.id))}>
                        <strong><i />{PHASE_TITLES[phase.phase]}<span>{phase.open ? '−' : '+'}</span></strong>
                        <small>{phase.nodes.length} snapshots · {phase.nodes.filter(node => node.lines.length).length} with source links</small>
                        <code>{[...new Set(phase.nodes.flatMap(node => node.names.map(([name]) => name)))].slice(0, 3).join(' · ') || 'No operation summary available'}</code>
                      </button>
                      {phase.open && <div className="lowering-phase-stages">
                        {phase.nodes.map(node => (
                          <button type="button" key={node.stage.id} data-stage-id={node.stage.id}
                            className={`lowering-node${node.stage.id === selectedStage.id ? ' is-selected' : ''}${!node.lines.length ? ' is-unlinked' : ''}`}
                            aria-pressed={node.stage.id === selectedStage.id}
                            aria-label={`${node.stage.title}: ${node.lines.length} linked lines. Inspect IR`}
                            onClick={() => {onSelect(node.stage.id, node.lines); setInspecting(true);}}>
                            <strong title={node.stage.title}>{node.stage.title}<span>↗</span></strong>
                            <small>{node.lines.length ? `${node.lines.length.toLocaleString()} linked lines` : 'No source links in capture'} · {node.stage.kind === 'pass' ? 'PASS' : node.stage.language.toUpperCase()}</small>
                            <code>{node.preview || 'Missing links do not establish elimination.'}</code>
                          </button>
                        ))}
                      </div>}
                    </div>
                  ))}
                </section>
              ))}
            </div>
          </div>
        </div>
        <div className="lowering-legend"><span>Dashed branches: source → associated compiler views</span>
          <span>↓ Phase groups in captured order within a track</span>
          <strong>Not tensor dependencies or proof of fusion/elimination.</strong></div>
      </section>
      {inspecting && <aside className="lowering-inspector" aria-label="Selected stage IR">
        <header><div><span>INSPECT CHECKPOINT</span><h3>{selectedStage.title}</h3>
          <p>{selectedNode?.stage.track || 'Unclassified track'} · Source line {sourceLine}</p></div>
          <button type="button" aria-label="Close IR inspector" onClick={() => setInspecting(false)}>×</button></header>
        {selectedStage.gap_note && <p className="lowering-gap-note">{selectedStage.gap_note}</p>}
        <div className="lowering-inspector-editor"><FocusedIRViewer key={`${selectedStage.id}:${sourceLine}`}
          stage={selectedStage} highlightLines={selectedNode?.lines ?? []} /></div>
      </aside>}
    </div>
  );
}
