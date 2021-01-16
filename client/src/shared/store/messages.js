import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      messages: null,
      participants: null,
      orderId: null
    };
  },
  actions: {
    async sendMessage(context, payload) {
      let orderId = context.state.orderId
      let newMessage = {
        message: payload.message,
        userId: context.rootGetters.userId,
        timestamp: (new Date()).toUTCString()
      }
      console.log(orderId, newMessage)
      // user can claim to be any user
      firebaseDatabase().ref(`/chat/${orderId}/messages`).push(newMessage);
      cloudCall('sendMessage', {
        message: payload.message
      });
    },
    async loadMessages(context, payload) {
      let orderId = context.state.orderId
      console.log(orderId);
      if (orderId) {


        if (orderId == payload.orderId) {
          return
        } else {
          firebaseDatabase().ref(`/chat/${context.state.orderId}`).off()
          context.commit('unloadMessages')
        }
      }
      orderId = payload.orderId

      let orderType = (await firebaseDatabase().ref(`chat/${orderId}/orderType/`).once('value')).val();
      context.commit('saveOrderId', {
        orderId: orderId,
        orderType: orderType
      })
      firebaseDatabase().ref(`/chat/${orderId}`).on('value', async snapshot => {
        let chat = snapshot.val();
        console.log(chat);

        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('saveMessages', {
          messages: chat.messages,
          participants: chat.participants
        })
      });
    }
  },
  mutations: {
    saveMessages(state, payload) {
      state.messages = payload.messages;
      state.participants = payload.participants;
    },
    saveOrderId(state, payload) {
      state.orderId = payload.orderId
      state.orderType = payload.orderType
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
    participants(state) {
      return state.participants;
    },
    orderLink(state, _, _1, rootGetters) {
      if (rootGetters.appName == "customer") {
        return `/services/${state.orderType}/${state.orderId}`
      } else {
        return `/orders/${state.orderId}`
      }
    }
  }
};