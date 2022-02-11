import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/functions';
import 'firebase/database';
import 'firebase/storage'

let firebaseConfig;

firebaseConfig = {
  apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
  authDomain: "mezcalmos-31f1c.firebaseapp.com",
  projectId: "mezcalmos-31f1c",
  storageBucket: "mezcalmos-31f1c.appspot.com",
  messagingSenderId: "804036698204",
  appId: "1:804036698204:web:39b22436cbb4ef633f8699",
  databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
};

if (process.env.VUE_APP_STAGING == "true") {
  firebaseConfig = {
    apiKey: "AIzaSyCtfKpbY31pO4DrB9k4oZzYRdzaymsjX9I",
    authDomain: "mezcalmos-staging.firebaseapp.com",
    databaseURL: "https://mezcalmos-staging-default-rtdb.firebaseio.com",
    projectId: "mezcalmos-staging",
    storageBucket: "mezcalmos-staging.appspot.com",
    messagingSenderId: "606383265109",
    appId: "1:606383265109:web:8f8e0fbf4bc91853d8cbdc"
  };
}

firebase.initializeApp(firebaseConfig);

if (process.env.VUE_APP_EMULATE == "true") {
  firebase.functions().useEmulator("localhost", 5001);
  firebase.auth().useEmulator('http://localhost:9099/');
  firebase.database().useEmulator("localhost", 9000);
} else if (process.env.VUE_APP_EMULATE_ONLY_FUNCTIONS == "true") {
  firebase.functions().useEmulator("localhost", 5001);
}

function firebaseInitFunction(fbCallback) {
  firebase.auth().onAuthStateChanged(fbCallback);
}

export  function cloudCall(name, payload) {
  if(!payload) {
    payload = {}
  }

  payload.database = "production"
  return firebase.functions().httpsCallable(name)(payload)
}

export const ref = firebase.database().ref();
export const firebaseAuth = firebase.auth;
export const firebaseDatabase = firebase.database
export const firebaseStorage = firebase.storage
export const firebaseInit = firebaseInitFunction