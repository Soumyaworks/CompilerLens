// Browser smoke check against `compilerlens view` serving the tiny_clip demo.
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require = createRequire(new URL('../frontend/package.json', import.meta.url));
const {chromium} = require('playwright');
const browser = await chromium.launch({headless: true, args: ['--no-sandbox']});
const page = await browser.newPage({viewport: {width: 1440, height: 950}});
const failures = [];
page.on('pageerror', error => failures.push(String(error)));
page.on('requestfailed', request => failures.push(request.url()));
try {
  await page.goto(process.argv[2], {waitUntil: 'networkidle'});
  await page.locator('.workload-card').first().waitFor();
  assert.equal(await page.locator('#landing-lineage').count(), 0);
  const card = page.locator('.workload-card').filter({hasText: 'tiny_clip'}).first();
  await card.locator('.workload-card-open').click();
  await page.locator('.architecture-input-terminal').waitFor();
  assert.match(await page.locator('.architecture-input-terminal').innerText(), /Synthetic inputs.*Image \+ text \+ mask/s);
  assert.match(await page.locator('.architecture-output-terminal').innerText(), /Embeddings \+ similarity/);
  assert.match(await page.locator('.architecture-header-facts').innerText(), /image \+ text/);
  assert.match(await page.locator('.architecture-header-facts').innerText(), /Random/);
  assert.equal(await page.locator('.architecture-flow-connector').count(), 0);
  await page.screenshot({path: '/tmp/compilerlens-multimodal-desktop.png'});
  await page.setViewportSize({width: 390, height: 844});
  const inputBox = await page.locator('.architecture-input-terminal').boundingBox();
  assert.ok(inputBox.x >= 0 && inputBox.x + inputBox.width <= 390, 'Mobile inputs are clipped');
  await page.screenshot({path: '/tmp/compilerlens-multimodal-mobile.png'});
  await page.setViewportSize({width: 1440, height: 950});
  await page.locator('.architecture-pipeline-button').click();
  await page.locator('.monaco-editor .view-line').first().waitFor({timeout: 30000});
  assert.deepEqual(failures, []);
  console.log('Multimodal viewer: labels, clean search, architecture, and compiler workspace passed.');
} finally {
  await browser.close();
}
