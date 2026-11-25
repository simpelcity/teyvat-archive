import type { Element } from '~/types/character'
import IconAnemo from '~/assets/images/elements/Icon_Anemo.png'
import IconCyro from '~/assets/images/elements/Icon_Cryo.png'
import IconDendro from '~/assets/images/elements/Icon_Dendro.png'
import IconElectro from '~/assets/images/elements/Icon_Electro.png'
import IconGeo from '~/assets/images/elements/Icon_Geo.png'
import IconHydro from '~/assets/images/elements/Icon_Hydro.png'
import IconPyro from '~/assets/images/elements/Icon_Pyro.png'

import IconAnemoFlat from '~/assets/images/elements/Icon_Anemo_Flat.png'
import IconCyroFlat from '~/assets/images/elements/Icon_Cryo_Flat.png'
import IconDendroFlat from '~/assets/images/elements/Icon_Dendro_Flat.png'
import IconElectroFlat from '~/assets/images/elements/Icon_Electro_Flat.png'
import IconGeoFlat from '~/assets/images/elements/Icon_Geo_Flat.png'
import IconHydroFlat from '~/assets/images/elements/Icon_Hydro_Flat.png'
import IconPyroFlat from '~/assets/images/elements/Icon_Pyro_Flat.png'

const elementBg: Record<Element, string> = {
  "Anemo": "#00bc7d90",
  "Cryo": "#00d3f390",
  "Dendro": "#9ae60090",
  "Electro": "#a684ff90",
  "Geo": "#ffb90090",
  "Hydro": "#00bcff90",
  "Pyro": "#fb2c3690"
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

const elementIconFlat: Record<Element, string> = {
  "Anemo": IconAnemoFlat,
  "Cryo": IconCyroFlat,
  "Dendro": IconDendroFlat,
  "Electro": IconElectroFlat,
  "Geo": IconGeoFlat,
  "Hydro": IconHydroFlat,
  "Pyro": IconPyroFlat
}

export function getElementColors(element: Element) {
  const bg = elementBg[element]
  const color = elementColor[element]
  const icon = elementIcon[element]
  const flat = elementIconFlat[element]
  return { bg, color, icon, flat }
}