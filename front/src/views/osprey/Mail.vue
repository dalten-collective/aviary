<template>
  <div>
    Mail
    <button @click="getMail">Check mail</button>

    <div class="p-4 m-4 border">
      <input v-model="slotHost" placeholder="who will send the mail" />
      <input v-model="groupHost" placeholder="original group host" />
      <input v-model="slotGroup" placeholder="original group name" />
      <button @click="openSlot">Open</button>
    </div>

    <div class="p-4 m-4 border rounded-lg">
      <div v-for="(mails, ship) in mailSlots">
        <Envelopes class="mb-8" :from="ship" :mails="mails" />
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

import Envelopes from '@/components/osprey/Envelopes.vue';

import { Pokes, Scries } from "@/api/ospreyAPI"

const ospreyStore = useStore()

const slotHost = ref<T.Ship>('')
const groupHost = ref<T.Ship>('')
const slotGroup = ref('')
const mailRecipient = ref<T.Ship>('')

const getMail = () => {
  ospreyStore.dispatch(ActionTypes.ScryMailslots)
}

const openSlot = () => {
  // TODO: validate
  // TODO: also strip whitespace
  const host = sigShip(slotHost.value)
  const groopHost = sigShip(groupHost.value)
  const groupName = slotGroup.value

  const group: T.Flag = `${ groopHost }/${ groupName }`
  console.log({ host, group })
  // return
  Pokes.MailOpen({ host, group })
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

