<script setup lang="ts">
//@ts-ignore
import NewProject from "./modals/NewProject.vue";
</script>

<template>
  <div
    class="h-20 w-full flex justify-between items-center px-5 shadow-md text-white-500"
  >
    <img
      src="https://cdn-icons-png.flaticon.com/512/157/157395.png"
      alt="wave"
      class="h-14 w-14 rounded-[50%]"
    />
    <div
      class="w-[50%] sm:w-[30%] lg:w-[20%] flex items-center justify-between"
    >
      <button
        @click="displayNewProjectModal = true"
        class="w-[140px] h-10 rounded-md border-[1px] border-black hover:bg-slate-50"
      >
        Create Project
      </button>
      <Avatar
        :size="50"
        :name="address"
        variant="marble"
        :colors="['#92A1C6', '#146A7C', '#F0AB3D', '#C271B4', '#C20D90']"
      />
    </div>
  </div>
  <div
    v-if="displayNewProjectModal"
    className="fixed inset-0 w-full overflow-y-auto bg-gray-600/50 pt-40"
  >
    <NewProject @closeModal="displayNewProjectModal = false" />
  </div>
</template>
<script lang="ts">
import Avatar from "vue-boring-avatars";
import { useUserInfoStore } from "../store";

export default {
  components: { Avatar },
  data() {
    return {
      address: "",
      displayNewProjectModal: false,
    };
  },
  async created() {
    //@ts-ignore
    const wallet = window.arweaveWallet;
    await wallet.connect([
      "ACCESS_ADDRESS",
      "ACCESS_PUBLIC_KEY",
      "ACCESS_ALL_ADDRESSES",
      "SIGN_TRANSACTION",
      "ACCESS_ARWEAVE_CONFIG",
      "SIGNATURE",
    ]);
    this.address = await wallet.getActiveAddress();
    useUserInfoStore().setAddress(this.address);
  },
};
</script>
