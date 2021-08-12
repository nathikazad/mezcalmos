import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  namespaced: true,
  state() {
    return {
      taxis: {},
      currentTaxi: null
    };
  },
  getters: {
    list(state) {
      var taxis = state.taxis;
      return function (query) {
        if (!query) {
          return taxis
        }
        let list = {}
        for (let key in taxis) {
          if (taxis[key].info.displayName.toLowerCase().indexOf(query) >= 0) {
            list[key] = taxis[key]
          } else if (key.indexOf(query) >= 0) {
            list[key] = taxis[key]
          }
        }
        return list
      };
    },
    currentTaxi(state) {
      return state.currentTaxi
    }
  },
  actions: {
    async loadTaxis(context) {
      let users = (await firebaseDatabase().ref(`users`).once("value")).val()
      let taxis = (await firebaseDatabase().ref(`taxiDrivers`).once("value")).val()
      for (let key in taxis) {
        if (users[key] && users[key].info)
          taxis[key].info = users[key].info
        else
          delete taxis[key]
      }
      context.commit('saveTaxis', taxis)
    },
    async approveAuthorizationRequest(_, payload) {
      let response = await cloudCall('approveAuthorizationRequest', {
        userType: "taxi",
        userId: payload.userId
      })
      return response
    },
    async sendTestNotification(_, payload) {
      let response = await cloudCall('sendTestNotification', {
        userId: payload.userId
      })
      return response
    },
    async taxiChangeInfoParam(_, payload) {
      let response = await firebaseDatabase().ref(`users/${payload.id}/info/${payload.param}`).set(payload.value)
      return response;
    }
  },
  mutations: {
    saveTaxis(state, payload) {
      state.taxis = payload;
    },
    saveCurrentTaxi(state, payload) {
      state.currentTaxi = payload;
    }
  }
}