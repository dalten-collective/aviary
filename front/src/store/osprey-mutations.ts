import { MutationTree } from "vuex";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";
import { OspreyState } from "./osprey-state";
import * as T from "@/types";
import * as O from "@/types/osprey-types";

import { sigShip } from "@/helpers"

export type OspreyMutations<S = OspreyState> = {
  [MutationTypes.STATE_SCHEDULE_SET](
    state: S,
    schedule: Array<O.Schedule>
  ): void;

  [MutationTypes.STATE_GROUPS_SET](
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
};

export const mutations: MutationTree<OspreyState> & OspreyMutations = {
  [MutationTypes.STATE_SCHEDULE_SET](
    state: OspreyState,
    schedule: Array<O.Schedule>
  ) {
    state.schedule = schedule
  },

  [MutationTypes.STATE_GROUPS_SET](
    state: OspreyState,
    payload: Parameters<OspreyMutations[MutationTypes.STATE_GROUPS_SET]>[1]
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
};
