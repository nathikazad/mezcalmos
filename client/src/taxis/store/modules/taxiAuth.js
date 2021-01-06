import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      canTaxi: false,
      status: "off" //other possible status "looking" or "inTaxi",
    };
  },
  getters: {
    canTaxi(state) {
      return state.canTaxi;
    },
    isLooking(state) {
      return state.status == "looking";
    },
    isInTaxi(state) {
      return state.status == "inTaxi";
    },
    isOff(state) {
      return state.status == "off";
    }
  },
  actions: {
    async loadTaxiAuth(context) {
      let userId = context.rootGetters.userId
      console.log(userId)
      let canTaxi = (await firebaseDatabase().ref(`taxiDrivers/${userId}/authorized`).once('value')).val() != null;
      context.commit('saveTaxiAuth', {
        canTaxi: canTaxi
      })
    },
    turnOn(context) {
      this.dispatch('incomingOrders/startListeningForIncoming')
      context.commit('setStatus', {
        status: "looking"
      })
    },
    turnOff(context) {
      this.dispatch('incomingOrders/stopListeningForIncoming')
      context.commit('setStatus', {
        status: "off"
      })
    },
    setToInTaxi(context) {
      this.dispatch('incomingOrders/stopListeningForIncoming')
      context.commit('setStatus', {
        status: "inTaxi"
      })
    },
  },
  mutations: {
    saveTaxiAuth(state, payload) {
      state.canTaxi = payload.canTaxi;
    },
    setStatus(state, payload) {
      state.status = payload.status;
    }
  }
}