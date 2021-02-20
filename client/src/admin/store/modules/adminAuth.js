import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      isAuthorized: false,
    };
  },
  getters: {
    isAdmin(state) {
      return state.isAdmin;
    }
  },
  actions: {
    async loadAdminAuth(context) {
      let userId = context.rootGetters.userId
      let isAdmin = (await firebaseDatabase().ref(`admins/${userId}/authorized`).once('value')).val() != null;
      context.commit('saveIsAdmin', {
        isAdmin: isAdmin
      })
    },
    // turnOn(context) {
    //   this.dispatch('incomingOrders/startListeningForIncoming')
    //   context.commit('setStatus', {
    //     status: "looking"
    //   })
    // },
  },
  mutations: {
    saveIsAdmin(state, payload) {
      state.isAdmin = payload.isAdmin;
    }
  }
}