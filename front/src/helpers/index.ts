import { unixToDa, decToUd } from '@urbit/api'
import * as T from '@/types'

export const sigShip = (ship: string | T.Ship): T.Ship => {
  if (!ship) {
    return '~'
  }
  if (ship[0] === "~") {
    return ship as T.Ship;
  }
  return `~${ship}`;
}

export const nowToUd = (): string => {
  return decToUd(unixToDa(Date.now()).toString())
}

export const secondsToUd = (sects: number): string => {
  return decToUd(unixToDa(sects).toString())
}

export const secondsToDate = (sects: number): Date => {
  return (new Date(sects * 1000))
}

export const serverAddress = () => {
  if (import.meta.env.DEV) {
    return import.meta.env.VITE_URBIT_TARGET
  } else {
    return `${ location.protocol }//${ location.host }`
  }
}
