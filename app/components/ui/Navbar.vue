<script setup lang="ts">
const route = useRoute()

// computed so it updates on navigation; the layout doesn't re-run setup
const navLinks = computed(() => [
  {
    to: '/',
    label: 'Home',
    isActive: route.path === '/' || route.path.startsWith('/characters')
  },
  {
    to: '/teams',
    label: 'Teams',
    isActive: route.path.startsWith('/teams')
  }
])
</script>

<template>
  <BNavbar
    v-b-color-mode="'dark'"
    variant="dark-subtle"
    class=""
  >
    <BNavbarNav class="d-flex column-gap-3 mx-auto">
      <NuxtLink v-for="link in navLinks" :key="link.to" :to="link.to" :class="`${link.isActive ? 'text-primary' : 'text-light'} text-decoration-none`">{{ link.label }}</NuxtLink>
    </BNavbarNav>
  </BNavbar>
</template>