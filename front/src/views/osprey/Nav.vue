<script setup lang="ts">
// code...
</script>

<template>
  <div class="flex flex-row">
    <router-link :to="{ name: 'ospreyHome' }" class="mr-2 text-blue-400 underline">
      Home
    </router-link>
    <router-link :to="{ name: 'archive' }" class="mr-2 text-blue-400 underline">
      Archive
    </router-link>
  </div>
</template>

<style scoped>
/* code... */
</style>
