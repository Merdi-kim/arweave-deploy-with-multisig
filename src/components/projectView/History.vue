<template lang="">
    <div v-for="history in projectStore.selectedProject.history" :key="history.msg" class="h-full w-full flex flex-col items-center border-b-[1px] border-b-gray-100 mb-6">
        <div class="w-[90%] h-14 flex items-center">
            <div class="w-2/12"><i>{{new Date(history.time).getHours()}} : {{new Date(history.time).getMinutes()}} {{new Date(history.time).getHours()>= 12 ? 'pm':'am'}} </i></div>
            <div class="w-8/12 flex justify-center">
                <div class="flex flex-col items-start">
                <span class="text-base">{{ history.msg}}</span>
                <span class="text-xs">By <i class="font-extralight">{{ truncate(history.author, 6)}}</i></span>
                </div>
            </div>
            <div class="w-2/12 text-end"></div>
        </div>
    </div>

</template>
<script>
import { useProjectStore } from '../../store';
import { truncate } from '../../utils';

export default {
    data() {
        return {
            projectStore:useProjectStore(),
            truncate
        }
    },
    methods: {
        
    },
    created() {
        
    }
}
</script>
