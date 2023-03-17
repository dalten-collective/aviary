<template>
  <div class="p-4 mx-2 my-8 border rounded-md">

    <h3>{{ flag }}</h3>

    <div class="pb-4 my-4 border-b">
      <h5>Doom inactive ships</h5>
      <div class="flex flex-col mt-4">
        <div class="max-w-md field-float group">
          <input type="text" class="float peer" id="limit" v-model="limit" />
          <label class="float peer" for="limit">
            Max members to kick
          </label>
        </div>

        <div class="max-w-md field-float group">
          <input type="text" id="lastseen" v-model="lastSeenDays" class="float peer" />
          <label for="lastseen" class="float peer">
            Last seen online (days)
          </label>
        </div>

        <div>
          <button class="text-xl" @click="doDoom">DOOM</button>
        </div>
      </div>
    </div>

    <div>
      <h5>Boot ships by rank</h5>
      <div class="flex flex-row mt-4">
        <select v-model="selectedRank" class="p-2 mr-2 cursor-pointer rounded-md">
          <option v-for="r in ranks">
            {{ r }}
          </option>
        </select>
        <button @click="doBoot" class="text-xl">BOOT</button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import * as T from '@/types'
import {ref} from 'vue';
import * as OP from '@/api/types/osprey-poke'

import { Pokes } from '@/api/ospreyAPI'

interface Props {
  flag: T.Flag
}
const props = defineProps<Props>()

const ranks = ref([
  'comet',
  'moon',
  'planet',
  'star',
  'galaxy'
])
const selectedRank = ref('comet')

const limit = ref(10)
const lastSeenDays = ref(7)
const lastSeenSeconds = ref(1)

const doDoom = () => {
  const seconds = parseInt(lastSeenDays.value) * 60 * 60 * 24
  const args: OP.DoomPayload = {
    limit: parseInt(limit.value),
    age: seconds,
    group: props.flag,
  }
  Pokes.Doom(args)
}

const doBoot = () => {
  // pawn earl duke king czar
  // cmet moon plnt star glxy

  let rank = 'pawn';

  switch (selectedRank.value) {
    case 'comet':
      rank = 'pawn'
      break;
    case 'moon':
      rank = 'earl'
      break
    case 'planet':
      rank = 'duke'
      break
    case 'star':
      rank = 'king'
      break
    case 'galaxy':
      rank = 'czar'
      break
    default:
      rank = 'pawn'
  }

  const args: OP.BootPayload = {
    rank,
    group: props.flag
  }
  Pokes.Boot(args)
}

</script>

<style scoped>
/* code... */
</style>
