<template>
  <div v-if="scheduleFor">
    <ul>
      <li>
          <div class="max-w-sm grid grid-cols-10">
            <div class="col-span-3">
              <span class="text-stone-500">next backup</span> 
            </div>
            <div class="col-span-7">
              {{ scheduleFor.next.toLocaleString() }}
            </div>
          </div>
      </li>
      <li>
          <div class="max-w-sm grid grid-cols-10">
            <div class="col-span-3">
              <span class="text-stone-500">last backup</span> 
            </div>
            <div class="col-span-7">
              {{ scheduleFor.last.toLocaleString() }}
            </div>
          </div>
      </li>
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
