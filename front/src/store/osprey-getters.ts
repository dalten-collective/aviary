import { GetterTree } from 'vuex'
import { GetterTypes } from './osprey-getter-types'
import { OspreyState } from './osprey-state'
import * as T from '@/types'

export type OspreyGetters = {
  [GetterTypes.EXAMPLE_WITH_ARG](state: OspreyState): (arg: string) => string | null
  // Add more here.
}

export const getters: GetterTree<OspreyState, OspreyState> & OspreyGetters = {
  [GetterTypes.EXAMPLE_WITH_ARG]: (state) => (arg: string) => {
    // look something up in state
    return 'found it'
  },

  // Add more here
}
