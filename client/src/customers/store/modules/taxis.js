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
      if (getDistanceFromLatLonInKm(payload.from, puertoCoords) > 50 || 
          getDistanceFromLatLonInKm(payload.to, puertoCoords) > 50) {
        let response = {
          status: "Error",
          errorMessage: "Too Far",
          i18nCode: "outOfPuerto"
        }
        console.log(response)
        return response
      }
      let from = payload.from
      let to = payload.to
      let response = await cloudCall('requestTaxi', {
        from: from,
        to: to,
        distance: payload.distance,
        duration: payload.duration
      });
      context.commit('saveTemporaryAddresses', null)
      console.log(response);

      return response;
    },
    async cancelTaxi(context, payload) {
      let status = context.state.value.status
      if (status != "lookingForTaxi" && status != "onTheWay") {
        console.log("Not possible to cancel")
        return
      }
      let response = await cloudCall('cancelTaxiFromCustomer', {
        reason: payload.reason
      })
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
    }
  }
};