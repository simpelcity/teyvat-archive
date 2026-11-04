<script setup lang="ts">
import { character_detail } from '~/data/character_detail'
import { property_map } from '~/data/property_map'
import { getElementColors } from '~/constants/elements'
import { getRarityBg } from '~/constants/weapons'
import { Star } from '@lucide/vue'

const route = useRoute()

const characterComputed = computed(() =>
  character_detail.find(c => c.base.name.toLowerCase() === route.params.id || `${c.base.name.toLowerCase()}-${c.base.element.toLowerCase()}` === route.params.id)
)

const character = characterComputed.value

if (!character) {
  throw createError({
    statusCode: 404,
    statusMessage: 'Character not found',
  })
}

const characterName = character.base.name === "Traveler" ? `${character.base.element} Traveler` : character.base.name

useHead({
  title: characterName
})

console.log('Character:', character)

const isTraveler = (c: typeof character) => c.base.name.toLowerCase() === 'traveler'

const displayName = (c: typeof character) =>
  isTraveler(c) ? `${c.base.element} Traveler` : c.base.name

function getProperty(id: number) {
  const property = property_map.find(p => p.property_type === id)
  return property
}
</script>

<template>
  <main v-if="character">
    <div class="container p-3 py-md-4">
      <section class="mb-4">
        <NuxtLink
          to="/"
          class="btn btn-outline-secondary"
        >
          &larr; Back to collection
        </NuxtLink>
      </section>

      <section class="">
        <div class="row">
          <div class="col col-md-4">
            <div class="card">
              <div class="card-body text-center p-0 d-flex flex-column">
                <div class="bg-primary rounded-top">
                  <h4 class="font-genshin my-2">{{ character.base.name }}</h4>
                </div>
                <img
                  class="w-100 object-fit-cover rounded-bottom"
                  :src="character.base.image"
                  :alt="`${displayName(character)} image`"
                  style="aspect-ratio: 4 / 5"
                />
              </div>
            </div>
          </div>

          <div class="col col-md-8">
            <div class="d-flex align-items-center gap-2">
              <img class="" width="60" height="60" :src="getElementColors(character.base.element).icon" />
              <div>
                <div class="d-flex align-items-center gap-2">
                  <h3 class="font-genshin mb-0">{{ displayName(character) }}</h3>
                  <div class="badge text-bg-primary">Lv. {{ character.base.level }}</div>
                </div>
                <div class="d-flex align-items-center gap-2 text-muted">
                  <div>
                    <Star v-for="n in character.base.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
                  </div>
                  |
                  <span class="">{{ character.weapon.type_name }}</span>
                </div>
              </div>
            </div>
            
            <hr />

            <div class="row">
              <div class="col col-md-7">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title font-genshin text-primary mb-0">Weapon</h4>
                  </div>
                  <div class="card-body d-flex gap-3">
                    <div
                      class="rounded flex-shrink-0 align-self-start"
                      :style="{
                        background: `url(${getRarityBg(character.weapon.rarity)}) no-repeat center / cover`,
                        width: '80px',
                        height: '80px',
                      }"
                    >
                      <img class="d-block w-100 h-100" :src="character.weapon.icon" :alt="character.weapon.name" />
                    </div>

                    <div class="d-flex flex-column">
                      <div class="d-flex align-items-center gap-2">
                        <h4 class="mb-0 fw-bold">{{ character.weapon.name }}</h4>
                        <div class="badge text-bg-secondary py-1 rounded-1">Lv. {{ character.weapon.level }}</div>
                      </div>

                      <span class="text-primary fw-semibold">Refinement Rank {{ character.weapon.affix_level }}</span>
                      <span class="text-secondary">{{ getProperty(character.weapon.main_property.property_type)?.name }}: {{ character.weapon.main_property.final }}</span>
                      <span class="text-secondary" v-if="character.weapon.sub_property">{{ getProperty(character.weapon.sub_property.property_type)?.name }}: {{ character.weapon.sub_property.final }}</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col col-md-6"></div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>
</template>



<!-- <div class="row align-items-center g-4">

          <div class="col-md-4">
            <div class="card">
              <div class="card-body text-center">
                <h1 class="h3 mb-3">
                  {{ character.base.name }}
                </h1>

                <p class="text-secondary">
                  {{ character.base.element }}
                </p>

                <span class="badge bg-warning text-dark">
                  {{ character.base.rarity }} Star
                </span>
              </div>
            </div>
          </div>

          <div class="col-md-8">
            <h2 class="display-5 fw-bold">
              {{ character.base.name }}
            </h2>

            <p class="text-secondary">
              {{ character.weapon.type_name }}
            </p>

            <hr />

            <div class="row g-3">

              <div class="col-6">
                <div class="card">
                  <div class="card-body">
                    <small class="text-secondary">Level</small>
                    <h3>{{ character.base.level }}</h3>
                  </div>
                </div>
              </div>

              <div class="col-6">
                <div class="card">
                  <div class="card-body">
                    <small class="text-secondary">Constellation</small>
                    <h3>C{{ character.base.actived_constellation_num }}</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div> -->