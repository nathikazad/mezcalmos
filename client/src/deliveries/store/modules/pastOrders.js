import { firebaseDatabase } from '@/shared/config/firebase'
export default {
    namespaced: true,
    state() {
      return {
        list: [],
        order: null,
        orderId: null
      };
    },
    actions: {
      async loadList(context) {
        let userId = context.rootGetters.userId
        let orders = (await firebaseDatabase().ref(`deliveryDrivers/${userId}/orders/`).once('value')).val();
        context.commit('saveOrders', orders)
      }
    },
    mutations: {
      saveOrders(state, payload){
        state.list = payload
      }
    },
    getters: {
      hasOrders(state) {
        return state.list && Object.keys(state.list).length > 0
      },
      list(state) {
        return state.list;
      } 
    }
  };