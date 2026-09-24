// Existing UI smoke check against the installed package server.
import {createRequire} from 'node:module';
const require = createRequire(new URL('../frontend/package.json', import.meta.url));
const {chromium} = require('playwright');
const browser = await chromium.launch({headless: true, args: ['--no-sandbox']});
const page = await browser.newPage({viewport: {width: 1600, height: 950}});
const failures = [];
page.on('pageerror', error => failures.push(String(error)));
page.on('requestfailed', request => failures.push(request.url()));
try {
  await page.goto(process.argv[2], {waitUntil: 'networkidle'});
  await page.locator('.workload-card').first().waitFor();
  await page.locator('.workload-card-open').first().click();
  await page.locator('.architecture-pipeline-button').click();
  await page.locator('.monaco-editor .view-line').first().waitFor({timeout: 30000});
  if (await page.locator('.golden-layout-container .pane').count() < 2) throw Error('Workspace panes missing');
  if (failures.length) throw Error(failures.join('\n'));
  await page.screenshot({path: '/tmp/compilerlens-installed-viewer.png'});
  console.log('Installed viewer: workload cards, workspace, Monaco and workers passed.');
} finally { await browser.close(); }
