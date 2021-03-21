import {
  firebaseDatabase
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  namespaced: true,
  state() {
    return {
      customers: {},
      currentCustomer: null
    };
  },
  getters: {
    list(state) {
      var customers = state.customers;
      return function (query) {
        if (!query) {
          return customers
        }
        let list = {}
        for (let key in customers) {
          if (customers[key].info.displayName.indexOf(query) >= 0) {
            list[key] = customers[key]
          } else if (customers[key].info.email.indexOf(query) >= 0) {
            list[key] = customers[key]
          } else if (key.indexOf(query) >= 0) {
            list[key] = customers[key]
          }
        }
        return list
      };
    },
    currentCustomer(state) {
      return state.currentCustomer
    }
  },
  actions: {
    async loadCustomers(context) {
      let customers = (await firebaseDatabase().ref(`users`).once("value")).val()
      context.commit('saveCustomers', customers)
    },
    async loadCustomer(context, payload) {
      context.commit('saveCurrentCustomer', null)
      let customer = (await firebaseDatabase().ref(`users/${payload.userId}`).once("value")).val()
      context.commit('saveCurrentCustomer', customer)
    }
  },
  mutations: {
    saveCustomers(state, payload) {
      state.customers = payload;
    },
    saveCurrentCustomer(state, payload) {
      state.currentCustomer = payload;
    }
  }
}