<template>
  <div class="mx-auto conatiner">
    Birds
    <pre>
    </pre>

    <div class="grid grid-cols-6">
      <div class="col-span-4"> <!-- left -->
        <div class="mb-4">
          <header>
            flocks
          </header>
          <div>
            <ul>
              <li v-for="flock in flocks" :key="flock.area" class="flex flex-col">
                <div>
                  {{ flock }}
                </div>
                <div class="flex flex-row">
                  <button @click="dropFlock(flock)">Drop</button>
                  <div class="px-2 py-1 ml-2 border rounded-md">
                    <label for="inviteShip">
                      <input id="inviteShip" placeholder="~sampel-palnet" v-model="inviteShip" />
                    </label>
                    <label for="inviteNote">
                      <input id="inviteNote" :placeholder="`Join my ${ flock.area } flock`" v-model="inviteNote" />
                    </label>
                    <button @click="sendInvite(flock.area)">Invite</button>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>

        <div class="mb-4">
          <header>
            available chats (not in flocks)
          </header>
          <div>
            <ul>
              <li v-for="chat in availableChats" :key="chat">
                {{ chat }}
              </li>
            </ul>
          </div>
        </div>

        <div>
          New Flock:
          <div>
            <label for="area">
              Area
              <input id="area" placeholder="video-games" v-model="areaName" />
            </label>
            <select v-model="selectedFlag">
              <option v-for="f in availableChats" :key="f">
                {{ f }}
              </option>
            </select>
            <button @click="formFlock">Form</button>
          </div>
        </div>
      </div>

      <div class="col-span-2"> <!-- right -->
        <div class="mb-4">
          <header>
            sent invites
          </header>
          <div>
            <ul>
              <li v-for="areaInvite in sentInvites" :key="areaInvite.area">
                <div class="p-2 my-4 border rounded-md">
                  <header class="mb-2">
                    "{{ areaInvite.area }}" area
                  </header>

                  <div>
                    <div class="flex flex-col p-2 mb-2 border rounded-sm" v-for="invite in areaInvite.invites" :key="invite.to">
                      <div class="flex flex-row justify-between">
                        <div>
                          to: {{ invite.to }}
                        </div>
                        <div>
                          on {{ invite.invitation.when }}
                        </div>
                      </div>

                      <div>
                        note: "{{ invite.invitation.note }}"
                      </div>

                    </div>
                  </div>

                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>

    </div>

  </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, computed, ref } from 'vue';
import { useStore } from '@/store/store'
import { ActionTypes } from '@/store/action-types';
import { GetterTypes } from '@/store/getter-types';

import * as P from '@/types/parrot-types'

const store = useStore()

onMounted(() => {
  startAirlock('parrot')
  store.dispatch(ActionTypes.SCRY_SENT_INVITES)
})

onUnmounted(() => {
  // Maybe:
  // closeAirlock()
})

const areaName = ref('')
const selectedFlag = ref('')
const inviteShip = ref('')
const inviteNote = ref('')

const computedThings = computed(() => store.state.exampleThings)
const fromGetters = computed(() => {
  return store.getters[GetterTypes.EXAMPLE_WITH_ARG]('arg here');
})

const availableChats = computed<Array<P.Chat>>(() => {
  return store.state.availableChats
})
const flocks = computed<Array<P.Chat>>(() => {
  return store.state.flocks
})
const sentInvites = computed<Array<P.AreaInvite>>(() => {
  return store.state.sentInvites
})

const startAirlock = (deskname: string) => {
  console.log('airlock')
  store.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}

const closeAirlock = () => {
  // Maybe you want this.
}

const formFlock = () => {
  console.log('flocking ', 'ref: ', areaName.value, ' flag: ', selectedFlag.value)
  store.dispatch(ActionTypes.FLOCK_FORM, {
    area: areaName.value,
    chat: selectedFlag.value,
  }).then(() => {
    store.dispatch(ActionTypes.SCRY_AVAIL_CHATS)
  })
}

const dropFlock = (flock: P.Flock) => {
  console.log('dropping ', 'ref: ', flock.area)
  const area = flock.area
  store.dispatch(ActionTypes.FLOCK_DROP, {
    area
  }).then(() => {
    store.dispatch(ActionTypes.SCRY_AVAIL_CHATS)
  })
}

const sendInvite = (area: P.Area) => {
  console.log('inviting ', [inviteShip.value])

  store.dispatch(ActionTypes.INVITE_SEND, {
    area,
    note: inviteNote.value,
    ships: [inviteShip.value] // TODO:  array
  }).then(() => {
    store.dispatch(ActionTypes.SCRY_SENT_INVITES)
  })
}

</script>
