<script setup lang="ts">
import { character_detail } from '~/data/character_detail'
import { property_map } from '~/data/property_map'
import { getElementColors } from '~/constants/elements'
import { getRarityBg } from '~/constants/weapons'
import { Star, MoveLeft, LockKeyhole } from '@lucide/vue'
import '@/assets/styles/pages/CharacterDetail.scss'

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

const tabs = [
  { id: 'weapon', label: 'Weapon' },
  { id: 'artifacts', label: 'Artifacts' },
  { id: 'constellations', label: 'Constellations' },
] as const

type TabId = (typeof tabs)[number]['id']

const activeTab = ref<TabId>('weapon')

const constellations = computed(() =>
  [...character.constellations].sort((a, b) => a.pos - b.pos)
)

const activeConstellationPos = ref(1)

const activeConstellation = computed(() =>
  constellations.value.find(c => c.pos === activeConstellationPos.value)
)
</script>

<template>
  <main v-if="character">
    <div class="container p-3 py-md-4">
      <NuxtLink
        to="/"
        class="nuxt-link btn btn-outline-secondary mb-4 d-flex align-items-center gap-1"
      >
        <MoveLeft />
        <span class="back-btn-text fw-bold">Back to collection</span>
      </NuxtLink>

      <section class="d-flex flex-column gap-3">
        <div class="row g-3">
          <div class="col col-md-4">
            <div class="card">
              <div class="card-body text-center p-0 d-flex flex-column">
                <div class="bg-primary rounded-top">
                  <h5 class="font-genshin my-2">{{ character.base.name }}</h5>
                </div>
                <img
                  class="w-100 object-fit-cover rounded-bottom"
                  :src="character.base.image"
                  :alt="`${displayName(character)} image`"
                  :style="{
                    aspectRatio: '4 / 5',
                    background: `linear-gradient(to bottom,
                      color-mix(in srgb, ${getElementColors(character.base.element).color} 55%, #1c1c28),
                      color-mix(in srgb, ${getElementColors(character.base.element).color} 25%, #1c1c28))`
                  }"
                />
              </div>
            </div>
          </div>

          <div class="col col-md-8">
            <div class="d-flex align-items-center gap-2">
              <img class="" width="50" height="50" :src="getElementColors(character.base.element).icon" />
              <div>
                <div class="d-flex align-items-center gap-2">
                  <h4 class="font-genshin mb-0">{{ displayName(character) }}</h4>
                  <div class="badge text-bg-primary">Lv. {{ character.base.level }}</div>
                </div>
                <div class="d-flex align-items-center gap-2 text-muted">
                  <div class="d-flex">
                    <Star v-for="n in character.base.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
                  </div>
                  |
                  <span class="">{{ character.weapon.type_name }}</span>
                </div>
              </div>
            </div>
            
            <hr />

            <div class="row g-3">
              <div class="col col-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="card-title font-genshin text-primary mb-0">Weapon</h5>
                  </div>
  
                  <div class="card-body d-flex gap-3 py-2">
                    <div
                      class="rounded flex-shrink-0 align-self-center"
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
                        <h5 class="mb-0 fw-bold">{{ character.weapon.name }}</h5>
                        <div class="badge text-bg-secondary rounded-1">Lv. {{ character.weapon.level }}</div>
                      </div>
  
                      <span class="text-primary fw-bold small">Refinement Rank {{ character.weapon.affix_level }}</span>
                      <span class="text-secondary small">{{ getProperty(character.weapon.main_property.property_type)?.name }}: {{ character.weapon.main_property.final }}</span>
                      <span class="text-secondary small" v-if="character.weapon.sub_property">{{ getProperty(character.weapon.sub_property.property_type)?.name }}: {{ character.weapon.sub_property.final }}</span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col col-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="card-title font-genshin text-primary mb-0">Character Stats</h5>
                  </div>
  
                  <div class="card-body py-2">
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col col-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title font-genshin text-primary mb-0">Constellation</h5>
              </div>
    
              <div class="card-body py-2">
                <ul class="nav nav-tabs mb-3" role="tablist">
                  <li v-for="c in constellations" :key="c.id" class="nav-item" role="presentation">
                    <button
                      type="button"
                      class="nav-link d-flex flex-column align-items-center gap-1"
                      :class="{
                        active: activeConstellationPos === c.pos,
                        'constellation-locked': !c.is_actived,
                      }"
                      role="tab"
                      :aria-selected="activeConstellationPos === c.pos"
                      @click="activeConstellationPos = c.pos"
                    >
                      C{{ c.pos }}
                    </button>
                  </li>
                </ul>
    
                <div v-if="activeConstellation" class="card" role="tabpanel">
                  <div class="card-body p-2 d-flex gap-3">
                    <div
                      class="rounded-circle flex-shrink-0 d-flex align-items-center justify-content-center"
                      :style="{
                        width: '64px',
                        height: '64px',
                        backgroundColor: getElementColors(character.base.element).bg,
                      }"
                    >
                      <img :src="activeConstellation.icon" :alt="activeConstellation.name" width="50" height="50" />
                    </div>
    
                    <div>
                      <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge text-bg-secondary">C{{ activeConstellation.pos }}</span>
                        <h5 class="mb-0 fw-bold">{{ activeConstellation.name }}</h5>
                        <span v-if="!activeConstellation.is_actived" class="badge text-bg-dark"><LockKeyhole /> Locked</span>
                      </div>
    
                      <p class="mb-0 text-secondary" v-html="formatEffect(activeConstellation.effect)" />
    
                      <p
                        v-if="activeConstellation.is_enhanced && activeConstellation.enhanced_effect"
                        class="mb-0 mt-2"
                        v-html="formatEffect(activeConstellation.enhanced_effect)"
                      />
                    </div>
                  </div>
                </div>
              </div>
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