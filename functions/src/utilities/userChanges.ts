import * as functions from "firebase-functions";
import { userInfo } from "../shared/databaseNodes/root";
import * as firebase from "firebase-admin";

// Customer Canceling
export const processSignUp = functions.auth.user().onCreate(async user => {
  if (!user.photoURL)
    user.photoURL = 'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d'

  await userInfo(user.uid).update({
    displayName: user.displayName,
    photo: user.photoURL,
    email: user.email
  });
  // await hasuraModule.setClaim(user.uid);
});

export const addName = functions.database.ref(
  '/users/{userId}/info/displayName').onCreate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.val() })
  })

export const changeName = functions.database.ref(
  '/users/{userId}/info/displayName').onUpdate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
  })

export const addPhoto = functions.database.ref(
  '/users/{userId}/info/photo').onCreate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.val() })
  })

export const changePhoto = functions.database.ref(
  '/users/{userId}/info/photo').onUpdate(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
  })
