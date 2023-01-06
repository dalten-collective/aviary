import * as T from "@/types";
import * as P from "@/types/parrot-types";

export const parrotState = {
  availableChats: [] as Array<P.Chat>,
  flocks: [] as Array<P.Flock>,
  sentInvites: [] as Array<P.AreaInvite>,
  pendingInvites: [] as Array<{ host: T.Flag; invitation: P.Invitation }>,
}

export type ParrotState = typeof parrotState