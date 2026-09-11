/**
 * Renders the app in a headless browser and asserts the pieces actually appear.
 *
 * This exists because a passing typecheck and an HTTP 200 prove nothing about whether
 * Monaco initialised, golden-layout mounted its panes, or the artifact parsed. Any console
 * error or failed request fails the run.
 *
 * Covers the Compiler-Explorer-style workspace: the landing page (workload cards), the
 * golden-layout workspace (default panes, the phase-grouped searchable stage picker,
 * IR/Diff/loc() per pane, adding a pane, evidence-driven navigation), and that a second
 * workload (linear_relu) is genuinely distinct from the first (its own fusion evidence).
 *
 * Usage:  node scripts/verify.mjs [url]
 */

import {chromium} from 'playwright';

const URL = process.argv[2] ?? 'http://localhost:5173/';
const SHOT = 'screenshots';

const consoleErrors = [];
const failedRequests = [];

const browser = await chromium.launch();
const page = await browser.newPage({viewport: {width: 1600, height: 950}});

page.on('console', message => {
  if (message.type() === 'error') consoleErrors.push(message.text());
});
page.on('pageerror', error => consoleErrors.push(`pageerror: ${error.message}`));
page.on('requestfailed', request =>
  failedRequests.push(`${request.url()} — ${request.failure()?.errorText}`),
);

const checks = [];
function check(name, passed, detail = '') {
  checks.push({name, passed, detail});
}

// A pane's stage picker (single-select TomSelect) plus dropdown, scoped so two open stage
// panes never leak into each other's assertions.
function pickerIn(pane) {
  return pane.locator('.ts-wrapper').first();
}
async function openDropdown(picker) {
  await picker.click();
  await page.waitForTimeout(150);
  return page.locator('.ts-dropdown:visible').first();
}

// --- landing page --------------------------------------------------------------------------

await page.goto(URL, {waitUntil: 'networkidle', timeout: 60_000});
await page.waitForSelector('.workload-card', {timeout: 20_000});

const cardTitles = await page.locator('.workload-card-head h3').allInnerTexts();
check('landing page lists both workloads', cardTitles.includes('matmul') && cardTitles.includes('linear_relu'), JSON.stringify(cardTitles));

// Counted, not hardcoded: downloaded HuggingFace models show up here too, so the number of
// cards grows as models are compiled. What matters is that the landing page comes back with
// the same set it started with.
const landingCardCount = cardTitles.length;

const cardStats = await page.locator('.workload-card', {hasText: 'matmul'}).locator('.workload-card-stats').innerText();
check('workload card shows stage/op/evidence counts', /stages/.test(cardStats) && /ops/.test(cardStats), cardStats);

await page.screenshot({path: `${SHOT}/01-landing.png`});

// --- open matmul: default workspace --------------------------------------------------------

await page.locator('.workload-card', {hasText: 'matmul'}).locator('.workload-card-open').click();
await page.waitForSelector('.monaco-editor .view-line', {timeout: 30_000});
await page.waitForTimeout(600);

check('back to workloads button present', (await page.locator('.back-button').count()) === 1);

const panes = () => page.locator('.golden-layout-container .pane');
check('default workspace opens 4 panes', (await panes().count()) === 4, `found ${await panes().count()}`);

const tabTitles = await page.locator('.lm_tab').allInnerTexts();
check(
  'default panes are source, two stages, evidence',
  tabTitles.includes('PyTorch Source') && tabTitles.includes('Evidence') && tabTitles.length === 4,
  JSON.stringify(tabTitles),
);

const sourceText = await page.locator('.pane', {hasText: 'PyTorch Source'}).first().locator('.monaco-editor:visible').first().innerText();
check('source pane shows the PyTorch source', sourceText.includes('torch.matmul'), sourceText.slice(0, 120));

// --- pipeline rail: one heading per phase, ringed markers for open stage panes -----------
// Structural/count checks only here -- the click-to-open-phase test that adds a pane runs
// later, after every index-sensitive check below is done with today's 4 default panes.

const railHeadings = page.locator('.pipeline-rail-heading');
check('pipeline rail has one heading per phase', (await railHeadings.count()) === 8, `found ${await railHeadings.count()}`);
check('rail marks the two default stage panes as active', (await page.locator('.pipeline-rail-heading.active').count()) === 2);

// --- stage picker: searchable, grouped by phase --------------------------------------------

const stagePane = panes().nth(1);
const picker = pickerIn(stagePane);
let dropdown = await openDropdown(picker);

const optgroupCount = await dropdown.locator('.optgroup-header').count();
check('stage picker has all 8 phase groups', optgroupCount === 8, `found ${optgroupCount}`);

const optionCount = await dropdown.locator('.option').count();
check('stage picker lists all 55 stages', optionCount === 55, `found ${optionCount}`);

await page.keyboard.type('GenericVectorization');
await page.waitForTimeout(400);
const filtered = await dropdown.locator('.option').allInnerTexts();
check('stage picker search filters options', filtered.length >= 1 && filtered.every(t => t.includes('GenericVectorization')), JSON.stringify(filtered));

await dropdown.locator('.option', {hasText: 'GenericVectorization'}).first().click();
await page.waitForTimeout(500);
// Single-select TomSelect closes its own dropdown on pick, but Escape+blur makes sure --
// an open dropdown sits above the rest of the pane and swallows subsequent clicks.
await page.keyboard.press('Escape');
await page.mouse.click(800, 500);
await page.waitForTimeout(200);
check(
  'picking a stage updates the pane tab title',
  (await page.locator('.lm_tab', {hasText: 'GenericVectorization'}).count()) >= 1,
);
check('picking a stage badges it as a pass', (await stagePane.locator('.pass-badge').count()) === 1);

let editorText = await stagePane.locator('.monaco-editor:visible').first().innerText();
check('vectorization pass IR contains vector ops', editorText.includes('vector.'), editorText.slice(0, 120));

// --- IR/Diff/loc() toggles, scoped to this one pane ----------------------------------------

const diffButton = stagePane.locator('.view-toggle button', {hasText: 'Diff'});
check('diff is available for a pass with a predecessor in its track', await diffButton.isEnabled());
await diffButton.click();
await page.waitForSelector('.monaco-diff-editor', {timeout: 25_000});
await page.waitForTimeout(1000);
const decorations = await stagePane.evaluate(el =>
  el.querySelectorAll('.monaco-diff-editor .line-insert, .monaco-diff-editor .line-delete, .monaco-diff-editor .char-insert, .monaco-diff-editor .char-delete').length,
);
check('pass-to-pass diff renders real changes', decorations > 0, `found ${decorations}`);
await page.screenshot({path: `${SHOT}/02-diff.png`});

const locToggle = stagePane.locator('.loc-toggle input');
check('loc() toggle offered on this MLIR pane', (await locToggle.count()) === 1);
await stagePane.locator('.view-toggle button', {hasText: 'IR'}).click();
await page.waitForTimeout(300);
let irText = await stagePane.locator('.monaco-editor:visible').first().innerText();
check('loc() hidden by default', !irText.includes('loc('), irText.slice(0, 120));
await locToggle.check();
await page.waitForTimeout(500);
irText = await stagePane.locator('.monaco-editor:visible').first().innerText();
check('loc() shown once toggled on', irText.includes('loc('), irText.slice(0, 160));
await locToggle.uncheck();
await page.waitForTimeout(300);

// --- the second stage pane is independent ---------------------------------------------------

// .lm_tab lives in golden-layout's own header strip, a sibling of the pane's content --
// not a descendant -- so independence is checked via the pane's own picker control instead.
const otherStagePane = panes().nth(2);
const otherTitleBefore = (await pickerIn(otherStagePane).innerText()).trim();
check(
  'the other stage pane kept its own selection while this one changed',
  otherTitleBefore !== 'GenericVectorization',
  otherTitleBefore,
);

// --- evidence pane + navigation --------------------------------------------------------------

const evidencePane = panes().nth(3);
const evidenceCount = await evidencePane.locator('.evidence-item').count();
check('evidence pane populated', evidenceCount >= 10, `found ${evidenceCount}`);

const sourceLink = evidencePane.locator('.evidence-source button').first();
const targetStageTitle = (await sourceLink.innerText()).trim();
await sourceLink.click();
await page.waitForTimeout(500);
check(
  'clicking evidence opens a new stage pane on its source stage',
  (await panes().count()) === 5 && (await page.locator('.lm_tab', {hasText: targetStageTitle}).count()) >= 1,
  `target: ${targetStageTitle}, panes: ${await panes().count()}`,
);
await page.screenshot({path: `${SHOT}/03-evidence-navigate.png`});

// --- add pane: stage / evidence / notes -------------------------------------------------------

async function addPane(label) {
  await page.locator('.add-pane-button').click();
  await page.waitForTimeout(150);
  await page.locator('.add-pane-dropdown button', {hasText: label}).click();
  await page.waitForTimeout(400);
}

const panesBeforeAdd = await panes().count();
await addPane('Stage viewer');
check('add pane inserts a new stage viewer', (await panes().count()) === panesBeforeAdd + 1);

await addPane('Notes');
const notesItems = await page.locator('.notes-list li').count();
check('notes pane lists the artifact\'s limitations', notesItems >= 1, `found ${notesItems}`);
await page.screenshot({path: `${SHOT}/04-add-pane.png`});

// --- pipeline rail: click-to-open-phase (mutates pane count, so this runs last) ----------

const panesBeforeRailClick = await panes().count();
const codegenHeading = railHeadings.filter({hasText: 'Codegen'});
await codegenHeading.click();
await page.waitForTimeout(500);
check(
  'clicking a rail heading opens a PhaseFlowPane for that phase',
  (await panes().count()) === panesBeforeRailClick + 1,
  `panes: ${await panes().count()}`,
);
// Not asserted via an active-count delta: Codegen may already be active from the earlier
// evidence-navigate test (Dispatch Kernel MLIR is a Codegen-phase stage), so the count
// wouldn't move even though this heading itself is now (still) active.
check('the clicked heading is marked active', await codegenHeading.evaluate(el => el.classList.contains('active')));

const phasePane = page.locator('.golden-layout-container .pane').filter({has: page.locator('.phase-mini-rail')});
check('phase pane opens on the phase\'s first stage', (await phasePane.locator('.phase-stepper-count').innerText()) === '1 / 34');

await phasePane.locator('.phase-stepper-nav button', {hasText: '›'}).click();
await page.waitForTimeout(400);
check('stepper next advances by one', (await phasePane.locator('.phase-stepper-count').innerText()) === '2 / 34');

await phasePane.locator('.phase-mini-rail-segment').nth(15).click();
await page.waitForTimeout(400);
check(
  'mini rail jumps directly to the clicked stage',
  (await phasePane.locator('.phase-stepper-count').innerText()) === '16 / 34' &&
    (await phasePane.locator('.phase-mini-rail-segment.active').count()) === 1,
);
await page.screenshot({path: `${SHOT}/06-rail-jump.png`});

// --- structural drag/resize affordances (golden-layout's own chrome, not simulated) --------

check('panes carry drag-and-resize chrome', (await page.locator('.lm_splitter').count()) >= 3);
check('every pane tab has a close control', (await page.locator('.lm_tab .lm_close_tab').count()) >= (await page.locator('.lm_tab').count()));

// --- back to landing, open the second workload ------------------------------------------------

await page.locator('.back-button').click();
await page.waitForSelector('.workload-card', {timeout: 10_000});
check('back button returns to the landing page', (await page.locator('.workload-card').count()) === landingCardCount);

await page.locator('.workload-card', {hasText: 'linear_relu'}).locator('.workload-card-open').click();
await page.waitForSelector('.monaco-editor .view-line', {timeout: 30_000});
await page.waitForTimeout(600);

const linearReluSource = await page.locator('.pane', {hasText: 'PyTorch Source'}).first().locator('.monaco-editor:visible').first().innerText();
check('linear_relu source is genuinely different from matmul', linearReluSource.includes('relu'), linearReluSource.slice(0, 160));

const linearReluEvidence = await page.locator('.golden-layout-container .pane', {hasText: 'Compiler evidence'}).innerText();
check(
  'linear_relu has its own fused-epilogue evidence matmul does not',
  linearReluEvidence.toLowerCase().includes('fused'),
  linearReluEvidence.slice(0, 200),
);
await page.screenshot({path: `${SHOT}/05-linear-relu.png`});

// --- the Sandbox ------------------------------------------------------------------------------
// Only structural checks here. Driving a real compile needs the API server running, and a test
// that fails because an optional server is down would be a false alarm rather than a signal --
// so the compile path is exercised by hand (see README) and this covers the UI reaching it.

await page.locator('.back-button').click();
await page.waitForSelector('.workload-card', {timeout: 10_000});
check('landing page offers the Sandbox', (await page.locator('.sandbox-entry').count()) === 1);

await page.locator('.sandbox-entry').click();
await page.waitForTimeout(1200);

const sandboxReachable = (await page.locator('.sandbox-controls').count()) === 1;
if (sandboxReachable) {
  check('sandbox exposes model, seq-len, stage and flag controls',
    (await page.locator('.sandbox-controls select').count()) >= 6);
  check('sandbox has compile and measure actions',
    (await page.locator('.sandbox-actions button').count()) === 2);
  check('measure is disabled before a compile',
    (await page.locator('.sandbox-actions button:disabled').count()) >= 1);
  check('every compiler flag explains why it matters',
    (await page.locator('.control-why').count()) >= 4);
  await page.screenshot({path: `${SHOT}/07-sandbox.png`});
} else {
  // The API is not running, so the page shows its own empty state. That is correct behaviour
  // and worth asserting rather than skipping.
  const message = await page.locator('.sandbox-unavailable').innerText().catch(() => '');
  check('sandbox explains how to start the API when it is not running',
    message.includes('run_server'), message.slice(0, 120));
}

await browser.close();

// --- report ------------------------------------------------------------------------------

let failed = 0;
for (const {name, passed, detail} of checks) {
  if (!passed) failed++;
  console.log(`${passed ? 'PASS' : 'FAIL'}  ${name}${detail && !passed ? `  (${detail})` : ''}`);
}

if (consoleErrors.length) {
  console.log(`\n${consoleErrors.length} console error(s):`);
  for (const error of consoleErrors.slice(0, 10)) console.log(`  ${error}`);
}
if (failedRequests.length) {
  console.log(`\n${failedRequests.length} failed request(s):`);
  for (const request of failedRequests.slice(0, 10)) console.log(`  ${request}`);
}

const problems = failed + consoleErrors.length + failedRequests.length;
console.log(
  `\n${checks.length - failed}/${checks.length} checks passed, ` +
    `${consoleErrors.length} console errors, ${failedRequests.length} failed requests`,
);
process.exit(problems === 0 ? 0 : 1);
