import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/functions';
import 'firebase/database';
import 'firebase/storage';

const firebaseConfig = {
  apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
  authDomain: "mezcalmos-31f1c.firebaseapp.com",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com",
  projectId: "mezcalmos-31f1c",
  storageBucket: "mezcalmos-31f1c.appspot.com",
  messagingSenderId: "804036698204",
  appId: "1:804036698204:web:39b22436cbb4ef633f8699"
};

if (process.env.VUE_APP_EMULATOR && process.env.VUE_APP_EMULATOR == "true") {
  firebaseConfig.databaseURL = "https://mezcalmos-test.firebaseio.com"
}

firebase.initializeApp(firebaseConfig);

function firebaseInitFunction(fbCallback) {
  console.log(process.env)
  // TODO: detect if being served or deployed and add conditionally
  if (process.env.VUE_APP_EMULATOR && process.env.VUE_APP_EMULATOR == "true") {
    firebase.functions().useEmulator("localhost", 5001);
  }
  firebase.auth().onAuthStateChanged(fbCallback);
}

export const ref = firebase.database().ref();
export const firebaseAuth = firebase.auth;
export const firebaseFunctions = firebase.functions
export const firebaseDatabase = firebase.database
export const firebaseStorage = firebase.storage
export const firebaseInit = firebaseInitFunction