export type Element =
  | 'Pyro'
  | 'Hydro'
  | 'Anemo'
  | 'Electro'
  | 'Dendro'
  | 'Cryo'
  | 'Geo'

export type WeaponType =
  | 'Sword'
  | 'Claymore'
  | 'Polearm'
  | 'Bow'
  | 'Catalyst'

export interface Weapon {
  affix_level: number
  icon: string
  id: number
  level: number
  name: string
  rarity: number
  type: number
}

export interface BaseCharacter {
  id: number
  icon: string
  name: string
  element: Element
  fetter: number
  level: number
  rarity: 4 | 5
  actived_constellation_num: number
  image: string
  is_chosen: boolean
  side_icon: string
  weapon_type: number
  weapon: Weapon
}

export interface BaseProperties {
  property_type: number
  base: string
  add: string
  final: string
}

export interface Constellations {
  id: number
  name: string
  icon: string
  effect: string
  is_actived: boolean
  pos: number
  is_enhanced: boolean
  enhanced_effect: string
  can_enhanced: boolean
}

export interface Costumes {
  id: number
  name: string
  icon: string
}

export interface ElementProperties {
  property_type: number
  base: string
  add: string
  final: string
}

export interface ExtraProperties {
  property_type: number
  base: string
  add: string
  final: string
}

export interface RecommendRelicProperty {
  recommend_properties: {
    sand_main_property_list: number[]
    goblet_main_property_list: number[]
    circlet_main_property_list: number[]
    sub_property_list: number[]
  }
  custom_properties: null
  has_set_recommend_prop: boolean
}

export interface Relics {
  build_id: number
  id: number
  level: number
  main_property_type_id: number
  main_times: number | null
  main_value: string
  position: number
  rarity: number
  relic_id: number
  set_id: number
  main_property: {
    filter_name: string
    icon: string | null
    id: number
    name: string
  }
  relic: {
    icon: string
    id: number
    name: string
    pos_name: string
  }
  relic_set: {
    id: number
    name: string
    affixes: {
      activation_number: number
      effect: string
      id: number
      set_id: number
    }[]
  }
  substats: {
    build_relic_id: number
    id: number
    property_type_id: number
    times: number
    value: string
    property: {
      filter_name: string
      icon: string | null
      id: number
      name: string
    }
  }[]
}

export interface JSONRelics {
  id: number
  name: string
  icon: string
  pos: number
  rarity: number
  level: number
  set: {
    id: number
    name: string
    affixes: {
      activation_number: number
      effect: string
    }[]
  }
  pos_name: string
  main_property: {
    property_type: number
    value: string
    times: number
  }
  sub_property_list: {
    property_type: number
    value: string
    times: number
  }[]
}

export interface SelectedProperties {
  property_type: number
  base: string
  add: string
  final: string
}

export interface BuildSkills {
  build_id: number
  can_enhanced: boolean | null
  enhanced_desc: string | null
  id: number
  is_enhanced: boolean | null
  is_unlock: boolean | null
  level: number
  skill_id: number
  skill: Skills
}

export interface Skills {
  character_id: number
  description: string
  icon: string
  id: number
  name: string
  skill_type_id: number
  skill_type: {
    id: number
    name: string
  }
  affixes: {
    id: number
    name: string
    position: number
    skill_id: number
    value: string
  }[]
}

export interface JSONSkills {
  skill_id: number
  skill_type: number
  level: number
  desc: string
  skill_affix_list: {
    name: string
    value: string
  }[]
  icon: string
  is_unlock: boolean
  name: string
  is_enhanced: boolean
  enhanced_desc: string
  before_enhanced_skill_attr_index: number[]
  after_enhanced_skill_attr_index: number[]
  can_enhanced: boolean
}

export interface WeaponDetails {
  id: number
  name: string
  icon: string
  type: number
  rarity: number
  level: number
  promote_level: number
  type_name: WeaponType
  desc: string
  affix_level: number
  main_property: {
    property_type: number
    base: string
    add: string
    final: string
  }
  sub_property: {
    property_type: number
    base: string
    add: string
    final: string
  } | null
}

export interface Characters {
  actived_constellation_num: number
  element: Element
  fetter: number
  icon: string
  id: number
  image: string
  is_chosen: boolean
  level: number
  name: string
  rarity: 4 | 5
  side_icon: string
  weapon: Weapon | null
  weapon_type: number
}

export interface Character {
  base: BaseCharacter
  base_properties: BaseProperties[]
  constellations: Constellations[]
  costumes: Costumes[]
  element_properties: ElementProperties[]
  extra_properties: ExtraProperties[]
  recommend_relic_property: RecommendRelicProperty
  relics: JSONRelics[]
  selected_properties: SelectedProperties[]
  skills: JSONSkills[]
  unlock_tps: boolean
  weapon: WeaponDetails
  weapon_skin: null
}

