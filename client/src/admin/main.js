import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from './store/store'
import vuetify from './plugins/vuetify'
import {
  initModules
} from '@/shared/config/modules'
import {
  i18n
} from '@/shared/config/i18n'
import {
  firebaseInit
} from '@/shared/config/firebase'
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
    await store.dispatch('loadAdminAuth');
    if (router.currentRoute.path == "/auth" && router.currentRoute.query.redirect) {
      router.push({
        path: router.currentRoute.query.redirect
      })
    } else if (router.currentRoute.path == "/auth") {
      router.push({
        path: "/"
      })
    }
  }
}

firebaseInit(firebaseCallback)

window.app = new Vue({
  render: h => h(App),
  router,
  store,
  vuetify,
  i18n
}).$mount('#app')