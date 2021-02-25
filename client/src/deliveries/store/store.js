import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'

import driverAuthModule from './modules/driverAuth'
import incomingOrdersModule from './modules/incomingOrders';
import pastOrdersModule from './modules/pastOrders';
import orderModule from './modules/grocery';


Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    driverAuth: driverAuthModule,
    order: orderModule,
    incomingOrders: incomingOrdersModule,
    pastOrders: pastOrdersModule,
    messages: messagesModule
  },
  getters: {
    appName() {
      return "delivery"
    }
  }
});

export default store;