import { ActionTree, ActionContext, DispatchOptions } from "vuex";
import { OspreyState as State } from "./osprey-state";
import { OspreyGetters as Getters } from "./osprey-getters";
import { OspreyMutations as Mutations } from "./osprey-mutations";
import { OspreyActionTypes as ActionTypes } from "./osprey-action-types";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";

import * as T from '@/types'
import * as O from '@/types/osprey-types'
import * as OR from '@/types/osprey-response-types'
import * as OApiR from '@/api/types/osprey-response'

import airlock from "@/api";
// import * as parrotAPI from "@/api/parrotAPI";
import * as ospreyAPI from "@/api/ospreyAPI";

import { Pokes } from "@/api/ospreyAPI"
import { Scries } from "@/api/ospreyAPI"

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
    console.log('airlocking')
    airlock.openAirlockTo(
      deskName,

      // Main all-responses-handler
      (data: OR.OspreyResponse) => {
        console.log('subscription response')
        console.table(data)

        // if (OR.IsScheduleResponse(data)) {
        //   console.log('BlockedHosts ', data)
        //   // dispatch(ActionTypes.EXAMPLE, data.test.thing as string);
        // }
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

   [ActionTypes.ScrySchedule](
     ctx,
   ) {
     console.log('dispatching SCRY_SCHEDULE action...')
     return Scries.Schedule().then((r: OApiR.OspreyResponseSchedule) => {
       ctx.commit(MutationTypes.STATE_SCHEDULE_SET, r.fact)
     })
   },

   [ActionTypes.ScryEvery](
     ctx,
   ) {
     console.log('dispatching ScryEvery action...')
     return Scries.Groups().then((r) => {
       console.log('every ', r.fact)
       // ctx.commit(MutationTypes.STATE_GROUPS_SET, r.fact)
     })
   },

   [ActionTypes.ScryGroups](
     ctx,
   ) {
     console.log('dispatching SCRY_GROUPS action...')
     return Scries.Groups().then((r: OApiR.OspreyResponseHostedGroups) => {
       ctx.commit(MutationTypes.STATE_GROUPS_SET, r.fact)
     })
   },

   [ActionTypes.ScryChats](
     ctx,
   ) {
     console.log('dispatching ScryChats action...')
     return Scries.Chats().then((r: OApiR.OspreyResponseHostedChats) => {
       ctx.commit(MutationTypes.ChatsSet, r.fact)
     })
   },

   [ActionTypes.ScryHeaps](
     ctx,
   ) {
     console.log('dispatching ScryHeaps action...')
     return Scries.Heaps().then((r: OApiR.OspreyResponseHostedHeaps) => {
       ctx.commit(MutationTypes.HeapsSet, r.fact)
     })
   },

   [ActionTypes.ScryDiaries](
     ctx,
   ) {
     console.log('dispatching ScryDiaries action...')
     return Scries.Diaries().then((r: OApiR.OspreyResponseHostedDiaries) => {
       ctx.commit(MutationTypes.DiariesSet, r.fact)
     })
   },

};
