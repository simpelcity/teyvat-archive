<script setup lang="ts">
import type { Team } from '~/types/team'
import '@/assets/styles/pages/Teams.scss'

useHead({
  title: 'Teams'
})

const supabase = useSupabaseClient()

const { data: teams, error } = await useAsyncData('teams', async () => {
  const [teamsResult, membersResult] = await Promise.all([
    supabase.from('teams').select('id, name').order('id'),
    supabase
      .from('team_members')
      .select('team_id, position, character:characters(*)')
      .order('position')
  ])

  if (teamsResult.error) throw teamsResult.error
  if (membersResult.error) throw membersResult.error

  const membersByTeam = new Map<number, Team['members']>()
  for (const { team_id, ...member } of membersResult.data) {
    const members = membersByTeam.get(team_id) ?? []
    members.push(member)
    membersByTeam.set(team_id, members)
  }

  return teamsResult.data.map(team => ({
    ...team,
    members: membersByTeam.get(team.id) ?? []
  }))
}, { default: () => [] as Team[] })

const query = ref('')

// Matches the team name or any member, including "<element> traveler"
const filteredTeams = computed(() => {
  const q = query.value.trim().toLowerCase()
  if (!q) return teams.value
  return teams.value.filter(team =>
    team.name.toLowerCase().includes(q) ||
    team.members.some(({ character }) =>
      `${character.element} ${character.name}`.toLowerCase().includes(q)
    )
  )
})

console.log('Teams:', teams.value)
</script>

<template>
  <main>
    <BContainer class="p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teams</h1>
      </section>

      <p v-if="error" class="team-empty">Couldn't load teams. Check the Supabase connection and reload.</p>

      <section v-else-if="teams.length" aria-label="Teams">
        <div class="team-search d-flex align-items-center gap-3 mb-4">
          <label for="team-search" class="visually-hidden">Search teams</label>
          <input
            id="team-search"
            v-model="query"
            type="search"
            class="form-control shadow-none border-secondary font-nunito fw-bold"
            placeholder="Search by team or character…"
          />
          <p class="team-search__count mb-0 flex-shrink-0 text-secondary small" aria-live="polite">
            <template v-if="query.trim()"><strong class="text-primary">{{ filteredTeams.length }}</strong> of {{ teams.length }} {{ teams.length === 1 ? 'team' : 'teams' }}</template>
            <template v-else><strong class="text-primary">{{ teams.length }}</strong> {{ teams.length === 1 ? 'team' : 'teams' }}</template>
          </p>
        </div>

        <ul v-if="filteredTeams.length" class="team-list d-grid gap-3 p-0 m-0 list-unstyled">
          <li v-for="team in filteredTeams" :key="team.id">
            <TeamIndexCard :team="team" />
          </li>
        </ul>

        <div v-else class="team-empty">
          <p class="mb-2">No teams with “{{ query.trim() }}”.</p>
          <button type="button" class="btn btn-outline-primary btn-sm" @click="query = ''">Clear search</button>
        </div>
      </section>

      <p v-else class="team-empty">No teams yet. Add them in Supabase and they'll show up here.</p>
    </BContainer>
  </main>
</template>
