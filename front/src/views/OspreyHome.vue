<template>
  <div>
    <button @click="scrySchedule">scry Schedule</button>
    <button @click="scryGroups">scry groups</button>
    <button @click="scryEvery">scry every</button>
    <button @click="scryChats">scry chats</button>
    <button @click="scryHeaps">scry heaps</button>
    <button @click="scryDiaries">scry Diaries</button>
  </div>
</template>

<script setup lang="ts">
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { OspreyActionTypes as ActionTypes } from '@/store/osprey-action-types';

const ospreyStore = useStore()

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

</script>

