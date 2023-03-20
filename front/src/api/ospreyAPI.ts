import urbitAPI from "./urbitAPI";
import * as O from "@/types/osprey-types"
import * as T from "@/types"
import * as OR from '@/api/types/osprey-response'
import * as OP from '@/api/types/osprey-poke'

import * as OA from "./ospreyActionPoker"; 
import * as OS from "./ospreyScrier"; 

export const Scries = {
  Schedule() { return scrySchedule() },
  Mail() { return scryMail() },
  Every() { return scryEvery() },
  Dms() { return scryDms() },
  Chats() { return scryChats() },
  Heaps() { return scryHeaps() },
  Groups() { return scryGroups() },
  Diaries() { return scryDiaries() },
}

export const Pokes = {
  ArchiveMine() { return pokeArchiveMine() },
  ArchiveHeap(flag) { return pokeArchiveHeap(flag) },
  ArchiveDiary(flag) { return pokeArchiveDiary(flag) },
  ArchiveGroup(flag) { return pokeArchiveGroup(flag) },
  ArchiveChat(flag) { return pokeArchiveChat(flag) },
  RepeatArchive(flag, typeString, schedule) { return pokeRepeatArchive(flag, typeString, schedule) },
  Doom(args) { return pokeDoom(args) },
  Boot(args) { return pokeBoot(args) },

  MailOpen(args) { return pokeMailOpen(args) },
  MailSend(args) { return pokeMailSend(args) },
  MailRead(args) { return pokeMailRead(args) },
  MailKill(args) { return pokeMailKill(args) },
}

////

export function scrySchedule(): Promise<OR.OspreyResponseSchedule> {
  const scrier = new OS.ScrySchedule()
  return scrier.scry()
}

export function scryMail(): Promise<OR.OspreyResponseMail> {
  const scrier = new OS.ScryMail()
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

export function pokeArchiveMine(): Promise<any>
  {
  const poker = new OA.ArchiveMine()
  return poker.poke()
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

export function pokeRepeatArchive(
    flag: T.Flag,
    typeString: string,
    schedule: number
  ): Promise<any>
  {
  const poker = new OA.RepeatArchive(flag, typeString, schedule)
  return poker.poke()
}

export function pokeDoom(args: OP.DoomPayload['doom']): Promise<any>
  {
  const poker = new OA.Doom(args)
  return poker.poke()
}

export function pokeBoot(args: OP.BootPayload['boot']): Promise<any>
  {
  const poker = new OA.Boot(args)
  return poker.poke()
}

export function pokeMailOpen(args: OP.MailOpenPayload['open']): Promise<any>
  {
  const poker = new OA.MailOpen(args)
  return poker.poke()
}

export function pokeMailSend(args: OP.MailSendPayload['mail']): Promise<any>
  {
  const poker = new OA.MailSend(args)
  return poker.poke()
}

export function pokeMailRead(args: OP.MailReadPayload['read']): Promise<any>
  {
  const poker = new OA.MailRead(args)
  return poker.poke()
}

export function pokeMailKill(args: OP.MailKillPayload['kill']): Promise<any>
  {
  const poker = new OA.MailKill(args)
  return poker.poke()
}
