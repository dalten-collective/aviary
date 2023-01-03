import { ActionTree, ActionContext, DispatchOptions } from "vuex";
import { State } from "./state";
import { Getters } from "./getters";
import { Mutations } from "./mutations";
import { ActionTypes } from "./action-types";
import { MutationTypes } from "./mutation-types";

import * as T from '@/types'
import * as P from '@/types/parrot-types'
import * as PR from '@/types/parrot-response-types'

import airlock from "@/api";
import * as parrotAPI from "@/api/parrotAPI";

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
  [ActionTypes.EXAMPLE](
    { commit }: AugmentedActionContext,
    payload: string
  ): void;
  // Add more here.
}

export const actions: ActionTree<State, State> & Actions = {
  [ActionTypes.AIRLOCK_OPEN]({ commit, dispatch }, deskName: string) {

    airlock.openAirlockTo(
      deskName,

      // Main all-responses-handler
      (data: PR.ParrotResponse) => {
        if (PR.IsBlockedHostsResponse(data)) {
          console.log('BlockedHosts ', data)
          // dispatch(ActionTypes.EXAMPLE, data.test.thing as string);
        }
        if (PR.IsPendingInvitesResponse(data)) {
          console.log('PendingInvites ', data)
        }
        if (PR.IsSentInvitesResponse(data)) {
          console.log('SentInvites ', data)
        }
        if (PR.IsExistingFlocksResponse(data)) {
          console.log('ExistingFlocks ', data)
          commit(MutationTypes.EXISTING_FLOCKS_SET, data.fact)
        }
        if (PR.IsAvailableChatsResponse(data)) {
          console.log('AvailableChats ', data)
          commit(MutationTypes.AVAILABLE_CHATS_SET, data.fact)
        }
      },

      (subscriptionNumber: number) => {
        // Thing to do on subscription callback, if anything
      }
    );
  },

   [ActionTypes.FLOCK_FORM](
     ctx,
     args: {
       area: P.Area;
       chat: P.Chat;
     }
   ) {
     console.log('dispatching FLOCK_FORM action...')
     parrotAPI.form(args)
   },

  // Add more here

};
