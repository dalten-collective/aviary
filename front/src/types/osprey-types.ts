import * as T from "@/types";

export interface Schedule {
  next: number; // hoon seconds
  last: number; // hoon seconds
  area: {
    type: string; // like "GROUP" or "ALL-HOSTED"
    flag: T.Flag; // when "ALL-HOSTED", there is no flag present
  };
}

export interface MailSlot {
  data: MailDataNone | MailDataContent;
  group: T.Flag;
}

export type MailDataNone = "NONE";

export interface MailDataContent {
  admins: Array<T.Ship>;
  "included-files": Array<{
    flag: T.Flag;
    type: T.ResourceType;
  }>;
  members: Array<T.Ship>;
  group: T.Flag;
}

export interface Defendants {
  flag: T.Flag,  // the group
  type: "doom" | "boot",
  limit: number, // TODO: or is this a string?
  age: string,   // hoon time ago
  ships: Array<T.Ship>
}
