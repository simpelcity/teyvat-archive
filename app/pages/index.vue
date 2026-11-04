<script setup lang="ts">
useHead({
  title: 'Home'
})

import { characters } from '~/data/characters'
import { getElementColors } from '~/constants/elements'
import { Star } from '@lucide/vue'

const query = ref('')

const isTraveler = (c: typeof characters[number]) => c.name.toLowerCase() === 'traveler'

const displayName = (c: typeof characters[number]) =>
  isTraveler(c) ? `${c.element} Traveler` : c.name

const slug = (c: typeof characters[number]) =>
  isTraveler(c) ? `traveler-${c.element.toLowerCase()}` : c.name.toLowerCase()

const filteredCharacters = computed(() => {
  const q = query.value.trim().toLowerCase()
  if (!q) return characters
  return characters.filter(c =>
    displayName(c).toLowerCase().includes(q) ||
    c.element.toLowerCase().includes(q)
  )
})

console.log('Characters:', characters)
</script>

<template>
  <main>
    <div class="container p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teyvat Archive</h1>
        <input
          v-model="query"
          type="search"
          class="form-control mt-3 shadow-none border-secondary"
          placeholder="Search by name or element…"
          aria-label="Search characters"
        />
      </section>

      <section>
        <div v-if="filteredCharacters.length" class="grid">
          <NuxtLink
            v-for="character in filteredCharacters"
            :key="character.id"
            :to="`/characters/${slug(character)}`"
            class="text-decoration-none"
          >
            <div class="card rounded">
              <img :src="`${character.icon}`" :alt="`${displayName(character)} icon`" class="mw-100 rounded-top" :style="`background-color: ${getElementColors(character.element).color};`" />
              <div class="card-body">
                <h5 class="card-title font-genshin">{{ displayName(character) }}</h5>
                <Star v-for="n in character.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
              </div>
            </div>
          </NuxtLink>
        </div>
      </section>
    </div>
  </main>
</template>