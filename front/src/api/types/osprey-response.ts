import * as Api from '@/api/types/common'
import * as T from '@/types'
import * as O from '@/types/osprey-types'
import * as OP from '@/api/types/osprey-poke'

export enum OspreyResponseFaces {
  OspreyHostedEvery = "OSPREY-HOSTED-EVERY",
  OspreyHostedDms = "OSPREY-HOSTED-DMS",
  OspreyHostedChats = "OSPREY-HOSTED-CHATS",
  OspreyHostedHeaps = "OSPREY-HOSTED-HEAPS",
  OspreyHostedGroups = "OSPREY-HOSTED-GROUPS",
  OspreyHostedDiaries = "OSPREY-HOSTED-DIARIES",
  OspreySchedule = "OSPREY-STATE-SCHEDULE",
  ArchiveStart = "ARCHIVE-START",
  ArchiveStatusUpdate = "ARCHIVE-STATUS-UPDATE",
  Dooming = "DOOMING",
  DoomDone = "DOOMBOT-RESULTS",
  Booting = "BOOTING",
  BootDone = "BOOTBOT-RESULTS",
}

export interface OspreyResponseSchedule {
  type: Api.ResponseTypes.Scry;
  face: OspreyResponseFaces.OspreySchedule;
  fact: Array<O.Schedule>;
}

export interface OspreyResponseHostedEvery {
  type: Api.ResponseTypes.Scry;
  face: OspreyResponseFaces.OspreyHostedEvery;
  fact: Array<T.Flag>
}

export interface OspreyResponseHostedDms {
  type: Api.ResponseTypes.Scry;
    face: OspreyResponseFaces.OspreyHostedDms;
    fact: Array<T.Ship>
}

export interface OspreyResponseHostedChats {
  type: Api.ResponseTypes.Scry;
    face: OspreyResponseFaces.OspreyHostedChats;
    fact: Array<T.Flag>
}

export interface OspreyResponseHostedHeaps {
  type: Api.ResponseTypes.Scry;
    face: OspreyResponseFaces.OspreyHostedHeaps;
    fact: Array<T.Flag>
}

export interface OspreyResponseHostedGroups {
  type: Api.ResponseTypes.Scry;
    face: OspreyResponseFaces.OspreyHostedGroups;
    fact: Array<T.Flag>
}

export interface OspreyResponseHostedDiaries {
  type: Api.ResponseTypes.Scry;
  face: OspreyResponseFaces.OspreyHostedDiaries;
  fact: Array<T.Flag>
}

export interface OspreyResponseArchiveStart {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.ArchiveStart;
  fact: {
    archiving: {
      path: T.Flag;
      type: string;
    }
  }
}

export interface OspreyResponseArchiveStatusUpdate {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.ArchiveStatusUpdate;
  fact: {
    archiving: {
      path: T.Flag;
      type: string;
    };
    total: number;    // total jams to be produced
    complete: number; // jams completed thus far
    done: boolean;    // true when complete
  }
}

export interface OspreyResponseDoomStart {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.Dooming;
  fact: {
    seconds: number;
    group: T.Flag;
  };
}

export interface OspreyResponseDoomDone {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.DoomDone;
  fact: {
    kililed: Array<T.Ship>;
    group: T.Flag;
  };
}

export interface OspreyResponseBootStart {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.Booting;
  fact: {
    rank: string;
    group: T.Flag;
  };
}

export interface OspreyResponseBootDone {
  type: Api.ResponseTypes.Fact;
  face: OspreyResponseFaces.BootDone;
  fact: {
    kililed: Array<T.Ship>;
    group: T.Flag;
  };
}

export type OspreyResponse =
  OspreyResponseSchedule |
  OspreyResponseHostedEvery |
  OspreyResponseHostedDms |
  OspreyResponseHostedChats |
  OspreyResponseHostedHeaps |
  OspreyResponseHostedGroups |
  OspreyResponseHostedDiaries |
  OspreyResponseArchiveStart |
  OspreyResponseArchiveStatusUpdate |
  OspreyResponseDoomStart |
  OspreyResponseDoomDone |
  OspreyResponseBootStart |
  OspreyResponseBootDone

export const IsOspreyHostedEvery = (r: OspreyResponse):
  r is OspreyResponseHostedEvery => {
  return (r.face === OspreyResponseFaces.OspreyHostedEvery)
}

export const IsOspreyHostedChats = (r: OspreyResponse):
  r is OspreyResponseHostedChats => {
  return (r.face === OspreyResponseFaces.OspreyHostedChats)
}

export const IsOspreyHostedHeaps = (r: OspreyResponse):
  r is OspreyResponseHostedHeaps => {
  return (r.face === OspreyResponseFaces.OspreyHostedHeaps)
}

export const IsOspreyHostedGroups = (r: OspreyResponse):
  r is OspreyResponseHostedGroups => {
  return (r.face === OspreyResponseFaces.OspreyHostedGroups)
}

export const IsOspreyHostedDiaries = (r: OspreyResponse):
  r is OspreyResponseHostedDiaries => {
  return (r.face === OspreyResponseFaces.OspreyHostedDiaries)
}

export const IsOspreyResponseSchedule = (r: OspreyResponse):
  r is OspreyResponseSchedule => {
  return (r.face === OspreyResponseFaces.OspreySchedule)
}

export const IsOspreyResponseArchiveStart = (r: OspreyResponse):
  r is OspreyResponseArchiveStart => {
  return (r.face === OspreyResponseFaces.ArchiveStart)
}

export const IsOspreyResponseArchiveStatusUpdate = (r: OspreyResponse):
  r is OspreyResponseArchiveStatusUpdate => {
  return (r.face === OspreyResponseFaces.ArchiveStatusUpdate)
}

export const IsOspreyResponseDoomStart = (r: OspreyResponse):
  r is OspreyResponseDoomStart => {
  return (r.face === OspreyResponseFaces.Dooming)
}

export const IsOspreyResponseDoomDone = (r: OspreyResponse):
  r is OspreyResponseDoomDone => {
  return (r.face === OspreyResponseFaces.DoomDone)
}

export const IsOspreyResponseBootStart = (r: OspreyResponse):
  r is OspreyResponseBootStart => {
  return (r.face === OspreyResponseFaces.Booting)
}

export const IsOspreyResponseBootDone = (r: OspreyResponse):
  r is OspreyResponseBootDone => {
  return (r.face === OspreyResponseFaces.BootDone)
}
