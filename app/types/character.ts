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
}

export interface BaseProperties {
  id: number
}

export interface Constellations {
  id: number
}

export interface Costumes {
  id: number
}

export interface ElementProperties {
  id: number
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
  weapon: Weapon
  weapon_type: number
}

export interface Character {
  base: BaseCharacter
}