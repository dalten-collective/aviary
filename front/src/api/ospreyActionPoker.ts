import urbitAPI from "./urbitAPI";
import * as OP from '@/api/types/osprey-poke'

const OspreyActionMark = "osprey-actions"

class OspreyAction {
  payload: any;

  constructor(
    payload: OP.OspreyPoke
  ) {
    this.payload = payload
  }

  poke(): Promise<any> {
    const json = this.payload
    console.log('json ', json)
    return urbitAPI.poke({
      app: 'osprey',
      mark: OspreyActionMark,
      json
    })
  }
}

export class MailOpen extends OspreyAction {
  declare payload: OP.MailOpenPayload['open'];

  constructor(args: OP.MailOpenPayload['open']) {
    const json: OP.MailOpenPayload = {
      open: args
    }
    super(json)
  }
}

export class MailSend extends OspreyAction {
  declare payload: OP.MailSendPayload['mail'];

  constructor(args: OP.MailSendPayload['mail']) {
    const json: OP.MailSendPayload = {
      mail: args
    }
    super(json)
  }
}

export class MailRead extends OspreyAction {
  declare payload: OP.MailReadPayload['read'];

  constructor(args: OP.MailReadPayload['read']) {
    const json: OP.MailReadPayload = {
      read: args
    }
    super(json)
  }
}

export class MailKill extends OspreyAction {
  declare payload: OP.MailKillPayload['kill'];

  constructor(args: OP.MailKillPayload['kill']) {
    const json: OP.MailKillPayload = {
      kill: args
    }
    super(json)
  }
}

export class ArchiveMine extends OspreyAction {
  declare payload: null;

  constructor() {
    const json: OP.ArchiveMinePayload = {
      mine: null
    }
    super(json)
  }
}

export class ArchiveHeap extends OspreyAction {
  declare payload: OP.ArchiveHeapPayload['heap'];

  constructor(flag: OP.ArchiveHeapPayload['heap']) {
    const json: OP.ArchiveHeapPayload = {
      heap: flag
    }
    super(json)
  }
}

export class ArchiveDiary extends OspreyAction {
  declare payload: OP.ArchiveDiaryPayload['diary'];

  constructor(flag: OP.ArchiveDiaryPayload['diary']) {
    const json: OP.ArchiveDiaryPayload = {
      diary: flag
    }
    super(json)
  }
}

export class ArchiveGroup extends OspreyAction {
  declare payload: OP.ArchiveGroupPayload['group'];

  constructor(flag: OP.ArchiveGroupPayload['group']) {
    const json: OP.ArchiveGroupPayload = {
      group: flag
    }
    super(json)
  }
}

export class ArchiveChat extends OspreyAction {
  declare payload: OP.ArchiveChatPayload['chat']['flag'];

  constructor(flag: OP.ArchiveChatPayload['chat']['flag']) {
    const json: OP.ArchiveChatPayload = {
      chat: {
        flag
      }
    }
    super(json)
  }
}

export class RepeatArchive extends OspreyAction {
  declare payload: OP.RepeatArchivePayload;

  constructor(flag, typeString, schedule) {
    var json = {
      repeat: {
        archive: {},
        frequency: schedule
      }
    } as OP.RepeatArchivePayload

    if (typeString === 'chat') {
      json.repeat.archive[typeString] = {
        flag: flag
      }
    } else {
      json.repeat.archive[typeString] = flag
    }

    console.log('rep payload ', json)

    super(json)
  }
}

export class Doom extends OspreyAction {
  declare payload: OP.DoomPayload['doom']

  constructor(args: OP.DoomPayload['doom']) {
    const json: OP.DoomPayload = {
      doom: args
    }
    super(json)
  }
}

export class Boot extends OspreyAction {
  declare payload: OP.BootPayload['boot']

  constructor(args: OP.BootPayload['boot']) {
    const json: OP.BootPayload = {
      boot: args
    }
    super(json)
  }
}

export class Execute extends OspreyAction {
  declare payload: OP.ExecutePayload['exec']['id']

  constructor(args: OP.ExecutePayload['exec']['id']) {
    const json: OP.ExecutePayload = {
      exec: {
        id: args
      }
    }
    super(json)
  }
}

export class Pardon extends OspreyAction {
  declare payload: OP.PardonPayload['stop']['id']

  constructor(args: OP.PardonPayload['stop']['id']) {
    const json: OP.PardonPayload = {
      stop: {
        id: args
      }
    }
    super(json)
  }
}
