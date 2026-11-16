<script setup lang="ts">
import { property_map } from '~/data/property_map'
import type { Relics } from '~/types/character'
import { getRarityBg } from '~/constants/weapons'
import { Star, ChevronRight } from '@lucide/vue'
import { wiki_map } from "~/data/wiki_map"

const props = defineProps<{
  relic: Relics
}>()

function getProperty(id: number) {
  const property = property_map.find(p => p.property_type === id)
  return property
}
</script>

<template>
  <div class="card rounded">
    <div class="card-body p-0">
      <ul class="list-unstyled mb-0">
        <li class="d-flex justify-content-between ps-2 pe-1 py-1">
          <div class="mt-1">
            <span class="text-limit small text-muted mb-1">{{ relic.name }}</span>
            <div class="badge bg-dark text-secondary rounded-1">Lv. {{ relic.level }}</div>
          </div>

          <div>
            <UiPopover trigger="hover" width="360px" :label="`${relic.name} details`">
              <template #trigger>
                <img :src="relic.icon" :alt="`Show ${relic.name} details`" width="40" height="40" />
              </template>

              <div class="popover-body d-flex flex-column">
                <div class="d-flex gap-3">
                  <img
                    :src="relic.icon"
                    width="80"
                    height="80"
                    class="rounded"
                    :style="{ background: `url(${getRarityBg(relic.rarity)}) no-repeat center / cover` }"
                  />
                  <div class="d-flex flex-column w-100">
                    <span class="fs-6 fw-bold">{{ relic.name }}</span>
                    <div class="d-flex gap-2 mb-auto">
                      <span class="badge text-bg-secondary rounded-1 mb-1">{{ relic.pos_name }}</span>
                    </div>
                    <NuxtLink
                      :to="wiki_map[relic.id]"
                      target="_blank"
                      class="btn btn-outline border rounded-1 text-primary py-0 ps-2 pe-1 fw-semibold text-decoration-none align-self-end"
                    >
                      <span class="small d-flex align-items-center">Go to HoYoWiki <ChevronRight :size="16" /></span>
                    </NuxtLink>
                  </div>
                </div>
              </div>
            </UiPopover>

            <div class="d-flex">
              <Star v-for="r in relic.rarity" :key="r" class="text-warning" fill="#ffc107" :size="8" />
            </div>
          </div>
        </li>

        <li class="d-flex justify-content-between p-2 bg-dark">
          <span class="fw-semibold">{{ getProperty(relic.main_property.property_type)?.name }}</span>
          <span class="font-genshin">{{ relic.main_property.value }}</span>
        </li>

        <li v-for="s in relic.sub_property_list" class="d-flex justify-content-between p-2">
          <div class="d-flex align-items-center gap-2">
            <span class="fw-semibold small text-muted">{{ getProperty(s.property_type)?.name }}</span>
            <span v-if="s.times > 0" class="border border-secondary fw-bold badge-sm d-flex justify-content-center align-items-center">{{ s.times }}</span>
          </div>
          <span class="font-genshin small text-muted">{{ s.value }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>