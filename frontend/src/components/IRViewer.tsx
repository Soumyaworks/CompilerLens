import Editor from '@monaco-editor/react';
import {useMemo, useRef} from 'react';

import type {Lineage, Stage} from '../api/artifact';
import {isTraceableAnchorOp} from '../api/artifact';
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
  /** Lineage data for highlighting operations in source code. */
  lineage?: Lineage;
  /** Callback when a lineage-highlighted line is clicked. */
  onLineageClick?: (sourceLine: string) => void;
  /** Highlight these lines with a different color (for lineage jumps). */
  highlightLines?: number[];
}

export function IRViewer({
  stage,
  revealLine,
  hidden = false,
  showLocations,
  lineage,
  onLineageClick,
  highlightLines,
}: IRViewerProps) {
  const editorRef = useRef<any>(null);
  const text = useMemo(
    () =>
      stage.language === 'mlir' && !showLocations ? stripLocations(stage.text) : stage.text,
    [showLocations, stage.language, stage.text],
  );

  // Add decorations for lineage-highlighted lines (only for source code with operations)
  const decorations = useMemo(() => {
    const decs: Array<{
      range: {startLineNumber: number; startColumn: number; endLineNumber: number; endColumn: number};
      options: {
        isWholeLine: boolean;
        className: string;
        glyphMarginClassName: string;
        glyphMarginHoverMessage: {value: string};
        mouseDownMessage: {value: string};
      };
    }> = [];

    // The anchor stage's own operation at each line -- used below to skip scaffolding
    // (the function signature, scalar constants, global weight declarations, embedded
    // constant tensors), none of which is something a user wrote an expression on. Their
    // ABI/runtime boilerplate descendants (hal.*, util.*, memref.*) have no location of
    // their own and default to whichever anchor line they're attached to, which would
    // otherwise dump all of it onto that line -- see `isTraceableAnchorOp`.
    const anchorOpByLine =
      stage.name === 'torch-input' ? new Map(stage.ops.map(op => [op.line, op.name])) : null;

    // Add lineage highlighting - highlight ALL lines in the lineage entry
    if (lineage && onLineageClick) {
      Object.entries(lineage.lines).forEach(([lineNum, entry]) => {
        const sourceLineNum = parseInt(lineNum, 10);

        const anchorOpName = anchorOpByLine?.get(sourceLineNum);
        if (anchorOpName && !isTraceableAnchorOp(anchorOpName)) return;

        // Get all lines for this lineage entry from this stage
        const stageLines = entry.stages[stage.id];
        if (stageLines && stageLines.length > 0) {
          // Highlight all lines for this operation
          stageLines.forEach((line, idx) => {
            decs.push({
              range: {
                startLineNumber: line,
                startColumn: 1,
                endLineNumber: line,
                endColumn: 1,
              },
              options: {
                isWholeLine: true,
                className: 'lineage-highlight-line',
                glyphMarginClassName: idx === 0 ? 'lineage-glyph' : '',
                glyphMarginHoverMessage: {
                  value: idx === 0 ? `${entry.total_ops.toLocaleString()} operations across ${entry.stage_count} stages` : '',
                },
                mouseDownMessage: {value: idx === 0 ? 'Click to trace lineage' : ''},
              },
            });
          });
        }
      });
    }

    // Add highlight for jumped-to lines (all lines for this operation)
    if (highlightLines && highlightLines.length > 0) {
      // Add decoration for all lines of this operation
      highlightLines.forEach((lineNum, idx) => {
        decs.push({
          range: {
            startLineNumber: lineNum,
            startColumn: 1,
            endLineNumber: lineNum,
            endColumn: 1,
          },
          options: {
            isWholeLine: true,
            className: 'lineage-jump-highlight',
            glyphMarginClassName: idx === 0 ? 'lineage-jump-glyph' : '',
            glyphMarginHoverMessage: {value: idx === 0 ? 'Jumped from lineage' : ''},
            mouseDownMessage: {value: ''},
          },
        });
      });
    }

    return decs;
  }, [lineage, onLineageClick, stage.id, stage.name, stage.text, stage.ops, highlightLines]);

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
          glyphMargin: true,
        }}
        onMount={editor => {
          editorRef.current = editor;
          if (revealLine) {
            editor.revealLineInCenter(revealLine);
            editor.setPosition({lineNumber: revealLine, column: 1});
          }
          // Set decorations for lineage highlights
          if (decorations.length > 0) {
            editor.deltaDecorations([], decorations);
          }
          // Add click handler for lineage lines
          if (onLineageClick && lineage) {
            editor.onMouseDown(e => {
              if (e.target.type === 2) {
                // 2 = glyph margin
                const lineNumber = e.target.position?.lineNumber;
                if (lineNumber) {
                  onLineageClick(String(lineNumber));
                }
              }
            });
          }
        }}
      />
    </div>
  );
}
