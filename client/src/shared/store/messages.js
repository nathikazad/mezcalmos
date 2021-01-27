import {
  firebaseDatabase
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      messages: null,
      participants: null,
      orderId: null,
      chatType: null
    };
  },
  actions: {
    async sendMessage(context, payload) {
      let orderId = context.state.orderId
      let newMessage = {
        orderId: orderId,
        message: payload.message,
        userId: context.rootGetters.userId,
        timestamp: (new Date()).toUTCString()
      }
      console.log(orderId, newMessage)
      // user can claim to be any user
      firebaseDatabase().ref(`/chat/${orderId}/messages`).push(newMessage);
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

      let chat = (await firebaseDatabase().ref(`chat/${orderId}/`).once('value')).val();
      context.commit('saveChatInfo', {
        orderId: orderId,
        orderType: chat.orderType,
        chatType: chat.chatType
      })
      firebaseDatabase().ref(`/chat/${orderId}`).on('value', async snapshot => {
        let chat = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('saveMessages', {
          messages: chat.messages,
          participants: chat.participants,
        })
        context.dispatch("notifications/clearMessageNotifications", {
          orderId: orderId
        }, {root:true});
      });
      
    }
  },
  mutations: {
    saveMessages(state, payload) {
      state.messages = payload.messages;
      state.participants = payload.participants;
    },
    saveChatInfo(state, payload) {
      state.orderId = payload.orderId
      state.orderType = payload.orderType
      state.chatType = payload.chatType
    },
    unloadMessages(state) {
      state.messages = {}
      state.orderType = null;
      state.orderId = null;
      state.chatType = null;
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