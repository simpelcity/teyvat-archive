import { useLookupsStore } from '~/stores/lookups'

// Requires the lookups store to be loaded (callOnce('lookups', () => useLookupsStore().load()))
export function getWikiUrl(id: number) {
  return useLookupsStore().wikiMap[id]
}
