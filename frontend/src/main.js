import { createApp } from 'vue';
import App from './App.vue'
import router from './router.js'
import state from './state/state'
import { firebaseListener } from './config/firebase';
import BaseCard from './components/ui/BaseCard'
import BaseButton from './components/ui/BaseButton'
import BaseBadge from './components/ui/BaseBadge'
import BaseSpinner from './components/ui/BaseSpinner'
import BaseDialog from './components/ui/BaseDialog'

firebaseListener(authStatusChange);
const app = createApp(App)
// app.config.devtools = true
app.use(router)
app.use(state)
app.component('base-card', BaseCard)
app.component('base-button', BaseButton)
app.component('base-badge', BaseBadge)
app.component('base-spinner', BaseSpinner)
app.component('base-dialog', BaseDialog)
app.mount('#app');


function authStatusChange(user, token) {
  state.dispatch('autoSignIn', {
    userId: user.uid,
    name: user.displayName,
    email: user.email,
    photoURL: user.photoURL,
    authToken: token
  })
}