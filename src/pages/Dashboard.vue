<script setup lang="ts">
import { dryrun } from "@permaweb/aoconnect";
import Project from "../components/cards/Project.vue"
import NoProcessSelected from "../components/NoProjectSelected.vue"
import ProjectView from "../components/projectView/Index.vue"
import { REGISTRY } from "../utils";
import { useProjectStore, useUserInfoStore } from "../store";
</script>

<template>
    <div class="min-h-[calc(100vh-5rem)] flex w-full">
        <div class="w-3/12 border-r-[1px] border-gray-300 py-4">
            <h3 class="font-semibold mb-8 pl-2 text-xl">My Projects</h3>
            <div v-if="!!projects.length">
                <Project v-for="project in projects" :key="project.id" :project="{project}"/>
            </div>
            <div v-else class="h-full w-full flex items-center justify-center font-extralight"><i>No Projects yet</i></div>
        </div>
        <div class="w-9/12">
            <ProjectView v-if="projectStore.selectedProject.id.trim().length > 0"/>
            <NoProcessSelected v-else/>
        </div>
    </div>
</template>
<script lang="ts">

export default {
    data() {
        return {
            projects: [],
            projectStore: useProjectStore()
        }
    },
    async created() {
        const { Output } = await dryrun({
            process: REGISTRY,
            tags: [{name: "Action", value: "Get"}]
        })
        const userAddress = useUserInfoStore().getAddress
        const transformedResult = JSON.parse(Output.data)
        this.projects = transformedResult[userAddress]
    }
}
</script>