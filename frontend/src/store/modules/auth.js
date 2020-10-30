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
    login(_, payload) {
      firebaseAuth().signInWithEmailAndPassword(payload.email, payload.password)
    },
    signUp(_, payload) {
      firebaseAuth().createUserWithEmailAndPassword(payload.email, payload.password)
    },
    async autoSignIn(context, payload) {
      context.commit('saveAuthData', payload)
      const {data} = await apolloClient.query({ query: gql`
      query MyQuery {
          users {
            name
          }
        }
    ` })
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
