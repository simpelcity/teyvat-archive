import process from 'node:process'

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2026-11-03',
  devtools: { enabled: true },
  modules: [
    '@pinia/nuxt',
    '@bootstrap-vue-next/nuxt',
    '@nuxtjs/supabase'
  ],
  build: {
    transpile: ['@lucide/vue']
  },
  supabase: {
    // Public read-only data, no login required
    redirect: false,
    types: '~/types/database.types.ts'
  },
  runtimeConfig: {
    public: {
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_KEY
    }
  },
  css: [
    '~/assets/styles/main.scss',
  ],
  typescript: {
    strict: true
  },
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          quietDeps: true,
          silenceDeprecations: ["import", "color-functions", "global-builtin", "if-function"]
        }
      }
    }
  },
  app: {
    head: {
      link: [
        {
          rel: 'icon',
          type: 'image/svg+xml',
          href: '/favicon.ico'
        }
      ]
    }
  }
})
