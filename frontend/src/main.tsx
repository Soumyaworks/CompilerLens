import 'golden-layout/dist/css/goldenlayout-base.css';
import 'golden-layout/dist/css/themes/goldenlayout-dark-theme.css';
import 'tom-select/dist/css/tom-select.css';

import {StrictMode} from 'react';
import {createRoot} from 'react-dom/client';

import {App} from './App';
import {setupMonaco} from './monaco/setup';
// Imported last so its `.lm_*`/`.ts-*` overrides win the cascade over the library defaults.
import './styles.css';

// Register the MLIR/LLVM/asm grammars and point the loader at the bundled Monaco before
// any editor mounts.
setupMonaco();

const container = document.getElementById('root');
if (!container) throw new Error('#root not found');

createRoot(container).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
