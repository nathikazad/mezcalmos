import { firebaseDatabase } from '@/shared/config/firebase'
export default {
    namespaced: true,
    state() {
      return {
        list: []
      };
    },
    actions: {
      async loadList(context) {
        let userId = context.rootGetters.userId
        let orders = (await firebaseDatabase().ref(`users/${userId}/orders/`).once('value')).val();
        context.commit('loadOrders', orders)
      }
    },
    mutations: {
      loadOrders(state, payload){
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