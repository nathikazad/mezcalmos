import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  namespaced: true,
  state() {
    return {
      customers: {}
    };
  },
  getters: {
    list(state) {
      var customers = state.customers;
      return function (query) {
        if(!query){
          return customers
        }
        let list = {}
        for(let key in customers) {
          if(customers[key].info.displayName.indexOf(query) >= 0){
            list[key] = customers[key]
          } else if(customers[key].info.email.indexOf(query) >= 0){
            list[key] = customers[key]
          } else if (key.indexOf(query) >= 0) {
            list[key] = customers[key]
          }
        }
        return list
      };        
    }
  },
  actions: {
    async loadCustomers(context, payload) {
      let customers = (await firebaseDatabase().ref(`users`).once("value")).val()
      context.commit('saveCustomers', customers)
    }
  },
  mutations: {
    saveCustomers(state, payload) {
      state.customers = payload;
    }
  }
}