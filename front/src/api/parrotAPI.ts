import urbitAPI from "./urbitAPI";
import * as P from "@/types/parrot-types"
import * as T from "@/types"

const PARROT_ACTION_MARK = "parrot-action"

export function form(args: {
  area: P.Area,
  chat: P.Chat,
}): Promise<any> {
  const json = {
    form: args
  }

  return urbitAPI
    .poke({
      app: 'parrot',
      mark: PARROT_ACTION_MARK,
      json
    })
}

export function drop(args: {
  area: P.Area,
}): Promise<any> {
  const json = {
    drop: args
  }

  return urbitAPI
    .poke({
      app: 'parrot',
      mark: PARROT_ACTION_MARK,
      json
    })
}

export function send(args: {
  area: P.Area;
  note: string;
  ships: Array<T.Ship>;
}): Promise<any> {
  const { area, note, ships } = args

  const json = {
    send: {
      area,
      buds: {
        note,
        them: ships
      },
    }
  }

  return urbitAPI
    .poke({
      app: 'parrot',
      mark: PARROT_ACTION_MARK,
      json
    })
}

export function scryAvail(): Promise<any> {
  return urbitAPI.scry({
    app: 'parrot',
    path: '/aval'
  })
}

export function scryFlok(): Promise<any> {
  return urbitAPI.scry({
    app: 'parrot',
    path: '/flok'
  })
}

export function scrySent(): Promise<any> {
  return urbitAPI.scry({
    app: 'parrot',
    path: '/sent'
  })
}
