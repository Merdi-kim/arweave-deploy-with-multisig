<template>
    <div class="ml-4 pl-2 pr-3 py-5 border-b-[1px] border-gray-200 cursor-pointer hover:bg-gray-50">
        <h4> {{ project.name }}</h4>
        <div>

        </div>
    </div>
</template>
<script lang="ts">

export default {
    props:{
        project: {
            required:true
        }
    },

    setup({project}) {
        return {
            project:project.project
        }
    }
    
}
</script>