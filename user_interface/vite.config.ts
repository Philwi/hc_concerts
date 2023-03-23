import { fileURLToPath, URL } from 'node:url'
import vuePugPlugin from 'vue-pug-plugin'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue({
    template: {
      preprocessOptions: {
        plugins: [
          vuePugPlugin
        ]
      }
    }
  }),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
