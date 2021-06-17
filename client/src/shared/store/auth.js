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
      language: getBrowserLanguage(),
      inviteCode: "none"
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
    },
    phoneNumber(state){
      return state.phoneNumber
    },
    inviteCodeAlreadySet(state) {
      return state.inviteCode != null
    }
  },
  actions: {
    async login() {
      var provider = new firebaseAuth.FacebookAuthProvider();
      await firebaseAuth().signInWithPopup(provider);
    },
    async sendOTPForLogin(context, payload) {
      let resp = await cloudCall('sendOTPForLogin', { 
        phoneNumber: payload.phoneNumber, 
        messageType: payload.messageType,
        language: context.state.language,
        apiKey: payload.apiKey });
      console.log(resp)
      if(resp.data.status == "Success") {
        context.commit('savePhoneNumber', payload)
      } else {
        console.log(resp.data)
      }
      
     return resp.data
    },
    async signInUsingOTP(context, payload) {
      let resp = await cloudCall('getAuthUsingOTP', 
      { 
        phoneNumber: context.state.phoneNumber,
        OTPCode: payload.OTPCode 
      });
     
      if(resp.data.status == "Success") {
        firebaseAuth().signInWithCustomToken(resp.data.token)
      } else {
        console.log(resp.data)
      }
      return resp.data
    },
    async autoSignIn(context, payload) {
      let snapshot = await firebaseDatabase().ref(`users/${payload.userId}/info/`).once('value');
      storeUserInfo(context, snapshot)
      firebaseDatabase().ref(`users/${payload.userId}/info/`).on('value', function (snapshot) {
        storeUserInfo(context, snapshot)
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
    },
    async editUserProfile(context, payload) {
      let response = await firebaseDatabase().ref(`users/${context.state.userId}/info`).update(payload)
      return response;
    },
    async sendOTPForNumberChange(context, payload) {
      let resp = await cloudCall('sendOTPForNumberChange', { 
        phoneNumber: payload.phoneNumber, 
        messageType: payload.messageType,
        language: context.state.language,
        apiKey: payload.apiKey });
      if(resp.data.status == "Success") {
        context.commit('savePhoneNumber', payload)
      } else {
        console.log(resp.data)
      }
      
     return resp.data
    },
    async confirmNumberChangeUsingOTP(context, payload) {
      let resp = await cloudCall('confirmNumberChangeUsingOTP', 
      { 
        phoneNumber: context.state.phoneNumber,
        OTPCode: payload.OTPCode 
      });
     
      if(resp.data.status != "Success") {
        console.log(resp.data)
      }

      return resp.data
    },
    loadInviteCode(context) {
      let userId = context.rootGetters.userId
      let nodeName
      if (context.rootGetters.appName == "customer") {
        nodeName = "users"
      } else if (context.rootGetters.appName == "taxi") {
        nodeName = "taxiDrivers"
      }

      firebaseDatabase().ref(`${nodeName}/${userId}/invite/code`).on('value', snapshot => {
        context.commit('saveInviteCode', snapshot.val())
      });
      context.commit('saveLogoutCallback', {
        func: function (context, userId, nodeName) {
          firebaseDatabase().ref(`${nodeName}/${userId}/invite/code`).off()
          context.commit('saveInviteCode', null)
        },
        args: [context, userId, nodeName]
      }, { root: true })
    },
    saveInviteCode(context, payload) {
      if(!payload)
        payload = "none"
      payload = payload.toLowerCase()
      let userId = context.rootGetters.userId
      let nodeName
      if (context.rootGetters.appName == "customer") {
        nodeName = "users"
      } else if (context.rootGetters.appName == "taxi") {
        nodeName = "taxiDrivers"
      }

      if (!userId) {
        context.commit('saveInviteCode', 'none')
      }else{
        firebaseDatabase().ref(`${nodeName}/${userId}/invite/code`).set(payload);
      }
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
    },
    saveInviteCode(state, payload) {
      state.inviteCode = payload
    }

  }
}

async function storeUserInfo(context, snapshot) {
  if (snapshot.val()) {
    context.commit('saveUserInfo', snapshot.val())
    
    let lang = snapshot.val().language
    if (lang) {
      context.commit('saveLanguage', lang)
    } else {
      context.dispatch('setLanguage', context.state.language)
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