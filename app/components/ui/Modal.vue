<script setup lang="ts">
const props = withDefaults(defineProps<{
  title?: string
  size?: 'sm' | 'md' | 'lg' | 'xl'
  closeOnBackdrop?: boolean
}>(), {
  size: 'md',
  closeOnBackdrop: true,
})

// v-model support: <UiModal v-model="isOpen">
const open = defineModel<boolean>({ default: false })

const dialog = ref<HTMLDialogElement | null>(null)

watch(open, (value) => {
  const el = dialog.value
  if (!el) return

  if (value && !el.open) {
    el.showModal()
    document.body.style.overflow = 'hidden' // stop the page scrolling behind
  } else if (!value && el.open) {
    el.close()
  }
})

// Fires for every way the dialog closes: Esc, close(), the X button
function onClose() {
  open.value = false
  document.body.style.overflow = ''
}

// Clicks on the backdrop land on the <dialog> itself, not on its content
function onDialogClick(e: MouseEvent) {
  if (props.closeOnBackdrop && e.target === dialog.value) open.value = false
}

// If it was open on page load, or the page leaves while it's open
onMounted(() => { if (open.value) dialog.value?.showModal() })
onBeforeUnmount(() => { document.body.style.overflow = '' })
</script>

<template>
  <dialog
    ref="dialog"
    class="ui-modal"
    :class="`ui-modal-${size} bg-dark-subtle`"
    :aria-label="title"
    @close="onClose"
    @click="onDialogClick"
  >
    <div class="modal-content">
      <div v-if="title || $slots.header" class="modal-header p-3 pb-0">
        <slot name="header">
          <h5 class="modal-title font-genshin">{{ title }}</h5>
        </slot>
        <button type="button" class="btn-close btn-close-white shadow-none" aria-label="Close" @click="open = false" />
      </div>

      <div class="modal-body p-3">
        <slot :close="() => (open = false)" />
      </div>

      <div v-if="$slots.footer" class="modal-footer">
        <slot name="footer" :close="() => (open = false)" />
      </div>
    </div>
  </dialog>
</template>

<style scoped>
.ui-modal {
  padding: 0;
  border: 0;
  border-radius: var(--bs-border-radius-lg);
  background: transparent;
  color: inherit;
  width: calc(100vw - 32px);
  max-height: calc(100dvh - 32px);
}
.ui-modal-sm { max-width: 300px; }
.ui-modal-md { max-width: 500px; }
.ui-modal-lg { max-width: 800px; }
.ui-modal-xl { max-width: 1140px; }

.ui-modal .modal-content {
  height: 620px;
}

.ui-modal .modal-body {
  overflow-y: auto;
}

.ui-modal::backdrop {
  background: rgba(0, 0, 0, 0.6);
}

/* Open animation */
.ui-modal[open] {
  animation: ui-modal-in 0.15s ease;
}
@keyframes ui-modal-in {
  from { opacity: 0; transform: translateY(-8px); }
}
</style>