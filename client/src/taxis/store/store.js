import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'

import taxiAuthModule from './modules/taxiAuth'
import incomingOrdersModule from './modules/incomingOrders';
import pastOrdersModule from './modules/pastOrders';
import orderModule from './modules/order';


Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxiAuth: taxiAuthModule,
    order: orderModule,
    incomingOrders: incomingOrdersModule,
    pastOrders: pastOrdersModule,
    messages: messagesModule
  },
  getters: {
    appName() {
      return "taxi"
    }
  }
});

export default store;