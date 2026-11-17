<script setup lang="ts">
useHead({
  title: 'Home'
})

import type { Characters } from '~/types/character'

const supabase = useSupabaseClient()

const { data: characters } = await useAsyncData('characters', async () => {
  const { data, error } = await supabase.from('characters').select('data').order('position')
  if (error) throw createError({ statusCode: 500, statusMessage: error.message })
  return data.map(row => row.data as Characters)
}, { default: () => [] as Characters[] })

const query = ref('')

const isTraveler = (c: Characters) => c.name.toLowerCase() === 'traveler'

const displayName = (c: Characters) =>
  isTraveler(c) ? `${c.element} Traveler` : c.name

const filteredCharacters = computed(() => {
  const q = query.value.trim().toLowerCase()
  if (!q) return characters.value
  return characters.value.filter(c =>
    displayName(c).toLowerCase().includes(q) ||
    c.element.toLowerCase().includes(q)
  )
})
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