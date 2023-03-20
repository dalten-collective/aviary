<template>
  <div class="flex flex-row">
    <router-link :to="{ name: 'ospreyHome' }" class="mr-2 text-blue-400 underline">
      Home
    </router-link>
    <router-link :to="{ name: 'archive' }" class="mr-2 text-blue-400 underline">
      Archive
    </router-link>
    <router-link :to="{ name: 'restore' }" class="mr-2 text-blue-400 underline">
      Restore
    </router-link>
    <router-link :to="{ name: 'bootNDoom' }" class="mr-2 text-blue-400 underline">
      Boot'n'Doom
    </router-link>
    <router-link :to="{ name: 'mail' }" class="mr-2 text-blue-400 underline">
      Mail
    </router-link>
  </div>
</template>

<script setup lang="ts">
</script>


<style scoped>

/* code... */
</style>
