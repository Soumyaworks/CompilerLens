import react from '@vitejs/plugin-react';
import {defineConfig} from 'vite';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    // The dev box is remote, so bind all interfaces rather than localhost only.
    host: true,
  },
});
