/**
 * Strip MLIR `loc(...)` metadata for display.
 *
 * The regenerated dumps annotate nearly every operation with a location. That metadata is
 * what makes lineage possible, but it also makes the IR much harder to read -- and a fused
 * DWARF location can be twelve thousand characters on a single line. So the viewer offers a
 * toggle, defaulting to hidden.
 *
 * This mirrors `ingest/mlir_loc.py`. It runs on the client rather than shipping a second
 * copy of every stage's text in the artifact, which saved about 800 KB and keeps `text` the
 * single source of truth.
 */

/** `#loc2 = loc(...)` alias definition lines, which are dropped wholesale. */
const ALIAS_DEF = /^#loc[\w]*\s*=\s*loc\(.*\)\s*$/;

/**
 * Index just past the ')' matching the '(' at `start`.
 *
 * Quote-aware, because fused DWARF locations embed parentheses inside string attributes
 * where a plain depth counter would stop early. Returns -1 when unbalanced.
 */
function findBalanced(text: string, start: number): number {
  let depth = 0;
  let inString = false;
  for (let i = start; i < text.length; i++) {
    const char = text[i];
    if (inString) {
      if (char === '\\') {
        i++;
      } else if (char === '"') {
        inString = false;
      }
      continue;
    }
    if (char === '"') inString = true;
    else if (char === '(') depth++;
    else if (char === ')') {
      depth--;
      if (depth === 0) return i + 1;
    }
  }
  return -1;
}

/** Spans of each outermost `loc(...)` in a line. */
function locSpans(line: string): Array<[number, number]> {
  const spans: Array<[number, number]> = [];
  let from = 0;
  for (;;) {
    const found = line.indexOf('loc(', from);
    if (found === -1) return spans;
    // Must be a standalone token, not the tail of an identifier such as `myloc(`.
    const before = found > 0 ? line[found - 1] : '';
    if (before && (/[a-zA-Z0-9]/.test(before) || '_.$'.includes(before))) {
      from = found + 4;
      continue;
    }
    const end = findBalanced(line, found + 3);
    if (end === -1) return spans;
    spans.push([found, end]);
    from = end;
  }
}

export function stripLocations(text: string): string {
  const out: string[] = [];
  for (const raw of text.split('\n')) {
    if (ALIAS_DEF.test(raw.trim())) continue;
    let line = raw;
    const spans = locSpans(line);
    if (spans.length > 0) {
      // Remove right-to-left so earlier offsets stay valid.
      for (let i = spans.length - 1; i >= 0; i--) {
        line = line.slice(0, spans[i][0]) + line.slice(spans[i][1]);
      }
      line = line.replace(/\s+$/, '');
      // A line that held nothing but a location is dropped entirely.
      if (line.trim() === '') continue;
    }
    out.push(line);
  }
  return out.join('\n');
}

/** Whether a stage's text has any location metadata worth offering a toggle for. */
export function hasLocations(text: string): boolean {
  return /\bloc\(/.test(text);
}
