import Vue from "vue";
import App from "./App.vue";
import router from "./router.js";
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
  registerServiceWorker
} from "../shared/config/registerServiceWorker"
import {
  i18n
} from '@/shared/config/i18n'
//init modules
initModules(Vue)
//Firebase state changed function
async function firebaseCallback(user) {

  if (user) {
    await store.dispatch("autoSignIn", {
      userId: user.uid,
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      loggedIn: true,
    });

    let tokenResult = await user.getIdTokenResult()
    let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
    if (!hasuraClaim) {
      console.log("No hasura, retrying")
      await store.dispatch("addHasuraClaims");
    }
    let hasuraAuthToken = await user.getIdToken(true)
    store.dispatch("saveHasuraToken", { hasuraAuthToken: hasuraAuthToken });



    registerServiceWorker('customer').then(() => {
      askForNotification('customer', store);
    });
    store.dispatch("notifications/loadNotificationsForCustomer");
    store.dispatch("savedLocations/loadLocations");
    store.dispatch("admin/loadAdmin");
    await store.dispatch('loadCurrentOrder');
    let dbUser = store.getters["userInfo"]
    if (!dbUser || !dbUser.displayName || !dbUser.photo) {
      router.push('/userinfo?edit=true');
    } else if (router.currentRoute.path == "/auth" &&
      router.currentRoute.query.redirect) {
      router.push({ path: router.currentRoute.query.redirect });
    } else if (store.getters.currentOrderId) {
      router.push({ path: `/services/taxi/${store.getters.currentOrderId}` });
    } else if (router.currentRoute.path == "/auth" || router.currentRoute.path == "/validation") {
      router.push({ path: "/" });
    }
  }
}

firebaseInit(firebaseCallback);

Vue.config.productionTip = false;

window.app = new Vue({
  render: (h) => h(App),
  router,
  store,
  i18n
}).$mount("#app");

// HASURA STUFF
// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";
// app.provide(DefaultApolloClient, apolloClient)
// let token = await user.getIdToken()
// let tokenResult = await user.getIdTokenResult()
// let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
// if (!hasuraClaim) {
//   //console.log("No hasura, retrying")
//   await firebase.functions().httpsCallable('addHasuraClaims')();
//   token = await user.getIdToken(true)
// }
// //console.log(token);