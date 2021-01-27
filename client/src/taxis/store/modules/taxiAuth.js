import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      canTaxi: false,
      isLooking: false,
      currentOrder: {id:null, value:null},
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
      setTimeout(async function(){
        let driverLocation = await getCoords();
        let locationUpdate = {position:driverLocation, lastUpdateTime:(new Date()).toUTCString()}
        firebaseDatabase().ref(`taxiDrivers/${userId}/location`).set(locationUpdate)
        if(context.state.currentOrder.id){
          let order = context.state.currentOrder.value
          firebaseDatabase().ref(`orders/taxi/${context.state.currentOrder.id}/driver/location`).update(locationUpdate)
          let origin
          if(order.status == "onTheWay"){
            origin = order.from
          } else if (order.status == "inTransit") {
            origin = order.to
          } else {
            return
          }
          
          let directionsService = new window.google.maps.DirectionsService();
          directionsService.route({
            origin:{lat: driverLocation.lat, lng: driverLocation.long},
            destination:{lat: origin.lat, lng: origin.long},
            travelMode:"DRIVING",
          },
          (response, status) => {
            if(status == "OK"){
              let distance = response.routes[0].legs[0].distance
              let duration = response.routes[0].legs[0].duration
              let eta = new Date()
              eta.setSeconds(eta.getSeconds() + duration.value);
              firebaseDatabase().ref(`orders/taxi/${context.state.currentOrder.id}/driver/location`).update({
                distanceToLocation: distance,
                timeToLocation: duration,
                estimatedArrivalTime: eta.toUTCString(),
              })
            }
          })
        }
      }, 60000);
    },
    startLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(true);
    },
    stopLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(false);
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
    }
  }
}

function storeState(newState, context) {
  if(newState.authorized){
    context.commit('saveTaxiAuth', {canTaxi: true})
  } else {
    return
  }
  if(newState.inTaxi){
    context.dispatch('incomingOrders/stopListeningForIncoming')
    firebaseDatabase().ref(`orders/taxi/${newState.inTaxi}`).once('value', snapshot => {
      context.commit('setCurrentOrder', {id:newState.inTaxi, value:snapshot.val()})
    });
  } else {
    context.commit('setCurrentOrder', {id:null,value:null})
    if(newState.isLooking) {
      context.commit('setIsLooking', true)
      context.dispatch('incomingOrders/startListeningForIncoming')
    } else {
      context.commit('setIsLooking', false)
      context.dispatch('incomingOrders/stopListeningForIncoming')
    }  
  }
}

const getCoords = async () => {
  const pos = await new Promise((resolve, reject) => {
    navigator.geolocation.getCurrentPosition(resolve, reject);
  });

  return {
    long: pos.coords.longitude,
    lat: pos.coords.latitude,
  };
};
