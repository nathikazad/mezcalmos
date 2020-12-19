import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from './store/store'

import  './config/firebase';

// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";


Vue.config.productionTip = false
// app.provide(DefaultApolloClient, apolloClient)


new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
