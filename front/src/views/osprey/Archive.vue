<template>
  <div class="container mx-auto my-8">

    <header>
      <div class="flex flex-row items-center justify-between">
        <div>
        <h2>Backup</h2>
        </div>
      </div>
      <div class="flex flex-row items-center justify-between px-4 py-2 my-4 bg-stone-300">
        <div>
          <button class="bg-white">Backup All</button>
        </div>
        <div class="flex flex-row items-center justify-end">
        <div class="relative z-0 items-center my-2 mr-2 group">
          <input type="text" class='py-1 rounded-md float peer' placeholder="Search" id='search' />
          <label class="float peer" for="search">Search</label>
        </div>
        <div>
          <select class="p-2 bg-white cursor-pointer rounded-md">
            <option selected>
              All Resoures
            </option>
            <option>
              Groups
            </option>
            <option>
              Chats
            </option>
            <option>
              Galleries
            </option>
            <option>
              Notebooks
            </option>
          </select>
        </div>
        </div>
      </div>
    </header>

    <div  class="p-2 my-6">
      <h3 class="my-6">Groups</h3>
      <Group v-for="g in groups" :flag="g" :key="g" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div  class="p-2 my-6">
      <h3 class="my-6">Chats</h3>
      <Chat v-for="c in chats" :flag="c" :key="c" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div  class="p-2 my-6">
      <h3 class="my-6">Galleries</h3>
      <Heap v-for="h in heaps" :flag="h" :key="h" class="p-4 mb-2 border rounded shadow-md" />
    </div>

    <div  class="p-2 my-6">
      <h3 class="my-6">Notebooks</h3>
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
