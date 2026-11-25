<script setup lang="ts">
import type { Team } from '~/types/team'
import type { Element } from '~/types/character'
import { getElementColors } from '~/constants/elements'

const props = defineProps<{ team: Team }>()

const members = computed(() =>
  props.team.members.map(({ character }) => {
    const { color, icon } = getElementColors(character.element as Element)
    return {
      icon,
      character,
      displayName: character.name.toLowerCase() === 'traveler' ? `${character.element} Traveler` : character.name,
      color,
      gradient: `linear-gradient(to bottom, color-mix(in srgb, ${color} 55%, #1c1c28), color-mix(in srgb, ${color} 25%, #1c1c28))`,
    }
  })
)

const elements = computed(() => members.value.map(m => m.character.element).join(', '))

const slug = computed(() => props.team.name.toLowerCase().replace(/ /g, '-'))
</script>

<template>
  <NuxtLink :to="`/teams/${slug}`" class="team-row">
    <div class="team-row__info">
      <h2 class="team-row__name font-genshin">{{ team.name }}</h2>
      <div class="team-row__elements" role="img" :aria-label="`Elements: ${elements}`">
        <img v-for="m in members" :key="m.character.id" :src="m.icon" alt="" width="18" height="18" class="team-row__element" />
      </div>
    </div>

    <ul class="team-row__lineup">
      <li v-for="m in members" :key="m.character.id" class="team-row__member">
        <img
          :src="m.character.icon"
          alt=""
          width="118"
          height="96"
          loading="lazy"
          class="team-row__portrait"
          :style="{ background: m.gradient }"
        />
        <span class="team-row__member-name">{{ m.displayName }}</span>
      </li>
    </ul>
  </NuxtLink>
</template>
