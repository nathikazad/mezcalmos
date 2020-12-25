import Vuex from 'vuex'
import Vue from 'vue'

import authModule from './modules/auth';
import taxisModule from './modules/taxis';
import groceriesModule from './modules/groceries'
import ordersModule from './modules/orders';
import messagesModule from './modules/messages'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxis: taxisModule,
    groceries: groceriesModule,
    orders: ordersModule,
    messages: messagesModule
  }
});

export default store;