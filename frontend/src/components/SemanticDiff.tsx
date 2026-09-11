import {DiffEditor} from '@monaco-editor/react';
import {useMemo} from 'react';

import type {Stage, StageDiff} from '../api/artifact';
import {stripLocations} from '../api/locations';
import {monacoLanguage, THEME_NAME} from '../monaco/setup';

/**
 * Before/after comparison between two adjacent stages in the same track.
 *
 * Stage 1 shows the textual diff plus the precomputed headline of what changed. The
 * semantic classification -- naming a transformation as "tiled + vectorized matmul"
 * rather than listing added lines -- arrives once
 * the lineage engine can substantiate the claim. Showing a textual diff and calling it
 * semantic would be the wrong kind of shortcut.
 *
 * The loc() filter applies here too. Leaving metadata in one view and stripping it in the
 * other would be inconsistent, and on a diff it is actively harmful: an operation that did
 * not change but whose location was renumbered shows up as a spurious modification.
 */

interface SemanticDiffProps {
  previous: Stage;
  current: Stage;
  diff: StageDiff | undefined;
  /** Hidden rather than unmounted -- see the note in App.tsx. */
  hidden?: boolean;
  /** Whether to keep loc(...) metadata in the compared text. */
  showLocations: boolean;
}

/** Signed count with a colour and an explicit sign, never colour alone. */
function Delta({value, unit}: {value: number; unit: string}) {
  const sign = value > 0 ? 'add' : value < 0 ? 'remove' : 'none';
  return (
    <span className="delta" data-sign={sign}>
      {value > 0 ? '+' : ''}
      {value} {unit}
    </span>
  );
}

function displayText(stage: Stage, showLocations: boolean): string {
  return stage.language === 'mlir' && !showLocations ? stripLocations(stage.text) : stage.text;
}

export function SemanticDiff({
  previous,
  current,
  diff,
  hidden = false,
  showLocations,
}: SemanticDiffProps) {
  const originalText = useMemo(
    () => displayText(previous, showLocations),
    [previous, showLocations],
  );
  const modifiedText = useMemo(() => displayText(current, showLocations), [current, showLocations]);

  return (
    <div
      className="viewer"
      style={{
        display: hidden ? 'none' : 'grid',
        gridTemplateRows: 'auto 1fr',
        minHeight: 0,
      }}
    >
      <div className="diff-summary">
        <strong>{previous.title}</strong>
        <span className="diff-arrow">→</span>
        <strong>{current.title}</strong>
        {diff ? (
          <>
            <Delta value={diff.op_delta} unit="ops" />
            <span>{diff.summary}</span>
          </>
        ) : (
          <span>No comparison available.</span>
        )}
      </div>
      <DiffEditor
        // Deliberately NOT keyed on the stage pair. Forcing a remount disposes the two
        // text models while DiffEditorWidget still references them, which throws
        // "TextModel got disposed before DiffEditorWidget model got reset". Updating the
        // original/modified props instead lets the widget swap models in the right order.
        //
        // keepCurrent*Model opts this pane out of @monaco-editor/react's own disposal too:
        // that disposal runs in the same buggy order when the *whole* pane (this component
        // included) is torn down, e.g. leaving a workspace for the landing page. The models
        // it would otherwise dispose leak instead -- one bounded, one-time pair per pane
        // close, not per toggle -- which is the trade this project makes deliberately rather
        // than fight a library-internal ordering bug.
        keepCurrentOriginalModel
        keepCurrentModifiedModel
        height="100%"
        theme={THEME_NAME}
        original={originalText}
        modified={modifiedText}
        language={monacoLanguage(current.language)}
        options={{
          readOnly: true,
          domReadOnly: true,
          renderSideBySide: true,
          wordWrap: 'off',
          fontFamily: "'SF Mono', 'JetBrains Mono', Menlo, Consolas, monospace",
          fontSize: 12,
          lineHeight: 18,
          minimap: {enabled: false},
          scrollBeyondLastLine: false,
          // The IR is regenerated wholesale each phase, so whitespace-only churn is
          // constant noise and hides the changes that matter.
          ignoreTrimWhitespace: true,
        }}
      />
    </div>
  );
}
