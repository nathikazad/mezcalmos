import { firebaseDatabase, firebaseFunctions } from '@/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      value: {},
      orderId: null
    };
  },
  actions: {
    loadTaxi(context, payload) {
      // let userId = context.rootGetters.userId
      let orderId  = payload.orderId;
      firebaseDatabase().ref(`/orders/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        if(order.taxiId){
          order.taxiDriverName = (await firebaseDatabase().ref(`/users/${order.taxiId}/name`).once('value')).val()
        }
        context.commit('loadTaxi', {order:order, orderId:orderId})
      });
    },
    async unloadTaxi(context) {
      console.log("unloaded taxis")
      let orderId = context.state.orderId
      firebaseDatabase().ref(`/orders/${orderId}`).off()
      context.commit('unloadTaxi')
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
      state.value = payload.order
      state.orderId = payload.orderId
    },
    unloadTaxi(state){
      state.value = null
      state.orderId = null
    }
  },
  getters: {
    value(state) {
      return state.value;
    }
  }
};