import { MutationTree } from "vuex";
import { MutationTypes } from "./mutation-types";
import { State } from "./state";
import * as T from "@/types";
import * as P from "@/types/parrot-types";
import * as P from "@/types/parrot-types";

import { sigShip } from "@/helpers"

export type Mutations<S = State> = {
  [MutationTypes.AVAILABLE_CHATS_SET](
    state: S,
    chats: Array<P.Chat>
  ): void;

  [MutationTypes.EXISTING_FLOCKS_SET](
    state: S,
    flocks: Array<P.Flock>
  ): void;

  [MutationTypes.EXISTING_FLOCKS_ADD](
    state: S,
    flock: P.Flock,
  ): void;

  [MutationTypes.EXISTING_FLOCKS_REMOVE](
    state: S,
    area: P.Area,
  ): void;

  [MutationTypes.SENT_INVITES_SET](
    state: S,
    invites: Array<P.AreaInvite>
  ): void;

  [MutationTypes.SENT_INVITES_ADD](
    state: S,
    invites: P.Invite
  ): void;

  [MutationTypes.PENDING_INVITES_SET](
    state: S,
    invites: Array<P.Invitation>
  ): void;
};

export const mutations: MutationTree<State> & Mutations = {
  [MutationTypes.AVAILABLE_CHATS_SET](
    state: State,
    chats: Array<P.Chat>
  ) {
    state.availableChats = chats
  },

  [MutationTypes.EXISTING_FLOCKS_SET](
    state: State,
    flocks: Array<P.Flock>
  ) {
    state.flocks = flocks
  },

  [MutationTypes.EXISTING_FLOCKS_ADD](
    state: State,
    flock: P.Flock,
  ) {
    state.flocks = state.flocks.concat(flock)
  },

  [MutationTypes.EXISTING_FLOCKS_REMOVE](
    state: State,
    area: P.Area,
  ) {
    state.flocks = state.flocks.filter((f: P.Flock) => {
      f.area === area
    })
  },

  [MutationTypes.SENT_INVITES_SET](
    state: State,
    invites: Array<P.Invite>  // TODO
  ) {
    state.sentInvites = invites
  },

  [MutationTypes.SENT_INVITES_ADD](
    state: State,
    invite: P.Invite,
  ) {
    // TODO:
    // 1. find this area in state.invites
    // 2. for each bud in fact.buds:
    //   - if exists, update note
    //   - if not, add an invitation
    // state.sentInvites = state.sentInvites.concat(invite)
  },

  [MutationTypes.PENDING_INVITES_SET](
    state: State,
    invites: Array<{ host: T.Flag; invitation: P.Invitation }>
  ) {
    state.pendingInvites = invites
  },
};
