import {
  firebaseAuth,
  firebaseDatabase,
  cloudCall
} from '@/shared/config/firebase'

import {
  i18n
} from '@/shared/config/i18n'

import {
  getBrowserLanguage
} from '@/shared/mixins/functions'

// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      userId: null,
      info: null,
      phoneNumber: null,
      hasuraAuthToken: null,
      loggedIn: false,
      logoutCallbacks: [],
      language: getBrowserLanguage()
    };
  },
  getters: {
    userId(state) {
      return state.userId;
    },
    userInfo(state) {
      return state.info
    },
    userLanguage(state) {
      return state.language
    },
    hasuraAuthToken(state) {
      return state.hasuraAuthToken;
    },
    loggedIn(state) {
      return state.loggedIn;
    }
  },
  actions: {
    async login() {
      var provider = new firebaseAuth.FacebookAuthProvider();
      await firebaseAuth().signInWithPopup(provider);
    },
    async sendOTP(context, payload) {
      let resp = await cloudCall('sendOTP', { phoneNumber: payload.phoneNumber });
      context.commit('savePhoneNumber', payload)
      console.log(resp)
    },
    async confirmOTP(context, payload) {
      let resp = await cloudCall('confirmOTP', 
      { 
        phoneNumber:context.state.phoneNumber ,
        OTPCode: payload.OTPCode 
      });
      console.log(resp)
    },
    async autoSignIn(context, payload) {
      firebaseDatabase().ref(`users/${payload.userId}/info/`).on('value', function (snapshot) {
        context.commit('saveUserInfo', snapshot.val())
        let lang = snapshot.val().language
        if (lang) {
          context.commit('saveLanguage', lang)
        } else {
          context.dispatch('setLanguage', context.state.language)
        }
      })
      context.commit('saveAuthData', payload)
    },
    async logout(context) {
      firebaseDatabase().ref(`users/${context.state.userId}/info/`).off()
      context.state.logoutCallbacks.forEach(cb => cb.func(...cb.args));
      context.commit('clearData')
      await firebaseAuth().signOut()
    },
    setLanguage(context, payload) {
      if (context.state.userId) {
        firebaseDatabase().ref(`users/${context.state.userId}/info/language`).set(payload)
      }
      context.commit('saveLanguage', payload)
    },
    saveLogoutCallback(context, payload) {
      //console.log(payload.args)
      context.commit('saveLogoutCallback', payload)
    }
  },
  mutations: {
    saveAuthData(state, payload) {
      state.userId = payload.userId;
      state.hasuraAuthToken = payload.hasuraAuthToken;
      state.loggedIn = payload.loggedIn;
    },
    saveUserInfo(state, payload) {
      state.info = payload
    },
    clearData(state) {
      state.userId = null;
      state.hasuraAuthToken = null;
      state.loggedIn = false;
      state.info = null
      state.logoutCallbacks = []
    },
    saveLogoutCallback(state, payload) {
      state.logoutCallbacks.push(payload)
    },
    saveLanguage(state, payload) {
      state.language = payload
      i18n.locale = payload
    },
    savePhoneNumber(state, payload) {
      state.phoneNumber = payload.phoneNumber
    }

  }
}


// how to make hasura query
// const { data } = await apolloClient.query({
//   query: gql`
//     query MyQuery {
//         users {
//           name
//         }
//       }
//   ` })
// //console.log("hasura query");
// //console.log(data)