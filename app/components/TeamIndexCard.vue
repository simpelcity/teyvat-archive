<script setup lang="ts">
import type { Team } from '~/types/team'
import type { Element } from '~/types/character'
import { getElementColors } from '~/constants/elements'

const props = defineProps<{ team: Team }>()

const members = computed(() =>
  props.team.members.map(({ character }) => {
    const { color, flat } = getElementColors(character.element as Element)
    return {
      flat,
      character,
      displayName: character.name.toLowerCase() === 'traveler' ? `${character.element} Traveler` : character.name,
      color,
      gradient: `linear-gradient(to bottom, color-mix(in srgb, ${color} 55%, #1c1c28), color-mix(in srgb, ${color} 25%, #1c1c28))`,
    }
  })
)

const elements = computed(() => members.value.map(m => m.character.element).join(', '))

const slug = computed(() => props.team.name.toLowerCase().replace(/ /g, '_'))
</script>

<template>
  <NuxtLink :to="`/teams/${slug}`" class="team-row text-decoration-none">
    <BCard class="" no-body>
      <BCardBody class="d-flex align-items-center gap-4 w-100">
        <div class="team-row__info flex-grow-1 flex-shrink-1">
          <h2 class="team-row__name font-genshin fs-4">{{ team.name }}</h2>
          <div class="team-row__elements d-flex gap-1" role="img" :aria-label="`Elements: ${elements}`">
            <img v-for="m in members" :key="m.character.id" :src="m.flat" :style="{ borderColor: `${m.color} !important`, padding: '1px' }" alt="" width="30" height="30" class="team-row__element rounded-circle border border-2 bg-dark" />
          </div>
        </div>
    
        <ul class="team-row__lineup list-unstyled m-0">
          <li v-for="m in members" :key="m.character.id" class="team-row__member text-center">
            <div class="member-side_icon-wrap rounded-circle border border-2" :style="{ background: `${getElementColors(m.character.element as Element).bg}`, boxShadow: `0px 0px 6px 3px ${getElementColors(m.character.element as Element).color}` }">
              <img
                :src="m.character.side_icon"
                :alt="`${m.displayName} side icon`"
                loading="lazy"
                class="team-row__portrait side-icon"
              />
            </div>
            <span class="team-row__member-name">{{ m.displayName }}</span>
          </li>
        </ul>
      </BCardBody>
    </BCard>
  </NuxtLink>
</template>
