import assert from 'node:assert/strict';
import {readFile} from 'node:fs/promises';
import test from 'node:test';
import {transformWithOxc} from 'vite';

// Exercise the actual TS helpers without a browser or an extra test-runner dependency.
async function loadHelper(name) {
  const source = await readFile(new URL(`../src/api/${name}.ts`, import.meta.url), 'utf8');
  const {code} = await transformWithOxc(source, `${name}.ts`);
  return import(`data:text/javascript;base64,${Buffer.from(code).toString('base64')}`);
}
const {matchRanges, focusRanges, mergeRanges, projectIR, expandGap} = await loadHelper('focusedIR');
const {stripLocations} = await loadHelper('locations');
const {buildLoweringGraph, layoutLoweringTree, TRACK_WIDTH} = await loadHelper('lineageGraph');
const lines = Array.from({length: 100}, (_, i) => `original line ${i + 1}`);

test('matches are sorted, unique, bounded and contiguous ranges are joined', () => {
  assert.deepEqual(matchRanges([90, 5, 6, 5, 0, -1, 101, NaN, 3.5, Infinity], 100),
    [{start: 5, end: 6}, {start: 90, end: 90}]);
  assert.deepEqual(mergeRanges([{start: 1, end: 10}, {start: 3, end: 4}, {start: 11, end: 14}], 12),
    [{start: 1, end: 12}]);
});

test('every scattered match survives projection with exact source/display mappings', () => {
  const projection = projectIR(lines, matchRanges([5, 6, 90], 100));
  assert.deepEqual(projection.originalLines, [null, 5, 6, null, 90, null]);
  for (const original of [5, 6, 90]) {
    assert.equal(projection.text.split('\n')[projection.displayLines.get(original) - 1], lines[original - 1]);
  }
  assert.deepEqual(projection.gaps.map(({start, end}) => [start, end]), [[1, 4], [7, 89], [91, 100]]);
});

test('expansion works from both edges and merges overlap without hiding matches', () => {
  let ranges = matchRanges([10, 70], 100);
  ranges = expandGap(ranges, {start: 11, end: 69}, 'start', 100);
  assert.deepEqual(ranges, [{start: 10, end: 30}, {start: 70, end: 70}]);
  ranges = expandGap(ranges, {start: 31, end: 69}, 'end', 100);
  assert.deepEqual(ranges, [{start: 10, end: 30}, {start: 50, end: 70}]);
  ranges = expandGap(ranges, {start: 31, end: 49}, 'all', 100);
  assert.deepEqual(ranges, [{start: 10, end: 70}]);
});

test('first/last line, all lines, no matches, empty text and short gaps', () => {
  const boundary = projectIR(lines, matchRanges([1, 100], 100));
  assert.equal(boundary.gaps.length, 1);
  assert.equal(projectIR(lines, [{start: 1, end: 100}]).text, lines.join('\n'));
  assert.equal(projectIR(lines, []).gaps.length, 1);
  assert.deepEqual(projectIR([], []).originalLines, []);
  assert.deepEqual(expandGap([{start: 4, end: 4}], {start: 1, end: 3}, 'end', 4), [{start: 1, end: 4}]);
});

test('location filtering preserves original line numbers only when requested', () => {
  const text = '#loc1 = loc("source":1:1)\n%0 = torch.aten.mm %a, %b loc("source":2:1)\nloc("source":3:1)\nreturn %0\n';
  assert.equal(stripLocations(text, true), '\n%0 = torch.aten.mm %a, %b\n\nreturn %0\n');
  assert.equal(stripLocations(text, true).split('\n').length, text.split('\n').length);
  assert.equal(stripLocations(text), '%0 = torch.aten.mm %a, %b\nreturn %0\n');
});

test('large sparse snapshots retain all matches and keep displayed text small', () => {
  const source = Array.from({length: 100000}, (_, i) => `instruction ${i + 1}`);
  const matches = [1, 50000, 99999, 100000];
  const projected = projectIR(source, matchRanges(matches, source.length), ';');
  assert.equal(projected.displayLines.size, matches.length);
  assert.equal(projected.originalLines.length, 6);
  assert.ok(projected.text.length < 300);
});

test('native annotations and short blank separators form sections, not a gap per instruction', () => {
  const source = ['unrelated', '; compilerlens.id=f0:b0:i0', 'instruction A',
    '; compilerlens.id=f0:b0:i1', 'instruction B', '', 'instruction C', 'unrelated', 'instruction D'];
  assert.deepEqual(focusRanges([3, 5, 7, 9], source), [{start: 2, end: 7}, {start: 9, end: 9}]);
  assert.deepEqual(focusRanges([1, 5], ['a', '', '', '', 'b']), [{start: 1, end: 1}, {start: 5, end: 5}]);
  assert.deepEqual(focusRanges([], source), []);
});

test('lowering map keeps tracks independent and marks unlinked checkpoints without inventing edges', () => {
  const stage = (id, track, index, kind = 'phase') => ({id, track, index, kind, language: 'llvm',
    text: 'first\nsecond\nthird', ops: []});
  const stages = [stage('b', 'kernel', 2), stage('a', 'module', 0), stage('c', 'kernel', 4),
    stage('pass', 'kernel', 3, 'pass'), stage('unrelated', 'other', 1)];
  const entry = {stages: {a: [1], b: [2, 2, 99, -1], pass: [3]},
    hops: [{stage_id: 'b', op_names: {fadd: 1}}]};
  const graph = buildLoweringGraph(stages, entry);
  assert.deepEqual(graph.lanes.map(lane => lane.track), ['module', 'kernel']);
  assert.deepEqual(graph.edges.map(edge => [edge.from.stage.id, edge.to.stage.id]), [['b', 'c']]);
  assert.deepEqual(graph.lanes[1].nodes[0].lines, [2]);
  assert.deepEqual(graph.lanes[1].nodes[0].names, [['fadd', 1]]);
  assert.deepEqual(graph.lanes[1].nodes[1].lines, []);
  assert.equal(graph.passCount, 1);
  assert.deepEqual(buildLoweringGraph(stages, entry, true).edges.map(edge =>
    [edge.from.stage.id, edge.to.stage.id]), [['b', 'pass'], ['pass', 'c']]);
});

test('graph summaries prefer exact operation records; unknown tracks never share edges', () => {
  const a = {id: 'a', index: 0, kind: 'phase', language: 'mlir', text: 'alpha\nbeta',
    ops: [{line: 2, name: 'actual.op'}]};
  const entry = {stages: {a: [2], b: [1]}, hops: [{stage_id: 'a', op_names: {stale: 99}}]};
  const graph = buildLoweringGraph([a, {...a, id: 'b', index: 1}], entry);
  assert.equal(graph.edges.length, 0);
  assert.deepEqual(graph.lanes[0].nodes[0].names, [['actual.op', 1]]);
  assert.equal(graph.lanes[0].nodes[0].preview, 'beta');
  assert.equal(buildLoweringGraph([], {stages: {}, hops: []}).nodeCount, 0);
});

test('phase tree preserves capture order and expands without losing any snapshots', () => {
  const stages = ['input', 'llvm', 'llvm', 'binary', 'llvm'].map((phase, index) => ({
    id: `s${index}`, phase, index, kind: 'phase', track: 'module', language: 'mlir', text: 'op', ops: [],
  }));
  const graph = buildLoweringGraph(stages, {stages: {s0: [1]}, hops: []});
  const compact = layoutLoweringTree(graph, new Set(['module']), new Set());
  const phases = compact.branches[0].phases;
  assert.deepEqual(phases.map(p => p.phase), ['input', 'llvm', 'binary', 'llvm']);
  assert.deepEqual(phases.flatMap(p => p.nodes.map(n => n.stage.id)), stages.map(s => s.id));
  assert.equal(phases[1].nodes.length, 2);
  assert.ok(phases.every(p => !p.open));
  const expanded = layoutLoweringTree(graph, new Set(['module']), new Set([phases[1].id]));
  assert.ok(expanded.height > compact.height);
  assert.ok(expanded.branches[0].phases[2].y > expanded.branches[0].phases[1].y + expanded.branches[0].phases[1].height);
  assert.equal(expanded.width, compact.width);
  assert.ok(layoutLoweringTree(graph, new Set(), new Set()).height < compact.height);
});

test('many-track trees wrap at three columns with no overlapping branch rectangles', () => {
  const stages = Array.from({length: 10}, (_, index) => ({id: `s${index}`, index, phase: 'llvm',
    kind: 'phase', track: `kernel${index}`, language: 'llvm', text: 'op', ops: []}));
  const graph = buildLoweringGraph(stages, {stages: Object.fromEntries(stages.map(s => [s.id, [1]])), hops: []});
  const tree = layoutLoweringTree(graph, new Set(['kernel1']), new Set());
  assert.equal(tree.width, 64 + 3 * TRACK_WIDTH + 72);
  assert.equal(tree.branches.length, 10);
  for (const [i, a] of tree.branches.entries()) for (const b of tree.branches.slice(i + 1)) {
    assert.ok(a.x + TRACK_WIDTH <= b.x || b.x + TRACK_WIDTH <= a.x || a.y + a.height <= b.y || b.y + b.height <= a.y);
  }
  assert.ok(tree.branches.every(branch => branch.y + branch.height < tree.height));
});
