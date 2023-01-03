import * as T from '@/types'
import * as P from '@/types/parrot-types'

export type InviteStatuses =
  "RECEIVED" |
  "TRANSMITTED" |
  "RECEIVED" |
  "REJECTED" |
  "AFFIRMED"

export interface Invitation {
  area: T.Area;
  note: string;
  status: {
    status: InviteStatuses;
    when: T.When | null;
  }
}

export interface ReceivedInvitation extends Invitation {
  status: {
    status: "RECEIVED";
    when: T.When | null;
  }
}

export interface BlockedHosts {
  face: 'BLOCKED-HOSTS';
  type: 'SCRY';
  fact: Array<T.Flag>
}

export interface PendingInvites {
  face: 'PENDING-INVITES';
  type: 'SCRY';
  fact: Array<{
    host: T.Flag;
    invitation: {
      area: T.Area;
      note: string;
      when: T.When;
    }
  }>
}

export interface SentInvites {
  face: 'SENT-INVITES';
  type: 'SCRY';
  fact: Array<{
    area: T.Area;
    invites: Array<{
      to: T.Ship;
      invitation: ReceivedInvitation;
    }>
  }>
}

export interface ExistingFlocks {
  face: 'EXISTING-FLOCKS';
  type: 'SCRY';
  fact: Array<P.Flock>;
}

export interface AvailableChats {
  face: 'AVAILABLE-CHATS';
  type: 'SCRY';
  fact: Array<P.Chat>
}

export type ParrotResponse =
  BlockedHosts |
  PendingInvites |
  SentInvites |
  ExistingFlocks |
  AvailableChats

export const IsBlockedHostsResponse = (r: ParrotResponse):
  r is BlockedHosts => {
  return (r.face === 'BLOCKED-HOSTS')
}
export const IsPendingInvitesResponse = (r: ParrotResponse):
  r is PendingInvites => {
  return (r.face === 'PENDING-INVITES')
}
export const IsSentInvitesResponse = (r: ParrotResponse):
  r is SentInvites => {
  return (r.face === 'SENT-INVITES')
}
export const IsExistingFlocksResponse = (r: ParrotResponse):
  r is ExistingFlocks => {
  return (r.face === 'EXISTING-FLOCKS')
}
export const IsAvailableChatsResponse = (r: ParrotResponse):
  r is AvailableChats => {
  return (r.face === 'AVAILABLE-CHATS')
}
