import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from './store/store'
import {
  firebaseInit
} from "@/shared/config/firebase";
import {
  initModules
} from '@/shared/config/modules'
import {
  askForNotification
} from '@/shared/mixins/functions'
import "./registerServiceWorker";

//init modules
initModules(Vue)
Vue.config.productionTip = false

async function firebaseCallback(user) {
  if (user) {
    await store.dispatch('autoSignIn', {
      userId: user.uid,
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      loggedIn: true
    })
    await store.dispatch('loadTaxiAuth');
    if (router.currentRoute.path == "/auth") {
      if (router.currentRoute.query.redirect) {
        if (router.currentRoute.query.redirect == "/incoming" &&
          store.getters.isInTaxi) {
          router.push({
            path: `/orders/${store.getters.currentOrderId}`
          });
        } else {
          router.push({
            path: router.currentRoute.query.redirect
          })
        }
      } else {
        router.push({
          path: "/"
        })
      }
    }
    store.dispatch("notifications/loadNotificationsForTaxi");
    askForNotification('taxi',store)
  }
}

firebaseInit(firebaseCallback)

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')