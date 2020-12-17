import { firebaseDatabase, firebaseFunctions } from '@/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      value: {}
    };
  },
  actions: {
    async loadGrocery(context, payload) {
      // let userId = context.rootGetters.userId
      let orderId  = payload.orderId
      let order = await firebaseDatabase().ref('/orders/' + orderId).once('value')
      context.commit('loadGrocery', order)
    },
    async requestGrocery(context, payload) {
      // let userId = context.rootGetters.userId
      let from  = payload.from
      let to = payload.to
      let items = payload.items
      let notes = payload.notes
      let response = await firebaseFunctions().httpsCallable('requestGrocery')({ from: from, to: to, items:items, notes: notes });
      return response;
    }
  },
  mutations: {
    loadGrocery(state, payload){
      state.value = payload
    }
  },
  getters: {
    value(state) {
      return state.value;
    }
  }
};