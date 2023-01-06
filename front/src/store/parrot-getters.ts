import { GetterTree } from 'vuex'
import { ParrotGetterTypes as GetterTypes } from './parrot-getter-types'
import { ParrotState as State } from './parrot-state'
import * as T from '@/types'

export type ParrotGetters = {
  [GetterTypes.EXAMPLE_WITH_ARG](state: State): (arg: string) => string | null
  // Add more here.
}

export const getters: GetterTree<State, State> & Getters = {
  [GetterTypes.EXAMPLE_WITH_ARG]: (state) => (arg: string) => {
    // look something up in state
    return 'found it'
  },

  // Add more here
}
