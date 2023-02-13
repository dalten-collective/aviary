import urbitAPI from "./urbitAPI";
import * as O from "@/types/osprey-types"
import * as T from "@/types"
import * as OR from '@/api/types/osprey-response'
import * as OP from '@/api/types/osprey-poke'

import * as OA from "./ospreyActionPoker"; 

export function scrySchedule(): Promise<OR.OspreyResponseSchedule> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/schedule'
  })
}

export function scryEvery(): Promise<OR.OspreyResponseHostedEvery> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/every'
  })
}

export function scryDms(): Promise<OR.OspreyResponseHostedDms> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/dms'
  })
}

export function scryChats(): Promise<OR.OspreyResponseHostedChats> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/chats'
  })
}

export function scryHeaps(): Promise<OR.OspreyResponseHostedHeaps> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/heaps'
  })
}

export function scryGroups(): Promise<OR.OspreyResponseHostedGroups> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/groups'
  })
}

export function scryDiaries(): Promise<OR.OspreyResponseHostedDiaries> {
  return urbitAPI.scry({
    app: 'osprey',
    path: '/diaries'
  })
}

export function pokeArchiveHeap(flag: OP.ArchiveHeapPayload['heap']): Promise<any>
  {
  const poker = new OA.ArchiveHeap(flag)
  return poker.poke()
}

export function pokeArchiveDiary(flag: OP.ArchiveDiaryPayload['diary']): Promise<any>
  {
  const poker = new OA.ArchiveDiary(flag)
  return poker.poke()
}

export function pokeArchiveGroup(flag: OP.ArchiveGroupPayload['group']): Promise<any>
  {
  const poker = new OA.ArchiveGroup(flag)
  return poker.poke()
}

export function pokeArchiveChat(flag: OP.ArchiveChatPayload['chat']['flag']): Promise<any>
  {
  const poker = new OA.ArchiveChat(flag)
  return poker.poke()
}

export const Pokes = {
  ArchiveHeap(flag) { return pokeArchiveHeap(flag) },
  ArchiveDiary(flag) { return pokeArchiveDiary(flag) },
  ArchiveGroup(flag) { return pokeArchiveGroup(flag) },
  ArchiveChat(flag) { return pokeArchiveChat(flag) }
}

