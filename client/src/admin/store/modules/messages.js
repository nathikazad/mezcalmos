import { firebaseDatabase, cloudCall } from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      messages: {customer:{}, taxi: {}}
    };
  },
  getters: {
    listCustomerMessages(state) {
      return state.messages["customer"];
    },
    listTaxiMessages(state) {
      return state.messages["taxi"];
    },
  },
  actions: {
    async loadMessages(context) {
      
      firebaseDatabase().ref(`adminChat/customer/current`).on('value', function(snapshot) {
        context.commit('saveCustomerMessages', snapshot.val())
      })

      firebaseDatabase().ref(`adminChat/taxi/current`).on('value', function(snapshot) {
        context.commit('saveTaxiMessages', snapshot.val())
      })
      
      context.commit('saveLogoutCallback', {
        func:function() {
          firebaseDatabase().ref(`adminChat/customer/current`).off()
          firebaseDatabase().ref(`adminChat/taxi/current`).off()
        }, 
        args: []
      }, { root: true })
    },
    async createTicket(_, payload) {
      let ticket = {
        fromAdmin: true,
        userId: payload.userId,
        userType: payload.userType
      }
      let response = await cloudCall('createAdminChat', ticket);
      console.log(response)
      return response;
    },
    async resolveChat(_, payload) {
      let userId = payload.userId
      let userType = payload.userType

      let response = await cloudCall('resolveAdminChat', { userType: userType, userId: userId });
      console.log(response)
      return response;
      
    },
    messageUser(context, payload) {
      let adminId = context.rootGetters.userId
      let userId = payload.userId
      let userType = payload.userType
      let chatObject = context.state.messages[userType][userId]
      let chatId = Object.keys(chatObject)[0]
      let newMessage = {
        message: payload.message,
        userId: adminId,
        timestamp: (new Date()).toUTCString()
      }
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/${chatId}/messages`).push(newMessage);
      if(!chatObject["adminInfo"] || !chatObject["adminInfo"][adminId]){
        let info = context.rootGetters.userInfo
        let adminInfo = {
          displayName: info.displayName,
          photo: info.photo
        }
        firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/${chatId}/adminInfo/${adminId}`).set(adminInfo);
      }
    }
  },
  mutations: {
    saveCustomerMessages(state, payload) {
      state.messages["customer"] = payload;
    },
    saveTaxiMessages(state, payload) {
      state.messages["taxi"] = payload;
    }
  }
}