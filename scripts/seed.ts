// One-off / re-runnable import of the static data in app/data into Supabase.
// Usage: put SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env, then `pnpm seed`.
// Upserts, so running it again just refreshes the rows.
import { createClient } from '@supabase/supabase-js'
import { characters } from '../app/data/characters'
import { character_detail } from '../app/data/character_detail'
import { property_map } from '../app/data/property_map'
import { skill_map } from '../app/data/skill_map'
import { wiki_map } from '../app/data/wiki_map'

const url = process.env.SUPABASE_URL
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !serviceKey) {
  console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY (see .env.example)')
  process.exit(1)
}

// Service role bypasses RLS. Only ever use it in scripts, never in the Nuxt app.
const supabase = createClient(url, serviceKey, { auth: { persistSession: false } })

async function upsert(table: string, rows: object[], chunkSize = 50) {
  for (let i = 0; i < rows.length; i += chunkSize) {
    const { error } = await supabase.from(table).upsert(rows.slice(i, i + chunkSize))
    if (error) throw new Error(`${table}: ${error.message}`)
  }
  console.log(`✔ ${table}: ${rows.length} rows`)
}

await upsert('characters', characters.map((c, position) => ({ id: c.id, position, data: c })))
// Detail rows are large, so send fewer per request
await upsert('character_details', character_detail.map(c => ({ id: c.base.id, data: c })), 10)
await upsert('property_map', property_map)
await upsert('skill_map', Object.entries(skill_map).map(([id, name]) => ({ id: Number(id), name })))
await upsert('wiki_map', Object.entries(wiki_map).map(([id, url]) => ({ id: Number(id), url })))

console.log('Done.')
