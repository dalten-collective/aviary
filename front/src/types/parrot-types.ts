import * as T from '@/types'

export type Area = string;     // hepped
export type Chat = T.Flag;

export interface Flock {
  area: Area;
  host: T.Flag;
  team: Array<T.Flag>
}

export type InviteStatuses =
  "RECEIVED" |
  "TRANSMITTED" |
  "RECEIVED" |
  "REJECTED" |
  "AFFIRMED"

export interface ReceivedInvitation extends Invite {
  status: {
    status: "RECEIVED";
    when: T.When | null;
  }
}
export interface TransmittedInvitation extends Invite {
  status: {
    status: "TRANSMITTED";
    when: T.When | null;
  }
}

export interface Invitation {
  area: Area;
  note: string;
  when: T.When;
}

export interface AreaInvite {
  area: Area;
  invites: Array<Invite>
}

export interface Invite {
  to: T.Ship;
  invitation: Invitation;
  status: {
    status: InviteStatuses;
    when: T.When | null;
  }
}
