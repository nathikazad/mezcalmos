import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  namespaced: true,
  state() {
    return {
      taxis: {}
    };
  },
  getters: {
    list(state) {
      var taxis = state.taxis;
      return function (query) {
        if(!query){
          return taxis
        }
        let list = {}
        for(let key in taxis) {
          if(taxis[key].info.displayName.indexOf(query) >= 0){
            list[key] = taxis[key]
          } else if(taxis[key].info.email.indexOf(query) >= 0){
            list[key] = taxis[key]
          } else if (key.indexOf(query) >= 0) {
            list[key] = taxis[key]
          }
        }
        return list
      };        
    }
  },
  actions: {
    async loadTaxis(context, payload) {
      let users = (await firebaseDatabase().ref(`users`).once("value")).val()
      let taxis = (await firebaseDatabase().ref(`taxiDrivers`).once("value")).val()
      for(let key in taxis){
        taxis[key].info = users[key].info
      }
      context.commit('saveTaxis', taxis)
    }
  },
  mutations: {
    saveTaxis(state, payload) {
      state.taxis = payload;
    }
  }
}