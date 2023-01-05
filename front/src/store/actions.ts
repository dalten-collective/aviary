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
  [ActionTypes.AIRLOCK_OPEN](
    { commit }: AugmentedActionContext,
    deskName: string
  ): void;

  [ActionTypes.FLOCK_FORM](
    { commit }: AugmentedActionContext,
    args: {
      area: P.Area;
      chat: P.Chat;
    }
  ): Promise<any>;

  [ActionTypes.FLOCK_DROP](
    { commit }: AugmentedActionContext,
    args: {
      area: P.Area;
    }
  ): Promise<any>;

  [ActionTypes.INVITE_SEND](
    { commit }: AugmentedActionContext,
    args: {
      area: P.Area;
      note: string;
      ships: Array<T.Ship>;
    }
  ): Promise<any>;

  [ActionTypes.SCRY_AVAIL_CHATS](
    { commit }: AugmentedActionContext,
  ): Promise<any>;

  [ActionTypes.SCRY_FLOKS](
    { commit }: AugmentedActionContext,
  ): Promise<any>;

  [ActionTypes.SCRY_SENT_INVITES](
    { commit }: AugmentedActionContext,
  ): Promise<any>;
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
        if (PR.IsPendingInvitesResponse(data)) {
          console.log('PendingInvites ', data)
        }
        if (PR.IsSentInvitesResponse(data)) {
          console.log('SentInvites ', data)
          commit(MutationTypes.SENT_INVITES_SET, data.fact)
        }
        if (PR.IsExistingFlocksResponse(data)) {
          console.log('ExistingFlocks ', data)
          commit(MutationTypes.EXISTING_FLOCKS_SET, data.fact)
        }
        if (PR.IsAvailableChatsResponse(data)) {
          console.log('AvailableChats ', data)
          commit(MutationTypes.AVAILABLE_CHATS_SET, data.fact)
        }
        if (PR.IsFlockStartFact(data)) {
          console.log('FlockStartFact ', data)
          commit(MutationTypes.EXISTING_FLOCKS_ADD, data.fact)
        }
        if (PR.IsFlockCeaseFact(data)) {
          console.log('FlockCeaseFact ', data)
          commit(MutationTypes.EXISTING_FLOCKS_REMOVE, data.fact)
        }
        if (PR.IsSendInviteFact(data)) {
          console.log('SendInvites ', data)
          commit(MutationTypes.SENT_INVITES_ADD, data.fact)
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
     return parrotAPI.form(args)
   },

   [ActionTypes.FLOCK_DROP](
     ctx,
     args: {
       area: P.Area;
     }
   ) {
     console.log('dispatching FLOCK_DROP action...')
     return parrotAPI.drop(args)
   },

   [ActionTypes.INVITE_SEND](
     ctx,
     args: {
       area: P.Area;
       note: string;
       ships: Array<T.Ship>;
     }
   ) {
     console.log('dispatching INVITE_SEND action...')
     return parrotAPI.send(args)
   },

   [ActionTypes.SCRY_AVAIL_CHATS](ctx) {
     console.log('dispatching scry avail action...')
     return parrotAPI.scryAvail().then((r: PR.AvailableChats) => {
       console.log('scry ', r)
       ctx.commit(MutationTypes.AVAILABLE_CHATS_SET, r.fact)
     })
   },

   [ActionTypes.SCRY_FLOKS](ctx) {
     console.log('dispatching scry floks action...')
     return parrotAPI.scryFlok().then((r: PR.ExistingFlocks) => {
       console.log('scry ', r)
       ctx.commit(MutationTypes.EXISTING_FLOCKS_SET, r.fact)
     })
   },

   [ActionTypes.SCRY_SENT_INVITES](ctx) {
     console.log('dispatching scry sent action...')
     return parrotAPI.scrySent().then((r: PR.SentInvites) => {
       console.log('scry ', r)
       ctx.commit(MutationTypes.SENT_INVITES_SET, r.fact)
     })
   },

};
