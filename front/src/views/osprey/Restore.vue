<template>
  <div>
    restore

    <div class="flex flex-row items-center justify-between">
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

import { serverAddress } from "@/helpers";

import axios from "axios";

const files = ref([]);
const uploadInProgress = ref(false);
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
  // formData.append('type', 'new-group')
  formData.append('type', 'old-group')
  formData.append('group', '~zod-test')
  formData.append('channel', 'new-uploaded-channel')

  console.log('form ', formData)

  for (var i = 0; i < files.value.length; i++) {
    let file = files.value[i];
// input name = group
// input value = group-name-here
//
// input name = channel
// input value = 'new-chanel-name' (disallow /every)


    formData.append('files', file)
    console.log('file ', file)

    // let filePath = file.webkitRelativePath;
    // let fileMime = file.type;

    // console.log("path ", filePath);
    // console.log("mime ", fileMime);

    // console.log('reading file...')
    // var fileContent = new FileReader()
    // fileContent.readAsBinaryString(file)
    // fileContent.onloadend = function() {
    //   console.log(fileContent.result)
    // }

    // console.log("reading blob...");
    // let fileBlob = await readFileBlob(file);
    // console.log("blob read!");

    // console.log("enqueing post to: ", `${fileUploadEndpoint(address, vapor)}/upload/${filePath}`);

    // calls.push(
    //   {
    //     filePath,
    //     fileMime,
    //     fileBlob
    //   }
    // )
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
    // uploadInProgress.value = false;
    // do vaporize poke
    // pokeVaporize({
    //   address: props.address,
    //   item: props.vapor.item,
    // })
  })

  // axios
  //   .post(
  //     fileUploadEndpoint(address, vapor),
  //     formData, // probably change this to the file.
  //     {
  //       headers: {
  //         "Content-Type": "multipart/form-data",
  //         // change to appropriate content type for file.
  //       },
  //     }
  //   )
  //   .then((r) => {
  //     console.log(r);
  //     console.log("success");
  //   })
  //   .catch((err) => {
  //     console.log(err);
  //     console.log("fail");
  //   })
  //   .finally(() => {
  //     uploadInProgress.value = false;
  //   });
};

// file upload:
// name = files
// directory mozdirectory webkitdirectory

// existing group:
// input name = group
// input value = ~zod-another-one
//
// input name = channel
// input value = 'new-channel-name' (disallow any from /Every)

// new group:
// input name = group
// input value = group-name-here
//
// input name = channel
// input value = 'new-chanel-name' (disallow /every)
</script>

<style scoped>
/* code... */
</style>
