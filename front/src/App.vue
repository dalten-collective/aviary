<template>
  <nav class="flex flex-row">
    <router-link :to="{ name: 'parrotHome' }" class="mr-2 text-blue-400 underline">
      Parrot
    </router-link>
    <router-link :to="{ name: 'ospreyHome' }" class="mr-2 text-blue-400 underline">
      Osprey
    </router-link>
  </nav>
  <div>
    <router-view />


    <router-view name="parrot" />

    <router-view name="ospreyNav" />
    <router-view name="osprey" />
  </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, computed, ref } from 'vue';
import { useOspreyStore as useStore } from '@/store/osprey-store'
import { OspreyActionTypes } from '@/store/osprey-action-types';

const ospreyStore = useStore()

onMounted(() => {
  startAirlock('osprey')
  // ospreyStore.dispatch(ActionTypes.SCRY_SCHEDULE)
})

const startAirlock = (deskname: string) => {
  ospreyStore.dispatch(OspreyActionTypes.AIRLOCK_OPEN, deskname)
}
</script>

