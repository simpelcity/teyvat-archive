<script setup lang="ts">
useHead({
  title: 'Home'
})

import { characters } from '~/data/characters'

const query = ref('')

const isTraveler = (c: typeof characters[number]) => c.name.toLowerCase() === 'traveler'

const displayName = (c: typeof characters[number]) =>
  isTraveler(c) ? `${c.element} Traveler` : c.name

const filteredCharacters = computed(() => {
  const q = query.value.trim().toLowerCase()
  if (!q) return characters
  return characters.filter(c =>
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