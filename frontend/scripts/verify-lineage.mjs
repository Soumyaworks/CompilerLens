/** Deterministic browser regression; no model downloads or generated artifacts needed.
 * Start Vite, then: npm run verify:lineage -- http://127.0.0.1:5173
 */
import assert from 'node:assert/strict';
import {chromium} from 'playwright';

const url = process.argv[2] ?? 'http://127.0.0.1:5173';
const base = {kind: 'phase', track: 'module', pass_name: null, pass_arg: null, parent_stage: null,
  gap_note: null, description: '', op_histogram: {}, histogram_label: 'Operations', ops: []};
function stage(id, language, phase, count, matches) {
  const rows = Array.from({length: count}, (_, i) => `// unrelated_${id}_${i + 1}`);
  for (const line of matches) rows[line - 1] = language === 'mlir'
    ? `%v${line} = torch.aten.mm %a, %b loc("input":${line}:1)`
    : language === 'llvm' ? `%v${line} = fadd float %a, %b ; matched_${line}`
      : `    vaddps %ymm0, %ymm1, %ymm2 # matched_${line}`;
  if (language === 'mlir') rows[0] = '#loc1 = loc("input":1:1)';
  return {...base, id, name: id, title: id, index: phase === 'input' ? 0 : phase === 'llvm' ? 1 : 2,
    language, phase, text: rows.join('\n'), source_path: `${id}.txt`, line_count: count,
    byte_size: rows.join('\n').length, op_count: matches.length};
}
const anchor = stage('torch-input', 'mlir', 'input', 120, [40, 65]);
anchor.ops = [40, 65].map(line => ({id: `op${line}`, stage_id: anchor.id, line,
  name: line === 40 ? 'torch.aten.mm' : 'torch.aten.relu', text: anchor.text.split('\n')[line - 1],
  dialect: 'torch', results: [], operands: [], types: [], source_loc: null, lineage_key: null}));
const stages = [anchor, stage('llvm-codegen', 'llvm', 'llvm', 160, [5, 80, 150]),
  stage('assembly', 'asm', 'binary', 80, [1, 80])];
function entry(line) {
  const hits = {'torch-input': [line], 'llvm-codegen': [5, 80, 150], assembly: line === 65 ? [] : [1, 80]};
  return {total_ops: 6, stage_count: 3, op_names: {'torch.aten.mm': 1}, stages: hits,
    hops: stages.map((s, i) => ({stage_id: s.id, from_stage: i ? stages[i - 1].id : null,
      kind: 'transition', change: i ? 'changed' : 'created', confidence: 'structural',
      from_count: 1, to_count: hits[s.id].length, op_names: {test: hits[s.id].length},
      detail: 'Synthetic navigation fixture', pass_count: 0}))};
}
const artifact = {artifact_version: '0.7', compilation_id: 'lineage-test', stages,
  source: {code: 'torch.matmul(a, b)'}, target: {}, notes: [], diffs: [], evidence: [],
  lineage: {anchor_stage: 'torch-input', lines: {40: entry(40), 65: entry(65)},
    summary: {source_lines_covered: 2, total_anchored_ops: 12}}};
const browser = await chromium.launch({headless: true});
const page = await browser.newPage({viewport: {width: 1440, height: 1000}});
page.setDefaultTimeout(15000);
const errors = [];
page.on('pageerror', error => errors.push(String(error)));
try {
  await page.route('**/artifacts/index.json', route => route.fulfill({json: {workloads: [{
    id: artifact.compilation_id, title: 'Lineage test', description: 'Synthetic UI fixture',
    source_entry: 'test', source_preview: '', stage_count: 3, op_count: 7, evidence_count: 0,
  }]}}));
  await page.route('**/artifacts/lineage-test.json', route => route.fulfill({json: artifact}));
  await page.goto(url);
  await page.locator('.workload-card-open').click();
  await page.getByRole('button', {name: 'Open pipeline', exact: true}).click();
  await page.locator('.golden-layout-container .monaco-editor .view-line').first().waitFor();
  await page.getByRole('button', {name: 'Operation Lineage', exact: true}).click();
  await page.locator('.lineage-op-row').first().click();
  const panel = page.locator('.focused-ir-viewer');
  async function status(value) {
    await page.waitForFunction(value => document.querySelector('.focused-ir-toolbar [role="status"]')?.textContent === value, value);
  }
  await status('1 matching lines · 1 / 120 shown');
  await panel.locator('.focused-ir-gap').first().waitFor();
  assert.match(await panel.locator('.view-lines').innerText(), /%v40/);
  assert.ok((await panel.locator('.line-numbers').allTextContents()).includes('40'));
  await panel.getByRole('button', {name: '↑ 20 above', exact: true}).focus();
  await page.keyboard.press('Enter');
  await status('1 matching lines · 21 / 120 shown');
  await panel.getByRole('button', {name: 'Focus matches', exact: true}).click();
  await status('1 matching lines · 1 / 120 shown');
  await panel.getByRole('button', {name: '↓ 20 below', exact: true}).click();
  await status('1 matching lines · 21 / 120 shown');
  await page.locator('.lineage-stage-button', {hasText: 'llvm-codegen'}).click();
  await status('3 matching lines · 3 / 160 shown');
  await page.waitForFunction(() => document.querySelectorAll('.focused-ir-gap').length === 4);
  await page.waitForFunction(() => {
    const text = document.querySelector('.focused-ir-viewer .view-lines')?.textContent ?? '';
    return [5, 80, 150].every(line => text.includes(`matched_${line}`)) &&
      document.querySelectorAll('.focused-ir-viewer .lineage-jump-highlight').length === 3;
  });
  const ir = await panel.locator('.view-lines').innerText();
  for (const line of [5, 80, 150]) assert.match(ir, new RegExp(`matched_${line}`));
  assert.doesNotMatch(ir, /unrelated_llvm/);
  assert.equal(await panel.locator('.lineage-jump-highlight').count(), 3);
  // Middle gap: reveal from the previous block and then from the next block.
  await panel.getByRole('group', {name: 'Hidden lines 6 to 79', exact: true})
    .getByRole('button', {name: '↓ 20 below', exact: true}).click();
  await status('3 matching lines · 23 / 160 shown');
  await panel.getByRole('group', {name: 'Hidden lines 26 to 79', exact: true})
    .getByRole('button', {name: '↑ 20 above', exact: true}).click();
  await status('3 matching lines · 43 / 160 shown');
  await panel.getByRole('button', {name: 'Show full IR', exact: true}).click();
  await status('3 matching lines · 160 / 160 shown');
  assert.equal(await panel.locator('.focused-ir-gap').count(), 0);
  await panel.getByRole('button', {name: 'Focus matches', exact: true}).click();
  await status('3 matching lines · 3 / 160 shown');
  await page.locator('.lineage-stage-button', {hasText: 'assembly'}).click();
  await status('2 matching lines · 2 / 80 shown');
  await page.waitForFunction(() => document.querySelectorAll('.focused-ir-gap').length === 1);
  await panel.getByRole('button', {name: 'Show gap', exact: true}).click();
  await status('2 matching lines · 80 / 80 shown');
  await page.getByRole('button', {name: 'All operations'}).click();
  assert.equal(await panel.count(), 0);
  await page.locator('.lineage-op-row').nth(1).click();
  await status('1 matching lines · 1 / 120 shown');
  await page.waitForFunction(() => document.querySelector('.focused-ir-viewer .view-lines')?.textContent.includes('%v65'));
  await page.screenshot({path: '/tmp/compilerlens-focused-lineage.png'});
  await page.locator('.lineage-stage-button', {hasText: 'assembly'}).click();
  await status('No matching lines available · showing full IR');
  assert.ok(await panel.getByRole('button', {name: 'Focus matches', exact: true}).isDisabled());
  assert.ok(await panel.getByRole('button', {name: 'Show full IR', exact: true}).isDisabled());
  await page.getByRole('button', {name: 'Back to workspace'}).click();
  assert.equal(await panel.count(), 0);
  await page.locator('.golden-layout-container .monaco-editor .view-line').first().waitFor();
  assert.deepEqual(errors, []);
  console.log('Focused lineage browser checks passed: original lines, all matches, expansion, reset, LLVM/assembly, workspace.');
} catch (error) {
  await page.screenshot({path: '/tmp/compilerlens-focused-lineage-failure.png'});
  console.error('Browser errors:', errors);
  console.error('Focused panel:', await page.locator('.focused-ir-viewer').allTextContents());
  throw error;
} finally {
  await browser.close();
}
