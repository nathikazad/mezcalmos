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
    loadGrocery(context, payload) {
      // let userId = context.rootGetters.userId
      let orderId  = payload.orderId;
      firebaseDatabase().ref(`/orders/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        if(order.driverId){
          order.driverName = (await firebaseDatabase().ref(`/users/${order.GroceryId}/name`).once('value')).val()
        }
        context.commit('loadGrocery', {order:order, orderId:orderId})
      });
    },
    async unloadGrocery(context) {
      console.log("unloaded Grocerys")
      let orderId = context.state.orderId
      firebaseDatabase().ref(`/orders/${orderId}`).off()
      context.commit('unloadGrocery')
    },
    async requestGrocery(_, payload) {
      console.log("Requesting Grocery")
      let from  = payload.from
      let to = payload.to
      let items = payload.items
      let notes = payload.notes
      let response = await firebaseFunctions().httpsCallable('requestGrocery')({ from: from, to: to, notes: notes, items:items });
      return response;
    }
  },
  mutations: {
    loadGrocery(state, payload){
      console.log("Grocery mutated")
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