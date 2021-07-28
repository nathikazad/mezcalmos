export default {
  namespaced: true,
  state() {
    return {};
  },
  actions: {
    async log(_, payload) {
     console.log(payload)
    },
  },
};


