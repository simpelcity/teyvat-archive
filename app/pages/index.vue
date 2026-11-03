<script setup lang="ts">
import { characters } from '~/data/characters'
import { character_detail } from '~/data/character_detail'

console.log('Characters:', characters)
console.log('Character detail:', character_detail)

// const ownedCharacters = computed(() =>
//   characters.filter(character => character.owned)
// )
</script>

<template>
  <main>
    <h1>Teyvat Archive</h1>

    <section class="">
      <article
        v-for="character in characters"
        :key="character.id"
        class=""
      >
        <h2 class="font-semibold">{{ character.name }}</h2>
      </article>
    </section>
  </main>
</template>