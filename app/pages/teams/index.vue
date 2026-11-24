<script setup lang="ts">
import type { Characters, Element as ElementType } from '~/types/character'

useHead({
  title: 'Teams'
})

const supabase = useSupabaseClient()

const { data: teams } = await useAsyncData('teams', async () => {
  const { data, error } = await supabase
    .from('team_members')
    .select(`
      *,

      team:teams(*),

      character:characters (*)
    `)
    .order('position')
  if (error) throw error
  return teams
})

// const query = ref('')

// const filteredCharacters = computed(() => {
//   const q = query.value.trim().toLowerCase()
//   if (!q) return characters.value
//   return characters.value.filter(c =>
//     c.name.toLowerCase().includes(q) || c.element.toLowerCase().includes(q)
//   )
// })

// console.log(characters.value)
</script>

<template>
  <main>
    <BContainer class="p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teams</h1>
        <!--<input
          v-model="query"
          type="search"
          id="search-form"
          class="form-control mt-3 shadow-none border-secondary font-nunito fw-bold"
          placeholder="Search by team name"
          aria-label="Search characters"
        />-->
      </section>

      <section>
        <BRow v-if="filteredCharacters.length"  cols="2" cols-md="3" cols-lg="4" cols-xl="5" cols-xxl="6" class="g-3">
          <BCol v-for="character in filteredCharacters" :key="character.id">
            <CharacterIndexCard :character="character" />
          </BCol>
        </BRow>
      </section>
    </BContainer>
  </main>
</template>