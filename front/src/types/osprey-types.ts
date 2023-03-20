import * as T from "@/types";

export interface Schedule {
  next: number; // hoon seconds
  last: number; // hoon seconds
  area: {
    flag: T.Flag;
    type: string; // like "GROUP"
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
