import {
  createStore,
  Store as VuexStore,
  CommitOptions,
  DispatchOptions,
} from 'vuex'
import { ParrotState as State, parrotState as state} from './parrot-state'
import { ParrotGetters as Getters, getters } from './parrot-getters'
import { ParrotMutations as Mutations, mutations } from './parrot-mutations'
import { ParrotActions as Actions, actions } from './parrot-actions'

export const store = createStore({
  state,
  getters,
  mutations,
  actions,
})

export function useStore() {
  return store as Store
}

export type Store = Omit<
  VuexStore<State>,
  'getters' | 'commit' | 'dispatch'
> & {
  commit<K extends keyof Mutations, P extends Parameters<Mutations[K]>[1]>(
    key: K,
    payload: P,
    options?: CommitOptions
  ): ReturnType<Mutations[K]>
} & {
  dispatch<K extends keyof Actions>(
    key: K,
    payload: Parameters<Actions[K]>[1],
    options?: DispatchOptions
  ): ReturnType<Actions[K]>
} & {
  getters: {
    [K in keyof Getters]: ReturnType<Getters[K]>
  }
}
