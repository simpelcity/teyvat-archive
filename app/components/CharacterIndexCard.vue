<script setup lang="ts">
import type { Characters } from '~/types/character'
import { getElementColors } from '~/constants/elements'
import { Star } from '@lucide/vue'

const props = defineProps<{
  character: Characters
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
    <BCard class="h-100" no-body>
      <BCardImg
        :src="character.icon"
        :alt="`${displayName} icon`"
        :style="{
          background: `linear-gradient(to bottom,
            color-mix(in srgb, ${getElementColors(character.element).color} 55%, #1c1c28),
            color-mix(in srgb, ${getElementColors(character.element).color} 25%, #1c1c28))`
        }"
      />

      <BCardBody class="text-center">
        <BCardTitle class="h5">{{ displayName }}</BCardTitle>
  
        <BCardText>
          <Star v-for="n in character.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
        </BCardText>
      </BCardBody>
    </BCard>
  </NuxtLink>
</template>