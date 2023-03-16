<template>
  <button @click="archiveThing">Archive</button>
</template>

<script setup lang="ts">

import * as T from '@/types'
import { Pokes } from "@/api/ospreyAPI"
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { computed } from 'vue'

import { GetterTypes } from '@/store/osprey-getter-types';

interface Props {
  flag: T.Flag;
  typeString: string;
}
const props = defineProps<Props>();

const archiveThing = () => {
  const thing = props.typeString

  const typ = thing[0].charAt(0).toUpperCase() + thing.slice(1) // title-case it
  return Pokes[`Archive${typ}`](props.flag)
}

</script>

<style scoped>
/* code... */
</style>
