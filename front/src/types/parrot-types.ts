import * as T from '@/types'

export type Area = string;     // hepped
export type Chat = T.Flag;

export interface Flock {
  area: Area;
  host: T.Flag;
  team: Array<T.Flag>
}
