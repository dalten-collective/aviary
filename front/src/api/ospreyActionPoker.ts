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
