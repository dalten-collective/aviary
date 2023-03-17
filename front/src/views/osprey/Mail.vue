<template>
  <div class="container mx-auto my-8">
    <h2>Restore Remotely</h2>

    <div class="my-4">

    <button @click="getMail">Check mail</button>

    <div class="p-4 m-4 border">
      <div class="flex flex-col">
        <h4 class="mt-2 mb-8" >Open slot for restore</h4>
        <div class="max-w-md field-float group">
          <input type="text" v-model="slotHost" class="float peer" id="slothost" />
          <label class="float peer" for="slothost">Who will send you the group?</label>
        </div>

        <div class="max-w-md field-float group">
          <input type="text" v-model="groupHost" class="float peer" id="grouphost" />
          <label class="float peer" for="grouphost">Original group host</label>
        </div>

        <div class="max-w-md field-float group">
          <input type="text" v-model="slotGroup" class="float peer" id="slotGroup" />
          <label class="float peer" for="slotGroup">Group name</label>
        </div>
      </div>

      <button @click="openSlot">Open</button>
    </div>

    <div class="p-4 m-4 border rounded-lg">
      <div v-if="!mailSlots || Object.keys(mailSlots).length === 0">
        <h4>No incoming mail!</h4>
      </div>
      <div v-else>
        <h4>You've got mail:</h4>
        <div v-for="(mails, ship) in mailSlots">
          <Envelopes class="mb-8" :from="ship" :mails="mails" />
        </div>
      </div>
    </div>

    <div class="p-4 m-4 border rounded-lg">
      <h4 class="mb-4">Mail Groups</h4>
      <div v-for="g in groups" class="flex flex-col">
        <GroupMailer :group="g" class="max-w-md p-2 my-2 border rounded-md" />
      </div>
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
import GroupMailer from '@/components/osprey/GroupMailer.vue';

import { Pokes, Scries } from "@/api/ospreyAPI"

const ospreyStore = useStore()

const slotHost = ref<T.Ship>('')
const groupHost = ref<T.Ship>('')
const slotGroup = ref('')

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

const mailSlots = computed<Array<O.MailSlot>>(() => {
  return ospreyStore.state.mailslot
})

const groups = computed(() => {
  return ospreyStore.state.groups
})
</script>

