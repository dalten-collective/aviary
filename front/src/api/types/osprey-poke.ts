import * as T from '@/types'
import * as O from '@/types/osprey-types'

//export enum OspreyPokes {
//}

export interface MailOpenPayload {
  open: {
    host: T.Ship;
    group: T.Flag;
  }
}

export interface MailSendPayload {
  mail: {
    recipient: T.Ship;
    group: T.Flag;
  }
}

export interface MailReadPayload {
  read: {
    host: T.Ship;
    group: T.Flag;
    "new-group-name": string; // valid group string
    roster: {
      members: boolean;
      administrators: boolean;
    },
    include: Array<{
      type: string; // chat || heap || note
      "old-resource": T.Flag;
      "new-resource-name": string; // valid group name
    }>
  }
}

export interface MailKillPayload {
  kill: {
    host: T.Ship;
    group: T.Flag;
  }
}

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

export interface DoomPayload {
  doom: {
    limit: number;
    age: number;
    group: T.Flag;
  }
}

export interface BootPayload {
  boot: {
    rank: string;
    group: T.Flag;
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
  RepeatArchivePayload |
  DoomPayload |
  BootPayload |
  MailOpenPayload |
  MailSendPayload |
  MailReadPayload |
  MailKillPayload
