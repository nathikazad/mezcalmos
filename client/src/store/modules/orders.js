import { firebaseDatabase } from '@/config/firebase'
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
        //create listener for new orders
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
        console.log(state.list)
        return state.list;
      },
      hasOrders(state) {
        return state.list && Object.keys(state.list).length > 0
      }
    }
  };