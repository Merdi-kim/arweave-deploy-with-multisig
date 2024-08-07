<template>
    <div @click="selectProject" class="pl-6 pr-3 py-5 border-b-[1px] border-gray-200 cursor-pointer hover:bg-gray-100" :class="projectStore.selectedProject.id == project.id && 'bg-gray-100'">
        <h4 class="text-lg font-semibold"> {{ project.name }}</h4>
        <div class="flex justify-between text-xs">
            <div>Created on {{ new Date(project.createdAt).toDateString()}}</div>
            <div>ID: <span>{{ truncate(project.id) }}</span></div>
        </div>
    </div>
</template>
<script lang="ts">
import { truncate } from '../../utils';
import { useProjectStore } from '../../store';
import { PropType } from 'vue';

export default {
    props:{
        project: {
            type: { } as PropType<{id:string, name:string, multisig:string, createdAt:string}>,
            required:true
        }
    },
    data() {
        return {
            truncate,
            projectStore: useProjectStore(),
            selectedProject: {
                id:"",
                name:"",
                multisig:"",
                createdAt:"",
                history:[]
            }
        }
    },

    methods: {
        selectProject() {
            this.projectStore.setSelectedProject(this.project)
            this.selectedProject = this.projectStore.selectedProject 
        }
    },

    setup({project}) {
        return {
            project:project.project
        }
    }
    
}
</script>