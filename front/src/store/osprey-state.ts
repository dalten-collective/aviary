import * as T from "@/types";
import * as O from "@/types/osprey-types";

export const ospreyState = {
  schedule: [] as Array<O.Schedule>,
  groups: [] as Array<T.Flag>,
  chats: [] as Array<T.Flag>,
  heaps: [] as Array<T.Flag>,
  diaries: [] as Array<T.Flag>,
}

export type OspreyState = typeof ospreyState
