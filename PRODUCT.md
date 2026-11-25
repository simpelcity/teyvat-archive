# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users
One user: the owner of the Genshin Impact account. They use Teyvat Archive as a personal archive of their own account: looking up a character's build, checking what a team is made of, and keeping track of progress. Nobody else is the audience.

## Product Purpose
A personal, browsable record of one Genshin Impact account: characters with their builds (weapon, artifacts, talents, constellations, stats) and the teams the owner plays. It exists so the owner can find and read their own data faster and more pleasantly than in-game or on HoYoLAB. Success: the owner finds a character or team in seconds and understands it at a glance.

## Positioning
It shows exactly one real account, the owner's, synced from their own exported HoYoLAB data, not a general database of all characters or community tier lists.

## Operating Context
- Data comes from the owner's `genshin-account` repo (`characters.json`, `teams.json`) and is synced into Supabase with `pnpm sync`.
- Pages: character index (`/`), character detail (`/characters/<name>`, Traveler as `/characters/<element>-traveler`), teams index (`/teams`), team detail (`/teams/<slug>`).
- Teams index jobs: find a team fast, and see each team's composition (which characters and elements) at a glance.

## Capabilities and Constraints
- Stack: Nuxt 4, Vue 3, Bootstrap 5.3 (SCSS) with BootstrapVueNext, Supabase.
- Characters carry name, element, rarity, weapon type, icon, side icon and full-body image.
- Teams currently have a name and 4 ordered members (characters). More team data is planned (e.g. description, roles, rotation, notes) but not decided; layouts must leave room for it without assuming its shape.
- Traveler can appear with different elements; its display name is "<Element> Traveler".

## Evidence on Hand
- Real account data: 47 characters and 9 teams (`genshin-account/characters.json`, `genshin-account/teams.json`).
- Character art and icons are HoYoverse CDN URLs from that data; element icons live in `app/assets/images/elements`.
- No team descriptions, roles or rotations exist yet; do not invent them.

## Product Principles
- Personal over general: show this account's real data, never filler or placeholder claims.
- Recognition first: characters are recognized by their art and element, so lead with those.
- Fast to scan: the owner is looking something up; the answer should be visible without clicks.
- Grows with the data: new team fields should slot in without a redesign.
