import {useEffect, useRef} from 'react';
import TomSelect from 'tom-select';

import type {Stage} from '../api/artifact';
import {groupByPhase, PHASE_TITLES} from '../api/artifact';

/**
 * A searchable, phase-grouped stage picker -- the CompilerLens analogue of Compiler
 * Explorer's compiler picker (`static/widgets/compiler-picker.ts`), which is also a
 * TomSelect wrapped `<select>` grouped by optgroup.
 *
 * TomSelect is imperative and not React-aware, so the instance is created once per mount
 * and torn down on unmount, with prop changes pushed into it via its own API rather than
 * by re-rendering the underlying <select>.
 */

interface StagePickerProps {
  stages: Stage[];
  value: string;
  onChange: (stageId: string) => void;
}

function optionLabel(stage: Stage): string {
  const marker = stage.kind === 'pass' ? '↳ ' : '';
  return `${marker}${stage.title}`;
}

export function StagePicker({stages, value, onChange}: StagePickerProps) {
  const selectRef = useRef<HTMLSelectElement>(null);
  const tomRef = useRef<TomSelect | null>(null);
  const onChangeRef = useRef(onChange);
  onChangeRef.current = onChange;

  useEffect(() => {
    const select = selectRef.current;
    if (!select) return;

    const groups = groupByPhase(stages);
    const tom = new TomSelect(select, {
      options: stages.map(stage => ({
        value: stage.id,
        label: optionLabel(stage),
        phase: stage.phase,
      })),
      optgroups: groups.map(group => ({value: group.phase, label: PHASE_TITLES[group.phase]})),
      optgroupField: 'phase',
      valueField: 'value',
      labelField: 'label',
      searchField: ['label'],
      items: [value],
      maxOptions: null,
      onChange: (val: string | number) => onChangeRef.current(String(val)),
    });
    tomRef.current = tom;
    return () => {
      tom.destroy();
      tomRef.current = null;
    };
    // Options/groups only ever grow from a fixed artifact -- stages is stable per pane.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [stages]);

  useEffect(() => {
    const tom = tomRef.current;
    if (tom && tom.getValue() !== value) tom.setValue(value, true);
  }, [value]);

  return (
    <select ref={selectRef} className="stage-picker" defaultValue={value}>
      {stages.map(stage => (
        <option key={stage.id} value={stage.id}>
          {optionLabel(stage)}
        </option>
      ))}
    </select>
  );
}
