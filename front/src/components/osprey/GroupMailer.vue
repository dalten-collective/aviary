<template>
  <div class="flex flex-col">
    <h5 class="mb-4">{{ group }}</h5>
    <div>
      <div class="max-w-md field-float group">
        <input type="text" id="rec" v-model="mailRecipient" class="float peer" />
        <label for="rec" class="float peer">Recipient</label>
      </div>
      <div class="text-right">
        <button @click="sendMail(group)">send</button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import * as O from '@/types/osprey-types'
import * as OP from '@/api/types/osprey-poke'
import * as T from '@/types'
import {ref} from 'vue';
import { sigShip } from '@/helpers'

import { Pokes, Scries } from "@/api/ospreyAPI"

interface Props {
  group: T.Flag;
}
const props = defineProps<Props>();

const mailRecipient = ref<T.Ship>('')

const sendMail = (group) => {
  const recipient = sigShip(mailRecipient.value)
  Pokes.MailSend({ recipient, group })
}


</script>

<style scoped>
/* code... */
</style>
