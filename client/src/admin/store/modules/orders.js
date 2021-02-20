// import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      // canDeliver: false,
      
    };
  },
  getters: {
    // canDeliver(state) {
    //   return state.canDeliver;
    // }
  },
  actions: {
    // async loadDriverAuth(context) {
    //   let userId = context.rootGetters.userId
    //   let canDeliver = (await firebaseDatabase().ref(`deliveryDrivers/${userId}/authorized`).once('value')).val() != null;
    //   context.commit('saveDriverAuth', {
    //     canDeliver: canDeliver
    //   })
    // },
    // turnOn(context) {
    //   this.dispatch('incomingOrders/startListeningForIncoming')
    //   context.commit('setStatus', {
    //     status: "looking"
    //   })
    // },
  },
  mutations: {
    // saveDriverAuth(state, payload) {
    //   state.canDeliver = payload.canDeliver;
    // }
  }
}