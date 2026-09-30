import react from '@vitejs/plugin-react';
import {defineConfig} from 'vite';

// Same application and workers, with local API routes and no development artifacts.
export default defineConfig({
  plugins: [react()],
  publicDir: false,
  define: {'import.meta.env.VITE_SANDBOX_API': JSON.stringify('')},
  build: {outDir: '../compilerlens/_web', emptyOutDir: true},
});
