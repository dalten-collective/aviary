<template>
  <div>
    <h5>
      <span> {{ g }}</span>
    </h5>
      <Schedule class="my-2" :flag="g" />
      <ArchiveSchedule class="mt-4 mb-2" :flag="g" typeString="group" />
      <ArchiveNow :flag="g" typeString="group" />
      <LoadingBar class="max-w-sm mt-4" :flag="g" />
    </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
import { Pokes } from "@/api/ospreyAPI"
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

import Schedule from '@/components/osprey/Schedule.vue'
import LoadingBar from '@/components/osprey/LoadingBar.vue'
import ArchiveNow from '@/components/osprey/ArchiveNow.vue'
import ArchiveSchedule from '@/components/osprey/ArchiveSchedule.vue'

interface Props {
  flag: T.Flag;
}
const props = defineProps<Props>();

const ospreyStore = useStore()

const g = computed(() => {
  return props.flag
})

</script>
