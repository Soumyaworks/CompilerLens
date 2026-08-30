import Editor from '@monaco-editor/react';
import {useMemo} from 'react';

import type {Stage} from '../api/artifact';
import {stripLocations} from '../api/locations';
import {monacoLanguage, THEME_NAME} from '../monaco/setup';

/**
 * Verbatim IR display (DESIGN-DOC section 4.1).
 *
 * Read-only by design: this is a viewer, and the IR shown is exactly what the compiler
 * emitted. Word wrap is off because MLIR lines are long and wrapping destroys the visual
 * structure that makes nesting readable; horizontal scrolling is the lesser evil.
 *
 * `loc(...)` metadata is hidden unless asked for. It is what makes lineage possible, but
 * reading IR with a location on every line -- and a twelve-thousand-character DWARF
 * location on one of them -- is genuinely worse. The unfiltered text is one click away and
 * is always what the artifact stores. The control itself lives in the stage header rather
 * than floating over the editor, where it covered the first line of IR.
 */

interface IRViewerProps {
  stage: Stage;
  /** When set, scroll to and highlight this 1-based line. */
  revealLine?: number;
  /** Hidden rather than unmounted while the diff view is showing. */
  hidden?: boolean;
  /** Whether to keep loc(...) metadata in the displayed text. */
  showLocations: boolean;
}

export function IRViewer({stage, revealLine, hidden = false, showLocations}: IRViewerProps) {
  const text = useMemo(
    () =>
      stage.language === 'mlir' && !showLocations ? stripLocations(stage.text) : stage.text,
    [showLocations, stage.language, stage.text],
  );

  return (
    <div className="viewer" style={hidden ? {display: 'none'} : undefined}>
      <Editor
        // Remount when the stage or the filter changes, so the model, language, and scroll
        // position reset cleanly rather than carrying state across two different documents.
        key={`${stage.id}-${showLocations}`}
        height="100%"
        theme={THEME_NAME}
        language={monacoLanguage(stage.language)}
        value={text}
        options={{
          readOnly: true,
          domReadOnly: true,
          minimap: {enabled: true, maxColumn: 80},
          wordWrap: 'off',
          fontFamily: "'SF Mono', 'JetBrains Mono', Menlo, Consolas, monospace",
          fontSize: 12,
          lineHeight: 18,
          renderLineHighlight: 'line',
          scrollBeyondLastLine: false,
          smoothScrolling: true,
          cursorBlinking: 'smooth',
          padding: {top: 10, bottom: 10},
          bracketPairColorization: {enabled: false},
        }}
        onMount={editor => {
          if (revealLine) {
            editor.revealLineInCenter(revealLine);
            editor.setPosition({lineNumber: revealLine, column: 1});
          }
        }}
      />
    </div>
  );
}
