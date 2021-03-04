import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'
import locationModule from '@/shared/store/location';
import adminModule from '@/shared/store/admin'

import taxiAuthModule from './modules/taxiAuth'
import incomingOrdersModule from './modules/incomingOrders';
import pastOrdersModule from './modules/pastOrders';
import orderModule from './modules/order';
import notificationsModule from './modules/notifications'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxiAuth: taxiAuthModule,
    order: orderModule,
    incomingOrders: incomingOrdersModule,
    pastOrders: pastOrdersModule,
    messages: messagesModule,
    notifications: notificationsModule,
    location: locationModule,
    admin: adminModule
  },
  getters: {
    appName() {
      return "taxi"
    }
  }
});

export default store;