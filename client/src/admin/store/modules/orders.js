import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  namespaced: true,
  state() {
    return {
      taxiOrders: {open:{}, inProcess:{}},
      currentOrder: {id: null, info:{}, messages:{}}
    };
  },
  getters: {
    openTaxiOrders(state) {
      return state.taxiOrders.open;
    },
    inProcessTaxiOrders(state) {
      return state.taxiOrders.inProcess;
    },
    currentOrder(state) {
      return state.currentOrder
    }
  },
  actions: {
    loadTaxiOrders(context) {
      firebaseDatabase().ref(`openOrders/taxi`).on('value', function(snapshot) {
        context.commit('saveTaxiOrders', {
          orderType: "open",
          orders: snapshot.val()
        })
      })

      firebaseDatabase().ref(`inProcessOrders/taxi`).on('value', function(snapshot) {
        context.commit('saveTaxiOrders', {
          orderType: "inProcess",
          orders: snapshot.val()
        })
      })
    },
    loadTaxiOrder(context, payload) {
      let orderId = payload
      if(context.state.currentOrder.id) {
        firebaseDatabase().ref(`orders/taxi/${orderId}`).off()
        firebaseDatabase().ref(`chat/${orderId}`).off()
      }
      context.commit('saveTaxiOrder', {
        attribute: "id",
        value: orderId
      })
      firebaseDatabase().ref(`orders/taxi/${orderId}`).on('value', function(snapshot) {
        console.log(snapshot.val())
        context.commit('saveTaxiOrder', {
          attribute: "info",
          value: snapshot.val()
        })
      })
      firebaseDatabase().ref(`chat/${orderId}`).on('value', function(snapshot) {
        context.commit('saveTaxiOrder', {
          attribute: "messages",
          value: snapshot.val()
        })
      })
    }
  },
  mutations: {
    saveTaxiOrders(state, payload) {
      state.taxiOrders[payload.orderType] = payload.orders;
    },
    saveTaxiOrder(state, payload) {
      console.log(payload)
      state.currentOrder[payload.attribute] = payload.value;
    }
  }
}