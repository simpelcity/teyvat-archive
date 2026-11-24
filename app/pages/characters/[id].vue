<script setup lang="ts">
import { getElementColors } from '~/constants/elements'
import { getRarityBg } from '~/constants/weapons'
import { useLookupsStore } from '~/stores/lookups'
import type { BaseCharacter, BuildSkills, Element } from '~/types/character'
import { Star, MoveLeft } from '@lucide/vue'
import { RiLock2Fill } from '@remixicon/vue';
import '@/assets/styles/pages/CharacterDetail.scss'

const route = useRoute()
const supabase = useSupabaseClient()
const lookups = useLookupsStore()

await callOnce('lookups', () => lookups.load())

// URL is /characters/<name> (e.g. vesna) or /characters/<element>-traveler (e.g. anemo-traveler)
// const slug = String(route.params.id).replace(/["\\]/g, '')
const slug = decodeURIComponent(String(route.params.id)).toLowerCase()

const travelerMatch = slug.match(/^(\w+)-traveler$/)
const name = travelerMatch ? 'traveler' : slug
const element = travelerMatch ? travelerMatch[1] : null

const { data } = await useAsyncData(`character-${slug}`, async () => {
  let query = supabase
    .from('character_builds')
    .select(`
      *,
      character:characters!inner(*),

      build_weapons(
        *,
        weapon:weapons(*),
        properties:build_weapon_properties(
          *,
          property_type:property_types(*)
        )
      ),

      build_relics(
        *,
        relic:relics(*),
        relic_set:relic_sets(
          *,
          affixes:relic_set_affixes(*)
        ),
        substats:build_relic_substats(
          *,
          property:property_types(*)
        ),
        main_property:property_types(*)
      ),

      build_constellations(
        *,
        constellation:constellations(*)
      ),

      build_skills(
        *,
        skill:skills(
          *,
          affixes:skill_affixes(*),
          skill_type:skill_map(*)
        )
      ),

      build_properties(
        *,
        property:property_types(*)
      ),

      build_costumes(
        *,
        costume:costumes(*)
      )
    `)
    .ilike('character.name', name)

  if (element) query = query.ilike('character.element', element)

  const { data, error } = await query.limit(1).maybeSingle()
  if (error) throw error

  return data
})

if (!data.value) {
  throw createError({ statusCode: 404, statusMessage: 'Character not found' })
}

const character = data.value

const characterName = character.character.name === "Traveler" ? `${character.character.element} Traveler` : character.character.name

useHead({
  title: characterName
})

console.log('Character:', character)

const isTraveler = (c: typeof character) => c.character.name.toLowerCase() === 'traveler'

const displayName = (c: typeof character) =>
  isTraveler(c) ? `${c.character.element} Traveler` : c.character.name

const getProperty = (id: number) => lookups.getProperty(id)

const constellations = computed(() =>
  [...character.build_constellations].sort((a, b) => a.constellation.position - b.constellation.position)
)

const activeConstellationIndex = ref(0)

const properties = character.build_properties

const selectedProperties = properties.filter(p => p.category === "selected").sort((a, b) => a.id - b.id)

const skills =computed(() =>
  [...character.build_skills].sort((a, b) => a.id - b.id)
)

const selectedSkill = ref<BuildSkills | null>(null)
const showSkillModal = ref(false)

function openSkill(skill: BuildSkills) {
  selectedSkill.value = skill
  showSkillModal.value = true
}

const skillTabIndex = ref(0)

// Start on "Talent Info" each time a different skill is opened
watch(selectedSkill, () => { skillTabIndex.value = 0 })
</script>

<template>
  <main v-if="character">
    <div class="container p-3 py-md-4">
      <NuxtLink
        to="/"
        class="nuxt-link btn btn-outline-secondary mb-4 d-flex align-items-center gap-1"
      >
        <MoveLeft />
        <span class="back-btn-text">Back to collection</span>
      </NuxtLink>

      <section class="d-flex flex-column gap-3">
        <BRow class="g-3">
          <BCol md="4">
            <BCard no-body>
              <BCardBody class="text-center p-0 d-flex flex-column h-100">
                <div class="bg-primary rounded-top-2">
                  <h5 class="my-2">{{ character.character.name }}</h5>
                </div>
  
                <div>
                  <img
                    class="w-100 h-100 object-fit-cover rounded-bottom"
                    :src="character.character.image ?? ''"
                    :alt="`${displayName(character)} image`"
                    :style="{
                      aspectRatio: '4 / 5',
                      background: `linear-gradient(to bottom,
                        color-mix(in srgb, ${getElementColors(character.character.element as Element).color} 55%, #1c1c28),
                        color-mix(in srgb, ${getElementColors(character.character.element as Element).color} 25%, #1c1c28))`
                    }"
                  />
  
                  <div class="d-flex position-absolute bottom-0 start-0 bg-dark bg-opacity-25 w-100 d-flex justify-content-evenly py-2">
                    <div role="button" @click="openSkill(skill)" v-for="skill in skills" class="bg-dark bg-opacity-50 rounded-circle border border-secondary position-relative">
                      <img :src="skill.skill.icon" alt="" width="35" height="35" class="" />
                      <span class="position-absolute top-50 start-50 badge rounded-pill bg-dark d-flex justify-content-center align-items-center py-0 px-1 test">{{ skill.level }}</span>
                    </div>
                    
                    <BModal v-model="showSkillModal" title="Details" centered no-footer data-bs-theme="dark">
                      <template v-if="selectedSkill">
                        <div class="">
                          <div class="d-flex column-gap-2 mb-3">
                            <div class="bg-dark rounded-circle border border-2 border-secondary">
                              <img :src="selectedSkill.skill.icon" alt="" width="50" height="50" class="" />
                            </div>
  
                            <div class="d-flex flex-column justify-content-center text-start">
                              <span class="text-primary fs-5">{{ selectedSkill.skill.name }}</span>
                              <span class="text-muted">{{ selectedSkill.skill.skill_type.name }} Talent  | Lv. {{ selectedSkill.level }}</span>
                            </div>
                          </div>
  
                          <BTabs
                            v-model:index="skillTabIndex"
                            pills
                            fill
                            justified
                            nav-class="mb-3"
                            content-class="text-start"
                            active-nav-item-class="text-dark"
                            inactive-nav-item-class="bg-light bg-opacity-25 text-light"
                          >
                            <BTab title="Talent Info" title-link-class="rounded-end-0 rounded-start-5">
                              <div class="skill-table-scroll">
                                <p class="text-secondary mb-0" v-html="formatEffect(selectedSkill.skill.description)" />
                              </div>
                            </BTab>

                            <BTab
                              title="Skill Attributes"
                              :title-link-class="selectedSkill.skill.affixes.length ? 'rounded-start-0 rounded-end-5' : 'rounded-start-0 rounded-end-5 text-opacity-0'"
                              :disabled="!selectedSkill.skill.affixes.length"
                            >
                              <div class="d-flex flex-column row-gap-2 px-2 skill-table-scroll">
                                <div
                                  v-for="affix in selectedSkill.skill.affixes"
                                  :key="affix.name"
                                  class="d-flex justify-content-between bg-light bg-opacity-10 py-2 px-3 border border-secondary border-opacity-25"
                                >
                                  <span>{{ affix.name }}</span>
                                  <span>{{ affix.value }}</span>
                                </div>
                              </div>
                            </BTab>
                          </BTabs>
                        </div>
                      </template>
                    </BModal>
                  </div>
                </div>
              </BCardBody>
            </BCard>
          </BCol>

          <BCol md="8">
            <div class="d-flex align-items-center gap-2">
              <img class="" width="50" height="50" :src="getElementColors(character.character.element as Element).icon" />
              <div>
                <div class="d-flex align-items-center gap-2">
                  <h4 class="font-genshin mb-0">{{ displayName(character) }}</h4>
                  <div class="badge text-bg-primary">Lv. {{ character.level }}</div>
                </div>
                <div class="d-flex align-items-center gap-2 text-muted">
                  <div class="d-flex">
                    <Star v-for="n in character.character.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
                  </div>
                  |
                  <span class="text-muted">{{ character.build_weapons?.weapon.type_name }}</span>
                </div>
              </div>
            </div>
            
            <hr class="mt-2" />

            <BRow cols="1" class="g-3">
              <BCol>
                <BCard no-body>
                  <BCardHeader>
                    <BCardTitle class="h5 text-primary mb-0">Character Stats</BCardTitle>
                  </BCardHeader>

                  <BCardBody class="p-0">
                    <BRow cols="2" gutter-x="2">
                      <BCol v-for="p in selectedProperties" class="prop-div">
                        <div class="d-flex align-items-center justify-content-between py-1 px-2">
                          <div class="d-flex gap-1">
                            <div class="property-img d-flex">
                              <BImg v-if="p.property.icon" :src="p.property.icon" />
                            </div>
  
                            <span class="text-muted">{{ p.property.name }}</span>
                          </div>

                          <div class="">
                            <span class="font-genshin">{{ p.final_value }}</span>
                          </div>
                        </div>
                      </BCol>
                    </BRow>
                  </BCardBody>
                </BCard>
              </BCol>

              <BCol>
                <BCard no-body>
                  <BCardHeader>
                    <BCardTitle class="h5 text-primary mb-0">Weapon</BCardTitle>
                  </BCardHeader>

                  <BCardBody class="d-flex gap-3 py-2">
                    <div
                      class="rounded flex-shrink-0 align-self-center"
                      :style="{
                        background: `url(${getRarityBg(character.build_weapons?.weapon.rarity ?? 1)}) no-repeat center / cover`,
                        width: '80px',
                        height: '80px',
                      }"
                    >
                      <img class="d-block w-100 h-100" :src="character.build_weapons?.weapon.icon ?? ''" :alt="character.build_weapons?.weapon.name" />
                    </div>
  
                    <div class="d-flex flex-column">
                      <div class="d-flex align-items-center gap-2">
                        <h5 class="mb-0">{{ character.build_weapons?.weapon.name }}</h5>
                        <div class="badge text-bg-secondary rounded-1">Lv. {{ character.build_weapons?.level }}</div>
                      </div>
  
                      <span class="text-primary small">Refinement Rank {{ character.build_weapons?.affix_level }}</span>
                      <span class="text-muted small">{{ character.build_weapons?.properties.find(p => p.property_slot === "main")?.property_type.name }}: {{ character.build_weapons?.properties.find(p => p.property_slot === "main")?.final_value }}</span>
                      <span class="text-muted small" v-if="character.build_weapons?.properties.find(p => p.property_slot === 'sub')">{{ character.build_weapons?.properties.find(p => p.property_slot === "sub")?.property_type.name }}: {{ character.build_weapons?.properties.find(p => p.property_slot === "sub")?.final_value }}</span>
                    </div>
                  </BCardBody>
                </BCard>
              </BCol>
            </BRow>
          </BCol>
        </BRow>

        <BRow>
          <BCol class="col col-12">
            <BCard no-body>
              <BCardHeader>
                <BCardTitle class="h5 text-primary mb-0">Constellations</BCardTitle>
              </BCardHeader>
    
              <BCardBody>
                <BTabs v-model:index="activeConstellationIndex" nav-class="mb-3">
                  <BTab
                    v-for="c in character.build_constellations"
                    :key="c.id"
                    :title-item-class="['constellation-item', { 'constellation-locked': !c.is_actived }]"
                    title-link-class="d-flex flex-column align-items-center gap-1"
                  >
                    <template #title>
                      <div
                        class="rounded-circle border border-2"
                        :style="{
                          backgroundColor: getElementColors(character.character.element as Element).bg,
                          boxShadow: `0px 0px 8px 2px ${getElementColors(character.character.element as Element).color}`,
                        }"
                      >
                        <div class="constellation-icon position-relative overflow-hidden rounded-circle flex-shrink-0 d-flex align-items-center justify-content-center">
                          <div class="constellation-icon_decor position-absolute w-100 h-100 start-0 top-0 d-flex justify-content-center align-items-center">
                            <img :src="c.constellation.icon" :alt="c.constellation.name" width="30" height="30" />
                          </div>
                          <div v-if="!c.is_actived" class="shell-icon_base position-absolute w-100 h-100 start-0 top-0 d-flex mw-100 align-items-center justify-content-center bg-black bg-opacity-50 rounded-circle">
                            <RiLock2Fill size="15" class="text-light" />
                          </div>
                        </div>
                      </div>
                    </template>

                    <BCard no-body class="constellation-card">
                      <BCardBody class="p-2 d-flex gap-3">
                        <div
                          class="rounded-circle flex-shrink-0 d-flex align-items-center justify-content-center border border-2 constellation-div mt-1 ms-1"
                          :style="{
                            width: '54px',
                            height: '54px',
                            backgroundColor: getElementColors(character.character.element as Element).bg,
                            boxShadow: `0px 0px 8px 3px ${getElementColors(character.character.element as Element).color}`
                          }"
                        >
                          <div class="constellation-icon position-relative overflow-hidden">
                            <div class="constellation-icon_decor position-absolute w-100 h-100 start-0 top-0 d-flex justify-content-center align-items-center">
                              <img :src="c.constellation.icon" :alt="c.constellation.name" width="50" height="50" class="" />
                            </div>
                            <div v-if="!c.is_actived" class="shell-icon_base position-absolute w-100 h-100 start-0 top-0 d-flex mw-100 align-items-center justify-content-center bg-black bg-opacity-50 rounded-circle">
                              <RiLock2Fill size="30" />
                            </div>
                          </div>
                          
                        </div>
        
                        <div>
                          <div class="d-flex flex-column justify-content-center">
                            <h5 class="mb-0 text-primary">{{ c.constellation.name }}</h5>
                            <p class="small mb-2 text-secondary">Constellation Lv. <span class="text-info">{{ c.constellation.position }}</span></p>
                          </div>
        
                          <p class="mb-0 text-muted" v-html="formatEffect(c.constellation.effect)" />
        
                          <p v-if="c.is_enhanced && c.enhanced_effect" class="mb-0 mt-2" v-html="formatEffect(c.enhanced_effect)" />
                        </div>
                      </BCardBody>
                    </BCard>
                  </BTab>
                </BTabs>
    
              </BCardBody>
            </BCard>
          </BCol>
        </BRow>
        
        <BRow>
          <BCol>
            <BCard no-body>
              <BCardHeader>
                <BCardTitle class="h5 font-genshin text-primary mb-0">Artifacts</BCardTitle>
              </BCardHeader>

              <BCardBody>
                <BRow cols="5" class="artifact-cards" gutter-x="3">
                  <BCol v-for="relic in character.build_relics" :key="relic.id">
                    <CharacterArtifactCard :relic="relic" />
                  </BCol>
                </BRow>
              </BCardBody>
            </BCard>
          </BCol>
        </BRow>
      </section>
    </div>
  </main>
</template>