import { firebaseDatabase, firebaseFunctions } from '@/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      value: {},
      errorMessage: null
    };
  },
  actions: {
    async loadTaxi(context, payload) {
      // let userId = context.rootGetters.userId
      console.log(payload);
      let orderId  = payload.orderId
      let order = (await firebaseDatabase().ref('/orders/' + orderId).once('value')).val()
      // TODO: if unauthorized or wrong type of order redirect to home page
      context.commit('loadTaxi', order)
    },
    async requestTaxi(_, payload) {
      // let userId = context.rootGetters.userId
      let from  = payload.from
      let to = payload.to
      let response = await firebaseFunctions().httpsCallable('requestTaxi')({ from: from, to: to });
      return response;
    }
  },
  mutations: {
    loadTaxi(state, payload){
      console.log(payload)
      state.value = payload
    }
  },
  getters: {
    value(state) {
      return state.value;
    }
  }
};