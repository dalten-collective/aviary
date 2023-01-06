<template>
  <div class="mx-auto conatiner">
    birds

    <div class="grid grid-cols-6 gap-1">
      <div class="col-span-4"> <!-- left -->
        <div class="mb-4">
          <header>
            <h1 class="text-xl">
              flocks
            </h1>
          </header>

          <div>
            <div v-if="flocks.length === 0">
              no flocks yet. form one.
            </div>
            <ul v-else>
              <li v-for="flock in flocks" :key="flock.area" class="flex flex-col p-2 mb-2 border rounded-md">
                <div>
                  <div><h1>"{{ flock.area }}"</h1></div>
                  <div>
                    <h2 class="text-lg">birds:</h2>
                    <div v-if="flock.team.length === 0">
                      no birds yet. invite some birds to your flock.
                    </div>
                    <ul>
                      <li v-for="bird in flock.team">
                        {{ bird }}
                      </li>
                    </ul>
                  </div>
                </div>

                <div class="flex flex-row py-2 mt-2 border-t border-dashed">
                  <button @click="dropFlock(flock)">drop</button>

                  <div class="px-2 py-1 ml-2 border rounded-md" v-if="hostsFlock(flock)">
                    <label for="inviteShip">
                      <input id="inviteShip" placeholder="~sampel-palnet" v-model="inviteShip" />
                    </label>
                    <label for="inviteNote">
                      <input id="inviteNote" :placeholder='`join my "${
                        flock.area }" flock`' v-model="inviteNote" />
                    </label>
                    <button @click="sendInvite(flock.area)">invite</button>
                  </div>

                </div>
              </li>
            </ul>
          </div>
        </div>

        <!--
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
        -->

        <div>
          new flock:
          <div>
            <label for="area">
              area
              <input id="area" placeholder="video-games" v-model="areaName" />
            </label>
            <select v-model="selectedFlag">
              <option v-for="f in availableChats" :key="f">
                {{ f }}
              </option>
            </select>
            <button @click="formFlock">form</button>
          </div>
        </div>
      </div>

      <div class="flex flex-col col-span-2"> <!-- right -->
        <div class="mb-4">
          <header>
            <h1 class="text-xl">
              incoming invites
            </h1>
          </header>

          <div>
            <div v-if="pendingInvites.length === 0">
              no incoming invites
            </div>
            <ul>
              <li v-for="areaInvite in pendingInvites" :key="areaInvite.host">
                <div class="p-2 my-4 border rounded-md">
                  <header class="mb-2">
                    chat: {{ areaInvite.host }}
                  </header>

                  <div>
                    <div class="flex flex-col p-2 mb-2 border rounded-sm">
                      <div class="flex flex-row justify-between">
                        <div>
                          area: {{ areaInvite.invitation.area }}
                        </div>
                        <div>
                          on {{ areaInvite.invitation.when }}
                        </div>
                      </div>

                      <div>
                        note: "{{ areaInvite.invitation.note }}"
                      </div>

                      <div class="justify-end flex-flex row">
                        <div class="text-right">
                          <select v-model="joiningGroup">
                            <option v-for="f in availableChats" :key="f">
                              {{ f }}
                            </option>
                          </select>
                          <button @click="joinFlock(areaInvite.host)">join</button>
                          <button @click="ignoreInvite(areaInvite.host)">ignore</button>
                        </div>
                      </div>

                    </div>
                  </div>

                </div>
              </li>
            </ul>
          </div>
        </div>

        <div class="mb-4">
          <header>
            <h1 class="text-xl">
              sent invites
            </h1>
          </header>

          <div>
            <div v-if="sentInvites.length === 0">
              no outgoing invites
            </div>
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
                        <div class="flex flex-col">
                          <div>
                            {{
                              secondsToDate(invite.invitation.when).toLocaleString() }}
                          </div>
                          <div>
                            {{ invite.status.status }}
                          </div>
                        </div>
                      </div>

                      <div>
                        note: "{{ invite.invitation.note }}"
                      </div>

                      <div class="justify-end flex-flex row">
                        <div class="text-right">
                          <button @click="rescindInvite(areaInvite.area, invite.to)">rescind</button>
                        </div>
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
import { useStore } from '@/store/parrot-store'
import { ParrotActionTypes as ActionTypes } from '@/store/parrot-action-types';
import { GetterTypes } from '@/store/getter-types';
import { sigShip, secondsToDate } from '@/helpers'

import * as T from '@/types'
import * as P from '@/types/parrot-types'

const parrotStore = useStore()

onMounted(() => {
  startAirlock('parrot')
  parrotStore.dispatch(ActionTypes.SCRY_SENT_INVITES)
})

onUnmounted(() => {
  // Maybe:
  // closeAirlock()
})

const areaName = ref('')
const selectedFlag = ref('')
const inviteShip = ref('')
const inviteNote = ref('')
const joiningGroup = ref('')

// const fromGetters = computed(() => {
//   return store.getters[GetterTypes.EXAMPLE_WITH_ARG]('arg here');
// })

const availableChats = computed<Array<P.Chat>>(() => {
  return parrotStore.state.availableChats
})
const flocks = computed<Array<P.Flock>>(() => {
  return parrotStore.state.flocks
})
const sentInvites = computed<Array<P.AreaInvite>>(() => {
  return parrotStore.state.sentInvites
})
const pendingInvites = computed<Array<P.Invitation>>(() => {
  return parrotStore.state.pendingInvites
})

const hostsFlock = (flock: P.Flock): boolean => {
  const us = sigShip(window.ship)
  const flockHost = flock.host.split('/')[0]
  if (us === sigShip(flockHost)) {
    return true
  }
  return false
}

const startAirlock = (deskname: string) => {
  console.log('airlock')
  parrotStore.dispatch(ActionTypes.AIRLOCK_OPEN, deskname)
}

const closeAirlock = () => {
  // Maybe you want this.
}

const formFlock = () => {
  console.log('flocking ', 'ref: ', areaName.value, ' flag: ', selectedFlag.value)
  parrotStore.dispatch(ActionTypes.FLOCK_FORM, {
    area: areaName.value,
    chat: selectedFlag.value,
  }).then(() => {
    parrotStore.dispatch(ActionTypes.SCRY_FLOKS)
    parrotStore.dispatch(ActionTypes.SCRY_AVAIL_CHATS)
  })
}

const dropFlock = (flock: P.Flock) => {
  console.log('dropping ', 'ref: ', flock.area)
  const area = flock.area
  parrotStore.dispatch(ActionTypes.FLOCK_DROP, {
    area
  }).then(() => {
    parrotStore.dispatch(ActionTypes.SCRY_AVAIL_CHATS)
  })
}

const sendInvite = (area: P.Area) => {
  console.log('inviting ', [inviteShip.value])

  // TODO: make this field take an array
  const ships = [inviteShip.value].map((s) => sigShip(s))

  parrotStore.dispatch(ActionTypes.INVITE_SEND, {
    area,
    note: inviteNote.value,
    ships,
  }).then(() => {
    inviteShip.value = ''
    inviteNote.value = ''
    parrotStore.dispatch(ActionTypes.SCRY_SENT_INVITES)
  })
}

const rescindInvite = (area: P.Area, ship: T.Ship) => {
  console.log('rescinding ', area, ship)

  parrotStore.dispatch(ActionTypes.INVITE_RESCIND, {
    area,
    ship
  }).then(() => {
    parrotStore.dispatch(ActionTypes.SCRY_SENT_INVITES)
  })
}

const joinFlock = (host: T.Flag) => {
  if (joiningGroup.value === '') {
    console.log('didnt choose a group')
    return
  }
  parrotStore.dispatch(ActionTypes.FLOCK_JOIN, {
    host,
    join: joiningGroup.value
  }).then(() => {
    parrotStore.dispatch(ActionTypes.SCRY_PENDING_INVITES)
    parrotStore.dispatch(ActionTypes.SCRY_FLOKS)
  })
}

const ignoreInvite = (host: T.Flag) => {
  parrotStore.dispatch(ActionTypes.FLOCK_JOIN, {
    host,
    join: null
  }).then(() => {
    parrotStore.dispatch(ActionTypes.SCRY_PENDING_INVITES)
  })
}

</script>
