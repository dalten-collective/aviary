<template>
  <div>
    <div>re: {{ mail.group }}</div>
    <div v-if="mail.data === 'NONE'">
      <span class="text-stone-500">Awaiting mail on this slot from {{ from }}...</span>
    </div>
    <div v-else>
      <span class="font-bold">New mail from {{ from }}!</span>
      <br />
      <span class="underline cursor-pointer" @click="reading = !reading">{{ reading ? 'Close' : 'Read' }}</span>
      <div v-if="reading">
        <ul>
          <li class="mb-2">
            <strong>Resources</strong>:
            <ol>
              <li v-for="f in mail.data['included-files']">
                {{ f.flag }} ({{ f.type }})
              </li>
            </ol>
          </li>

          <li class="mb-2">
            <strong>Group Admins</strong>:
            <ol>
              <li v-for="a in mail.data['admins']">
                {{ a }}
              </li>
            </ol>
          </li>

          <li class="mb-2">
            <strong>Group Members</strong>:
            <ol>
              <li v-for="m in mail.data['members']">
                {{ m }}
              </li>
            </ol>
          </li>
        </ul>

        <div class="flex flex-row items-center">
          <div class="max-w-md mt-8 field-float group">
            <input type="text" id="newGroup" v-model="importToNewGroupName" class="bg-white float peer" />
            <label for="newGroup" class="float peer">
              New Group Name
            </label>
          </div>
          <div class="ml-2">
          <button class="bg-white" @click="readMail">Import!</button>
          </div>
        </div>

      </div>
    </div>
    <button class="mt-4 bg-white" @click="killMail">Delete Mail</button>
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
  from: T.Ship;
  mail: O.MailSlot;
}
const props = defineProps<Props>();

const reading = ref(false)
const importToNewGroupName = ref('')

const readMail = () => {
  const newGroupName = importToNewGroupName.value

  const resources = props.mail.data['included-files'].map((f) => {
    const name = f.flag.split('/')[1]
    let type;
    switch (f.type) {
      case 'diary':
        type = 'note';
        break;
      case 'chat':
        type = 'chat';
        break;
      case 'heap':
        type = 'heap';
        break;
    }
    return {
      type,
      'old-resource': f.flag,
      'new-resource-name': name
    }
  })

  const args: OP.MailReadPayload['read'] = {
    group: props.mail.group,
    host: props.from,
    "new-group-name": newGroupName,
    roster: {
      members: true, // TODO: make options
      administrators: true,
    },
    include: resources
  }

  console.log(args)

  Pokes.MailRead(args)
}

const killMail = () => {
  const group = props.mail.group
  const host = props.from
  Pokes.MailKill({ host, group })
}

</script>

<style scoped>
/* code... */
</style>
