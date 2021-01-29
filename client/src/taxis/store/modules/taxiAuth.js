import {
  firebaseDatabase
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      canTaxi: false,
      isLooking: false,
      currentOrder: {
        id: null,
        value: null
      },
      driverLocation: null,
      lastLocationUpdateTime: null
    };
  },
  getters: {
    canTaxi(state) {
      return state.canTaxi;
    },
    isLooking(state) {
      return state.isLooking;
    },
    isInTaxi(state) {
      return state.currentOrder.id != null;
    },
    currentOrderId(state) {
      return state.currentOrder.id
    },
    driverLocation(state) {
      return state.driverLocation
    }
  },
  actions: {
    async loadTaxiAuth(context) {
      let userId = context.rootGetters.userId
      let snapshot = await firebaseDatabase().ref(`taxiDrivers/${userId}/state`).once('value')
      storeState(snapshot.val(), context)
      firebaseDatabase().ref(`taxiDrivers/${userId}/state`).on('value', snapshot => {
        storeState(snapshot.val(), context)
      });
      navigator.geolocation.watchPosition(function (position) {
        let newPosition = {
          lat: position.coords.latitude,
          long: position.coords.longitude
        }
        context.commit('setDriverPosition', newPosition)
      });
      setInterval(function () {
        updateDriverPosition(context)
      }, 300 * 1000)
    },
    startLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(true);
    },
    stopLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(false);
    },
    updateDriverPosition(context) {
      updateDriverPosition(context)
    }
  },
  mutations: {
    saveTaxiAuth(state, payload) {
      state.canTaxi = payload.canTaxi;
    },
    setTaxi(state, payload) {
      state.currentOrder = payload
    },
    setIsLooking(state, payload) {
      state.isLooking = payload;
    },
    setCurrentOrder(state, payload) {
      state.currentOrder.id = payload.id;
      state.currentOrder.value = payload.value;
    },
    setCurrentOrderStatus(state, payload) {
      if (state.currentOrder.value) {
        state.currentOrder.value.status = payload
      }
    },
    setDriverPosition(state, payload) {
      state.driverLocation = payload
      state.lastLocationUpdateTime = new Date()
    }
  }
}

function storeState(newState, context) {
  if (newState.authorized) {
    context.commit('saveTaxiAuth', {
      canTaxi: true
    })
  } else {
    return
  }
  if (newState.inTaxi) {
    context.dispatch('incomingOrders/stopListeningForIncoming')
    firebaseDatabase().ref(`orders/taxi/${newState.inTaxi}`).once('value', snapshot => {
      context.commit('setCurrentOrder', {
        id: newState.inTaxi,
        value: snapshot.val()
      })
    });
    firebaseDatabase().ref(`orders/taxi/${newState.inTaxi}/status`).on('value', snapshot => {
      context.commit('setCurrentOrderStatus', snapshot.val())
    });
  } else {
    if (context.state.currentOrder.id) {
      firebaseDatabase().ref(`orders/taxi/${context.state.currentOrder.id}/status`).off()
    }
    context.commit('setCurrentOrder', {
      id: null,
      value: null
    })
    if (newState.isLooking) {
      context.commit('setIsLooking', true)
      context.dispatch('incomingOrders/startListeningForIncoming')
    } else {
      context.commit('setIsLooking', false)
      context.dispatch('incomingOrders/stopListeningForIncoming')
    }
  }
}

const updateDriverPosition = async (context) => {
  let userId = context.rootGetters.userId
  let driverLocation = context.state.driverLocation
  let lastUpdateTime = context.state.lastLocationUpdateTime
  let locationUpdate = {
    position: driverLocation,
    lastUpdateTime: lastUpdateTime.toUTCString()
  }
  firebaseDatabase().ref(`taxiDrivers/${userId}/location`).set(locationUpdate)
  if (context.state.currentOrder.id) {
    firebaseDatabase().ref(`orders/taxi/${context.state.currentOrder.id}/driver/location`).update(locationUpdate)
    updateRouteInformation(context.state.currentOrder, driverLocation)
  }
}

const updateRouteInformation = async (order, driverLocation) => {
  let destination
  if (order.value.status == "onTheWay") {
    destination = order.value.from
  } else if (order.value.status == "inTransit") {
    destination = order.value.to
  } else {
    return
  }
  if (window.google) {
    let directionsService = new window.google.maps.DirectionsService();
    directionsService.route({
        origin: {
          lat: driverLocation.lat,
          lng: driverLocation.long
        },
        destination: {
          lat: destination.lat,
          lng: destination.long
        },
        travelMode: "DRIVING",
      },
      (response, status) => {
        if (status == "OK") {
          console.log("inside update ", response)
          let distance = response.routes[0].legs[0].distance
          let duration = response.routes[0].legs[0].duration
          let polyline = response.routes[0].overview_polyline
          let eta = new Date()
          eta.setSeconds(eta.getSeconds() + duration.value);
          firebaseDatabase().ref(`orders/taxi/${order.id}/driver/location`).update({
            distanceToLocation: distance,
            timeToLocation: duration,
            estimatedArrivalTime: eta.toUTCString(),
            polyline: polyline
          })
        }
      })
  }
}