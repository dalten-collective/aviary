import * as T from "@/types";
import * as P from "@/types/parrot-types";

export const state = {
  exampleThings: [] as Array<T.Thing>,
  availableChats: [] as Array<P.Chat>,
  flocks: [] as Array<P.Flock>,
}

export type State = typeof state
