import Vue from "vue";
import App from "./App.vue";
import router from "./router.js";
import store from './store/store'
import {
  firebaseInit
} from "@/shared/config/firebase";
import "./registerServiceWorker";
import {
  initModules
} from '@/shared/config/modules'

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
      // hasuraAuthToken: token
    });
    if (
      router.currentRoute.path == "/auth" &&
      router.currentRoute.query.redirect
    ) {
      router.push({
        path: router.currentRoute.query.redirect
      });
    } else if (router.currentRoute.path == "/auth") {
      router.push({
        path: "/"
      });
    }
    store.dispatch("notifications/loadNotificationsForCustomer");
    const channel = new BroadcastChannel("sw-messages");
    channel.postMessage({
      msg: "getSubscription"
    });
    channel.addEventListener("message", event => {
      console.log("Received", JSON.parse(event.data.subscription));
      store.dispatch("notifications/saveUserNotificationInfo", JSON.parse(event.data.subscription));
    });
  }
}

firebaseInit(firebaseCallback);

Vue.config.productionTip = false;

new Vue({
  render: (h) => h(App),
  router,
  store,
}).$mount("#app");

// HASURA STUFF
// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";
// app.provide(DefaultApolloClient, apolloClient)
// let token = await user.getIdToken()
// let tokenResult = await user.getIdTokenResult()
// let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
// if (!hasuraClaim) {
//   console.log("No hasura, retrying")
//   await firebase.functions().httpsCallable('addHasuraClaims')();
//   token = await user.getIdToken(true)
// }
// console.log(token);