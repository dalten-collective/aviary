<template>
  <div>
    Birds
    <pre>
      Available Chats: {{ availableChats }}
      Flocks: {{ flocks }}
    </pre>
    <div>
      New Flock:
      <div>
        <label for="area">
          Area
          <input id="area" placeholder="video-games" v-model="areaName" />
        </label>
        <select v-model="selectedFlag">
          <option v-for="f in availableChats">
            {{ f }}
          </option>
        </select>
        <button @click="formFlock">Form</button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, computed, ref } from 'vue';
import { useStore } from '@/store/store'
import { ActionTypes } from '@/store/action-types';
import { GetterTypes } from '@/store/getter-types';

const store = useStore()

onMounted(() => {
  startAirlock('parrot')
})

onUnmounted(() => {
  // Maybe:
  // closeAirlock()
})

const areaName = ref('')
const selectedFlag = ref('')

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
  })
}

</script>


