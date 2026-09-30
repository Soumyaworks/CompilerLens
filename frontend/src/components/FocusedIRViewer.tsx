import Editor from '@monaco-editor/react';
import type {editor as MonacoEditor} from 'monaco-editor';
import {useEffect, useMemo, useRef, useState} from 'react';

import type {Stage} from '../api/artifact';
import {expandGap, focusRanges, projectIR} from '../api/focusedIR';
import type {LineRange, ProjectedGap} from '../api/focusedIR';
import {stripLocations} from '../api/locations';
import {monacoLanguage, THEME_NAME} from '../monaco/setup';

/** Lineage-only projection. Original stage text and the full pipeline editor are untouched.
 * The parent keys this component by operation and stage, resetting expanded context.
 * Public Monaco view zones provide keyboard-accessible controls between matching sections.
 */
export function FocusedIRViewer({stage, highlightLines}: {stage: Stage; highlightLines: number[]}) {
  const lines = useMemo(() => (
    stage.language === 'mlir' ? stripLocations(stage.text, true) : stage.text
  ).split('\n'), [stage.text, stage.language]);
  const matches = useMemo(() => focusRanges(highlightLines, lines), [highlightLines, lines]);
  const [visible, setVisible] = useState<LineRange[]>(matches);
  const [editor, setEditor] = useState<MonacoEditor.IStandaloneCodeEditor | null>(null);
  const scrollAnchor = useRef<{line: number; offset: number} | null>(null);
  const focusButton = useRef<HTMLButtonElement>(null);
  const showAll = matches.length === 0;
  const projection = useMemo(() => projectIR(
    lines, showAll ? [{start: 1, end: lines.length}] : visible,
    stage.language === 'asm' ? '#' : stage.language === 'llvm' ? ';' : '//',
  ), [lines, visible, showAll, stage.language]);
  const highlighted = useMemo(() => new Set(highlightLines.filter(
    line => Number.isInteger(line) && line >= 1 && line <= lines.length,
  )), [highlightLines, lines.length]);

  useEffect(() => {
    if (!editor) return;
    // Own model updates here so text, line maps, highlights and gap controls change together.
    const model = editor.getModel();
    if (!model) return;
    if (model.getValue() !== projection.text) model.setValue(projection.text);
    editor.updateOptions({lineNumbers: line => String(projection.originalLines[line - 1] ?? '⋯')});
    const decorations = editor.createDecorationsCollection([...highlighted].flatMap(line => {
      const displayLine = projection.displayLines.get(line);
      return displayLine ? [{
        range: {startLineNumber: displayLine, endLineNumber: displayLine, startColumn: 1, endColumn: 1},
        options: {isWholeLine: true, className: 'lineage-jump-highlight'},
      }] : [];
    }));
    const zoneIds: string[] = [];

    function reveal(gap: ProjectedGap, edge: 'start' | 'end' | 'all') {
      // Retain the first visible source line's screen position when expanding above it.
      const first = editor!.getVisibleRanges()[0]?.startLineNumber ?? 1;
      const at = projection.originalLines.findIndex((line, i) => i >= first - 1 && line !== null);
      if (at >= 0) scrollAnchor.current = {
        line: projection.originalLines[at]!,
        offset: editor!.getTopForLineNumber(at + 1) - editor!.getScrollTop(),
      };
      setVisible(current => expandGap(current, gap, edge, lines.length));
      // The clicked zone is replaced on expansion; keep keyboard focus in this panel.
      focusButton.current?.focus({preventScroll: true});
    }

    editor.changeViewZones(accessor => {
      for (const gap of projection.gaps) {
        const node = document.createElement('div');
        node.className = 'focused-ir-gap';
        node.setAttribute('role', 'group');
        node.setAttribute('aria-label', `Hidden lines ${gap.start} to ${gap.end}`);
        const count = Math.min(20, gap.end - gap.start + 1);
        function button(label: string, title: string, edge: 'start' | 'end' | 'all') {
          const control = document.createElement('button');
          control.type = 'button';
          control.textContent = label;
          control.title = title;
          control.onclick = () => reveal(gap, edge);
          node.append(control);
        }
        if (gap.start > 1) button(`↓ ${count} below`, 'Expand below the preceding section', 'start');
        if (gap.end < lines.length) button(`↑ ${count} above`, 'Expand above the following section', 'end');
        button('Show gap', `Show all ${gap.end - gap.start + 1} hidden lines in this gap`, 'all');
        zoneIds.push(accessor.addZone({
          afterLineNumber: gap.displayLine, heightInPx: 34, domNode: node,
          suppressMouseDown: false,
        }));
        // Monaco hides its view-zone container from assistive technology by default.
        // This dedicated editor uses it for real buttons, not decorative whitespace.
        node.parentElement?.removeAttribute('aria-hidden');
      }
    });
    const anchor = scrollAnchor.current;
    if (anchor) {
      const displayLine = projection.displayLines.get(anchor.line);
      if (displayLine) editor.setScrollTop(Math.max(0, editor.getTopForLineNumber(displayLine) - anchor.offset));
      scrollAnchor.current = null;
    }
    return () => {
      decorations.clear();
      editor.changeViewZones(accessor => zoneIds.forEach(id => accessor.removeZone(id)));
    };
  }, [editor, projection, highlighted, lines.length]);

  function refocus() {
    scrollAnchor.current = null;
    setVisible(matches);
    editor?.setScrollTop(0);
  }

  return (
    <div className="focused-ir-viewer">
      <div className="focused-ir-toolbar">
        <span role="status">
          {showAll ? 'No matching lines available · showing full IR' :
            `${highlighted.size.toLocaleString()} matching lines · ${projection.displayLines.size.toLocaleString()} / ${lines.length.toLocaleString()} shown`}
        </span>
        <button type="button" ref={focusButton} onClick={refocus} disabled={showAll}>
          Focus matches
        </button>
        <button type="button" disabled={projection.gaps.length === 0}
          onClick={() => setVisible([{start: 1, end: lines.length}])}>Show full IR</button>
      </div>
      <div className="focused-ir-hint">Original line numbers · Expand context at each gap · Find searches shown text</div>
      <div className="focused-ir-editor">
        <Editor
          height="100%"
          theme={THEME_NAME}
          language={monacoLanguage(stage.language)}
          defaultValue={projection.text}
          onMount={setEditor}
          options={{
            readOnly: true, domReadOnly: true, minimap: {enabled: false}, folding: false,
            wordWrap: 'off', fontSize: 12, lineHeight: 18,
            fontFamily: "'SF Mono', 'JetBrains Mono', Menlo, Consolas, monospace",
            lineNumbersMinChars: Math.max(3, String(lines.length).length),
            scrollBeyondLastLine: false, padding: {top: 10, bottom: 10},
            bracketPairColorization: {enabled: false},
            ariaLabel: `Operation lineage IR for ${stage.title}`,
          }}
        />
      </div>
    </div>
  );
}
