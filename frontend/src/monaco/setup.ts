/**
 * Monaco setup: bundled loader plus syntax highlighting for the languages we display.
 *
 * Monaco ships no MLIR, LLVM IR, or x86 assembly grammar, so all three are registered
 * here as Monarch tokenizers. They are intentionally shallow -- enough to make structure
 * legible while reading, not a validating parser.
 *
 * Monaco is imported as a module and handed to the loader rather than pulled from a CDN.
 * The demo has to work deterministically, and a network hiccup mid-presentation is not a
 * risk worth taking.
 */

import {loader} from '@monaco-editor/react';
// Import the editor API rather than the "monaco-editor" barrel. The barrel registers every
// bundled grammar -- ABAP, Solidity, PowerQuery, and eighty others -- which added ~2 MB to
// the bundle for languages this tool will never open. We register our own three grammars
// below and pull in exactly one stock language.
import * as monaco from 'monaco-editor/editor/editor.api';
// The PyTorch source stage is Python, and this is the only stock grammar we need. In
// monaco 0.56 the basic-language contributions live under languages/definitions/.
import 'monaco-editor/languages/definitions/python/register';
// monaco-editor 0.56 exposes subpaths through an exports map that rewrites "./*" to
// "./esm/vs/*.js", so the specifier is "monaco-editor/editor/editor.worker" -- the older
// "monaco-editor/esm/vs/..." form resolves to a doubled path and fails.
import editorWorker from 'monaco-editor/editor/editor.worker?worker';

// Monaco expects a worker factory on the global object. Only the base editor worker is
// needed: we register plain-text-ish grammars and no language services. The diff editor
// computes its diffs in this worker, so it is not optional for the Diff view.
(self as unknown as {MonacoEnvironment: monaco.Environment}).MonacoEnvironment = {
  getWorker: () => new editorWorker(),
};

export const THEME_NAME = 'compilerlens-dark';

/** Matches --surface-1 in styles.css, so the editor sits flush with the app shell. */
const SURFACE_1 = '#1a1a19';

function registerMlir(m: typeof monaco): void {
  m.languages.register({id: 'mlir'});
  m.languages.setMonarchTokensProvider('mlir', {
    defaultToken: '',
    tokenizer: {
      root: [
        [/\/\/.*$/, 'comment'],
        // Dialect-qualified operation name: the most important thing to see at a glance.
        [/\b[a-z_][\w]*(?:\.[a-zA-Z_$][\w$]*)+/, 'keyword'],
        // Aggregate and dialect types.
        [/\b(?:tensor|vector|memref)(?=<)/, 'type'],
        [/![\w.]+/, 'type'],
        [/\b(?:[fi](?:8|16|32|64)|bf16|index)\b/, 'type'],
        // Attribute aliases such as #hal.pipeline.layout.
        [/#[\w.]+/, 'attribute'],
        // SSA values and block arguments.
        [/%[\w$.#-]+/, 'variable'],
        // Symbol references.
        [/@[\w$.-]+/, 'symbol-ref'],
        // Block labels.
        [/\^[\w.]+/, 'label'],
        [/\b(?:func|module|return|loc|dense|affine_map|true|false)\b/, 'keyword.control'],
        [/"[^"]*"/, 'string'],
        [/-?\b\d+\.\d+(?:e[-+]?\d+)?\b/, 'number.float'],
        [/-?\b\d+\b/, 'number'],
      ],
    },
  });
}

function registerLlvmIr(m: typeof monaco): void {
  m.languages.register({id: 'llvm-ir'});
  m.languages.setMonarchTokensProvider('llvm-ir', {
    defaultToken: '',
    tokenizer: {
      root: [
        [/;.*$/, 'comment'],
        [
          /\b(?:define|declare|ret|br|switch|invoke|call|tail|alloca|load|store|getelementptr|phi|select|icmp|fcmp|add|sub|mul|fadd|fsub|fmul|fdiv|fneg|sdiv|udiv|and|or|xor|shl|lshr|ashr|zext|sext|trunc|fpext|fptrunc|bitcast|insertelement|extractelement|shufflevector|insertvalue|extractvalue|unreachable)\b/,
          'keyword',
        ],
        [
          /\b(?:void|float|double|half|ptr|label|i1|i8|i16|i32|i64|i128|x|nsw|nuw|inbounds|align|nocapture|noundef|internal|private|external|constant|global|dso_local|zeroinitializer|undef|poison|null)\b/,
          'type',
        ],
        [/![\w.]*/, 'attribute'],
        [/%[\w$.-]+/, 'variable'],
        [/@[\w$.-]+/, 'symbol-ref'],
        [/"[^"]*"/, 'string'],
        [/-?\b\d+\.\d+(?:e[-+]?\d+)?\b/, 'number.float'],
        [/-?\b(?:0x[0-9a-fA-F]+|\d+)\b/, 'number'],
      ],
    },
  });
}

function registerAsm(m: typeof monaco): void {
  m.languages.register({id: 'x86asm'});
  m.languages.setMonarchTokensProvider('x86asm', {
    defaultToken: '',
    tokenizer: {
      root: [
        [/[#;].*$/, 'comment'],
        // Assembler directives.
        [/^\s*\.[\w.]+/, 'attribute'],
        // Labels.
        [/^[\w.$]+:/, 'label'],
        // SIMD registers, called out because vector width is exactly what we came to see.
        [/%(?:zmm|ymm|xmm)\d+/, 'type'],
        [/%[a-z][\w]*/, 'variable'],
        // Mnemonic: first token on an indented line.
        [/^\s+[a-z][a-z0-9.]*/, 'keyword'],
        [/\$-?(?:0x[0-9a-fA-F]+|\d+)/, 'number'],
        [/-?\b(?:0x[0-9a-fA-F]+|\d+)\b/, 'number'],
      ],
    },
  });
}

function defineTheme(m: typeof monaco): void {
  m.editor.defineTheme(THEME_NAME, {
    base: 'vs-dark',
    inherit: true,
    rules: [
      {token: '', foreground: 'd4d3cb'},
      {token: 'comment', foreground: '6f6d67', fontStyle: 'italic'},
      {token: 'keyword', foreground: '82b7f5'},
      {token: 'keyword.control', foreground: 'c39ae8'},
      {token: 'type', foreground: '5cc7a0'},
      {token: 'attribute', foreground: 'b58a4d'},
      {token: 'variable', foreground: 'e0dfd6'},
      {token: 'symbol-ref', foreground: 'e8a05f'},
      {token: 'label', foreground: 'd77fa2'},
      {token: 'string', foreground: 'cf9178'},
      {token: 'number', foreground: 'b6cea8'},
      {token: 'number.float', foreground: 'b6cea8'},
    ],
    colors: {
      'editor.background': SURFACE_1,
      'editorGutter.background': SURFACE_1,
      // Note: Monaco ignores a 'minimap.background' entry here -- the column stays
      // transparent and long unwrapped IR lines show through behind it. That is fixed with
      // a CSS rule in styles.css instead.
      'minimapSlider.background': '#ffffff10',
      'minimapSlider.hoverBackground': '#ffffff18',
      'minimapSlider.activeBackground': '#ffffff22',
      'editor.lineHighlightBackground': '#22222180',
      'editorLineNumber.foreground': '#55544f',
      'editorLineNumber.activeForeground': '#898781',
      'editorIndentGuide.background1': '#26262400',
      'editor.selectionBackground': '#2f4a6b',
      'editorWidget.background': '#222221',
      'diffEditor.insertedTextBackground': '#0ca30c22',
      'diffEditor.removedTextBackground': '#d03b3b22',
    },
  });
}

let initialised = false;

/** Idempotent; safe to call from module scope. */
export function setupMonaco(): void {
  if (initialised) return;
  initialised = true;

  registerMlir(monaco);
  registerLlvmIr(monaco);
  registerAsm(monaco);
  defineTheme(monaco);
  loader.config({monaco});
}

/** Map an artifact stage language onto a registered Monaco language id. */
export function monacoLanguage(language: string): string {
  switch (language) {
    case 'mlir':
      return 'mlir';
    case 'llvm':
      return 'llvm-ir';
    case 'asm':
      return 'x86asm';
    case 'python':
      return 'python';
    default:
      return 'plaintext';
  }
}
