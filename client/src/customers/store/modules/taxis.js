import {
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'

import {
  getDistanceFromLatLonInKm,
  puertoCoords,
  inRichPeopleCoords
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
        getDistanceFromLatLonInKm(payload.to, puertoCoords) > 200) {

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
        to: payload.to,
        distance: payload.distance,
        duration: payload.duration,
        estimatedPrice: payload.estimatedPrice,
        paymentType: "cash",
        polyline: payload.polyline
      })).data;
      if (response.status == "Error") {
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
      let response = (await cloudCall('cancelTaxiFromCustomer', {
        reason: payload.reason
      })).data
      if (response.status == "Error") {
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
      return async function (distance, locations) {
        let pricePolicy = (await firebaseDatabase().ref(`pricePolicy`).once('value')).val();
        distance = parseFloat(distance);
        let perKmCost = (pricePolicy && pricePolicy.perKmCost) ? parseInt(pricePolicy.perKmCost) : 0;
        if (inRichPeopleCoords(locations.from, locations.to))
          perKmCost = pricePolicy.perKmCostRichPeople
        let minimumCost = (pricePolicy && pricePolicy.minimumCost) ? parseInt(pricePolicy.minimumCost) : 0
        let estimate = parseInt(distance * perKmCost)
        return estimate > minimumCost ? estimate : minimumCost;
      }
    }
  }
};