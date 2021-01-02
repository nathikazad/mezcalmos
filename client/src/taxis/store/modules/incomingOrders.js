import { firebaseDatabase } from '@/shared/config/firebase'
export default {
    namespaced: true,
    state() {
      return {
        list: []
      };
    },
    actions: {
      async startListeningForIncoming(context) {
        await firebaseDatabase().ref(`openOrders/taxi`).off();
        firebaseDatabase().ref(`openOrders/taxi`).on('value', snapshot => {
          let orders = snapshot.val()
          context.commit('saveIncoming', orders)
        });
        // TODO: sort orders by distance
      },
      stopListeningForIncoming() {
        firebaseDatabase().ref(`openOrders/taxi`).off();
      }
    },
    mutations: {
      saveIncoming(state, payload){
        state.list = payload
      }
    },
    getters: {
      list(state) {
        return state.list;
      },
      hasOrders(state) {
        return state.list && Object.keys(state.list).length > 0
      }
    }
  };