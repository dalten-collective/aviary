import * as T from "@/types";
import * as O from "@/types/osprey-types";

export const ospreyState = {
  schedule: [] as Array<O.Schedule>,
}

export type OspreyState = typeof ospreyState
