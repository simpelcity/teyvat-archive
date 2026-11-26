import type { Element, Elements } from '~/types/character'
import type { Team } from '~/types/team'

import ImageAnemo from '~/assets/images/elements/Anemo.png'
import ImageCyro from '~/assets/images/elements/Cryo.png'
import ImageDendro from '~/assets/images/elements/Dendro.png'
import ImageElectro from '~/assets/images/elements/Electro.png'
import ImageGeo from '~/assets/images/elements/Geo.png'
import ImageHydro from '~/assets/images/elements/Hydro.png'
import ImagePyro from '~/assets/images/elements/Pyro.png'

import IconAnemo from '~/assets/icons/elements/Anemo.svg'
import IconCyro from '~/assets/icons/elements/Cryo.svg'
import IconDendro from '~/assets/icons/elements/Dendro.svg'
import IconElectro from '~/assets/icons/elements/Electro.svg'
import IconGeo from '~/assets/icons/elements/Geo.svg'
import IconHydro from '~/assets/icons/elements/Hydro.svg'
import IconPyro from '~/assets/icons/elements/Pyro.svg'

// const elementBg: Record<Element, string> = {
//   "Pyro": "#ff646790",
//   "Hydro": "#00bcff90",
//   "Electro": "#a684ff90",
//   "Cryo": "#00d3f390",
//   "Anemo": "#00d49290",
//   "Geo": "#ffb90090",
//   "Dendro": "#9ae60090"
// }

const elementBg: Record<Element, string> = {
  "Pyro": "#FF664090",
  "Hydro": "#00C0FF90",
  "Electro": "#CC80FF90",
  "Cryo": "#80FFFF90",
  "Anemo": "#32D7A090",
  "Geo": "#FFAC0090",
  "Dendro": "#90CC0090"
}

const elementBg2: Record<Element, string> = {
  "Pyro": "#FF664050",
  "Hydro": "#00C0FF50",
  "Electro": "#CC80FF50",
  "Cryo": "#80FFFF50",
  "Anemo": "#32D7A050",
  "Geo": "#FFAC0050",
  "Dendro": "#90CC0050"
}

// const elementColor: Record<Element, string> = {
//   "Pyro": "#ff6467",
//   "Hydro": "#00bcff",
//   "Electro": "#a684ff",
//   "Cryo": "#00d3f3",
//   "Anemo": "#00d492",
//   "Geo": "#ffb900",
//   "Dendro": "#9ae600"
// }

const elementColor: Record<Element, string> = {
  "Pyro": "#FF6640",
  "Hydro": "#00C0FF",
  "Electro": "#CC80FF",
  "Cryo": "#80FFFF",
  "Anemo": "#32D7A0",
  "Geo": "#FFAC00",
  "Dendro": "#90CC00"
}

const elementImage: Record<Element, string> = {
  "Pyro": ImagePyro,
  "Hydro": ImageHydro,
  "Electro": ImageElectro,
  "Cryo": ImageCyro,
  "Anemo": ImageAnemo,
  "Geo": ImageGeo,
  "Dendro": ImageDendro
}

const elementIcon: Record<Element, string> = {
  "Pyro": IconPyro,
  "Hydro": IconHydro,
  "Electro": IconElectro,
  "Cryo": IconCyro,
  "Anemo": IconAnemo,
  "Geo": IconGeo,
  "Dendro": IconDendro
}

const elementalBonus = [
  {
    name: "Fervent Flames",
    element: "Pyro",
    elementAmount: 2,
    description: "Affected by Cryo for 40% less time. Increases ATK by 25%."
  },
  {
    name: "Soothing Water",
    element: "Hydro",
    elementAmount: 2,
    description: "Affected by Pyro for 40% less time. Increases Max HP by 25%."
  },
  {
    name: "Impetuous Winds",
    element: "Anemo",
    elementAmount: 2,
    description: "Decreases Stamina Consumption by 15%. Increases Movement SPD by 10%. Shortens Skill CD by 5%."
  },
  {
    name: "High Voltage",
    element: "Electro",
    elementAmount: 2,
    description: "Affected by Hydro for 40% less time. Superconduct, Stellar-Conduct, Overloaded, Electro-Charged, Lunar-Charged, Quicken, Aggravate, or Hyperbloom have a 100% chance to generate an Electro Elemental Particle (CD: 5s)."
  },
  {
    name: "Sprawling Greenery",
    element: "Dendro",
    elementAmount: 2,
    description: "Elemental Mastery increased by 50. After triggering Burning, Quicken, Bloom, or Lunar-Bloom reactions, all nearby party members gain 30 Elemental Mastery for 6s. After triggering Aggravate, Spread, Hyperbloom, or Burgeon reactions, all nearby party members gain 20 Elemental Mastery for 6s. The durations of the aforementioned effects will be counted independently."
  },
  {
    name: "Shattering Ice",
    element: "Cryo",
    elementAmount: 2,
    description: "Affected by Electro for 40% less time. Increases CRIT Rate against opponents that are Frozen or affected by Cryo by 15%."
  },
  {
    name: "Enduring Rock",
    element: "Geo",
    elementAmount: 2,
    description: "Increases shield strength by 15%. Additionally, when characters protected by a shield or when Moondrifts formed by Lunar-Crystallize reactions are nearby, the following special characteristics will take effect: DMG dealt increased by 15%, dealing DMG to enemies will decrease their Geo RES by 20% for 15s."
  },
  {
    name: "Protective Canopy",
    element: "any",
    elementAmount: 1,
    description: "All Elemental RES +15%, Physical RES +15%."
  }
]

export function getElementColors(element: Element) {
  const bg = elementBg[element]
  const color = elementColor[element]
  const bg2 = elementBg2[element]
  return { bg, color, bg2 }
}

export function getElementIcons(element: Element) {
  const image = elementImage[element]
  const icon = elementIcon[element]
  return { image, icon }
}

export function getTeamBonus(elements: Elements, team: Team) {
  const full = team.members.length >= 4

  const bonuses = elementalBonus.map(b => ({
    ...b,
    active: full && elements.some(e => e.name === b.element && e.amount >= b.elementAmount)
  }))

  // Protective Canopy: a full team with no element twice, i.e. 4 different elements
  const canopy = bonuses.find(b => b.name === 'Protective Canopy')!
  canopy.active = full && !bonuses.some(b => b.active)

  return bonuses.sort((a, b) => Number(b.active) - Number(a.active))
}
