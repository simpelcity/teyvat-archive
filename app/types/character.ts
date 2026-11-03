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

export interface Character {
  id: string
  name: string
  element: Element
  weaponType: WeaponType
  rarity: 4 | 5

  owned: boolean
  level: number
  constellation: number
  friendship: number

}