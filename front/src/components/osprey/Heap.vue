<template>
    <div>
      <span>heap: {{ g }}</span>
      <div v-if="scheduleFor(g)">
        schedule:
        <ul>
          <li>flag: {{ scheduleFor(g).flag }}</li>
          <li>next: {{ scheduleFor(g).next }}</li>
          <li>last: {{ scheduleFor(g).last }}</li>
        </ul>
      </div>
      <button @click="archiveThing('heap', g)">archive</button>
      <button @click="archiveOnSchedule('heap', g, 60)">archive 60</button>
      <LoadingBar :flag="g" />
    </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
import { Pokes } from "@/api/ospreyAPI"
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

import LoadingBar from '@/components/osprey/LoadingBar.vue'

interface Props {
  flag: T.Flag;
}
const props = defineProps<Props>();

const ospreyStore = useStore()

const g = computed(() => {
  return props.flag
})

const archiveThing = (thing: string, flag: T.Flag) => {
  const typ = thing[0].charAt(0).toUpperCase() + thing.slice(1) // title-case it
  return Pokes[`Archive${typ}`](flag)
}

const scheduleFor = (flag) => {
  return ospreyStore.getters[GetterTypes.ScheduleFor](flag)
}

const archiveOnSchedule = (thing: string, flag: T.Flag, schedule: number) => {
  return Pokes.RepeatArchive(flag, thing, schedule)
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

</script>
