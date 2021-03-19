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
        let chat = snapshot.val()
        let chatId = Object.keys(chat)[0]
        chat["chatId"] = chatId
        chat = Object.assign({}, chat, chat[chatId]);
        delete chat[chatId]
        context.commit('saveChat', chat)
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
      let chatId = context.state.chat.chatId
      let newMessage = {
        message: payload.message,
        userId: userId,
        timestamp: (new Date()).toUTCString()
      }
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/${chatId}/messages`).push(newMessage);
    },
    submitAuthorizationRequest(context) {
      let userType = context.rootGetters.appName
      if (userType == "customer") return
      cloudCall('submitAuthorizationRequest', {userType: userType})
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
    },
    messageCount(state) {
      Object.keys(state.chat.messages).length
    }
  }
};