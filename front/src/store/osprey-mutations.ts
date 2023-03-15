import { MutationTree } from "vuex";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";
import { OspreyState } from "./osprey-state";
import * as T from "@/types";
import * as L from "@/types/loading-types";
import * as O from "@/types/osprey-types";

import { sigShip } from "@/helpers"

export type OspreyMutations<S = OspreyState> = {
  [MutationTypes.ScheduleSet](
    state: S,
    payload: Array<O.Schedule>
  ): void;

  [MutationTypes.EverySet](
    state: S,
    payload: Array<T.Flag>
  ): void;

  [MutationTypes.GroupsSet](
    state: S,
    payload: Array<T.Flag>
  ): void;

  [MutationTypes.ChatsSet](
    state: S,
    payload: Array<T.Flag>
  ): void;
  [MutationTypes.HeapsSet](
    state: S,
    payload: Array<T.Flag>
  ): void;
  [MutationTypes.DiariesSet](
    state: S,
    payload: Array<T.Flag>
  ): void;

  [MutationTypes.ArchiveLoaderSet](
    state: S,
    payload: { flag: T.Flag, state: L.LoaderState, total: number, complete: number }
  ): void;
};

export const mutations: MutationTree<OspreyState> & OspreyMutations = {
  [MutationTypes.ScheduleSet](
    state: OspreyState,
    payload: Array<O.Schedule>
  ) {
    state.schedule = payload
  },

  [MutationTypes.EverySet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.EverySet]>[1]
  ) {
    state.every = payload
  },

  [MutationTypes.GroupsSet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.GroupsSet]>[1]
  ) {
    state.groups = payload
  },

  [MutationTypes.ChatsSet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.ChatsSet]>[1]
  ) {
    state.chats = payload
  },
  [MutationTypes.HeapsSet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.HeapsSet]>[1]
  ) {
    state.heaps = payload
  },
  [MutationTypes.DiariesSet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.DiariesSet]>[1]
  ) {
    state.diaries = payload
  },

  [MutationTypes.ArchiveLoaderSet](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.ArchiveLoaderSet]>[1]
  ) {
    const newLoading = {}
    newLoading[payload.flag] = {
      state: payload.state,
      total: payload.total,
      complete: payload.complete
    }
    const newState = {
      ...state.archiveLoadingState,
      ...newLoading
    }

    state.archiveLoadingState = newState

    if (payload.state === L.loaderStates.success) {
      setTimeout(() => {
        const newLoading = {}
        newLoading[payload.flag] = {
          state: L.loaderStates.initial,
          total: payload.total,
          complete: payload.complete
        }

        const newState = {
          ...state.archiveLoadingState,
          ...newLoading
        }
        state.archiveLoadingState = newState
      }, 4000)
    }
  },
};
