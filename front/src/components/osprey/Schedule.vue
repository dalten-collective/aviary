<template>
  <div v-if="scheduleFor">
    schedule:
    <ul>
      <li>flag: {{ scheduleFor.flag }}</li>
      <li>next: {{ scheduleFor.next }}</li>
      <li>last: {{ scheduleFor.last }}</li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

interface Props {
  flag: T.Flag;
}
const props = defineProps<Props>();

const ospreyStore = useStore()

const scheduleFor = computed(() => {
  return ospreyStore.getters[GetterTypes.ScheduleFor](props.flag)
})

</script>

<style scoped>
/* code... */
</style>
