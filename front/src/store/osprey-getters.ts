import { GetterTree } from 'vuex'
import { GetterTypes } from './osprey-getter-types'
import { OspreyState } from './osprey-state'
import * as T from '@/types'

export type OspreyGetters = {
  [GetterTypes.EXAMPLE_WITH_ARG](state: OspreyState): (arg: string) => string | null
  // Add more here.
  [GetterTypes.ArchiveLoaderProgress](state: OspreyState): (flag: T.Flag) => any
  [GetterTypes.ScheduleFor](state: OspreyState): (flag: T.Flag) => any
}

export const getters: GetterTree<OspreyState, OspreyState> & OspreyGetters = {
  [GetterTypes.EXAMPLE_WITH_ARG]: (state) => (arg: string) => {
    // look something up in state
    return 'found it'
  },

  [GetterTypes.ArchiveLoaderProgress]: (state) => (flag: T.Flag) => {
    const prog = state.archiveLoadingState[flag]
    if (!prog) {
      return null
    }
    return prog
  },

  [GetterTypes.ScheduleFor]: (state) => (flag: T.Flag) => {
    const sched = state.schedule.find(s => s.area.flag === flag)
    if (!sched) {
      return null
    }
    return {
      flag: sched.area.flag,
      next: new Date(sched.next * 1000),
      last: new Date(sched.last * 1000),
    }
  },

  // Add more here
}
