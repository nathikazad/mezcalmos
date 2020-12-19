import { firebaseFunctions, firebaseDatabase } from '@/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      messages: [],
      orderType: null,
      orderId: null
    };
  },
  actions: {
    async sendMessage(context, payload) {
      // const token = context.rootGetters.authToken
      let orderId = context.state.orderId
      let message = payload.message
      // cloud function to write timestamp and userid along with message
      let response = await firebaseFunctions().httpsCallable('sendMessage')({ orderId: orderId, message: message });
      return response;
    },
    async loadMessages(context, payload) {
      console.log("loading messages")
      let orderId = payload.orderId
      firebaseDatabase().ref(`/orders/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        console.log(order);
        // TODO: if unauthorized or wrong type of order redirect to home page
        if(order.taxiId){
          order.taxiDriverName = (await firebaseDatabase().ref(`/users/${order.taxiId}/name`).once('value')).val()
        }
        context.commit('loadMessages', {messages:order.messages, orderType:order.orderType, orderId:orderId})
      });
    },
    async unloadMessages(context) {
      console.log("unloaded messages")
      let orderId = context.state.orderId
      console.log(orderId)
      firebaseDatabase().ref(`/orders/${orderId}`).off()
      context.commit('unloadMessages')
    }
  },
  mutations: {
    loadMessages(state, payload) {
      console.log("messages mutated")
      state.messages = payload.messages;
      state.orderType = payload.orderType;
      state.orderId = payload.orderId;
    },
    unloadMessages(state) {
      state.messages = {}
      state.orderType = null;
      state.orderId = null;
    }
  },
  getters: {
    value(state) {
      return state.messages;
    },
    orderLink(state) {
      return `/services/${state.orderType}/${state.orderId}`
    }
  }
};