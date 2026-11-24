// Syncs characters.json from the genshin-account repo into Supabase; only changed rows are written.
// Usage: pnpm sync [path/to/characters.json]
// Needs SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env, and supabase/sync_characters.sql run once.
import { readFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

const file = process.argv[2] ?? '../genshin-account/characters.json'
const url = process.env.SUPABASE_URL
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !serviceKey) {
  console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY (see .env.example)')
  process.exit(1)
}

const { characters } = JSON.parse(readFileSync(file, 'utf8'))
if (!Array.isArray(characters)) {
  console.error(`${file} has no "characters" array`)
  process.exit(1)
}

const supabase = createClient(url, serviceKey, { auth: { persistSession: false } })
const { data, error } = await supabase.rpc('sync_characters', { payload: characters })
if (error) {
  console.error(`Sync failed, nothing was saved: ${error.message}`)
  process.exit(1)
}
console.log(`Synced ${characters.length} characters, ${data} rows changed.`)
