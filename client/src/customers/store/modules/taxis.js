import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'

import {
  getDistanceFromLatLonInKm,
  puertoCoords
} from '@/shared/mixins/mapFunctions'

export default {
  namespaced: true,
  state() {
    return {
      value: null,
      orderId: null,
      temporaryAddresseses: null
    };
  },
  actions: {
    loadTaxi(context, payload) {
      let orderId = context.state.orderId
      if (orderId) {
        if (orderId == payload.orderId) {
          return
        } else {
          firebaseDatabase().ref(`/orders/taxi/${orderId}`).off()
          context.commit('unloadTaxi')
        }
      }
      orderId = payload.orderId;
      firebaseDatabase().ref(`/orders/taxi/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('loadTaxi', {
          order: order,
          orderId: orderId
        })
      });
    },
    async requestTaxi(context, payload) {
      console.log(payload)
      if (getDistanceFromLatLonInKm(payload.from, puertoCoords) > 50 ||
        getDistanceFromLatLonInKm(payload.to, puertoCoords) > 50) {

        return {
          data: {
            status: "Error",
            errorMessage: "Too Far",
            i18nCode: "outOfPuerto"
          }
        }

      }

      let response = (await cloudCall('requestTaxi', {
        from: payload.from,
        to: payload.from,
        distance: payload.distance,
        duration: payload.duration,
        estimatedPrice: payload.estimatedPrice
      })).data;
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      context.commit('saveTemporaryAddresses', null)

      return response;
    },
    async cancelTaxi(context, payload) {
      let status = context.state.value.status
      if (status != "lookingForTaxi" && status != "onTheWay" && status != "inTransit") {
        console.log("Not possible to cancel")
        return
      }
      let response = (await cloudCall('cancelTaxiFromCustomer', { reason: payload.reason})).data
      if(response.status == "Error") {
        console.log(response.errorMessage)
      }
      return response
    },
    saveAddress(context, payload) {
      context.commit('saveTemporaryAddresses', payload)
    }
  },
  mutations: {
    loadTaxi(state, payload) {
      state.value = payload.order
      state.orderId = payload.orderId
    },
    unloadTaxi(state) {
      state.value = null
      state.orderId = null
    },
    saveTemporaryAddresses(state, payload) {
      state.temporaryAddresseses = payload
    }
  },
  getters: {
    value(state) {
      return state.value;
    },
    temporaryAddresses(state) {
      return state.temporaryAddresseses
    },
    estimatePrice() {
      return async function (distance) {
        let pricePolicy = (await firebaseDatabase().ref(`pricePolicy`).once('value')).val();
        distance = parseInt(distance);
        let perKmCost = parseInt(pricePolicy.perKmCost)
        let minimumCost = parseInt(pricePolicy.minimumCost)
        let estimate = distance * perKmCost
        return estimate > minimumCost ? estimate : minimumCost;
      }
    }
  }
};