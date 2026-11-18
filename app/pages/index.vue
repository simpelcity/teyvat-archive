<script setup lang="ts">
import type { Characters, Element as ElementType } from '~/types/character'

useHead({
  title: 'Home'
})

const supabase = useSupabaseClient()

const { data: characters } = await useAsyncData('characters', async () => {
  const { data, error } = await supabase
    .from('character_builds')
    .select(`
      character:characters (
        id,
        name,
        icon,
        element,
        rarity,
        image,
        side_icon,
        weapon_type
      ),

      fetter,
      level,
      active_constellation_num,
      is_chosen,

      build_weapons (
        weapon:weapons (
          id,
          name,
          icon,
          type,
          rarity
        ),
        level,
        affix_level
      )
    `)
  if (error) throw error
  return data.map((build): Characters => {
    const bw = build.build_weapons

    return {
      id: build.character.id,
      name: build.character.name,
      icon: build.character.icon ?? '',
      image: build.character.image ?? '',
      side_icon: build.character.side_icon ?? '',
      // DB columns are plain text/int; narrow them to the app's union types
      element: (build.character.element ?? 'Anemo') as ElementType,
      rarity: (build.character.rarity === 5 ? 5 : 4),
      weapon_type: build.character.weapon_type ?? 0,

      fetter: build.fetter ?? 0,
      level: build.level,
      actived_constellation_num: build.active_constellation_num ?? 0,
      is_chosen: build.is_chosen ?? false,

      weapon: bw && {
        id: bw.weapon.id,
        name: bw.weapon.name,
        icon: bw.weapon.icon ?? '',
        type: bw.weapon.type ?? 0,
        rarity: bw.weapon.rarity ?? 1,
        level: bw.level,
        affix_level: bw.affix_level ?? 1,
      },
    }
  })
}, { default: () => [] as Characters[] })

console.log(characters.value)
</script>

<template>
  <main>
    <BContainer class="p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teyvat Archive</h1>
        <!-- <input
          v-model="query"
          type="search"
          id="search-form"
          class="form-control mt-3 shadow-none border-secondary font-nunito fw-bold"
          placeholder="Search by name or element…"
          aria-label="Search characters"
        /> -->
      </section>

      <section>
        <BRow v-if="characters?.length"  cols="2" cols-md="3" cols-lg="4" cols-xl="5" cols-xxl="6" class="g-3">
          <BCol v-for="character in characters" :key="character.id">
            <CharacterIndexCard :character="character" />
          </BCol>
        </BRow>
      </section>
    </BContainer>
  </main>
</template>