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
    },
    inviteCodeAlreadySet(state) {
      return state.inviteCode != null
    }
  },
  state() {
    return {
      currentOrderId: null,
      inviteCode: "none"
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
    loadInviteCode(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`users/${userId}/invite/code`).on('value', snapshot => {
        context.commit('saveInviteCode', snapshot.val())
      });
      context.commit('saveLogoutCallback', {
        func: function (context, userId) {
          firebaseDatabase().ref(`users/${userId}/invite/code`).off()
          context.commit('saveInviteCode', null)
        },
        args: [context, userId]
      }, { root: true })
    },
    saveInviteCode(context, payload) {
      if(!payload)
        payload = "none"
      let userId = context.rootGetters.userId
      if (!userId) {
        context.commit('saveInviteCode', 'none')
      }else{
        firebaseDatabase().ref(`users/${userId}/invite/code`).set(payload);
      }
    }
  },
  mutations: {
    saveCurrentOrderId(state, payload) {
      state.currentOrderId = payload;
    },
    saveInviteCode(state, payload) {
      state.inviteCode = payload
    }
  }
});


export default store;