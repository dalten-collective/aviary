<template>
  <div class="container mx-auto my-8">
    <header>
      <div class="flex flex-row items-center justify-between">
        <div>
        <h2>Boot'n'Doom</h2>
        </div>
      </div>
      <div class="flex flex-row items-center justify-between px-4 py-2 my-4 bg-stone-300">
        <div>
          <!-- <button class="text-xl bg-white" disabled>Backup All</button> -->
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
      <pre>
court:
{{ courtroom }}
      </pre>
    <div class="flex flex-col">
      <div v-for="g in groups" class="max-w-md">
        <Doomer :flag="g" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, computed, ref } from 'vue';
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { OspreyActionTypes as ActionTypes } from '@/store/osprey-action-types';
import { GetterTypes } from '@/store/osprey-getter-types';
import { sigShip, secondsToDate } from '@/helpers'

import * as T from '@/types'
import * as O from '@/types/osprey-types'

import { Pokes } from "@/api/ospreyAPI"
import { Scries } from "@/api/ospreyAPI"
import { scrySchedule } from "@/api/ospreyAPI"

import Doomer from '@/components/osprey/Doomer.vue'

const ospreyStore = useStore()

const groups = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.groups
})

const courtroom = computed<{ [key: string]: O.Defendants }>(() => {
  return ospreyStore.state.courtroom
})
</script>

