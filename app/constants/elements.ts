import type { Element } from '~/types/character'
import IconAnemo from '~/assets/images/elements/Icon_Anemo.png'
import IconCyro from '~/assets/images/elements/Icon_Cryo.png'
import IconDendro from '~/assets/images/elements/Icon_Dendro.png'
import IconElectro from '~/assets/images/elements/Icon_Electro.png'
import IconGeo from '~/assets/images/elements/Icon_Geo.png'
import IconHydro from '~/assets/images/elements/Icon_Hydro.png'
import IconPyro from '~/assets/images/elements/Icon_Pyro.png'

const elementBg: Record<Element, string> = {
  "Anemo": "#00bc7d33",
  "Cryo": "#00d3f333",
  "Dendro": "#9ae60033",
  "Electro": "#a684ff33",
  "Geo": "#ffb90033",
  "Hydro": "#00bcff33",
  "Pyro": "#fb2c3633"
}

const elementColor: Record<Element, string> = {
  "Anemo": "#00bc7d",
  "Cryo": "#00d3f3",
  "Dendro": "#9ae600",
  "Electro": "#a684ff",
  "Geo": "#ffb900",
  "Hydro": "#00bcff",
  "Pyro": "#fb2c36"
}

const elementIcon: Record<Element, string> = {
  "Anemo": IconAnemo,
  "Cryo": IconCyro,
  "Dendro": IconDendro,
  "Electro": IconElectro,
  "Geo": IconGeo,
  "Hydro": IconHydro,
  "Pyro": IconPyro
}

export function getElementColors(element: Element) {
  const bg = elementBg[element]
  const color = elementColor[element]
  const icon = elementIcon[element]
  return { bg, color, icon }
}