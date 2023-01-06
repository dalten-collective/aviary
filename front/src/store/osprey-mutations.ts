import { MutationTree } from "vuex";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";
import { OspreyState } from "./osprey-state";
import * as T from "@/types";
import * as P from "@/types/parrot-types";

import { sigShip } from "@/helpers"

export type OspreyMutations<S = OspreyState> = {
  [MutationTypes.CHATS_SET](
    state: S,
    chats: Array<T.Flag>
  ): void;
};

export const mutations: MutationTree<OspreyState> & OspreyMutations = {
  [MutationTypes.CHATS_SET](
    state: OspreyState,
    chats: Array<T.Flag>
  ) {
    state.chats = chats
  },
};
