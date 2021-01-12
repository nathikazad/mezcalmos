import firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/functions';
import 'firebase/database';

const firebaseConfig = {
  apiKey: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
  authDomain: "mezcalmos-31f1c.firebaseapp.com",
  projectId: "mezcalmos-31f1c",
  storageBucket: "mezcalmos-31f1c.appspot.com",
  messagingSenderId: "804036698204",
  appId: "1:804036698204:web:39b22436cbb4ef633f8699"
};

if (process.env.VUE_APP_TEST_DB == "true") {
  firebaseConfig.databaseURL = "https://mezcalmos-test.firebaseio.com"
} else { // for emulator and production
  firebaseConfig.databaseURL = "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
}
firebase.initializeApp(firebaseConfig);

if (process.env.VUE_APP_EMULATE == "true") {
  firebase.functions().useEmulator("localhost", 5001);
  firebase.auth().useEmulator('http://localhost:9099/');
  if (process.env.VUE_APP_TEST_DB !=  "true") {
    firebase.database().useEmulator("localhost", 9000);
  }
}

function firebaseInitFunction(fbCallback) {
  firebase.auth().onAuthStateChanged(fbCallback);
}

export  function cloudCall(name, payload) {
  if (process.env.VUE_APP_TEST_DB == "true") {
    payload.database = "test"
  } else {
    payload.database = "production"
  }
  return firebase.functions().httpsCallable(name)(payload)
}

export const ref = firebase.database().ref();
export const firebaseAuth = firebase.auth;
export const firebaseDatabase = firebase.database
export const firebaseInit = firebaseInitFunction