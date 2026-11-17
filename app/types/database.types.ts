// Types for the tables in supabase/schema.sql, in the shape `supabase gen types typescript` produces.
// If you install the Supabase CLI you can regenerate this file instead of editing it by hand:
//   npx supabase gen types typescript --project-id <ref> > app/types/database.types.ts
// (the generated file types jsonb columns as `Json`, so keep the casts in the app code)
import type { Character, Characters } from './character'

type Table<Row, Insert = Row> = {
  Row: Row
  Insert: Insert
  Update: Partial<Insert>
  Relationships: []
}

export type Database = {
  public: {
    Tables: {
      characters: Table<
        { id: number; position: number; data: Characters },
        { id: number; position?: number; data: Characters }
      >
      character_details: Table<
        { id: number; data: Character; name_slug: string | null; name_element_slug: string | null },
        { id: number; data: Character }
      >
      property_map: Table<
        { property_type: number; name: string; icon: string | null; filter_name: string | null },
        { property_type: number; name: string; icon?: string | null; filter_name?: string | null }
      >
      skill_map: Table<{ id: number; name: string }>
      wiki_map: Table<{ id: number; url: string }>
    }
    Views: { [_ in never]: never }
    Functions: { [_ in never]: never }
    Enums: { [_ in never]: never }
    CompositeTypes: { [_ in never]: never }
  }
}
