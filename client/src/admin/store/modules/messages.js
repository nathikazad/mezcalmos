import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      currentMessages: null,
      messages: {
        customer: {},
        taxi: {}
      }
    };
  },
  getters: {
    listCustomerMessages(state) {
      return state.messages["customer"];
    },
    listTaxiMessages(state) {
      return state.messages["taxi"];
    },
    currentMessages(state) {
      return state.currentMessages;
    },
  },
  actions: {
    async loadMessages(context) {


      firebaseDatabase().ref(`adminChat/customer/current`).on('value', function (snapshot) {
        let currentCustomerMessages = {}

        if (snapshot.val()) {
          for (const customerId in snapshot.val()) {

            let ticketId = Object.keys(snapshot.val()[customerId])[0];
            let currentMessage = Object.values(snapshot.val()[customerId])[0]
            currentMessage['ticketId'] = ticketId
            currentCustomerMessages[customerId] = currentMessage

          }
        }
        context.commit('saveCustomerMessages', currentCustomerMessages)
      })

      firebaseDatabase().ref(`adminChat/taxi/current`).on('value', function (snapshot) {
        let currentTaxiMessages = {}
        if (snapshot.val()) {
          for (const taxiId in snapshot.val()) {

            let ticketId = Object.keys(snapshot.val()[taxiId])[0];
            let currentMessage = Object.values(snapshot.val()[taxiId])[0]
            currentMessage['ticketId'] = ticketId
            currentTaxiMessages[taxiId] = currentMessage

          }
        }
        context.commit('saveTaxiMessages', currentTaxiMessages)
      })

      context.commit('saveLogoutCallback', {
        func: function () {
          firebaseDatabase().ref(`adminChat/customer/current`).off()
          firebaseDatabase().ref(`adminChat/taxi/current`).off()
        },
        args: []
      }, {
        root: true
      })
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

      let response = await cloudCall('resolveAdminChat', {
        userType: userType,
        userId: userId
      });
      console.log(response)
      return response;

    },
    messageUser(context, payload) {
      let adminId = context.rootGetters.userId
      let userId = payload.userId
      let userType = payload.userType
      let chatObject = context.state.messages[userType][userId]
      let chatId = payload.ticketId
      let newMessage = {
        message: payload.message,
        adminId: adminId,
        timestamp: (new Date()).toUTCString()
      }
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/${chatId}/messages`).push(newMessage);
      if (!chatObject["admins"] || !chatObject["admins"][adminId]) {
        let info = context.rootGetters.userInfo
        let adminInfo = {
          displayName: info.displayName,
          photo: info.photo
        }
        firebaseDatabase().ref(`adminChat/${userType}/current/${userId}/${chatId}/admins/${adminId}`).set(adminInfo);
      }
    },
    loadCurrentMessages(context, payload) {
      let userId = payload.userId
      let userType = payload.userType
      firebaseDatabase().ref(`adminChat/${userType}/current/${userId}`).on('value', snapshot => {
        let currentMessages = null;
        if (snapshot.val()) {
          let ticketId = Object.keys(snapshot.val())[0]
          let messageObject = Object.values(snapshot.val())[0]
          currentMessages = {
            ...messageObject,
            ticketId: ticketId
          }
        }
        context.commit('saveCurrentMessages',currentMessages)
      })
    }
  },
  mutations: {
    saveCustomerMessages(state, payload) {
      state.messages["customer"] = payload;
    },
    saveTaxiMessages(state, payload) {
      state.messages["taxi"] = payload;
    },
    saveCurrentMessages(state, payload) {
      state.currentMessages = payload;
    }
  }
}