import urbitAPI from "./urbitAPI";
import * as OR from '@/api/types/osprey-response'

class OspreyScry {
  path: string;

  constructor(
    path: string
  ) {
    this.path = path
  }

  scry(): Promise<any> {
    const path = this.path
    console.log('scry path ', path)
    return urbitAPI.scry({
      app: 'osprey',
      path
    })
  }
}

export class ScrySchedule extends OspreyScry {
  constructor() {
    super('/schedule')
  }

  scry(): Promise<OR.OspreyResponseSchedule> {
    return super.scry()
  }
}

export class ScryEvery extends OspreyScry {
  constructor() {
    super('/every')
  }

  scry(): Promise<OR.OspreyResponseHostedEvery> {
    return super.scry()
  }
}

export class ScryDms extends OspreyScry {
  constructor() {
    super('/dms')
  }

  scry(): Promise<OR.OspreyResponseHostedDms> {
    return super.scry()
  }
}

export class ScryChats extends OspreyScry {
  constructor() {
    super('/chats')
  }

  scry(): Promise<OR.OspreyResponseHostedChats> {
    return super.scry()
  }
}

export class ScryHeaps extends OspreyScry {
  constructor() {
    super('/heaps')
  }

  scry(): Promise<OR.OspreyResponseHostedHeaps> {
    return super.scry()
  }
}

export class ScryGroups extends OspreyScry {
  constructor() {
    super('/groups')
  }

  scry(): Promise<OR.OspreyResponseHostedGroups> {
    return super.scry()
  }
}

export class ScryDiaries extends OspreyScry {
  constructor() {
    super('/diaries')
  }

  scry(): Promise<OR.OspreyResponseHostedDiaries> {
    return super.scry()
  }
}

