import { MutationTree } from "vuex";
import { MutationTypes } from "./mutation-types";
import { State } from "./state";
import * as T from "@/types";
import * as P from "@/types/parrot-types";

import { sigShip } from "@/helpers"

export type Mutations<S = State> = {
  [MutationTypes.EXAMPLE](
    state: S,
    payload: string
  ): void;

  [MutationTypes.AVAILABLE_CHATS_SET](
    state: S,
    chats: Array<P.Chat>
  ): void;

  [MutationTypes.EXISTING_FLOCKS_SET](
    state: S,
    flocks: Array<P.Flock>
  ): void;
};

export const mutations: MutationTree<State> & Mutations = {
  [MutationTypes.AVAILABLE_CHATS_SET](
    state,
    chats: Array<P.Chat>
  ) {
    state.availableChats = chats
  },

  [MutationTypes.EXISTING_FLOCKS_SET](
    state,
    flocks: Array<P.Flock>
  ) {
    state.flocks = flocks
  },
};
