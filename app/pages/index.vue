<script setup lang="ts">
useHead({
  title: 'Home'
})
import { characters } from '~/data/characters'
import { Star } from '@lucide/vue'

console.log('Characters:', characters)


</script>

<template>
  <main>
    <div class="container p-3 py-md-4">
      <section class="mb-4">
        <h1 class="text-primary font-genshin">Teyvat Archive</h1>
      </section>

      <section class="">
        <div class="grid">
          <a class="text-decoration-none" :href="`/characters/${character.name.toLowerCase() === 'traveler' ? character.name.toLowerCase() + '-' + character.element.toLowerCase() : character.name.toLowerCase()}`" v-for="character in characters" :key="character.id">
            <div class="card">
              <img :src="`${character.icon}`" />
              <div class="card-body">
                <h5 class="card-title">{{ character.name.toLowerCase() === 'traveler' ? `${character.element} Traveler` : character.name }}</h5>
                <Star v-for="n in character.rarity" :key="n" class="text-warning" fill="#ffc107" :size="16" />
              </div>
            </div>
          </a>
        </div>
      </section>
    </div>
  </main>
</template>