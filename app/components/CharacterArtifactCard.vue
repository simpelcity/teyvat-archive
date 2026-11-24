<script setup lang="ts">
import type { Relics } from '~/types/character'
import { getRarityBg } from '~/constants/weapons'
import { Star, ChevronRight } from '@lucide/vue'
import { useLookupsStore } from '~/stores/lookups'

const props = defineProps<{
  relic: Relics
}>()

// Loaded by the parent page (callOnce('lookups', ...))
const lookups = useLookupsStore()
const getProperty = (id: number) => lookups.getProperty(id)

const substats = computed(() =>
  [...props.relic.substats].sort((a, b) => a.id - b.id)
)
</script>

<template>
  <BCard no-body>
    <BCardBody class="p-0">
      <ul class="list-unstyled mb-0">
        <li class="d-flex justify-content-between ps-2 pe-1 py-1">
          <div class="mt-1">
            <span class="text-limit small text-muted mb-1">{{ relic.relic.name }}</span>
            <div class="badge bg-dark text-secondary rounded-1">Lv. {{ relic.level }}</div>
          </div>

          <div class="popover-div">
            <BPopover placement="top" :delay="{ show: 0, hide: 150 }" teleport-to="body" class="border-0 artifact-popover">
              <template #target>
                <button
                  type="button"
                  class="artifact-toggle bg-transparent border-0"
                  :aria-label="`Show ${relic.relic.name} details`"
                >
                  <img :src="relic.relic.icon" alt="" width="40" height="40" />
                </button>
              </template>

              <div class="d-flex gap-3">
                <img
                  :src="relic.relic.icon"
                  width="80"
                  height="80"
                  class="rounded"
                  :style="{ background: `url(${getRarityBg(relic.rarity)}) no-repeat center / cover` }"
                />
                <div class="d-flex flex-column w-100">
                  <span class="fs-6">{{ relic.relic.name }}</span>
                  <div class="d-flex gap-2 mb-auto">
                    <span class="badge text-bg-secondary rounded-1 mb-1 text-align-center fw-medium">{{ relic.relic.pos_name }}</span>
                  </div>
                  <NuxtLink
                    :to="lookups.wikiMap[relic.relic_set.id]"
                    target="_blank"
                    class="btn btn-outline border rounded-1 text-primary py-0 ps-2 pe-1 fw-semibold text-decoration-none align-self-end"
                  >
                    <span class="small d-flex align-items-center">Go to HoYoWiki <ChevronRight :size="16" /></span>
                  </NuxtLink>
                </div>
              </div>
            </BPopover>

            <div class="d-flex justify-content-center mb-1">
              <Star v-for="r in relic.rarity" :key="r" class="text-warning" fill="#ffc107" :size="8" />
            </div>
          </div>
        </li>

        <li class="d-flex justify-content-between p-2 bg-dark">
          <span>{{ relic.main_property.name }}</span>
          <span>{{ relic.main_value }}</span>
        </li>

        <li v-for="s in substats" class="d-flex justify-content-between p-2">
          <div class="d-flex align-items-center gap-2">
            <span class="small text-muted">{{ s.property.name }}</span>
            <span v-if="s.times > 0" class="artifact-times">{{ s.times }}</span>
          </div>
          <span class="small text-muted">+{{ s.value }}</span>
        </li>
      </ul>
    </BCardBody>
  </BCard>
</template>