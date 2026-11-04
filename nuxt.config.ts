// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2026-11-03',
  devtools: { enabled: true },
  modules: [
    '@pinia/nuxt',
  ],
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
  }
})
