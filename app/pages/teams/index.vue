<script setup lang="ts">
import type { Teams } from '~/types/team'

useHead({
  title: 'Teams'
})

const supabase = useSupabaseClient()

const { data: teams } = await useAsyncData('teams', async () => {
  const [teamsResult, membersResult] = await Promise.all([
    supabase.from('teams').select('id, name').order('id'),
    supabase
      .from('team_members')
      .select('team_id, position, character:characters(*)')
      .order('position')
  ])

  if (teamsResult.error) throw teamsResult.error
  if (membersResult.error) throw membersResult.error

  const membersByTeam = new Map<number, Teams['members']>()
  for (const { team_id, ...member } of membersResult.data) {
    const members = membersByTeam.get(team_id) ?? []
    members.push(member)
    membersByTeam.set(team_id, members)
  }

  return teamsResult.data.map(team => ({
    ...team,
    members: membersByTeam.get(team.id) ?? []
  }))
}, { default: () => [] as Teams[] })

console.log(teams.value)

</script>

<template>
  <main>
    <BContainer class="p-3 py-md-4">
      <section class="mb-4 text-center">
        <h1 class="text-primary font-genshin">Teams</h1>
      </section>

    </BContainer>
  </main>
</template>