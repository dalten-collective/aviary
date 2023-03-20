import { ActionTree, ActionContext, DispatchOptions } from "vuex";
import { OspreyState as State } from "./osprey-state";
import { OspreyGetters as Getters } from "./osprey-getters";
import { OspreyMutations as Mutations } from "./osprey-mutations";
import { OspreyActionTypes as ActionTypes } from "./osprey-action-types";
import { OspreyMutationTypes as MutationTypes } from "./osprey-mutation-types";

import * as T from '@/types'
import * as L from '@/types/loading-types'
import * as O from '@/types/osprey-types'
import * as OR from '@/api/types/osprey-response'

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
        // console.table(data)
        console.log(data.face, ' ', data.fact)

        // if (OR.IsScheduleResponse(data)) {
        //   console.log('BlockedHosts ', data)
        //   // dispatch(ActionTypes.EXAMPLE, data.test.thing as string);
        // }

        if (OR.IsOspreyResponseMailslot(data)) {
          // TODO:
          console.log('got slots')
        }

        // TODO
        if (OR.IsOspreyResponseMailSending(data)) {
          console.log('sending mail...')
        }
        // TODO
        if (OR.IsOspreyResponseMailSent(data)) {
          console.log('mail sent!')
        }
        // TODO
        if (OR.IsOspreyResponseMailReceived(data)) {
          console.log('mail received!')
        }
        if (OR.IsOspreyResponseMailReading(data)) {
          console.log('mail reading...')
        }
        if (OR.IsOspreyResponseMailReadDone(data)) {
          console.log('mail read done!')
        }
        if (OR.IsOspreyResponseMailKilled(data)) {
          console.log('mail killed!')
        }

        if (OR.IsOspreyResponseSchedule(data)) {
          commit(MutationTypes.ScheduleSet, data.fact)
        }

        if (OR.IsOspreyResponseScheduleCancel(data)) {
          console.log('schedule cancel')
          dispatch(ActionTypes.ScrySchedule)
        }

        if (OR.IsOspreyHostedEvery(data)) {
          console.log('every response')
          commit(MutationTypes.EverySet, data.fact)
        }

        if (OR.IsOspreyHostedChats(data)) {
          console.log('Chats response')
          commit(MutationTypes.ChatsSet, data.fact)
        }

        if (OR.IsOspreyHostedHeaps(data)) {
          console.log('Heaps response')
          commit(MutationTypes.HeapsSet, data.fact)
        }

        if (OR.IsOspreyHostedGroups(data)) {
          console.log('Groups response')
          commit(MutationTypes.GroupsSet, data.fact)
        }

        if (OR.IsOspreyHostedDiaries(data)) {
          console.log('Diaries response')
          commit(MutationTypes.DiariesSet, data.fact)
        }

        if (OR.IsOspreyResponseArchiveStart(data)) {
          console.log('archive started')
          console.log(data)
          commit(MutationTypes.ArchiveLoaderSet, { flag: data.fact.archiving.path, state: L.loaderStates.loading })
        }

        if (OR.IsOspreyResponseArchiveStatusUpdate(data)) {
          console.log('archive update:')
          console.log(data)
          // TODO:
          if (data.fact.done) {
            console.log('done')
            commit(MutationTypes.ArchiveLoaderSet, {
              flag: data.fact.archiving.path,
              state: L.loaderStates.success,
              total: data.fact.total,
              complete: data.fact.complete,
            })
            console.log('dispatching scry schedule')
            dispatch(ActionTypes.ScrySchedule)
          } else {
            console.log('progress: ', data.fact.complete, '/', data.fact.total)

            // for(let i = 0; i <= 10; i++) {
            //   setTimeout(() => {
            //     commit(MutationTypes.ArchiveLoaderSet, {
            //       flag: data.fact.archiving.path,
            //       state: L.loaderStates.loading,
            //       total: 10, // data.fact.total,
            //       complete: i, // data.fact.complete,
            //     })
            //   }, i * 500, i)
            // }

            commit(MutationTypes.ArchiveLoaderSet, {
              flag: data.fact.archiving.path,
              state: L.loaderStates.loading,
              total: data.fact.total,
              complete: data.fact.complete,
            })
          }
        }

        if (OR.IsOspreyResponseDoomStart(data)) {
          console.log('doom started...')
          console.log(data)
        }
        if (OR.IsOspreyResponseDoomDone(data)) {
          console.log('doom done')
          console.log(data)
        }

        if (OR.IsOspreyResponseBootStart(data)) {
          console.log('boot started...')
          console.log(data)
        }
        if (OR.IsOspreyResponseBootDone(data)) {
          console.log('boot done')
          console.log(data)
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

   [ActionTypes.ScrySchedule](
     ctx,
   ) {
     console.log('dispatching SCRY_SCHEDULE action...')
     return Scries.Schedule().then((r: OR.OspreyResponseSchedule) => {
       ctx.commit(MutationTypes.ScheduleSet, r.fact)
     })
   },

   [ActionTypes.ScryMailslots](
     ctx,
   ) {
     console.log('dispatching ScryMailslots action...')
     return Scries.Mail().then((r: OR.OspreyResponseMailslot) => {
       ctx.commit(MutationTypes.MailslotSet, r.fact)
     })
   },

   [ActionTypes.ScryEvery](
     ctx,
   ) {
     console.log('dispatching ScryEvery action...')
     return Scries.Every().then((r) => {
       console.log('every ', r.fact)
       // ctx.commit(MutationTypes.STATE_GROUPS_SET, r.fact)
     })
   },

   [ActionTypes.ScryGroups](
     ctx,
   ) {
     console.log('dispatching SCRY_GROUPS action...')
     return Scries.Groups().then((r: OR.OspreyResponseHostedGroups) => {
       ctx.commit(MutationTypes.GroupsSet, r.fact)
     })
   },

   [ActionTypes.ScryChats](
     ctx,
   ) {
     console.log('dispatching ScryChats action...')
     return Scries.Chats().then((r: OR.OspreyResponseHostedChats) => {
       ctx.commit(MutationTypes.ChatsSet, r.fact)
     })
   },

   [ActionTypes.ScryHeaps](
     ctx,
   ) {
     console.log('dispatching ScryHeaps action...')
     return Scries.Heaps().then((r: OR.OspreyResponseHostedHeaps) => {
       ctx.commit(MutationTypes.HeapsSet, r.fact)
     })
   },

   [ActionTypes.ScryDiaries](
     ctx,
   ) {
     console.log('dispatching ScryDiaries action...')
     return Scries.Diaries().then((r: OR.OspreyResponseHostedDiaries) => {
       ctx.commit(MutationTypes.DiariesSet, r.fact)
     })
   },

};
