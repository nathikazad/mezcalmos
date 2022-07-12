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
 

// This fires everytime `/users/{userId}/info/deleted` gets changed, resulting on
// either Disabling/Enabling the fireAuthUser depending on deleted value.
export const onDeleteUpdate = functions.database.ref(
  '/users/{userId}/info/deleted').onWrite(async (snap, context) => {
    const isDisabled = snap.after.val() === true;
    await firebase.auth().updateUser(context.params.userId, { disabled : isDisabled })
  })

export const onNameUpdate = functions.database.ref(
  '/users/{userId}/info/name').onWrite(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
  })

export const onPhotoUpdate = functions.database.ref(
  '/users/{userId}/info/image').onWrite(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
  })
