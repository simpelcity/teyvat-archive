<script setup lang="ts">
import type { Team } from '~/types/team'
import type { Element } from '~/types/character'
import { getElementColors } from '~/constants/elements'
import { Star, MoveLeft } from '@lucide/vue'
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
  
  console.log(data)

  if (error) throw error
  return data as Team | null
})

console.log(team.value)

if (!team.value) {
  throw createError({ statusCode: 404, statusMessage: 'Team not found', fatal: true })
}

useHead({ title: team.value.name })

const displayName = team.value.members.map(m => m.character.name.toLowerCase() === 'traveler' ? `test` : m.character.name)
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

      <section class="d-flex flex-column text-center">
        <div class="border-bottom mb-4">
          <h1 class="">{{ team.name }}</h1>
        </div>

        <BRow cols="4">
          <BCol v-for="member in team.members" :key="member.character.id">
            <BCard class="" no-body>
              <div class="d-flex align-items-center justify-content-center gap-1 py-1">
                <span class="fs-5">{{ member.character.name.toLowerCase() === 'traveler' ? `${member.character.element} Traveler` : member.character.name }}</span>
                <img
                  :src="getElementColors(member.character.element as Element).icon"
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

        <div class="mt-4">
          <span class="h4">Team Bonus:</span>
        </div>
      </section>
    </BContainer>
  </main>
</template>