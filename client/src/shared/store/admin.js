


import {
  firebaseDatabase
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      chat:null
    };
  },
  actions: {
    async loadAdmin(context, payload) {
      let userId = context.rootGetters.userId
      let userType = context.rootGetters.appName
      let chat = (await firebaseDatabase().ref(`adminChats/${userType}/current/${userId}`).once('value')).val();
      if(chat) { context.commit('saveChat', chat) }
      firebaseDatabase().ref(`adminChats/${userType}/current/${userId}`).once('value', function(snapshot) {
        if(chat) { context.commit('saveChat', snapshot.val()) }
      })
    },
    async createTicket(context, payload) {
      let response = await cloudCall('createAdminChat', { userType: userType, to: to, notes: notes, items:items });
      return response;
    },
    async messageAdmin(context, payload) {
      
      
    }
  },
  mutations: {
    saveChat(state, payload) {
      state.chat = payload;
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