import * as T from "@/types";
import * as P from "@/types/parrot-types";

export const state = {
  availableChats: [] as Array<P.Chat>,
  flocks: [] as Array<P.Flock>,
  sentInvites: [] as Array<P.AreaInvite>,
  pendingInvites: [] as Array<P.Invitation>,
}

export type State = typeof state
