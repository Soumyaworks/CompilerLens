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
