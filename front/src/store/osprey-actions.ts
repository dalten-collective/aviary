import { ActionTree, ActionContext, DispatchOptions } from "vuex";
import { ospreyState as State } from "./osprey-state";
import { OspreyGetters as Getters } from "./osprey-getters";
import { OspreyMutations as Mutations } from "./osprey-mutations";
import { OspreyActionTypes as ActionTypes } from "./osprey-action-types";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";

import * as T from '@/types'
import * as P from '@/types/parrot-types'
import * as PR from '@/types/parrot-response-types'

import airlock from "@/api";
// import * as parrotAPI from "@/api/parrotAPI";

type AugmentedActionContext = {
  commit<K extends keyof Mutations>(
    key: K,
    payload: Parameters<Mutations[K]>[1]
  ): ReturnType<Mutations[K]>;
  getters: {
    [K in keyof Getters]: ReturnType<Getters[K]>;
  };
  dispatch<K extends keyof Actions>(
    key: K,
    payload?: Parameters<Actions[K]>[1],
    options?: DispatchOptions
  ): ReturnType<Actions[K]>;
} & Omit<ActionContext<State, State>, "commit">;

export interface Actions {
  [ActionTypes.AIRLOCK_OPEN](
    { commit }: AugmentedActionContext,
    deskName: string
  ): void;
}

export const actions: ActionTree<State, State> & Actions = {
  [ActionTypes.AIRLOCK_OPEN]({ commit, dispatch }, deskName: string) {

    airlock.openAirlockTo(
      deskName,

      // Main all-responses-handler
      (data: PR.ParrotResponse) => {
        console.log('subscription response')
        console.table(data)

        if (PR.IsBlockedHostsResponse(data)) {
          console.log('BlockedHosts ', data)
          // dispatch(ActionTypes.EXAMPLE, data.test.thing as string);
        }
      },

      (subscriptionNumber: number) => {
        // Thing to do on subscription callback, if anything
      }
    );
  },

   // [ActionTypes.FLOCK_FORM](
   //   ctx,
   //   args: {
   //     area: P.Area;
   //     chat: P.Chat;
   //   }
   // ) {
   //   console.log('dispatching FLOCK_FORM action...')
   //   return parrotAPI.form(args)
   // },
};
