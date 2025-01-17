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

export const useProjectStore = defineStore("project", {
  state: () => ({
    selectedProject: {
      id:"",
      multisig:"",
      name:"",
      createdAt:"",
      history: [] as Array<{time:string, author:string, msg:string}> ,
    }
  }),
  getters: {
    getSelectedProject(state) {
      return state.selectedProject;
    },
  },
  actions: {
    setSelectedProject(project:{id:string, multisig:string, name:string, createdAt:string, history:Array<{time:string, author:string, msg:string}>}) {
      this.selectedProject = project;
    },
  },
});
