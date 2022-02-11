import { firebaseDatabase, cloudCall } from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      value: null,
      orderId: null
    };
  },
  actions: {
    loadGrocery(context, payload) {
      let orderId = context.state.orderId
      if (orderId) {
        if (orderId == payload.orderId){
          return
        } else {
          firebaseDatabase().ref(`/orders/grocery/${orderId}`).off()
          context.commit('unloadGrocery')
        }
      }
      orderId  = payload.orderId;
      firebaseDatabase().ref(`/orders/grocery/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('loadGrocery', {order:order, orderId:orderId})
      });
    },
    async requestGrocery(_, payload) {
      let from  = payload.from
      let to = payload.to
      let items = payload.items
      let notes = payload.notes
      let response = await cloudCall('requestGrocery', { from: from, to: to, notes: notes, items:items });
      return response;
    }
  },
  mutations: {
    loadGrocery(state, payload){
      state.value = payload.order
      state.orderId = payload.orderId
    },
    unloadGrocery(state){
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