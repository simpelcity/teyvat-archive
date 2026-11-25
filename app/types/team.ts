import type { Database } from './database.types'

type Character = Database['public']['Tables']['characters']['Row']

export interface TeamMember {
  position: number
  character: Character
}

export interface Team {
  id: number
  name: string
  members: TeamMember[]
}