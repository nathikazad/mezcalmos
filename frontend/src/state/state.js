import { createStore } from 'vuex';

import coachModule from './modules/coach';
import requestsModule from './modules/requests';
import authModule from './modules/auth'

const store = createStore({
  modules: {
    coaches: coachModule,
    requests: requestsModule,
    auth: authModule
  }
});

export default store;