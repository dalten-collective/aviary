<template>
  <div>
    <div v-if="!scheduleFor">
      <span class="underline cursor-pointer" @click="expanded = !expanded">{{ !expanded ? 'Set Recurring Backup' : 'Cancel' }}</span>
      <div v-if="expanded" class="pb-4 mb-4 border-b">
        <div class="flex flex-col mt-4">
        Back up every...
        <div class="max-w-md mt-4 field-float group">
          <input type="text" class="float peer" id="hrs" v-model="hrs" />
          <label class="float peer" for="hrs">
            Hours
          </label>
        </div>
        <div class="max-w-md mt-4 field-float group">
          <input type="text" class="float peer" id="min" v-model="min" />
          <label class="float peer" for="min">
            Minutes
          </label>
        </div>
        <div>
          <button @click="archiveOnSchedule">Set Backups</button>
        </div>
        </div>
      </div>
    </div>
    <div v-else>
      <button @click="cancelArchive">Cancel Scheduled Backups</button>
    </div>
  </div>
</template>

<script setup lang="ts">

import * as T from '@/types'
import { Pokes } from "@/api/ospreyAPI"
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed, ref } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

interface Props {
  flag: T.Flag;
  typeString: string;
}
const props = defineProps<Props>();
const ospreyStore = useStore()

const hrs = ref(1);
const min = ref(0);
const sec = ref(0);

const seconds = ref(60); // TODO:
const expanded = ref(false);

const archiveOnSchedule = () => {
  const thing = props.typeString
  const secs = ((parseInt(hrs.value) * 60 * 60) + (parseInt(min.value) * 60))

  return Pokes.RepeatArchive(props.flag, thing, secs)
}

const cancelArchive = () => {
  const thing = props.typeString
  return Pokes.RepeatArchive(props.flag, thing, null)
}

const scheduleFor = computed(() => {
  return ospreyStore.getters[GetterTypes.ScheduleFor](props.flag)
})

</script>

<style scoped>
/* code... */
</style>
