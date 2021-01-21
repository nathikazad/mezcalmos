import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      canTaxi: false,
      isLooking: false,
      currentTaxi: null
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
      return state.currentTaxi != null;
    },
    currentTaxi(state) {
      return state.currentTaxi
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
    },
    startLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(true);
    },
    stopLooking(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`taxiDrivers/${userId}/state/isLooking`).set(false);
    },
  },
  mutations: {
    saveTaxiAuth(state, payload) {
      state.canTaxi = payload.canTaxi;
    },
    setTaxi(state, payload) {
      state.currentTaxi = payload;
    },
    setIsLooking(state, payload) {
      state.isLooking = payload;
    }
  }
}

function storeState(state, context) {
  if(state.authorized){
    context.commit('saveTaxiAuth', {canTaxi: true})
  } else {
    return
  }
  if(state.inTaxi){
    context.commit('setTaxi', state.inTaxi)
    context.dispatch('incomingOrders/stopListeningForIncoming')
  } else {
    context.commit('setTaxi', null)
    if(state.isLooking) {
      context.commit('setIsLooking', true)
      context.dispatch('incomingOrders/startListeningForIncoming')
    } else {
      context.commit('setIsLooking', false)
      console.log("stop listening")
      context.dispatch('incomingOrders/stopListeningForIncoming')
    }  
  }
  
  
}