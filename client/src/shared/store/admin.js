import {
  firebaseDatabase, cloudCall
} from '@/shared/config/firebase'

export default {
  namespaced: true,
  state() {
    return {
      chat:null
    };
  },
  actions: {
    async loadAdmin(context) {
      let userId = context.rootGetters.userId
      let userType = context.rootGetters.appName
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}`).on('value', function(snapshot) {
        context.commit('saveChat', snapshot.val())
      })
      context.commit('saveLogoutCallback', {
        func:function(userId, userType, context) {
          firebaseDatabase().ref(`adminChat/${userType}/current/${userId}`).off()
          context.commit('saveChat', null)
        }, 
        args: [userId, userType, context]
      }, { root: true })
    },
    async createTicket(context) {
      let userType = context.rootGetters.appName
      let response = await cloudCall('createAdminChat', { userType: userType });
      return response;
    },
    async messageAdmin(context, payload) {
      if(!context.state.chat){
        console.log("No active chat, load or create chat first")
        return
      }
      let userId = context.rootGetters.userId
      let userType = context.rootGetters.appName
      let newMessage = {
        message: payload.message,
        userId: userId,
        timestamp: (new Date()).toUTCString()
      }
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/messages`).push(newMessage);
    }
  },
  mutations: {
    saveChat(state, payload) {
      state.chat = payload;
    }
  },
  getters: {
    chat(state) {
      return state.chat;
    }
  }
};