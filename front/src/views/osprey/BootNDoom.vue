<template>
  <div>
    Boot n Doom
    <div>
      <div v-for="g in groups">
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
</script>

