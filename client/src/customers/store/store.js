import Vuex from 'vuex'
import Vue from 'vue'

import { firebaseDatabase } from '@/shared/config/firebase'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'
import adminModule from '@/shared/store/admin'
import locationModule from '@/shared/store/location';
import loggerModule from '@/shared/store/logger';

import taxisModule from './modules/taxis';
import groceriesModule from './modules/groceries'
import ordersModule from './modules/orders';
import savedLocationsModule from './modules/savedLocations';
import notificationsModule from './modules/notifications'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxis: taxisModule,
    location: locationModule,
    groceries: groceriesModule,
    orders: ordersModule,
    messages: messagesModule,
    savedLocations: savedLocationsModule,
    notifications: notificationsModule,
    admin: adminModule,
    logger: loggerModule
  },
  getters: {
    appName() {
      return "customer"
    },
    currentOrderId(state) {
      return state.currentOrderId
    }
  },
  state() {
    return {
      currentOrderId: null,
    };
  },
  actions: {
    async loadCurrentOrder(context) {
      let userId = context.rootGetters.userId
      let snapshot = await firebaseDatabase().ref(`users/${userId}/state/currentOrder`).once('value')
      context.commit('saveCurrentOrderId', snapshot.val())
      firebaseDatabase().ref(`users/${userId}/state/currentOrder`).off()
      firebaseDatabase().ref(`users/${userId}/state/currentOrder`).on('value', snapshot => {
        context.commit('saveCurrentOrderId', snapshot.val())
      });

      context.commit('saveLogoutCallback', {
        func: function (context, userId) {
          firebaseDatabase().ref(`users/${userId}/state/currentOrder`).off()
          context.commit('saveCurrentOrderId', null)
        },
        args: [context, userId]
      }, { root: true })
    },
  },
  mutations: {
    saveCurrentOrderId(state, payload) {
      state.currentOrderId = payload;
    },
  }
});


export default store;