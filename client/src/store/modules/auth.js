import { firebaseAuth } from '@/config/firebase'
import { apolloClient } from '@/config/apollo'
import gql from 'graphql-tag'
export default {
  state() {
    return {
      userId: null,
      name: null,
      email: null,
      photoURL: null,
      authToken: null
    };
  },
  getters: {
    userId(state) {
      return state.userId;
    },
    authToken(state) {
      return state.authToken;
    },
    loggedIn(state) {
      return !!state.authToken;
    }
  },
  actions: {
    login() {
      var provider = new firebaseAuth.FacebookAuthProvider();
      // provider.setCustomParameters({
      //   'display': 'popup'
      // });
      firebaseAuth().signInWithPopup(provider);
    },
    async autoSignIn(context, payload) {
      context.commit('saveAuthData', payload)
      console.log("save auth data");
      const { data } = await apolloClient.query({
        query: gql`
          query MyQuery {
              users {
                name
              }
            }
        ` })
      console.log("hasura query");
      console.log(data)

    },
    async logout(context) {
      await firebaseAuth().signOut()
      context.commit('saveAuthData', {
        userId: null,
        name: null,
        email: null,
        photoURL: null,
        authToken: null
      })
    }
  },
  mutations: {
    async saveAuthData(state, payload) {
      state.userId = payload.userId;
      state.authToken = payload.authToken;
      state.name = payload.name;
      state.email = payload.email;
      state.photoUrl = payload.photoURL
    }
  }
}
