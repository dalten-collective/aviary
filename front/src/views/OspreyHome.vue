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
    <pre>
      schedule: {{ schedule }}
      groups: {{ groups }}
      chats: {{ chats }}
      heaps: {{ heaps }}
      diaries: {{ diaries }}
    </pre>
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

const poke = () => {
  // return Pokes.ArchiveMine()
  // return Pokes.ArchiveChat('~zod/new')
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

const startAirlock = (deskname: string) => {
  ospreyStore.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}
</script>

