import { firebaseDatabase, firebaseFunctions } from '@/shared/config/firebase'
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
        let orders = (await firebaseDatabase().ref(`taxiDrivers/${userId}/orders/`).once('value')).val();
        context.commit('saveOrders', orders)
      },
      loadOrder(context, payload) {
        // TODO: if id not null then call unload order
        let userId = context.rootGetters.userId
        let orderId = payload.orderId
        firebaseDatabase().ref(`taxiDrivers/${userId}/orders/${orderId}`).on('value', snapshot => {
          let order = snapshot.val()
          context.commit('saveOrder', {order: order, orderId: orderId});
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
      saveOrders(state, payload){
        state.list = payload
      },
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
      list(state) {
        return state.list;
      },
      order(state) {
        return state.order;
      },
      orderId(state) {
        return state.orderId;
      },
      hasOrders(state) {
        return state.list && Object.keys(state.list).length > 0
      }
    }
  };