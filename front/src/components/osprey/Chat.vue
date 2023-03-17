<template>
    <div>
      <span>{{ g }}</span>
      <Schedule :flag="g" />
      <ArchiveNow :flag="g" typeString="chat" />
      <ArchiveSchedule :flag="g" typeString="chat" />
      <LoadingBar :flag="g" />
    </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
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
