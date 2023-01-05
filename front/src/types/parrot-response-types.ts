import * as T from '@/types'
import * as P from '@/types/parrot-types'


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
export interface BlockedHosts {
  face: 'BLOCKED-HOSTS';
  type: 'SCRY';
  fact: Array<T.Flag>
}

export interface SentInvites {
  face: 'SENT-INVITES';
  type: 'SCRY';
  fact: Array<P.AreaInvite>;
}

export interface FlockStartFact {
  face: 'FLOCK-FLOCK-START';
  type: 'FACT';
  fact: P.Flock;
}

export interface FlockCeaseFact {
  face: 'FLOCK-FLOCK-CEASE';
  type: 'FACT';
  fact: P.Area;
}

export interface SendInviteFact {
  face: 'INVITE-SEND-INVITES';
  type: 'FACT';
  fact: {
    area: P.Area;
    buds: Array<T.Ship>;
    note: string;
  };
}

export interface InviteReceivedFact {
  face: 'INVITE-RECEIVED-BIRD';
  type: 'FACT';
  fact: P.Invitation;
}

export interface PendingInvitesResponse {
  face: 'PENDING-INVITES';
  type: 'SCRY';
  fact: Array<{
    host: T.Flag;
    invitation: P.Invitation
  }>
}

export type InviteResponses = 'ACCEPTED'

// not needed
// export interface InviteAction {
//   area: P.Area;
//   act: InviteResponses;
//   host: T.Flag;
//   chat: T.Flag;
// }

export interface InviteAcceptedFact {
  type: "FACT",
  face: "INVITE-REPLIED-BIRD",
  fact: {
    area: P.Area;
    act: InviteResponses;
    host: T.Flag;
    chat: T.Flag;
  }
}

export interface InviteRejectedFact {
  type: "FACT";
  face: "INVITE-REPLIED-HOST";
  fact: {
    area: P.Area;
    who: T.Ship;
    status: {
      status: "REJECTED";
      when: number;
    }
  }
}

export type ParrotResponse =
  BlockedHosts |
  SentInvites |
  ExistingFlocks |
  AvailableChats |
  FlockCeaseFact |
  FlockStartFact |
  SendInviteFact |
  InviteReceivedFact |
  PendingInvitesResponse |
  InviteAcceptedFact |
  InviteRejectedFact

export const IsBlockedHostsResponse = (r: ParrotResponse):
  r is BlockedHosts => {
  return (r.face === 'BLOCKED-HOSTS')
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
export const IsFlockStartFact = (r: ParrotResponse):
  r is FlockStartFact => {
  return (r.face === 'FLOCK-FLOCK-START')
}
export const IsFlockCeaseFact = (r: ParrotResponse):
  r is FlockCeaseFact => {
  return (r.face === 'FLOCK-FLOCK-CEASE')
}
export const IsSendInviteFact = (r: ParrotResponse):
  r is SendInviteFact => {
  return (r.face === 'INVITE-SEND-INVITES')
}
export const IsInviteReceivedFact = (r: ParrotResponse):
  r is InviteReceivedFact => {
  return (r.face === 'INVITE-RECEIVED-BIRD')
}
export const IsPendingInvitesResponse = (r: ParrotResponse):
  r is PendingInvitesResponse => {
  return (r.face === 'PENDING-INVITES')
}
export const IsInviteAcceptedFact = (r: ParrotResponse):
  r is InviteAcceptedFact => {
  return (r.face === 'INVITE-REPLIED-BIRD')
}
export const IsInviteRejectedFact = (r: ParrotResponse):
  r is InviteRejectedFact => {
  return (r.face === 'INVITE-REPLIED-HOST')
}
