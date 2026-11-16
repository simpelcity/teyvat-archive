<script setup lang="ts">
import { character_detail } from '~/data/character_detail'
import { property_map } from '~/data/property_map'
import { getElementColors } from '~/constants/elements'
import { getRarityBg } from '~/constants/weapons'
import { Star, MoveLeft } from '@lucide/vue'
import { RiLock2Fill } from '@remixicon/vue';
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

const constellations = computed(() =>
  [...character.constellations].sort((a, b) => a.pos - b.pos)
)

const activeConstellationPos = ref(1)

const activeConstellation = computed(() =>
  constellations.value.find(c => c.pos === activeConstellationPos.value)
)

const properties = computed(() => [
  ...character.base_properties,
  ...character.extra_properties,
])
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
              <div class="card-body text-center p-0 d-flex flex-column h-100">
                <div class="bg-primary rounded-top">
                  <h5 class="font-genshin my-2">{{ character.base.name }}</h5>
                </div>

                <div class="">
                  <img
                    class="w-100 h-100 object-fit-cover rounded-bottom"
                    :src="character.base.image"
                    :alt="`${displayName(character)} image`"
                    :style="{
                      aspectRatio: '4 / 5',
                      background: `linear-gradient(to bottom,
                        color-mix(in srgb, ${getElementColors(character.base.element).color} 55%, #1c1c28),
                        color-mix(in srgb, ${getElementColors(character.base.element).color} 25%, #1c1c28))`
                    }"
                  />

                  <div class="d-flex position-absolute bottom-0 start-0 bg-dark bg-opacity-25 w-100 d-flex justify-content-evenly py-2">
                    <div v-for="skill in character.skills" class="bg-dark bg-opacity-50 rounded-circle border border-secondary position-relative">
                      <img :src="skill.icon" alt="" width="35" height="35" class="" />
                      <span class="position-absolute top-50 start-50 badge rounded-pill bg-dark d-flex justify-content-center align-items-center py-0 px-1 test">{{ skill.level }}</span>
                    </div>
                  </div>
                </div>
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
                  <span class="text-muted">{{ character.weapon.type_name }}</span>
                </div>
              </div>
            </div>
            
            <hr class="mt-2" />

            <div class="row g-3">
              <div class="col col-12">
                <div class="card">
                  <div class="card-header">
                    <h5 class="card-title font-genshin text-primary mb-0">Character Stats</h5>
                  </div>
  
                  <div class="card-body p-0">
                    <div class="row gx-2">
                      <div v-for="p in properties" class="col col-6 prop-div">
                        <div class="d-flex align-items-center justify-content-between py-1 px-2">
                          <div class="d-flex gap-1">
                            <div class="property-img d-flex">
                              <img v-if="getProperty(p.property_type)?.icon" :src="getProperty(p.property_type)?.icon" class="w-100 h-100" />
                            </div>
  
                            <span class="text-muted fw-semibold">{{ getProperty(p.property_type)?.name }}</span>
                          </div>

                          <div class="">
                            <span class="font-genshin">{{ p.final }}</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

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
                      <span class="text-muted small">{{ getProperty(character.weapon.main_property.property_type)?.name }}: {{ character.weapon.main_property.final }}</span>
                      <span class="text-muted small" v-if="character.weapon.sub_property">{{ getProperty(character.weapon.sub_property.property_type)?.name }}: {{ character.weapon.sub_property.final }}</span>
                    </div>
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
                <h5 class="card-title font-genshin text-primary mb-0">Constellations</h5>
              </div>
    
              <div class="card-body">
                <ul class="nav nav-tabs mb-3" role="tablist">
                  <li v-for="c in constellations" :key="c.id" class="nav-item constellation-item" role="presentation">
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
                      <div class="rounded-circle border border-2" :style="{ backgroundColor: getElementColors(character.base.element).bg, boxShadow: `0px 0px 8px 2px ${getElementColors(character.base.element).color}` }">
                        <div class="constellation-icon position-relative overflow-hidden rounded-circle flex-shrink-0 d-flex align-items-center justify-content-center">
                          <div class="constellation-icon_decor position-absolute w-100 h-100 start-0 top-0 d-flex justify-content-center align-items-center">
                            <img :src="c.icon" :alt="c.name" width="30" height="30" class="" />
                          </div>
                          <div v-if="!c.is_actived" class="shell-icon_base position-absolute w-100 h-100 start-0 top-0 d-flex mw-100 align-items-center justify-content-center bg-black bg-opacity-50 rounded-circle">
                            <RiLock2Fill size="15" class="text-light" />
                          </div>
                        </div>
                      </div>
                    </button>
                  </li>
                </ul>
    
                <div v-if="activeConstellation" class="card constellation-card" role="tabpanel">
                  <div class="card-body p-2 d-flex gap-3">
                    <div
                      class="rounded-circle flex-shrink-0 d-flex align-items-center justify-content-center border border-2 constellation-div"
                      :style="{
                        width: '54px',
                        height: '54px',
                        backgroundColor: getElementColors(character.base.element).bg,
                        boxShadow: `0px 0px 8px 3px ${getElementColors(character.base.element).color}`
                      }"
                    >
                      <div class="constellation-icon position-relative overflow-hidden">
                        <div class="constellation-icon_decor position-absolute w-100 h-100 start-0 top-0 d-flex justify-content-center align-items-center">
                          <img :src="activeConstellation.icon" :alt="activeConstellation.name" width="50" height="50" class="" />
                        </div>
                        <div v-if="!activeConstellation.is_actived" class="shell-icon_base position-absolute w-100 h-100 start-0 top-0 d-flex mw-100 align-items-center justify-content-center bg-black bg-opacity-50 rounded-circle">
                          <RiLock2Fill size="30" />
                        </div>
                      </div>
                      
                    </div>
    
                    <div>
                      <div class="d-flex flex-column justify-content-center">
                        <h5 class="mb-0 fw-bold text-primary">{{ activeConstellation.name }}</h5>
                        <p class="small mb-2 text-secondary">Constellation Lv. <span class="text-info">{{ activeConstellation.pos }}</span></p>
                      </div>
    
                      <p class="mb-0 text-muted" v-html="formatEffect(activeConstellation.effect)" />
    
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

        <div class="row">
          <div class="col col-12">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title font-genshin text-primary mb-0">Artifacts</h5>
              </div>

              <div class="card-body">
                <div class="grid">
                  <CharacterArtifactCard
                    v-for="relic in character.relics"
                    :key="relic.id"
                    :relic="relic"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>
</template>