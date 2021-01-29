import {
  firebaseDatabase
} from '@/shared/config/firebase'

import { getDistanceFromLatLonInKm } from '@/shared/mixins/mapFunctions'
export default {
  namespaced: true,
  state() {
    return {
      list: {},
      sortedOrderIds: []
    };
  },
  actions: {
    async startListeningForIncoming(context) {
      await firebaseDatabase().ref(`openOrders/taxi`).off();
      firebaseDatabase().ref(`openOrders/taxi`).on('value', snapshot => {
        let orders = snapshot.val()
        context.commit('saveIncoming', orders)
        context.dispatch('updateDistances')
      });
      // TODO: sort orders by distance by getting from hasura
    },
    stopListeningForIncoming(context) {
      firebaseDatabase().ref(`openOrders/taxi`).off();
      context.commit('saveIncoming', {})
    },
    async updateDistances(context) {
      let orders = context.state.list
      let driverLocation = context.rootGetters.driverLocation;
      let distances = {}
      let sortedOrderIds = []
      for (let order in orders) {
        distances[order] = getDistanceFromLatLonInKm(orders[order].from, driverLocation)
      }
      console.log(distances)
      sortedOrderIds = Object.keys(distances).sort((id1, id2) => {
        return distances[id1] - distances[id2]
      })
      console.log(sortedOrderIds)
      context.commit('saveDistances', {
        sortedOrderIds,
        distances
      })
    }
  },
  mutations: {
    saveIncoming(state, payload) {
      state.list = payload
    },
    saveDistances(state, payload) {

      for (let order in state.list) {
        state.list[order].customer.distance = payload.distances[order]
      }
      state.sortedOrderIds = payload.sortedOrderIds

    }
  },
  getters: {
    sortedOrderIds(state) {
      return state.sortedOrderIds;
    },
    list(state) {
      return state.list;
    },
    hasOrders(state) {
      return state.list && Object.keys(state.list).length > 0
    }
  }
};