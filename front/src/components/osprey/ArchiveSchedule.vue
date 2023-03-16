<template>
  <button @click="archiveOnSchedule">Archive {{ seconds }}</button>
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

const seconds = ref(60); // TODO:

// TODO: remove parameters from button. they're props now
const archiveOnSchedule = () => {
  const thing = props.typeString

  console.log(props.flag, thing, seconds.value)
  return Pokes.RepeatArchive(props.flag, thing, seconds.value)
}

</script>

<style scoped>
/* code... */
</style>
