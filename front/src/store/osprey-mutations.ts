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
};

export const mutations: MutationTree<OspreyState> & OspreyMutations = {
  [MutationTypes.STATE_SCHEDULE_SET](
    state: OspreyState,
    schedule: Array<O.Schedule>
  ) {
    state.schedule = schedule
  },
};
