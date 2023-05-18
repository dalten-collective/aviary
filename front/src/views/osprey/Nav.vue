<template>
  <div class="py-6 bg-black">
    <div class="container flex flex-row mx-auto text-white">
      <router-link :to="{ name: 'archive' }" class="mr-4 underline">
        Backup
      </router-link>
      <router-link :to="{ name: 'restore' }" class="mr-4 underline">
        Restore
      </router-link>
      <router-link :to="{ name: 'bootNDoom' }" class="mr-4 underline">
        Boot'n'Doom
      </router-link>
      <router-link :to="{ name: 'mail' }" class="mr-4 underline">
        Remote Restore
      </router-link>
    </div>
  </div>
</template>

<script setup lang="ts">
</script>


<style scoped>

/* code... */
</style>
