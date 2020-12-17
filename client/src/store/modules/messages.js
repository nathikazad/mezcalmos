import { firebaseFunctions, firebaseDatabase } from '@/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      messages: [],
      firebaseListener: null
    };
  },
  actions: {
    async sendMessage(context, payload) {
      // const token = context.rootGetters.authToken
      payload.id = context.rootGetters.userId
      let orderId = payload.orderId
      let message = payload.messagesId
      // cloud function to write timestamp and userid along with message
      let response = await firebaseFunctions().httpsCallable('sendMessage')({ orderId: orderId, message: message });
      return response;
    },
    async loadMessages(context, payload) {
      console.log("loading messages")
      let orderId = payload.orderId
      let messages = await firebaseDatabase().ref('/orders/' + orderId+'/messages').once('value')
      // load last x messages
      // create firebase listener for new messages
      context.commit('loadMessages', messages)
    },
    async removeMessages(context) {
      // to be called before page is destroyed
      // remove event listener
      context.commit('emptyMessages')
    }
  },
  mutations: {
    loadMessages(state, payload) {
      state.messages = payload.messages;
    },
    addMessage(state, payload) {
      state.messages[payload.key] = payload.message;
    },
    emptyMessages(state) {
      state.messages = {}
    }
  },
  getters: {
    messages(state) {
      return state.messages;
    }
  }
};