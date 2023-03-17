<template>
  <div class="pl-2 border-l-4">
    <ul>
      <li>
        from: {{ from }}
      </li>
      <li>
        <Envelope v-for="mail in mails" :mail="mail"  :from="from"
          class="p-4 my-4 bg-stone-100 rounded-md"
        />
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import * as O from '@/types/osprey-types'
import * as T from '@/types'

import Envelope from '@/components/osprey/Envelope.vue'

interface Props {
  mails: Array<O.MailSlot>;
  from: T.Ship;
}
const props = defineProps<Props>();

</script>

<style scoped>
/* code... */
</style>
