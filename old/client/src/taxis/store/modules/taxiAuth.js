import { firebaseDatabase } from '@/shared/config/firebase'
import { getApolloClient } from '@/shared/config/apollo'
import gql from 'graphql-tag'
export default {
  state() {
    return {
      authorizationStatus: "none",
      isLooking: false,
      currentOrder: { id: null, value: null },
      driverLocation: null,
      lastLocationUpdateTime: null,
    };
  },
  getters: {
    canTaxi(state) {
      return state.authorizationStatus == "authorized";
    },
    authorizationPending(state) {
      return state.authorizationStatus == "pending";
    },
    isLooking(state) {
      return state.isLooking;
    },
    isInTaxi(state) {
      return state.currentOrder.id != null;
    },
    currentOrderId(state) {
      return state.currentOrder.id
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
      context.commit('saveWatchPositionCallback', {
        func: function () {
          context.dispatch('incomingOrders/updateDistances')
        }, args: []
      }, { root: true })

      let updateDriverIntervalId = setInterval(function () {
        updateDriverPosition(context)
      }, 10 * 1000)

      context.commit('saveLogoutCallback', {
        func: function (userId, updateDriverIntervalId, context) {
          firebaseDatabase().ref(`taxiDrivers/${userId}/state`).off()
          firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(false)
          clearInterval(updateDriverIntervalId);
          context.commit('clearAll')
        },
        args: [userId, updateDriverIntervalId, context]
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
      state.authorizationStatus = payload;
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
    clearAll(state){
      state.authorizationStatus = "none"
      state.isLooking = false
      state.currentOrder = { id: null, value: null }
      state.driverLocation = null
      state.lastLocationUpdateTime =  null
    }
  }
}

async function storeState(newState, context) {
  if (!newState || !newState.authorizationStatus) {
    return
  }
  context.commit('saveTaxiAuth', newState.authorizationStatus)
  if (newState.authorizationStatus != "authorized" ) {
    return
  }
  if (newState.currentOrder) {
    context.dispatch('incomingOrders/stopListeningForIncoming')
    let snapshot = await firebaseDatabase().ref(`orders/taxi/${newState.currentOrder}`).once('value')
    context.commit('setCurrentOrder', {
      id: newState.currentOrder,
      value: snapshot.val()
    })
    firebaseDatabase().ref(`orders/taxi/${newState.currentOrder}/status`).on('value', snapshot => {
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
    let apolloClient = getApolloClient();
    let userId = context.rootGetters.userId
    if (newState.isLooking) {
      context.commit('setIsLooking', true)
      // setHasuraAvailableOn

      await apolloClient.mutate({
        mutation: gql`
        mutation AvailableMutation {
          insert_driverLocation_one(object: {available: true, uid: "${userId}"}, on_conflict: {constraint: driverLocation_pkey, update_columns: available, where: {uid: {_eq: "${userId}"}}}) {
            location
          }
        }
      ` })
      context.dispatch('incomingOrders/startListeningForIncoming')
    } else {
      context.commit('setIsLooking', false)
      await apolloClient.mutate({
        mutation: gql`
        mutation AvailbleMutation {
          insert_driverLocation_one(object: {available: false, uid: "${userId}"}, on_conflict: {constraint: driverLocation_pkey, update_columns: available, where: {uid: {_eq: "${userId}"}}}) {
            location
          }
        }
      ` })
      context.dispatch('incomingOrders/stopListeningForIncoming')
    }

  }
}

const updateDriverPosition = async (context) => {
  let driverLocation = context.rootGetters.userLocation;
  let lastUpdateTime = context.rootGetters.lastLocationUpdateTime
  if (!driverLocation) {
    return
  }
  let userId = context.rootGetters.userId
  let locationUpdate = {
    position: driverLocation,
    lastUpdateTime: lastUpdateTime.toISOString()
  }
  firebaseDatabase().ref(`taxiDrivers/${userId}/location`).set(locationUpdate)
  console.log(driverLocation.lat, driverLocation.lng)
  // setDriverPosition
  let apolloClient = getApolloClient();
  await apolloClient.mutate({
    mutation: gql`
    mutation LocationMutation {
      insert_driverLocation_one(object: {location: {type: "Point", coordinates: [${driverLocation.lng}, ${driverLocation.lat}]}, uid: "${userId}"}, on_conflict: {constraint: driverLocation_pkey, update_columns: location, where: {uid: {_eq: "${userId}"}}}) {
        location
      }
    }
  ` })
  if (context.state.currentOrder.id) {
    firebaseDatabase().ref(`orders/taxi/${context.state.currentOrder.id}/driver/location`).update(locationUpdate)
  }
}

const updateRouteInformation = async (context) => {
  if (!context.state.currentOrder.id) {
    return;
  }
  let order = context.state.currentOrder
  let driverLocation = context.rootGetters.userLocation;
  let destination
  if (order.value.status == "onTheWay") {
    destination = order.value.from
  } else if (order.value.status == "inTransit") {
    destination = order.value.to
  } else {
    return
  }
  if (window.google && driverLocation && driverLocation.lat && driverLocation.lng) {
    let directionsService = new window.google.maps.DirectionsService();
    directionsService.route({
        origin: {
          lat: driverLocation.lat,
          lng: driverLocation.lng
        },
        destination: {
          lat: destination.lat,
          lng: destination.lng
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
            estimatedArrivalTime: eta.toISOString(),
            polyline: polyline
          })
        }
      })
  } else {
    //console.log("google maps not loaded")
  }
}