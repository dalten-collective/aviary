<template>
  <div>
    osprey
    <button @click="poke">poke</button>
    <button @click="scrySchedule">scry Schedule</button>
    <button @click="scryGroups">scry groups</button>
    <button @click="scryEvery">scry every</button>
    <button @click="scryChats">scry chats</button>
    <button @click="scryHeaps">scry heaps</button>
    <button @click="scryDiaries">scry Diaries</button>

    <hr class="my-4" />
    <div v-for="s in schedule">
      <ul>
        <li>flag: {{ s.area.flag }} ({{ s.area.type }})</li>
        <li>next: {{ new Date(s.next * 1000) }}</li>
        <li>last: {{ new Date(s.last * 1000) }}</li>
      </ul>
    </div>

    <div v-for="g in groups">
      <span>group: {{ g }}</span>
      <button @click="archiveThing('group', g)">archive</button>
      <button @click="archiveOnSchedule('group', g, 60)">archive 60</button>
      {{ loadStat(g) }}
      <div class="w-full bg-stone-300 shadow-inner rounded-full h-2.5 mb-4">
        <div class="bg-amber-500 h-2.5 rounded-full transition-all ease-out duration-1000" :style="{ width: `${ completePercent(g) }%` }"></div>
      </div>
    </div>

    <div v-for="c in chats">
      <span>chat: {{ c }}</span>
      <button @click="archiveThing('chat', c)">archive</button>
      {{ loadStat(c) }}
      <div class="w-full bg-stone-300 shadow-inner rounded-full h-2.5 mb-4">
        <div class="bg-amber-500 h-2.5 rounded-full transition-all ease-out duration-1000" :style="{ width: `${ completePercent(c) }%` }"></div>
      </div>
    </div>

    <div v-for="h in heaps">
      <span>heap: {{ h }}</span>
      <button @click="archiveThing('heap', h)">archive</button>
      {{ loadStat(h) }}
      <div class="w-full bg-stone-300 shadow-inner rounded-full h-2.5 mb-4">
        <div class="bg-amber-500 h-2.5 rounded-full transition-all ease-out duration-1000" :style="{ width: `${ completePercent(h) }%` }"></div>
      </div>
    </div>

    <div v-for="d in diaries">
      <span>diary: {{ d }}</span>
      <button @click="archiveThing('diary', d)">archive</button>
      {{ loadStat(d) }}
      <div class="w-full bg-stone-300 shadow-inner rounded-full h-2.5 mb-4">
        <div class="bg-amber-500 h-2.5 rounded-full transition-all ease-out duration-1000" :style="{ width: `${ completePercent(d) }%` }"></div>
      </div>
    </div>

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

const loadStat = (flag) => {
  return ospreyStore.getters[GetterTypes.ArchiveLoaderProgress](flag)
}

const completePercent = (flag) => {
  const stat = loadStat(flag)
  if (stat && stat.total && stat.total !== 0) {
    return Math.round((stat.complete / stat.total) * 100)
  }
  return 100
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

const startAirlock = (deskname: string) => {
  ospreyStore.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}
</script>

