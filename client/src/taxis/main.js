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
import {
  i18n
} from '@/shared/config/i18n'
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
    store.dispatch("notifications/loadNotificationsForTaxi");
    await store.dispatch('loadTaxiAuth');
    askForNotification('taxi', store);
    store.dispatch("admin/loadAdmin");
    
    if(!store.getters.canTaxi) {
      if(router.currentRoute.path != "/howToTaxi"){
        router.push({ path: "/howToTaxi" })
      }
    } else {
      store.dispatch("loadUserLocation");
      if (router.currentRoute.path == "/auth") {
        if (router.currentRoute.query.redirect) {
          if (router.currentRoute.query.redirect == "/incoming" &&
            store.getters.isInTaxi) {
            router.push({ path: `/orders/${store.getters.currentOrderId}` });
          } else {
            router.push({ path: router.currentRoute.query.redirect })
          }
        } else {
          router.push("/incoming")
        }
      } else {
        router.push("/incoming")
      }
    }
  } else if (router.currentRoute.path != "/howToTaxi") {
    router.push({ path: "/howToTaxi" })
  }
}

firebaseInit(firebaseCallback)

window.app = new Vue({
  render: h => h(App),
  router,
  store,
  i18n
}).$mount('#app')