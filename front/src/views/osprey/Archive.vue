<template>
  <div class="container mx-auto my-8">
    <h2>Backup</h2>
    <div  class="p-2 my-4 border rounded-md">
      <Group v-for="g in groups" :flag="g" :key="g" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div class="p-2 my-4 border rounded-md">
      <Chat v-for="c in chats" :flag="c" :key="c" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div class="p-2 my-4 border rounded-md">
      <Heap v-for="h in heaps" :flag="h" :key="h" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div class="p-2 my-4 border rounded-md">
      <Diary v-for="d in diaries" :flag="d" :key="d" class="p-4 mb-2 border rounded shadow-md" />
    </div>

  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { useOspreyStore as useStore } from '@/store/osprey-store'

import * as T from '@/types'

import Group from '@/components/osprey/Group.vue'
import Chat from '@/components/osprey/Chat.vue'
import Heap from '@/components/osprey/Heap.vue'
import Diary from '@/components/osprey/Diary.vue'

const ospreyStore = useStore()

const groups = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.groups
})
const chats = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.chats
})
const heaps = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.heaps
})
const diaries = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.diaries
})

</script>

<style scoped>
/* code... */
</style>
