// for viewing new and old orders as well as finding all past orders
import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'

import { getDistanceFromLatLonInKm } from '@/shared/mixins/mapFunctions'
export default {
  namespaced: true,
  state() {
    return {
      order: null,
      orderId: null
    };
  },
  actions: {
    loadOrder(context, payload) {
      if (context.getters.orderId != null) {
        context.dispatch('unloadOrder')
      }
      let orderId = payload.orderId
      firebaseDatabase().ref(`orders/taxi/${orderId}`).on('value', snapshot => {
        let order = snapshot.val()
        if(order.status == "lookingForTaxi") {
          let driverLocation = context.rootGetters.driverLocation;
          order.customer.distance = getDistanceFromLatLonInKm(order.from, driverLocation)
        }
        context.commit('saveOrder', {
          order: order,
          orderId: orderId
        });
      });
    },
    unloadOrder(context) {
      // TODO: check if order is loaded
      context.commit('unloadOrder')
    },
    async acceptRide(context) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      let response = await cloudCall('acceptTaxiOrder', {
        orderId: orderId
      });
      context.dispatch('updateDriverPosition', null, {root:true})
      return response;
    },
    async startRide(context) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      let response = await cloudCall('startTaxiRide', {
        orderId: orderId
      });
      context.dispatch('updateDriverPosition', null, {root:true})
      return response;
    },
    async finishRide(context) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      let response = await cloudCall('finishTaxiRide', {
        orderId: orderId
      });
      return response;
    }
  },
  mutations: {
    saveOrder(state, payload) {
      state.order = payload.order
      state.orderId = payload.orderId
    },
    unloadOrder(state) {
      state.order = null
      state.orderId = null
    }
  },
  getters: {
    isLoaded(state) {
      return state.order != null
    },
    getOrder(state) {
      return state.order;
    },
    orderId(state) {
      return state.orderId;
    },
    orderStatusLooking(state) {
      return state.order.status == "lookingForTaxi"
    },
    orderStatusOnTheWay(state) {
      return state.order.status == "onTheWay"
    },
    orderStatusInTransit(state) {
      return state.order.status == "inTransit"
    },
    orderStatusDroppedOff(state) {
      return state.order.status == "droppedOff"
    }
  }
};