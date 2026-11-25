<script setup lang="ts">
import type { Character } from '~/types/character'
import { getElementColors } from '~/constants/elements'
import { Star } from '@lucide/vue'
import Rarity6 from '~/assets/images/rarity_bg/rarity_6.png'

const props = defineProps<{
  character: Character
}>()

const isTraveler = computed(() => props.character.name.toLowerCase() === 'traveler')

const displayName = computed(() =>
  isTraveler.value ? `${props.character.element} Traveler` : props.character.name
)

const slug = computed(() =>
  isTraveler.value
    ? `${props.character.element.toLowerCase()}-traveler`
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
          background: `${character.name !== 'Manekina' ? `linear-gradient(to bottom,
            color-mix(in srgb, ${getElementColors(character.element).color} 55%, #1c1c28),
            color-mix(in srgb, ${getElementColors(character.element).color} 25%, #1c1c28))` : `url(${Rarity6}) no-repeat center / cover`}`
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