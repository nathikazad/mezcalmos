import { firebaseDatabase, cloudCall } from '@/shared/config/firebase'
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
          if (taxis[key].info.displayName.indexOf(query) >= 0) {
            list[key] = taxis[key]
          } else if (taxis[key].info.email.indexOf(query) >= 0) {
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
        console.log(users, taxis);

        taxis[key].info = users[key].info
      }
      context.commit('saveTaxis', taxis)
    },
    async approveAuthorizationRequest(_, payload) {
      let response = await cloudCall('approveAuthorizationRequest', {userType: "taxi", userId: payload.userId})
      return response
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