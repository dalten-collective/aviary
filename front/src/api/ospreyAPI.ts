import urbitAPI from "./urbitAPI";
import * as O from "@/types/osprey-types"
import * as T from "@/types"

// const PARROT_ACTION_MARK = "parrot-action"

// export function form(args: {
//   area: P.Area,
//   chat: P.Chat,
// }): Promise<any> {
//   const json = {
//     form: args
//   }
// 
//   return urbitAPI
//     .poke({
//       app: 'parrot',
//       mark: PARROT_ACTION_MARK,
//       json
//     })
// }

export function scrySchedule(): Promise<any> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/schedule'
  })
}
