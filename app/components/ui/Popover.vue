<script setup lang="ts">
const props = withDefaults(defineProps<{
  trigger?: 'hover' | 'click'
  width?: string
  label?: string
}>(), {
  trigger: 'click',
  width: '280px',
})

const MARGIN = 8

const isOpen = ref(false)
const root = ref<HTMLElement | null>(null)
const popover = ref<HTMLElement | null>(null)
const placement = ref<'top' | 'bottom'>('top')
const shiftX = ref(0)

function open() { isOpen.value = true }
function close() { isOpen.value = false }
function toggle() { isOpen.value = !isOpen.value }

async function updatePlacement() {
  if (!isOpen.value) return

  placement.value = 'top'
  shiftX.value = 0
  await nextTick()

  const rect = popover.value?.getBoundingClientRect()
  if (!rect) return

  if (rect.top < MARGIN) placement.value = 'bottom'

  const viewportWidth = document.documentElement.clientWidth
  if (rect.left < MARGIN) {
    shiftX.value = rect.left - MARGIN
  } else if (rect.right > viewportWidth - MARGIN) {
    shiftX.value = rect.right - (viewportWidth - MARGIN)
  }
}

// Re-measure every time it opens, however it was opened (click or hover)
watch(isOpen, (open) => { if (open) updatePlacement() })

function onDocumentClick(e: MouseEvent) {
  if (root.value && !root.value.contains(e.target as Node)) close()
}
function onKeydown(e: KeyboardEvent) {
  if (e.key === 'Escape') close()
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
  <div
    ref="root"
    class="ui-popover-root"
    :class="{ 'is-open': isOpen }"
    @mouseenter="props.trigger === 'hover' && open()"
    @mouseleave="props.trigger === 'hover' && close()"
  >
    <button
      type="button"
      class="ui-popover-trigger"
      :aria-expanded="isOpen"
      aria-haspopup="dialog"
      @click="toggle"
    >
      <slot name="trigger" />
    </button>

    <Transition name="ui-popover-fade">
      <div
        v-if="isOpen"
        ref="popover"
        class="popover ui-popover"
        :class="placement === 'top' ? 'bs-popover-top placement-top' : 'bs-popover-bottom placement-bottom'"
        :style="{ right: `${shiftX}px`, width }"
        role="dialog"
        :aria-label="label"
      >
        <slot :close="close" />
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.ui-popover-root {
  position: relative;
  display: inline-block;
}
.ui-popover-root.is-open {
  z-index: 1070;
}

.ui-popover-trigger {
  padding: 0;
  border: 0;
  background: none;
  cursor: pointer;
  display: block;
}

.ui-popover {
  position: absolute;
  left: auto;
  max-width: calc(100vw - 16px);
  z-index: 1070;
}
.ui-popover.placement-top { bottom: calc(100% + 8px); }
.ui-popover.placement-bottom { top: calc(100% + 8px); }

/* Invisible bridge over the 8px gap, so hover mode doesn't close
   while the mouse moves from the trigger to the popover */
.ui-popover::before {
  content: '';
  position: absolute;
  left: 0;
  right: 0;
  height: 8px;
}
.ui-popover.placement-top::before { top: 100%; }
.ui-popover.placement-bottom::before { bottom: 100%; }

.ui-popover-fade-enter-active,
.ui-popover-fade-leave-active {
  transition: opacity 0.15s ease;
}
.ui-popover-fade-enter-from,
.ui-popover-fade-leave-to {
  opacity: 0;
}
</style>