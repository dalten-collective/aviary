<template>
  <div class="flex flex-col mt-24">
    <RouterLink class="w-20 h-20 p-4 mb-4 border shadow-md rounded-md" :to="{ name: 'parrotHome' }">Parrot</RouterLink>
    <RouterLink class="w-20 h-20 p-4 border shadow-md rounded-md" :to="{ name: 'ospreyHome' }">Osprey</RouterLink>
  </div>
</template>

<script setup lang="ts">
</script>

