import type { Database } from './database.types'

type Character = Database['public']['Tables']['characters']['Row']

export interface TeamMember {
  position: number
  character: Character | null
}

export interface Teams {
  id: number
  name: string
  members: TeamMember[]
}