<template>
    <div v-if="loadStat(g)?.state === 'success'" class="px-2 py-1 font-bold text-white bg-green-400 rounded-full">
      Archived!
    </div>
    <div v-if="loadStat(g)?.state === 'loading'" class="w-full bg-stone-300 shadow-inner rounded-full h-2.5 mb-4">
      <div class="bg-amber-500 h-2.5 rounded-full transition-all ease-out duration-1000" :style="{ width: `${ completePercent(g) }%` }"></div>
    </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
import { Pokes } from "@/api/ospreyAPI"
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

interface Props {
  flag: T.Flag;
}
const props = defineProps<Props>();

const g = computed(() => {
  return props.flag
})

const ospreyStore = useStore()

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

<style scoped>
/* code... */
</style>
