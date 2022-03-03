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
import {
  i18n
} from '@/shared/config/i18n'
import {
  registerServiceWorker
} from "../shared/config/registerServiceWorker"
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


    let tokenResult = await user.getIdTokenResult()
    console.log(tokenResult);
    let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
    if (!hasuraClaim) {
      console.log("No hasura, retrying")
      await store.dispatch("addHasuraClaims");
    }
    let hasuraAuthToken = await user.getIdToken(true)
    store.dispatch("saveHasuraToken", { hasuraAuthToken: hasuraAuthToken });

    registerServiceWorker('taxi').then(() => {
      askForNotification('taxi', store);
    });
    

    await store.dispatch('loadTaxiAuth');
    store.dispatch("notifications/loadNotificationsForTaxi");
    await store.dispatch("admin/loadAdmin");
    let dbUser = store.getters["userInfo"]
    if (!dbUser || !dbUser.displayName || !dbUser.photo) {
      router.push('/userinfo?edit=true');
    } else if (store.getters.authorizationPending) {
      router.redirectAuthorizationPendingUsers()
    } else if (store.getters.canTaxi) {
      store.dispatch("loadUserLocation");
      if (store.getters.isInTaxi) {
        router.push({
          path: `/orders/${store.getters.currentOrderId}`
        });
      } else if (router.currentRoute.query.redirect) {
        router.push({
          path: router.currentRoute.query.redirect
        })
      } else {
        router.push("/incoming")
      }
    } else if (router.currentRoute.path != "/howToTaxi") {
      router.push({
        path: "/howToTaxi"
      })
    }
  } else if (router.currentRoute.path != "/howToTaxi") {
    router.push({
      path: "/howToTaxi"
    })
  }
}

firebaseInit(firebaseCallback)

window.app = new Vue({
  render: h => h(App),
  router,
  store,
  i18n
}).$mount('#app')