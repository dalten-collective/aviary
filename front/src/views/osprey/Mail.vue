<template>
  <div>
    Mail
    <button @click="getMail">Check mail</button>

    <div class="p-4 m-4 border">
      <input v-model="slotHost" placeholder="host" />
      <input v-model="slotGroup" placeholder="group" />
      <button @click="openSlot">Open</button>
    </div>

    <div class="p-4 m-4 border">
      <div v-for="m in mailSlots">
        <pre>{{ m }}</pre>
      </div>
    </div>

    <div class="p-4 m-4 border">
      <div v-for="g in groups" class="p-2 my-4 border shadow-md rounded-md">
        {{ g }}
        <input v-model="mailRecipient" placeholder="send to ship" />
        <button @click="sendMail(g)">send</button>
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

import { Pokes, Scries } from "@/api/ospreyAPI"

const ospreyStore = useStore()

const slotHost = ref<T.Ship>('')
const slotGroup = ref('')
const mailRecipient = ref<T.Ship>('')

const getMail = () => {
  ospreyStore.dispatch(ActionTypes.ScryMailslots)
}

const openSlot = () => {
  Pokes.MailOpen({ host: slotHost.value, group: slotGroup.value })
}

const sendMail = (group) => {
  const recipient = sigShip(mailRecipient.value)
  Pokes.MailSend({ recipient, group })
}

const mailSlots = computed<Array<O.MailSlot>>(() => {
  return ospreyStore.state.mailslot
})

const groups = computed(() => {
  return ospreyStore.state.groups
})
</script>

