import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/functions';
import 'firebase/database';
import store from '../store/store'
import router from '../router';

const firebaseConfig = {
  apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
  authDomain: "mezcalmos-31f1c.firebaseapp.com",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  projectId: "mezcalmos-31f1c",
  storageBucket: "mezcalmos-31f1c.appspot.com",
  messagingSenderId: "804036698204",
  appId: "1:804036698204:web:39b22436cbb4ef633f8699"
};

firebase.initializeApp(firebaseConfig);
firebase.functions().useEmulator("localhost", 5000);

firebase.auth().onAuthStateChanged(async function (user) {
    if (user) {
      // let token = await user.getIdToken()
      // let tokenResult = await user.getIdTokenResult()
      // let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
      // if (!hasuraClaim) {
      //   console.log("No hasura, retrying")
      //   await firebase.functions().httpsCallable('addHasuraClaims')();
      //   token = await user.getIdToken(true)
      // }
      // console.log(token);

      await store.dispatch('autoSignIn', {
        userId: user.uid,
        name: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
        loggedIn: true
        // hasuraAuthToken: token
      })
      if (router.currentRoute.path == "/auth") {
        router.push({
          path: router.currentRoute.query.redirect
        })
      }
    }
  },
  function (error) {
    console.log(error)
  });


export const ref = firebase.database().ref();
export const firebaseAuth = firebase.auth;
export const firebaseFunctions = firebase.functions
export const firebaseDatabase = firebase.database