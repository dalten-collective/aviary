import urbitAPI from "./urbitAPI";
import * as P from "@/types/parrot-types"

const PARROT_ACTION_MARK = "parrot-action"

export function form(args: {
  area: P.Area,
  chat: P.Chat,
}) {
  const json = {
    form: args
  }

  console.log('json ', json)

  return urbitAPI
    .poke({
      app: 'parrot',
      mark: PARROT_ACTION_MARK,
      json
    })
    .then((r: any) => {
      console.log('form r ', r)
    });
}
