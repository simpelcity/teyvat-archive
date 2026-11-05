<script setup lang="ts">
import type { BaseCharacter } from '~/types/character'
import { getElementColors } from '~/constants/elements'
import { Star } from '@lucide/vue'

const props = defineProps<{
  character: BaseCharacter
}>()

const isTraveler = computed(() => props.character.name.toLowerCase() === 'traveler')

const displayName = computed(() =>
  isTraveler.value ? `${props.character.element} Traveler` : props.character.name
)

const slug = computed(() =>
  isTraveler.value
    ? `traveler-${props.character.element.toLowerCase()}`
    : props.character.name.toLowerCase()
)
</script>

<template>
  <NuxtLink :to="`/characters/${slug}`" class="text-decoration-none">
    <div class="card rounded">
      <img
        :src="character.icon"
        :alt="`${displayName} icon`"
        class="card-img-top"
        :style="{
          background: `linear-gradient(to bottom,
            color-mix(in srgb, ${getElementColors(character.element).color} 55%, #1c1c28),
            color-mix(in srgb, ${getElementColors(character.element).color} 25%, #1c1c28))`
        }"
      />

      <div class="card-body text-center">
        <h5 class="card-title font-genshin">{{ displayName }}</h5>

        <Star v-for="n in character.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
      </div>
    </div>
  </NuxtLink>
</template>