// for viewing new and old orders as well as finding all past orders
import { firebaseDatabase, firebaseFunctions } from '@/shared/config/firebase'
export default {
    namespaced: true,
    state() {
      return {
        order: null,
        orderId: null
      };
    },
    actions: {
      loadOrder(context, payload) {
        // TODO: if id not null then call unload order
        if(context.getters.orderId != null) {
          context.dispatch('unloadOrder')
        }
        let orderId = payload.orderId
        firebaseDatabase().ref(`orders/${orderId}`).on('value', snapshot => {
          let order = snapshot.val()
          context.commit('saveOrder', {order: order, orderId: orderId});
          // TODO: if order status changes from isLooking to onTheWay and the driverId is not current driver then exit gracefully.
        });
        // TODO: gracefully handle error read
      },
      unloadOrder(context) {
        let userId = context.rootGetters.userId
        let orderId = context.state.orderId
        // TODO: check if order is loaded
        firebaseDatabase().ref(`taxiDrivers/${userId}/orders/${orderId}`).off()
        context.commit('unloadOrder')
      },
      async acceptOrder(context) {
        // TODO: check if order is loaded
        let orderId = context.state.orderId
        let response = await firebaseFunctions().httpsCallable('acceptOrder')({ orderId: orderId });
        return response;
      },
      async finishOrder(context) {
        // TODO: check if order is loaded
        let orderId = context.state.orderId
        let response = await firebaseFunctions().httpsCallable('finishOrder')({ orderId: orderId });
        return response;
      }
    },
    mutations: {
      saveOrder(state, payload){
        state.order = payload.order
        state.orderId = payload.orderId
      },
      unloadOrder(state) {
        state.order = null
        state.orderId = null
      }
    },
    getters: {
      isLoaded(state) {
        return state.order != null
      },
      getOrder(state) {
        return state.order;
      },
      orderId(state) {
        return state.orderId;
      },
      
    }
  };