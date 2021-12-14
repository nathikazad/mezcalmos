import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
import { setUserInfo } from "../shared/controllers/rootController";


// Customer Canceling
export const processSignUp = functions.auth.user().onCreate(async user => {
  if (!user.photoURL)
    user.photoURL = 'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d'

  await setUserInfo(user.uid, {
    name: user.displayName,
    id: user.uid,
    image: user.photoURL,
    email: user.email,
  })
  // await hasuraModule.setClaim(user.uid);
});

export const addName = functions.database.ref(
  '/users/{userId}/info/name').onCreate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.val() })
  })

export const changeName = functions.database.ref(
  '/users/{userId}/info/name').onUpdate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
  })

export const addPhoto = functions.database.ref(
  '/users/{userId}/info/image').onCreate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.val() })
  })

export const changePhoto = functions.database.ref(
  '/users/{userId}/info/image').onUpdate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
  })
