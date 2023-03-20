<template>
  <div class="container mx-auto my-8">
    <h2>Restore from File</h2>

    <div class='flex mx-2 my-4'>
      <div class="px-2 py-1 mr-4 cursor-pointer" :class="!createNewGroup ? 'border rounded-full bg-stone-100 font-bold py-1 px-2' : 'underline text-stone-500'" @click="createNewGroup = false">
        Import to Existing Group
      </div>
      <div class="px-2 py-1 mr-2 cursor-pointer" :class="createNewGroup ? 'border rounded-full bg-stone-100 font-bold py-1 px-2' : 'underline text-stone-500'" @click="createNewGroup = true">
        Create New Group
      </div>
    </div>

    <div class="mx-2 my-4">
      <div v-if="!createNewGroup" >
        <select v-model="selectedGroup" class="p-2 cursor-pointer rounded-md">
          <option disabled selected value="selectedGroup">
            Select a Group
          </option>
          <option v-for="g in groups">
            {{ g }}
          </option>
        </select>
      </div>

      <div v-else>
        <div class="max-w-md field-float group">
        <input class='peer float' type='text' id='newgroo' v-model="newGroupName" />
        <label for='newgroo' class='peer float'>New Group Name</label>
        </div>
      </div>
    </div>

    <div class="mx-2 my-4">
        <div class="max-w-md field-float group">
        <input class='peer float' type='text' id='newchan' v-model="newChannelName" />
        <label for='newchan' class='peer float'>New Channel Name</label>
      </div>
    </div>

    <div class="flex flex-row items-center">
      <div>
        <label for="osprey-upload" class="upload-label">
          <input
            type="file"
            name="files"
            id="osprey-upload"
            directory=""
            webkitdirectory=""
            mozdirectory=""
            @change="handleFileAttach($event)"
            class="text-sm text-stone-500 file:mr-4 file:cursor-pointer file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-purple-50 file:text-purple-700 hover:file:bg-purple-100"
          />
        </label>
      </div>
      <button
        :disabled="(files.length === 0) | uploadInProgress"
        @click="submitFiles(address, vapor)"
        :class="uploadButtonStyle"
      >
        <span v-if="uploadInProgress">
          <svg
            aria-hidden="true"
            role="status"
            class="inline w-4 h-4 mr-3 text-white animate-spin"
            viewBox="0 0 100 101"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
              fill="#E5E7EB"
            />
            <path
              d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
              fill="currentColor"
            />
          </svg>
          Uploading...
        </span>
        <span v-else> Upload </span>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import { useOspreyStore as useStore } from '@/store/osprey-store'
import {sigShip} from '@/helpers';
const ospreyStore = useStore()

import { serverAddress } from "@/helpers";

import axios from "axios";

const createNewGroup = ref(false);

const selectedGroup = ref('selectedGroup');
const newGroupName = ref('');
const newChannelName = ref('');

const files = ref([]);
const uploadInProgress = ref(false);

const groups = computed<Array<T.Flag>>(() => {
  return ospreyStore.state.groups
})

const uploadButtonStyle = computed(() => {
  let styles = [];
  if (files.value.length === 0) {
    styles.push("disabled");
  }
  if (uploadInProgress.value) {
    styles.push("loading");
  }
  return styles;
});

const fileUploadEndpoint = () => {
  return `${serverAddress() }/apps/aviary/osprey/upload`;
};

const handleFileAttach = (event) => {
  console.log("handling attachments");
  files.value = event.target.files;
  console.log("attach event: ", event);
};

const submitFiles = async () => {
  uploadInProgress.value = true;

  let formData = new FormData();
  // var calls: Array<{ filePath: string; fileMime: string; fileBlob: string; }>  = [];

  // TODO: validate
  // disallow channel names that appear in /every

  if (!createNewGroup.value) {
    formData.append('type', 'old-group')
    const host = selectedGroup.value.split('/')[0]
    const name = selectedGroup.value.split('/')[1]
    const groupName = `${ sigShip(host) }-${ name }`
    formData.append('group', groupName)
  } else {
    formData.append('type', 'new-group')
    formData.append('group', newGroupName.value)
  }

  formData.append('channel', newChannelName.value)

  console.log('form ', formData)

  for (var i = 0; i < files.value.length; i++) {
    let file = files.value[i];
    formData.append('files', file)
    console.log('file ', file)
  }

  console.log('posting all...')

  var results = axios({
    method: "post",
    url: `${fileUploadEndpoint()}`,
    data: formData,
    withCredentials: false,
    headers: {
      "Content-Type": "multipart/form-data",
    },
  })
  .then(() => {
    console.log('all posts succeeded!')
  }).catch((err) => {
    console.log('something went wrong: ', err)
  }).finally(() => {
    files.value = []
    uploadInProgress.value = false;
  })

};
</script>

<style scoped>
/* code... */
</style>
