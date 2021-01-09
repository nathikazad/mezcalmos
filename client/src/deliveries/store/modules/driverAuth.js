import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      canDeliver: false,
      status: "off" //other possible status "looking" or "inDelivery",
    };
  },
  getters: {
    canDeliver(state) {
      return state.canDeliver;
    },
    isLooking(state) {
      return state.status == "looking";
    },
    isInDelivery(state) {
      return state.status == "inDelivery";
    },
    isOff(state) {
      return state.status == "off";
    }
  },
  actions: {
    async loadDriverAuth(context) {
      let userId = context.rootGetters.userId
      console.log(userId)
      let canDeliver = (await firebaseDatabase().ref(`deliveryDrivers/${userId}/authorized`).once('value')).val() != null;
      console.log("can deliver "+canDeliver)
      context.commit('saveDriverAuth', {
        canDeliver: canDeliver
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
    saveDriverAuth(state, payload) {
      state.canDeliver = payload.canDeliver;
    },
    setStatus(state, payload) {
      state.status = payload.status;
    }
  }
}