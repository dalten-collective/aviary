import * as T from '@/types'
import * as O from '@/types/osprey-types'

export interface StateSchedule {
  face: 'OSPREY-STATE-SCHEDULE';
  type: 'SCRY';
  fact: Array<O.Schedule>;
}

export type OspreyResponse =
  StateSchedule

export const IsScheduleResponse = (r: OspreyResponse):
  r is StateSchedule => {
  return (r.face === 'OSPREY-STATE-SCHEDULE')
}
