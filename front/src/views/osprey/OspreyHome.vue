<template>
  <div>
    nothing
  </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, computed, ref } from 'vue';
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { OspreyActionTypes as ActionTypes } from '@/store/osprey-action-types';
import { GetterTypes } from '@/store/osprey-getter-types';
import { sigShip, secondsToDate } from '@/helpers'

import * as T from '@/types'
import * as O from '@/types/osprey-types'

import { Pokes } from "@/api/ospreyAPI"
import { Scries } from "@/api/ospreyAPI"
import { scrySchedule } from "@/api/ospreyAPI"

import Group from '@/components/osprey/Group.vue'
import Chat from '@/components/osprey/Chat.vue'
import Heap from '@/components/osprey/Heap.vue'
import Diary from '@/components/osprey/Diary.vue'

const ospreyStore = useStore()

onMounted(() => {
  startAirlock('osprey')
  // ospreyStore.dispatch(ActionTypes.SCRY_SCHEDULE)
})

const archiveThing = (thing: string, flag: T.Flag) => {
  const typ = thing[0].charAt(0).toUpperCase() + thing.slice(1) // title-case it
  return Pokes[`Archive${typ}`](flag)
}

const archiveOnSchedule = (thing: string, flag: T.Flag, schedule: number) => {
  return Pokes.RepeatArchive(flag, thing, schedule)
}

const scryGroups = () => {
  ospreyStore.dispatch(ActionTypes.ScryGroups)
}
const scrySchedule = () => {
  ospreyStore.dispatch(ActionTypes.ScrySchedule)
}
const scryEvery = () => {
  ospreyStore.dispatch(ActionTypes.ScryEvery)
}

const scryChats = () => {
  ospreyStore.dispatch(ActionTypes.ScryChats)
}

const scryHeaps = () => {
  ospreyStore.dispatch(ActionTypes.ScryHeaps)
}

const scryDiaries = () => {
  ospreyStore.dispatch(ActionTypes.ScryDiaries)
}

const schedule = computed<Array<O.Schedule>>(() => {
  return ospreyStore.state.schedule
})
const groups = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.groups
})
const chats = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.chats
})
const heaps = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.heaps
})
const diaries = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.diaries
})
const archiveLoadingState = computed(() => {
  return ospreyStore.state.archiveLoadingState
})


const loadStat = (flag) => {
  return ospreyStore.getters[GetterTypes.ArchiveLoaderProgress](flag)
}

const scheduleFor = (flag) => {
  return ospreyStore.getters[GetterTypes.ScheduleFor](flag)
}

const completePercent = (flag) => {
  const stat = loadStat(flag)
  if (stat && stat.total && stat.total !== 0) {
    return Math.round((stat.complete / stat.total) * 100)
  }
  return 100
}

const startAirlock = (deskname: string) => {
  ospreyStore.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}
</script>

