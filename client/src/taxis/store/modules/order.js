// for viewing new and old orders as well as finding all past orders
import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'

import {
  getDistanceFromLatLonInKm
} from '@/shared/mixins/mapFunctions'
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
        firebaseDatabase().ref(`orders/taxi/${context.getters.orderId}`).off()
        context.commit('unloadOrder')
      }
      let orderId = payload.orderId
      firebaseDatabase().ref(`orders/taxi/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val()
        console.log(order.to)
        if (order.status == "lookingForTaxi") {
          let driverLocation = context.rootGetters.userLocation;
          order.customer.distance = getDistanceFromLatLonInKm(order.from, driverLocation)
        }
        context.commit('saveOrder', { order: order, orderId: orderId });
      }, () => {

        context.commit('saveOrder', { order: null, orderId: null })
      });

    },
    async acceptRide(context) {
      let orderId = context.state.orderId
      let response = (await cloudCall('acceptTaxiOrder', { orderId: orderId })).data;
      context.dispatch('updateRouteInformation', null, { root: true })
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      return response;
    },
    async cancelRide(context, payload) {
      let status = context.state.order.status
      if (status != "onTheWay") {
        console.log("Not possible to cancel")
        return
      }
      let response = (await cloudCall('cancelTaxiFromDriver', { reason: payload.reason })).data
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      return response
    },
    async startRide(context) {
      let driverLocation = context.rootGetters.userLocation;
      let startLocation = context.state.order.from
      if(getDistanceFromLatLonInKm(driverLocation, startLocation) > 0.5) {
        return {
          status: "Error",
          errorMessage: "Too far",
          i18nCode: "tooFarFromStartLocation"
        }
      }
      let response = (await cloudCall('startTaxiRide')).data;
      context.dispatch('updateRouteInformation', null, { root: true })
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      return response;
    },
    async finishRide(context) {
      let driverLocation = context.rootGetters.userLocation;
      let endLocation = context.state.order.to
      if(getDistanceFromLatLonInKm(driverLocation, endLocation) > 0.5) {
        return {
          status: "Error",
          errorMessage: "Too far",
          i18nCode: "tooFarFromStartLocation"
        }
      }
      let response = (await cloudCall('finishTaxiRide')).data;
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      return response;
    }
  },
  mutations: {
    saveDistance(state, payload) {
      state.order.customer.distance = payload
    },
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
      return !!state.order && state.order.status == "lookingForTaxi"
    },
    orderStatusOnTheWay(state) {
      return !!state.order && state.order.status == "onTheWay"
    },
    orderStatusInTransit(state) {
      return !!state.order && state.order.status == "inTransit"
    },
    orderStatusDroppedOff(state) {
      return !!state.order && state.order.status == "droppedOff"
    },
    orderStatusCancelled(state) {
      return !!state.order && state.order.status == "cancelled"
    }
  }
};