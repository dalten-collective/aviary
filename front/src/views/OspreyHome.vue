<template>
  <div>
    osprey
    <button @click="poke">poke</button>
    <pre>
      schedule: {{ schedule }}
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

const ospreyStore = useStore()

onMounted(() => {
  startAirlock('osprey')
  ospreyStore.dispatch(ActionTypes.SCRY_SCHEDULE)
})

const poke = () => {
  return Pokes.ArchiveChat('~zod/new')
}

const schedule = computed<Array<O.Schedule>>(() => {
  return ospreyStore.state.schedule
})

const startAirlock = (deskname: string) => {
  ospreyStore.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}
</script>

