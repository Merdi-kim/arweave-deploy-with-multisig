import { defineStore } from "pinia";

export const useUserInfoStore = defineStore("userInfo", {
  state: () => ({
    address: "",
  }),
  getters: {
    getAddress(state) {
      return state.address;
    },
  },
  actions: {
    setAddress(address: string) {
      this.address = address;
    },
  },
});
