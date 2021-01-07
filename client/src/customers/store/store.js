import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'

import taxisModule from './modules/taxis';
import groceriesModule from './modules/groceries'
import ordersModule from './modules/orders';

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxis: taxisModule,
    groceries: groceriesModule,
    orders: ordersModule,
    messages: messagesModule
  },
  getters: {
    appName() {
      return "customer"
    }
  }
});

export default store;