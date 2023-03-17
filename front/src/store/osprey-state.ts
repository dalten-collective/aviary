import * as T from "@/types";
import * as O from "@/types/osprey-types";

import * as L from "@/types/loading-types";

import { loaderStates } from "@/types/loading-types";

const uiElementLoadingState: L.UILoaderState = {
  yourElementHere: loaderStates.initial,
  anotherElement: loaderStates.initial,
}

interface ArchiveLoader {
  [key: T.Flag]: {
    state: L.LoaderState,
    total: number,
    complete: number,
  };
}

export const ospreyState = {
  schedule: [] as Array<O.Schedule>,
  groups: [] as Array<T.Flag>,
  chats: [] as Array<T.Flag>,
  heaps: [] as Array<T.Flag>,
  diaries: [] as Array<T.Flag>,
  every: [] as Array<T.Flag>,
  mailslot: [] as Array<O.MailSlot>,

  archiveLoadingState: {} as { ArchiveLoader },

  loadingStates: uiElementLoadingState as L.UILoaderState,
}

export type OspreyState = typeof ospreyState
