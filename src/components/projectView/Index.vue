<script setup lang="ts">
   import { useProjectStore } from "../../store";
   //@ts-ignore
   import History from "./History.vue";
   //@ts-ignore
   import Settings from "./Settings.vue";
</script>

<template>
    <div class="h-full w-full p-4">
        <div class="h-14 w-full flex justify-between items-center">
            <div>
                <h3 class="font-bold text-2xl">{{ projecStore.selectedProject.name}} <span class="text-xs font-extralight">{{ projecStore.selectedProject.id }}</span></h3>
                <div class="text-xs">Created on <span>{{ new Date(projecStore.selectedProject.createdAt).toDateString()}}</span></div>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" class="h-[26px] hover:h-7 ease-in-out duration-300 cursor-pointer">
                <path strokeLinecap="round" strokeLinejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
            </svg>   
        </div>
        <div class="h-14 w-full flex justify-center items-center">
            <div class="340px flex items-center justify-between">
                <button @click="isHistory = true" class="w-[140px] h-8 mx-2" :class="isHistory && 'font-bold bg-gray-200'">History</button>
                <button @click="isHistory = false" class="w-[140px] h-8 mx-2" :class="!isHistory && 'font-bold bg-gray-200'">Settings</button>
            </div>
        </div>
        <div class="pt-10">
            <History v-if="isHistory"/>
            <Settings v-else/>
        </div>
    </div>
</template>
<script lang="ts">
export default {
    data() {
        return {
            isHistory:true,
            projecStore: useProjectStore()
        }
    }
}
</script>

  