import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'

import taxiAuthModule from './modules/taxiAuth'
import incomingOrdersModule from './modules/incomingOrders';
import ordersModule from './modules/orders';

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxiAuth: taxiAuthModule,
    orders: ordersModule,
    incomingOrders: incomingOrdersModule,
    messages: messagesModule
  }
});

export default store;