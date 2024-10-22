import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';

import adminAuthModule from './modules/adminAuth'
import ordersModule from './modules/orders';
import customersModule from './modules/customers';
import taxisModule from './modules/taxis';
import messagesModule from './modules/messages';


Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    adminAuth: adminAuthModule,
    orders: ordersModule,
    messages: messagesModule,
    customers: customersModule,
    taxis: taxisModule
  },
  getters: {
    appName() {
      return "admin"
    }
  }
});

export default store;