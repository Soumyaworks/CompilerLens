/** Inclusive, original (1-based) source lines. Never infer extra lineage matches. */
export interface LineRange {start: number; end: number}

export const CONTEXT_LINES = 20;

export function mergeRanges(ranges: LineRange[], lineCount: number): LineRange[] {
  const sorted = ranges
    .filter(r => Number.isInteger(r.start) && Number.isInteger(r.end))
    .map(r => ({start: Math.max(1, r.start), end: Math.min(lineCount, r.end)}))
    .filter(r => r.start <= r.end)
    .sort((a, b) => a.start - b.start);
  const result: LineRange[] = [];
  for (const range of sorted) {
    const last = result.at(-1);
    if (last && range.start <= last.end + 1) last.end = Math.max(last.end, range.end);
    else result.push({...range});
  }
  return result;
}

export function matchRanges(lines: number[], lineCount: number): LineRange[] {
  return mergeRanges(lines.map(line => ({start: line, end: line})), lineCount);
}

/** Keep native ID annotations with their instruction, and short blank separators inside
 * a section. Otherwise annotated LLVM produces a gap control between every instruction.
 * These context lines are visible but never promoted to highlighted/source-matched lines.
 */
export function focusRanges(matches: number[], textLines: string[]): LineRange[] {
  const ranges = matchRanges(matches, textLines.length).map(range => ({
    start: range.start > 1 && /^\s*; compilerlens\.id=\S+\s*$/.test(textLines[range.start - 2])
      ? range.start - 1 : range.start,
    end: range.end,
  }));
  const sections: LineRange[] = [];
  for (const range of ranges) {
    const previous = sections.at(-1);
    if (previous && range.start - previous.end <= 3 &&
        textLines.slice(previous.end, range.start - 1).every(line => !line.trim())) {
      previous.end = range.end;
    } else sections.push({...range});
  }
  return mergeRanges(sections, textLines.length);
}

export interface ProjectedGap extends LineRange {displayLine: number}

/** One editor, with explicit omission markers and a reversible display/source line map. */
export function projectIR(lines: string[], visible: LineRange[], comment = '//') {
  const text: string[] = [];
  const originalLines: Array<number | null> = [];
  const displayLines = new Map<number, number>();
  const gaps: ProjectedGap[] = [];
  let next = 1;
  function gap(start: number, end: number) {
    if (start > end) return;
    text.push(`${comment} … ${end - start + 1} lines hidden (L${start}–L${end}) …`);
    originalLines.push(null);
    gaps.push({start, end, displayLine: text.length});
  }
  for (const range of mergeRanges(visible, lines.length)) {
    gap(next, range.start - 1);
    for (let line = range.start; line <= range.end; line++) {
      text.push(lines[line - 1]);
      originalLines.push(line);
      displayLines.set(line, text.length);
    }
    next = range.end + 1;
  }
  gap(next, lines.length);
  return {text: text.join('\n'), originalLines, displayLines, gaps};
}

/** Reveal from either neighbouring section without losing any already-visible lines. */
export function expandGap(
  visible: LineRange[], gap: LineRange, edge: 'start' | 'end' | 'all', lineCount: number,
  amount = CONTEXT_LINES,
): LineRange[] {
  const range = edge === 'start' ? {start: gap.start, end: Math.min(gap.end, gap.start + amount - 1)}
    : edge === 'end' ? {start: Math.max(gap.start, gap.end - amount + 1), end: gap.end}
    : gap;
  return mergeRanges([...visible, range], lineCount);
}
