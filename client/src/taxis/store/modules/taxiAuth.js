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
      lastLocationUpdateTime: null,
      locationEnabled: false
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
    },
    locationEnabled(state) {
        return state.locationEnabled
    }
  },
  actions: {
    async loadTaxiAuth(context) {
      let userId = context.rootGetters.userId
      let snapshot = await firebaseDatabase().ref(`taxiDrivers/${userId}/state`).once('value')
      await storeState(snapshot.val(), context)
      firebaseDatabase().ref(`taxiDrivers/${userId}/state`).on('value', snapshot => {
        storeState(snapshot.val(), context)
      });
      let navigatorWatchId = navigator.geolocation.watchPosition(function (position) {
        let newPosition = {
          lat: position.coords.latitude,
          long: position.coords.longitude
        }
        console.log("driver position, ", newPosition)
        context.commit('setDriverPosition', newPosition)
        context.dispatch('incomingOrders/updateDistances')
        context.commit('setLocationEnabled', true)
      }, async function() {
        context.commit('setLocationEnabled', false)
      });
      let updateDriverIntervalId = setInterval(function () {
        updateDriverPosition(context)
      }, 10 * 1000)
      
      let updateRouteIntervalId = setInterval(function () {
        updateRouteInformation(context)
      }, 300 * 1000)

      setTimeout(function () {
        updateRouteInformation(context)
      }, 10 * 1000)

      context.commit('saveLogoutCallback', {
        func:function(userId, updateDriverIntervalId, navigatorWatchId, updateRouteIntervalId) {
          firebaseDatabase().ref(`taxiDrivers/${userId}/state`).off()
          clearInterval(updateDriverIntervalId);
          clearInterval(updateRouteIntervalId);
          navigator.geolocation.clearWatch(navigatorWatchId);
        }, 
        args: [userId, updateDriverIntervalId, navigatorWatchId, updateRouteIntervalId]
      }, { root: true })
    },
    startLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(true);
    },
    stopLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(false);
    },
    updateRouteInformation(context) {
      updateRouteInformation(context)
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
    },
    setLocationEnabled(state, payload) {
      console.log("Location Enabled, ", payload)
      state.locationEnabled = payload
    }
  }
}

async function storeState(newState, context) {
  if (newState.authorized) {
    context.commit('saveTaxiAuth', {
      canTaxi: true
    })
  } else {
    return
  }
  if (newState.inTaxi) {
    context.dispatch('incomingOrders/stopListeningForIncoming')
    let snapshot = await firebaseDatabase().ref(`orders/taxi/${newState.inTaxi}`).once('value')
    context.commit('setCurrentOrder', {
      id: newState.inTaxi,
      value: snapshot.val()
    })
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
  if(!context.state.driverLocation){
    return
  }
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
  }
}

const updateRouteInformation = async (context) => {
  if(!context.state.currentOrder.id){
    return;
  } 
  let order = context.state.currentOrder
  let driverLocation = context.state.driverLocation
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
  } else {
    console.log("google maps not loaded")
  }
}