import { createStore } from 'vuex';

import authModule from './modules/auth';
import taxisModule from './modules/taxis';
import groceriesModule from './modules/groceries'
import ordersModule from './modules/orders';
import messagesModule from './modules/messages'

const store = createStore({
  modules: {
    auth: authModule,
    taxis: taxisModule,
    groceries: groceriesModule,
    orders: ordersModule,
    messages: messagesModule
  }
});

export default store;