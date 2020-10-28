import { createApp } from 'vue';
import App from './App.vue'
import router from './router.js'
import state from './state/state'

import { firebaseListener } from './config/firebase';



import { InMemoryCache } from "apollo-cache-inmemory";
import ApolloClient from "apollo-client";
import { setContext } from "apollo-link-context";
import { createHttpLink } from "apollo-link-http";
import { DefaultApolloClient } from "@vue/apollo-composable";

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


// HELP: figure out a way to make this async which you can do in react
const authLink = setContext((_, { headers }) => {
  //   const token = localStorage.getItem("token");
  return {
    headers: {
      ...headers,
      //   authorization: token ? `Bearer ${token}` : "",
    },
  };
});

const httpLink = createHttpLink({
  uri: `https://graphql.anilist.co/`,
});

const cache = new InMemoryCache();

// Create the apollo client
const apolloClient = new ApolloClient({
  link: authLink.concat(httpLink),
  cache,
});

app.provide(DefaultApolloClient, apolloClient)


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