<script setup lang="ts">
import type { Team } from '~/types/team'
import type { Element } from '~/types/character'
import { getElementColors, getElementIcons, getTeamBonus } from '~/constants/elements'
import { Star, MoveLeft, Check, Ban, Diamond } from '@lucide/vue'
import Rarity6 from '~/assets/images/rarity_bg/rarity_6.png'

const route = useRoute()
const supabase = useSupabaseClient()

const slug = decodeURIComponent(String(route.params.id)).toLowerCase()
let name: string

if (slug.match(/-/g)) {
  name = slug
} else {
  name = String(route.params.id).replace(/_/g, ' ')
}

const { data: team } = await useAsyncData(`team-${route.params.id}`, async () => {
  const { data, error } = await supabase
    .from('teams')
    .select('id, name, members:team_members(position, character:characters(*))')
    .ilike('name', name)
    .order('position', { referencedTable: 'team_members' })
    .maybeSingle()

  if (error) throw error
  return data as Team | null
})

if (!team.value) {
  throw createError({ statusCode: 404, statusMessage: 'Team not found', fatal: true })
}

useHead({ title: team.value.name })

const elementCounts: Elements = Object.entries(
  Object.groupBy(team.value.members, m => m.character.element)
).map(([name, members]) => ({ name, amount: members!.length}))

const teamBonus = getTeamBonus(elementCounts, team.value)

const elementsArray: Element[] = ["Pyro", "Hydro", "Electro", "Cryo", "Anemo", "Geo", "Dendro"]

console.log('elements:', elementCounts)
</script>

<template>
  <main v-if="team">
    <BContainer class="p-3 py-md-4">
      <NuxtLink
        to="/teams"
        class="nuxt-link btn btn-outline-secondary mb-4 d-flex align-items-center gap-1"
      >
        <MoveLeft />
        <span class="back-btn-text">Back to Teams</span>
      </NuxtLink>

      <div class="border-bottom mb-4 text-center">
        <h1>{{ team.name }}</h1>
      </div>

      <section class="mb-4 text-center" aria-labelledby="members-heading">
        <h2 id="members-heading">Members</h2>

        <BRow cols="4">
          <BCol v-for="member in team.members" :key="member.character.id">
            <BCard class="" no-body>
              <div class="d-flex align-items-center justify-content-center gap-1 py-1">
                <span class="fs-5">{{ member.character.name.toLowerCase() === 'traveler' ? `${member.character.element} Traveler` : member.character.name }}</span>
                <img
                  :src="getElementIcons(member.character.element as Element).image"
                  width="25"
                  height="25"
                />
              </div>

              <img
                :src="member.character.image"
                :alt="`${member.character.name.toLowerCase() === 'traveler' ? `${member.character.element} Traveler` : member.character.name} icon`"
                :style="{
                  aspectRatio: '8 / 9',
                  background: `${member.character.name !== 'Manekina' ? `linear-gradient(to bottom,
                    color-mix(in srgb, ${getElementColors(member.character.element as Element).color} 55%, #1c1c28),
                    color-mix(in srgb, ${getElementColors(member.character.element as Element).color} 25%, #1c1c28))` : `url(${Rarity6}) no-repeat center / cover`}`
                }"
                class="object-fit-cover"
              />

              <div class="d-flex flex-column align-items-center py-2">
                <span>Position: {{ member.position }}</span>
              </div>
            </BCard>
          </BCol>
        </BRow>
      </section>

      <section aria-labelledby="bonus-heading">
        <h2 id="bonus-heading" class="text-center">Team Bonus</h2>

        <BRow>
          <BCol cols="4" class="elements-circle">
            <div class="position-relative h-100">
              <!--<div v-for="element in elementCounts">
                <img
                  :src="getElementIcons(element.name as Element).icon"
                  :alt="`${element.name} icon`"
                  width="30"
                  height="30"
                  class=""
                />
              </div>-->
              <img v-for="element in elementsArray" :src="getElementIcons(element).icon" width="50" height="50" :class="`border border-3 rounded-circle ${element.toLowerCase()}-icon element-icon`" :style="{ background: `${getElementColors(element).bg2}`, borderColor: `${getElementColors(element).color} !important`, padding: '2px' }" />
            </div>
          </BCol>
          <BCol cols="8">
            <div class="d-flex flex-column ms-5">
              <div v-for="bonus in teamBonus">
                <div :class="`d-flex bg-dark-subtle justify-content-between fs-5 py-1 px-3 rounded-1 ${bonus.active ? '' : 'opacity-25'}`">
                  <div v-if="bonus.element !== 'any'" class="d-flex align-items-center column-gap-1">
                    <img :src="getElementIcons(bonus.element as Element).icon" width="25" height="25" class="border border-2 rounded-circle" :style="{ background: `${getElementColors(bonus.element as Element).bg2}`, borderColor: `${getElementColors(bonus.element as Element).color} !important` }" />
                    <img :src="getElementIcons(bonus.element as Element).icon" width="25" height="25" class="border border-2 rounded-circle" :style="{ background: `${getElementColors(bonus.element as Element).bg2}`, borderColor: `${getElementColors(bonus.element as Element).color} !important` }" />
                  </div>
                  <span v-else :class="`text-primary`">Any 4 Unique Elements</span>

                  <span v-if="bonus.active">Activated <Check class="text-success" :size="30" /></span>
                  <span v-else><Ban class="mirror text-secondary" /></span>
                </div>

                <div class="p-3">
                  <h5 :class="`${bonus.active ? 'text-primary' : 'text-secondary opacity-50'}`"><Diamond class="" :fill="bonus.active ? '#d3bc8e' : 'transparent'" :size="10" /> {{ bonus.name }}</h5>

                  <p :class="`${bonus.active ? '' : 'text-secondary opacity-50'}`">{{ bonus.description }}</p>
                </div>
              </div>
            </div>
          </BCol>
        </BRow>
      </section>
    </BContainer>
  </main>
</template>