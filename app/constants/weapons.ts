import Rarity1 from '~/assets/images/weapon_bg/rarity_1.svg'
import Rarity2 from '~/assets/images/weapon_bg/rarity_2.svg'
import Rarity3 from '~/assets/images/weapon_bg/rarity_3.svg'
import Rarity4 from '~/assets/images/weapon_bg/rarity_4.svg'
import Rarity5 from '~/assets/images/weapon_bg/rarity_5.svg'

const rarityBg: Record<number, string> = {
  1: Rarity1,
  2: Rarity2,
  3: Rarity3,
  4: Rarity4,
  5: Rarity5
}

export function getRarityBg(rarity: number) {
  return rarityBg[rarity]
}