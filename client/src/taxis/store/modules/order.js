// for viewing new and old orders as well as finding all past orders
import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'
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
        // TODO: if order is null then reroute page
        context.commit('saveOrder', {
          order: order,
          orderId: orderId
        });
      });
    },
    unloadOrder(context) {
      let orderId = context.state.orderId
      // TODO: check if order is loaded
      firebaseDatabase().ref(`orders/taxi/${orderId}`).off()
      context.commit('unloadOrder')
    },
    async acceptRide(context) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      let response = await cloudCall('acceptTaxiOrder', {
        orderId: orderId
      });
      // For TESTING PURPOSE, remove this and add it to callback from gps update posittion
      let position = {
        lat: 34.25, 
        lng: 31.58,
        distanceToLocation: 2.3,
        timeToLocation: 1500,
        estimatedArrivalTime: (new Date()).toUTCString(),
        lastUpdateTime: (new Date()).toUTCString()
      };
      context.dispatch('updateDriverPosition', position)
      return response;
    },
    updateDriverPosition(context, position) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      firebaseDatabase().ref(`orders/taxi/${orderId}/driver/position`).set(position);
    },
    async startRide(context) {
      // TODO: check if order is loaded
      let orderId = context.state.orderId
      let response = await cloudCall('startTaxiRide', {
        orderId: orderId
      });
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