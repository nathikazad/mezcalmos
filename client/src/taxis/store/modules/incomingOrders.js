import {
  firebaseDatabase
} from '@/shared/config/firebase'
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
      let driverLocation = await getCoords();
      console.log(driverLocation)
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

function getDistanceFromLatLonInKm(from, to) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(from.lat - to.lat); // deg2rad below
  var dLon = deg2rad(from.long - to.long);
  var a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(deg2rad(from.lat)) * Math.cos(deg2rad(to.lat)) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c; // Distance in km
  return parseInt(d);
}

function deg2rad(deg) {
  return deg * (Math.PI / 180)
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