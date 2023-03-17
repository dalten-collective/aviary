<template>
  <div class="flex flex-row">
    <router-link :to="{ name: 'ospreyHome' }" class="mr-2 text-blue-400 underline">
      Home
    </router-link>
    <router-link :to="{ name: 'archive' }" class="mr-2 text-blue-400 underline">
      Archive
    </router-link>
    <router-link :to="{ name: 'bootNDoom' }" class="mr-2 text-blue-400 underline">
      Boot'n'Doom
    </router-link>
    <button @click="scry">mail</button>
  </div>
</template>

<script setup lang="ts">

import { Scries } from '@/api/ospreyAPI'

const scry = () => {
  Scries.Mail().then((r) => console.table(r) )
}

</script>


<style scoped>

/* code... */
</style>
