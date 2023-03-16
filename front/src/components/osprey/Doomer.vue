<template>
  <div>
    {{ flag }}
    <div>
      <button @click="doDoom">doom</button>
      <pre>
        limit: {{ limit }}
        last: {{ lastSeenSeconds }}
      </pre>
    </div>

    <div>
      <select v-model="selectedRank">
        <option v-for="r in ranks">
          {{ r }}
        </option>
      </select>
      <button @click="doBoot">boot</button>
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
const lastSeenSeconds = ref(1)

const doDoom = () => {
  const args: OP.DoomPayload = {
    limit: limit.value,
    age: lastSeenSeconds.value,
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
