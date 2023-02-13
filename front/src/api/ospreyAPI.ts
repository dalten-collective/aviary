import urbitAPI from "./urbitAPI";
import * as O from "@/types/osprey-types"
import * as T from "@/types"
import * as OR from '@/api/types/osprey-response'
import * as OP from '@/api/types/osprey-poke'

import * as OA from "./ospreyActionPoker"; 
import * as OS from "./ospreyScrier"; 

export const Scries = {
  Schedule() { return scrySchedule() },
  Every() { return scryEvery() },
  Dms() { return scryDms() },
  Chats() { return scryChats() },
  Heaps() { return scryHeaps() },
  Groups() { return scryGroups() },
  Diaries() { return scryDiaries() },
}

export const Pokes = {
  ArchiveHeap(flag) { return pokeArchiveHeap(flag) },
  ArchiveDiary(flag) { return pokeArchiveDiary(flag) },
  ArchiveGroup(flag) { return pokeArchiveGroup(flag) },
  ArchiveChat(flag) { return pokeArchiveChat(flag) }
}

////

export function scrySchedule(): Promise<OR.OspreyResponseSchedule> {
  const scrier = new OS.ScrySchedule()
  return scrier.scry()
}

export function scryEvery(): Promise<OR.OspreyResponseHostedEvery> {
  const scrier = new OS.ScryEvery()
  return scrier.scry()
}

export function scryDms(): Promise<OR.OspreyResponseHostedDms> {
  const scrier = new OS.ScryDms()
  return scrier.scry()
}

export function scryChats(): Promise<OR.OspreyResponseHostedChats> {
  const scrier = new OS.ScryChats()
  return scrier.scry()
}

export function scryHeaps(): Promise<OR.OspreyResponseHostedHeaps> {
  const scrier = new OS.ScryHeaps()
  return scrier.scry()
}

export function scryGroups(): Promise<OR.OspreyResponseHostedGroups> {
  const scrier = new OS.ScryGroups()
  return scrier.scry()
}

export function scryDiaries(): Promise<OR.OspreyResponseHostedDiaries> {
  const scrier = new OS.ScryDiaries()
  return scrier.scry()
}

////

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

