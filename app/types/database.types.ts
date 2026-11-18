export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.18"
  }
  public: {
    Tables: {
      build_constellations: {
        Row: {
          build_id: number
          can_enhanced: boolean | null
          constellation_id: number
          enhanced_effect: string | null
          id: number
          is_activated: boolean | null
          is_enhanced: boolean | null
        }
        Insert: {
          build_id: number
          can_enhanced?: boolean | null
          constellation_id: number
          enhanced_effect?: string | null
          id?: never
          is_activated?: boolean | null
          is_enhanced?: boolean | null
        }
        Update: {
          build_id?: number
          can_enhanced?: boolean | null
          constellation_id?: number
          enhanced_effect?: string | null
          id?: never
          is_activated?: boolean | null
          is_enhanced?: boolean | null
        }
        Relationships: [
          {
            foreignKeyName: "build_constellations_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: false
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_constellations_constellation_id_fkey"
            columns: ["constellation_id"]
            isOneToOne: false
            referencedRelation: "constellations"
            referencedColumns: ["id"]
          },
        ]
      }
      build_costumes: {
        Row: {
          build_id: number
          costume_id: number
          id: number
        }
        Insert: {
          build_id: number
          costume_id: number
          id?: never
        }
        Update: {
          build_id?: number
          costume_id?: number
          id?: never
        }
        Relationships: [
          {
            foreignKeyName: "build_costumes_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: false
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_costumes_costume_id_fkey"
            columns: ["costume_id"]
            isOneToOne: false
            referencedRelation: "costumes"
            referencedColumns: ["id"]
          },
        ]
      }
      build_properties: {
        Row: {
          add_value: number | null
          base_value: number | null
          build_id: number
          category: string
          final_value: number | null
          id: number
          property_type_id: number
        }
        Insert: {
          add_value?: number | null
          base_value?: number | null
          build_id: number
          category: string
          final_value?: number | null
          id?: never
          property_type_id: number
        }
        Update: {
          add_value?: number | null
          base_value?: number | null
          build_id?: number
          category?: string
          final_value?: number | null
          id?: never
          property_type_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "build_properties_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: false
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_properties_property_type_id_fkey"
            columns: ["property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      build_relic_substats: {
        Row: {
          build_relic_id: number
          id: number
          property_type_id: number
          times: number | null
          value: string
        }
        Insert: {
          build_relic_id: number
          id?: never
          property_type_id: number
          times?: number | null
          value: string
        }
        Update: {
          build_relic_id?: number
          id?: never
          property_type_id?: number
          times?: number | null
          value?: string
        }
        Relationships: [
          {
            foreignKeyName: "build_relic_substats_build_relic_id_fkey"
            columns: ["build_relic_id"]
            isOneToOne: false
            referencedRelation: "build_relics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_relic_sub_property"
            columns: ["property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      build_relics: {
        Row: {
          build_id: number
          id: number
          level: number
          main_property_type_id: number
          main_times: number | null
          main_value: string
          position: number
          rarity: number
          relic_id: number
          set_id: number | null
        }
        Insert: {
          build_id: number
          id?: never
          level: number
          main_property_type_id: number
          main_times?: number | null
          main_value: string
          position: number
          rarity: number
          relic_id: number
          set_id?: number | null
        }
        Update: {
          build_id?: number
          id?: never
          level?: number
          main_property_type_id?: number
          main_times?: number | null
          main_value?: string
          position?: number
          rarity?: number
          relic_id?: number
          set_id?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "build_relics_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: false
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_relics_relic_id_fkey"
            columns: ["relic_id"]
            isOneToOne: false
            referencedRelation: "relics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_relics_set_id_fkey"
            columns: ["set_id"]
            isOneToOne: false
            referencedRelation: "relic_sets"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_relic_main_property"
            columns: ["main_property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      build_skills: {
        Row: {
          build_id: number
          can_enhanced: boolean | null
          enhanced_desc: string | null
          id: number
          is_enhanced: boolean | null
          is_unlock: boolean | null
          level: number
          skill_id: number
        }
        Insert: {
          build_id: number
          can_enhanced?: boolean | null
          enhanced_desc?: string | null
          id?: never
          is_enhanced?: boolean | null
          is_unlock?: boolean | null
          level: number
          skill_id: number
        }
        Update: {
          build_id?: number
          can_enhanced?: boolean | null
          enhanced_desc?: string | null
          id?: never
          is_enhanced?: boolean | null
          is_unlock?: boolean | null
          level?: number
          skill_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "build_skills_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: false
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_skills_skill_id_fkey"
            columns: ["skill_id"]
            isOneToOne: false
            referencedRelation: "skills"
            referencedColumns: ["id"]
          },
        ]
      }
      build_weapon_properties: {
        Row: {
          add_value: number | null
          base_value: number | null
          build_weapon_id: number
          final_value: number | null
          id: number
          property_slot: string
          property_type_id: number
        }
        Insert: {
          add_value?: number | null
          base_value?: number | null
          build_weapon_id: number
          final_value?: number | null
          id?: never
          property_slot: string
          property_type_id: number
        }
        Update: {
          add_value?: number | null
          base_value?: number | null
          build_weapon_id?: number
          final_value?: number | null
          id?: never
          property_slot?: string
          property_type_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "build_weapon_properties_build_weapon_id_fkey"
            columns: ["build_weapon_id"]
            isOneToOne: false
            referencedRelation: "build_weapons"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_weapon_property_type"
            columns: ["property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      build_weapons: {
        Row: {
          affix_level: number | null
          build_id: number
          id: number
          level: number
          promote_level: number | null
          weapon_id: number
        }
        Insert: {
          affix_level?: number | null
          build_id: number
          id?: never
          level: number
          promote_level?: number | null
          weapon_id: number
        }
        Update: {
          affix_level?: number | null
          build_id?: number
          id?: never
          level?: number
          promote_level?: number | null
          weapon_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "build_weapons_build_id_fkey"
            columns: ["build_id"]
            isOneToOne: true
            referencedRelation: "character_builds"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "build_weapons_weapon_id_fkey"
            columns: ["weapon_id"]
            isOneToOne: false
            referencedRelation: "weapons"
            referencedColumns: ["id"]
          },
        ]
      }
      character_builds: {
        Row: {
          active_constellation_num: number | null
          build_name: string | null
          character_id: number
          created_at: string | null
          fetter: number | null
          id: number
          is_chosen: boolean | null
          level: number
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          active_constellation_num?: number | null
          build_name?: string | null
          character_id: number
          created_at?: string | null
          fetter?: number | null
          id?: never
          is_chosen?: boolean | null
          level: number
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          active_constellation_num?: number | null
          build_name?: string | null
          character_id?: number
          created_at?: string | null
          fetter?: number | null
          id?: never
          is_chosen?: boolean | null
          level?: number
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "character_builds_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
        ]
      }
      character_details_backup: {
        Row: {
          data: Json
          id: number
          name_element_slug: string | null
          name_slug: string | null
        }
        Insert: {
          data: Json
          id: number
          name_element_slug?: string | null
          name_slug?: string | null
        }
        Update: {
          data?: Json
          id?: number
          name_element_slug?: string | null
          name_slug?: string | null
        }
        Relationships: []
      }
      character_details_list: {
        Row: {
          created_at: string
          id: number
        }
        Insert: {
          created_at?: string
          id?: number
        }
        Update: {
          created_at?: string
          id?: number
        }
        Relationships: []
      }
      character_recommended_substats: {
        Row: {
          character_id: number
          id: number
          property_type_id: number
        }
        Insert: {
          character_id: number
          id?: never
          property_type_id: number
        }
        Update: {
          character_id?: number
          id?: never
          property_type_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "character_recommended_substats_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "character_recommended_substats_property_type_id_fkey"
            columns: ["property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      character_relic_recommendations: {
        Row: {
          character_id: number
          id: number
          property_type_id: number
          slot: string
        }
        Insert: {
          character_id: number
          id?: never
          property_type_id: number
          slot: string
        }
        Update: {
          character_id?: number
          id?: never
          property_type_id?: number
          slot?: string
        }
        Relationships: [
          {
            foreignKeyName: "character_relic_recommendations_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "character_relic_recommendations_property_type_id_fkey"
            columns: ["property_type_id"]
            isOneToOne: false
            referencedRelation: "property_types"
            referencedColumns: ["id"]
          },
        ]
      }
      characters: {
        Row: {
          element: string | null
          icon: string | null
          id: number
          image: string | null
          name: string
          rarity: number | null
          side_icon: string | null
          weapon_type: number | null
        }
        Insert: {
          element?: string | null
          icon?: string | null
          id: number
          image?: string | null
          name: string
          rarity?: number | null
          side_icon?: string | null
          weapon_type?: number | null
        }
        Update: {
          element?: string | null
          icon?: string | null
          id?: number
          image?: string | null
          name?: string
          rarity?: number | null
          side_icon?: string | null
          weapon_type?: number | null
        }
        Relationships: []
      }
      characters_backup: {
        Row: {
          data: Json
          id: number
          position: number
        }
        Insert: {
          data: Json
          id: number
          position?: number
        }
        Update: {
          data?: Json
          id?: number
          position?: number
        }
        Relationships: []
      }
      characters_list: {
        Row: {
          actived_constellation_num: number
          created_at: string
          element: string
          fetter: number
          icon: string
          id: number
          image: string
          is_chosen: boolean
          level: number
          name: string
          rarity: number
          side_icon: string
          updated_at: string
          wapon_type: number
          weapon_id: number
        }
        Insert: {
          actived_constellation_num?: number
          created_at?: string
          element: string
          fetter?: number
          icon: string
          id?: number
          image: string
          is_chosen?: boolean
          level?: number
          name: string
          rarity?: number
          side_icon: string
          updated_at?: string
          wapon_type: number
          weapon_id: number
        }
        Update: {
          actived_constellation_num?: number
          created_at?: string
          element?: string
          fetter?: number
          icon?: string
          id?: number
          image?: string
          is_chosen?: boolean
          level?: number
          name?: string
          rarity?: number
          side_icon?: string
          updated_at?: string
          wapon_type?: number
          weapon_id?: number
        }
        Relationships: []
      }
      constellations: {
        Row: {
          character_id: number
          effect: string | null
          icon: string | null
          id: number
          name: string
          position: number
        }
        Insert: {
          character_id: number
          effect?: string | null
          icon?: string | null
          id: number
          name: string
          position: number
        }
        Update: {
          character_id?: number
          effect?: string | null
          icon?: string | null
          id?: number
          name?: string
          position?: number
        }
        Relationships: [
          {
            foreignKeyName: "constellations_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
        ]
      }
      costumes: {
        Row: {
          character_id: number
          icon: string | null
          id: number
          name: string
        }
        Insert: {
          character_id: number
          icon?: string | null
          id: number
          name: string
        }
        Update: {
          character_id?: number
          icon?: string | null
          id?: number
          name?: string
        }
        Relationships: [
          {
            foreignKeyName: "costumes_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
        ]
      }
      property_map: {
        Row: {
          filter_name: string | null
          icon: string | null
          name: string
          property_type: number
        }
        Insert: {
          filter_name?: string | null
          icon?: string | null
          name: string
          property_type: number
        }
        Update: {
          filter_name?: string | null
          icon?: string | null
          name?: string
          property_type?: number
        }
        Relationships: []
      }
      property_types: {
        Row: {
          filter_name: string
          icon: string | null
          id: number
          name: string
        }
        Insert: {
          filter_name: string
          icon?: string | null
          id: number
          name: string
        }
        Update: {
          filter_name?: string
          icon?: string | null
          id?: number
          name?: string
        }
        Relationships: []
      }
      relic_set_affixes: {
        Row: {
          activation_number: number
          effect: string
          id: number
          set_id: number
        }
        Insert: {
          activation_number: number
          effect: string
          id?: never
          set_id: number
        }
        Update: {
          activation_number?: number
          effect?: string
          id?: never
          set_id?: number
        }
        Relationships: [
          {
            foreignKeyName: "relic_set_affixes_set_id_fkey"
            columns: ["set_id"]
            isOneToOne: false
            referencedRelation: "relic_sets"
            referencedColumns: ["id"]
          },
        ]
      }
      relic_sets: {
        Row: {
          id: number
          name: string
        }
        Insert: {
          id: number
          name: string
        }
        Update: {
          id?: number
          name?: string
        }
        Relationships: []
      }
      relics: {
        Row: {
          icon: string | null
          id: number
          name: string
          pos_name: string | null
        }
        Insert: {
          icon?: string | null
          id: number
          name: string
          pos_name?: string | null
        }
        Update: {
          icon?: string | null
          id?: number
          name?: string
          pos_name?: string | null
        }
        Relationships: []
      }
      skill_affixes: {
        Row: {
          id: number
          name: string
          position: number
          skill_id: number
          value: string
        }
        Insert: {
          id?: never
          name: string
          position: number
          skill_id: number
          value: string
        }
        Update: {
          id?: never
          name?: string
          position?: number
          skill_id?: number
          value?: string
        }
        Relationships: [
          {
            foreignKeyName: "skill_affixes_skill_id_fkey"
            columns: ["skill_id"]
            isOneToOne: false
            referencedRelation: "skills"
            referencedColumns: ["id"]
          },
        ]
      }
      skill_map: {
        Row: {
          id: number
          name: string
        }
        Insert: {
          id: number
          name: string
        }
        Update: {
          id?: number
          name?: string
        }
        Relationships: []
      }
      skills: {
        Row: {
          character_id: number
          description: string | null
          icon: string | null
          id: number
          name: string
          skill_type: number
        }
        Insert: {
          character_id: number
          description?: string | null
          icon?: string | null
          id: number
          name: string
          skill_type: number
        }
        Update: {
          character_id?: number
          description?: string | null
          icon?: string | null
          id?: number
          name?: string
          skill_type?: number
        }
        Relationships: [
          {
            foreignKeyName: "skills_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
        ]
      }
      weapons: {
        Row: {
          description: string | null
          icon: string | null
          id: number
          name: string
          rarity: number | null
          type: number | null
          type_name: string | null
        }
        Insert: {
          description?: string | null
          icon?: string | null
          id: number
          name: string
          rarity?: number | null
          type?: number | null
          type_name?: string | null
        }
        Update: {
          description?: string | null
          icon?: string | null
          id?: number
          name?: string
          rarity?: number | null
          type?: number | null
          type_name?: string | null
        }
        Relationships: []
      }
      weapons_backup: {
        Row: {
          affix_level: number
          created_at: string
          icon: string
          id: number
          level: number
          name: string
          rarity: number
          type: number
          updated_at: string
        }
        Insert: {
          affix_level: number
          created_at?: string
          icon: string
          id?: number
          level: number
          name: string
          rarity: number
          type: number
          updated_at?: string
        }
        Update: {
          affix_level?: number
          created_at?: string
          icon?: string
          id?: number
          level?: number
          name?: string
          rarity?: number
          type?: number
          updated_at?: string
        }
        Relationships: []
      }
      wiki_map: {
        Row: {
          id: number
          url: string
        }
        Insert: {
          id: number
          url: string
        }
        Update: {
          id?: number
          url?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
