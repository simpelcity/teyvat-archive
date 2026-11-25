<script setup lang="ts">
import type { Character, Element as ElementType } from '~/types/character'

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
    .order('id')
  if (error) throw error
  return data.map((build): Character => {
    const bw = build.build_weapons

    return {
      id: build.character.id,
      name: build.character.name,
      icon: build.character.icon,
      image: build.character.image,
      side_icon: build.character.side_icon,
      // DB columns are plain text/int; narrow them to the app's union types
      element: (build.character.element) as ElementType,
      rarity: (build.character.rarity === 5 ? 5 : 4),
      weapon_type: build.character.weapon_type,

      fetter: build.fetter,
      level: build.level,
      actived_constellation_num: build.active_constellation_num,
      is_chosen: build.is_chosen,

      weapon: bw && {
        id: bw.weapon.id,
        name: bw.weapon.name,
        icon: bw.weapon.icon,
        type: bw.weapon.type,
        rarity: bw.weapon.rarity,
        level: bw.level,
        affix_level: bw.affix_level,
      },
    }
  })
}, { default: () => [] as Character[] })

const query = ref('')

const filteredCharacters = computed(() => {
  const q = query.value.trim().toLowerCase()
  if (!q) return characters.value
  return characters.value.filter(c =>
    c.name.toLowerCase().includes(q) || c.element.toLowerCase().includes(q)
  )
})

console.log(characters.value)
</script>

<template>
  <main>
    <BContainer class="p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teyvat Archive</h1>
        <input
          v-model="query"
          type="search"
          id="search-form"
          class="form-control mt-3 shadow-none border-secondary font-nunito fw-bold"
          placeholder="Search by name or element…"
          aria-label="Search characters"
        />
      </section>

      <section>
        <BRow v-if="filteredCharacters.length"  cols="2" cols-md="3" cols-lg="4" cols-xl="5" cols-xxl="6" class="g-3">
          <BCol v-for="character in filteredCharacters" :key="character.id">
            <CharacterIndexCard :character="character" />
          </BCol>
        </BRow>
      </section>
    </BContainer>
  </main>
</template>