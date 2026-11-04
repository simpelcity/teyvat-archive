<script setup lang="ts">
import { character_detail } from '~/data/character_detail'

const route = useRoute()

const character = computed(() =>
  character_detail.find(c => c.base.name.toLowerCase() === route.params.id || `${c.base.name.toLowerCase()}-${c.base.element.toLowerCase()}` === route.params.id)
)

const characterName = character.value?.base.name === "Traveler" ? `${character.value.base.element} Traveler` : character.value?.base.name

useHead({
  title: characterName
})

console.log('Character:', character.value)

if (!character.value) {
  throw createError({
    statusCode: 404,
    statusMessage: 'Character not found',
  })
}
</script>

<template>
  <main v-if="character" class="container py-5">
    <NuxtLink
      to="/"
      class="btn btn-outline-secondary mb-4"
    >
      &larr; Back to collection
    </NuxtLink>
  </main>
</template>