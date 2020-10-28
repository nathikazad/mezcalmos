import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/functions'; 
import 'firebase/database';

const config = {
  apiKey: "AIzaSyDrzrm45K_KXvbzgtginqRLGabrgYTaWWs",
  authDomain: "vue-test-7606e.firebaseapp.com",
  databaseURL: "https://vue-test-7606e.firebaseio.com",
  projectId: "vue-test-7606e",
  storageBucket: "vue-test-7606e.appspot.com",
  messagingSenderId: "739626734679",
  appId: "1:739626734679:web:f3be7362fd031c3304ff12"
}

firebase.initializeApp(config);

export function firebaseListener(func) {
  firebase.auth().onAuthStateChanged(async function (user) {
    if (user) {
      let token = await user.getIdToken()
      let tokenResult = await user.getIdTokenResult()
      let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
      if (!hasuraClaim) {
        console.log("No hasura, retrying")
        await firebase.functions().httpsCallable('addHasuraClaims')();
        token = await user.getIdToken(true)
      }
      func(user, token)
    }
  }, function (error) {
    console.log(error)
  });
}

export const ref = firebase.database().ref();
export const firebaseAuth = firebase.auth;
export const firebaseFunctions = firebase.functions