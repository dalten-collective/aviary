import * as T from '@/types'
import * as O from '@/types/osprey-types'

//export enum OspreyPokes {
//}

export interface ArchiveMinePayload {
  mine: null
}

export interface ArchiveHeapPayload {
  heap: T.Flag
}

export interface ArchiveDiaryPayload {
  diary: T.Flag
}

export interface ArchiveGroupPayload {
  group: T.Flag
}

export interface ArchiveChatPayload {
  chat: {
    flag: T.Flag;
  }
}

export interface RepeatArchivePayload {
  repeat: {
    archive: {
      string: T.Flag;
    },
    frequency: number;
  }
}

// TODO: don't use
export interface ArchiveDmPayload {
  chat: {
    ship: T.Ship;
  }
}
// TODO: don't use
export interface ArchiveClubPayload {
  chat: {
    club: string; // 0v12345
  }
}

export type OspreyArchivePoke =
  ArchiveMinePayload |
  ArchiveHeapPayload |
  ArchiveDiaryPayload |
  ArchiveGroupPayload |
  ArchiveChatPayload |
  ArchiveDmPayload |
  ArchiveClubPayload

export type OspreyPoke =
  OspreyArchivePoke |
  RepeatArchivePayload
