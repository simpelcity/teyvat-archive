<script setup lang="ts">
import { property_map } from '~/data/property_map'
import type { Relics } from '~/types/character'
import { getElementColors } from '~/constants/elements'
import { getRarityBg } from '~/constants/weapons'
import { Star, ChevronRight } from '@lucide/vue'
import { ref } from 'vue';
import { wiki_map } from "~/data/wiki_map"

const props = defineProps<{
  relic: Relics
}>()

function getProperty(id: number) {
  const property = property_map.find(p => p.property_type === id)
  return property
}

const isOpen = ref(false)
const root = ref<HTMLElement | null>(null)

// Close when clicking anywhere outside the card, or pressing Esc
function onDocumentClick(e: MouseEvent) {
  if (root.value && !root.value.contains(e.target as Node)) isOpen.value = false
}
function onKeydown(e: KeyboardEvent) {
  if (e.key === 'Escape') isOpen.value = false
}

const popover = ref<HTMLElement | null>(null)
const placement = ref<'top' | 'bottom'>('top')

const MARGIN = 8 // keep this much space from the screen edge

const shiftX = ref(0) // px; positive moves the popover left, negative moves it right

async function updatePlacement() {
  if (!isOpen.value) return

  // Reset, then measure from the default position
  placement.value = 'top'
  shiftX.value = 0
  await nextTick()

  const rect = popover.value?.getBoundingClientRect()
  if (!rect) return

  // Vertical: flip below if it doesn't fit above
  if (rect.top < MARGIN) {
    placement.value = 'bottom'
  }

  // Horizontal: nudge back inside the screen
  const viewportWidth = document.documentElement.clientWidth // excludes the scrollbar

  if (rect.left < MARGIN) {
    shiftX.value = rect.left - MARGIN                    // negative → move right
  } else if (rect.right > viewportWidth - MARGIN) {
    shiftX.value = rect.right - (viewportWidth - MARGIN) // positive → move left
  }
}

async function toggle() {
  isOpen.value = !isOpen.value
  if (isOpen.value) await updatePlacement()
}

onMounted(() => {
  document.addEventListener('click', onDocumentClick)
  document.addEventListener('keydown', onKeydown)
  window.addEventListener('scroll', updatePlacement, { passive: true })
  window.addEventListener('resize', updatePlacement)
})
onBeforeUnmount(() => {
  document.removeEventListener('click', onDocumentClick)
  document.removeEventListener('keydown', onKeydown)
  window.removeEventListener('scroll', updatePlacement)
  window.removeEventListener('resize', updatePlacement)
})
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

          <div
            ref="root"
            @mouseenter="isOpen = true"
            @mouseleave="isOpen = false"
            class="position-relative"
            :class="{ 'artifact-open': isOpen }"
          >
            <button
              type="button"
              class="artifact-toggle"
              :aria-expanded="isOpen"
              :aria-label="`Show ${relic.name} details`"
            >
              <img :src="relic.icon" alt="" width="40" height="40" />
            </button>

            <Transition name="fade">
              <div
                v-if="isOpen"
                ref="popover"
                class="popover artifact-popover"
                :class="placement === 'top' ? 'bs-popover-top placement-top' : 'bs-popover-bottom placement-bottom'"
                :style="{ right: `${shiftX}px` }"
                role="dialog"
                :aria-label="`${relic.name} details`"
              >
                <div class="popover-body d-flex flex-column">
                  <div class="d-flex gap-3">
                    <div class="">
                      <img :src="relic.icon" width="80" height="80" class="rounded" :style="{ background: `url(${getRarityBg(relic.rarity)}) no-repeat center / cover` }" />
                    </div>
                    
                    <div class="d-flex flex-column w-100">
                      <span class="fs-6 fw-bold">{{ relic.name }}</span>
                      <div class="d-flex gap-2 mb-auto">
                        <span class="badge text-bg-secondary rounded-1 mb-1">{{ relic.pos_name }}</span>
                      </div>
                      <NuxtLink :to="wiki_map[relic.id]" target="_blank" class="btn btn-outline border rounded-1 text-primary py-0 ps-2 pe-1 fw-semibold text-decoration-none align-self-end">
                        <span class="small d-flex align-items-center">Go to HoYoWiki <ChevronRight :size="16" /></span>
                      </NuxtLink>
                    </div>
                  </div>
                </div>
              </div>
            </Transition>

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