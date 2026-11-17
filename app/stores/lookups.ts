import { defineStore } from 'pinia'
import type { PropertyMap } from '~/types/property_map'

/**
 * Small lookup tables (property, skill type and wiki maps) loaded once from Supabase.
 * Load in a page with `await callOnce('lookups', () => useLookupsStore().load())`;
 * components can then read the store directly.
 */
export const useLookupsStore = defineStore('lookups', {
  state: () => ({
    propertyMap: [] as PropertyMap[],
    skillMap: {} as Record<number, string>,
    wikiMap: {} as Record<number, string>,
    loaded: false,
  }),

  actions: {
    async load() {
      if (this.loaded) return
      const supabase = useSupabaseClient()

      const [props, skills, wiki] = await Promise.all([
        supabase.from('property_map').select('*'),
        supabase.from('skill_map').select('*'),
        supabase.from('wiki_map').select('*'),
      ])
      const error = props.error ?? skills.error ?? wiki.error
      if (error) throw createError({ statusCode: 500, statusMessage: error.message })

      this.propertyMap = (props.data ?? []) as PropertyMap[]
      this.skillMap = Object.fromEntries((skills.data ?? []).map(r => [r.id, r.name]))
      this.wikiMap = Object.fromEntries((wiki.data ?? []).map(r => [r.id, r.url]))
      this.loaded = true
    },

    getProperty(id: number) {
      return this.propertyMap.find(p => p.property_type === id)
    },
  },
})
