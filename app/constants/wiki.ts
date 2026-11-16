import { wiki_map } from '~/data/wiki_map'

export function getWikiUrl(id: number) {
  return wiki_map[id]
}