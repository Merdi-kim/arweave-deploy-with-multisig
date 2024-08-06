<template>
    <div className="relative mx-auto w-10/12 rounded-md border bg-white p-7 shadow-lg sm:w-[32rem]">
      <form
      @submit="createNewProject"
        className="mx-auto flex w-full flex-col items-center justify-center sm:w-96"
      >
        <h2 class="text-2xl font-semibold mb-8">Create Project</h2>
        <div className="w-full mb-2">
          <input
            type="text"
            v-model="name"
            :required="!!name.trim().length"
            className="mb-4 mt-2 w-full rounded-md border px-4 py-2 text-gray-700 invalid:border-red-500 focus:border-blue-300 focus:outline-none"
            placeholder="Enter Name"
            :disabled="isLoading"
          />
        </div>
        <div>
            <div> Add Multisig <input type="checkbox" :disabled="isLoading" id="checkbox" v-model="multisigChecked"/> </div>
            <p class="text-xs text-gray-400 my-2"><i>Adding a multisig to your project allows you to give access to other team members to deploy code on this project</i></p>
        </div>
        <div v-if="!isLoading" class="mt-2">
            <button
            type="button"
            @click="closeModal"
              className="mr-6 rounded-md border-[1px] px-4 py-2 text-black hover:border-black hover:bg-gray-100"
            >
              Close
            </button>
          <button
            type="submit"
            className="rounded-md border-[1px] bg-black px-4 py-2 text-white hover:border-blue-300 hover:text-blue-300"
          >
            Create
          </button>
        </div>
        <div v-else class="mt-2 flex justify-center text-blue-300">
          <i>Creating project...</i>
        </div>
      </form>
    </div>
</template>
<script>
import { spawn, createDataItemSigner, message } from '@permaweb/aoconnect';
import { MODULE_ID, REGISTRY, SCHEDULER_ID } from '../../utils';
export default {
    data() {
        return {
          name:"",
          multisigChecked:false,
          isLoading:false
        }
    },
    methods: {
      async createNewProject(e) {
        e.preventDefault();
        this.isLoading= true
        const processId = await spawn({
          module: MODULE_ID,
          scheduler: SCHEDULER_ID,
          signer: createDataItemSigner(window.arweaveWallet),
          tags: [{ name: 'Process', value: 'Aftr-multisig' }],
        });
        await message({
          process: REGISTRY,
          signer: createDataItemSigner(window.arweaveWallet),
          tags:[
            {name: "Action", value: "Register"},
            {name: "ProcessId", value: processId},
            {name: "Name", value: this.name},
            {name: "Multisig", value: ""},
          ]
        })
        this.isLoading= false
        window.location.reload()
        //this.$emit('closeModal')
      },

      closeModal() {
        this.$emit('closeModal')
      }
    }, 
}
</script>