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

export type OspreyResponse =
  OspreyResponseSchedule |
  OspreyResponseHostedEvery |
  OspreyResponseHostedDms |
  OspreyResponseHostedChats |
  OspreyResponseHostedHeaps |
  OspreyResponseHostedGroups |
  OspreyResponseHostedDiaries |
  OspreyResponseArchiveStart |
  OspreyResponseArchiveStatusUpdate

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
