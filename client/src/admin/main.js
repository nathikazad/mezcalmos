import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from './store/store'

import { firebaseInit } from '@/shared/config/firebase'

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
    await store.dispatch('loadAdminAuth');
    if (router.currentRoute.path == "/auth" && router.currentRoute.query.redirect) {
      router.push({ path: router.currentRoute.query.redirect })
    } else if (router.currentRoute.path == "/auth") {
      router.push({ path: "/" })
    }
    
  }
}

firebaseInit(firebaseCallback)

window.App = new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
