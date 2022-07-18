import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
import { setUserInfo } from "../shared/controllers/rootController";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";


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
 

export const deleteAccount = functions.https.onCall(async (data , context) => {
  let response = await isSignedIn(context.auth);
  if (response != undefined) {
    return response;
  }
  await firebase.auth().updateUser(context.auth!.uid!, { disabled: true });
  return {status: ServerResponseStatus.Success}
});
 

export const onNameUpdate = functions.database.ref(
  '/users/{userId}/info/name').onWrite(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { displayName: snap.after.val() })
  })

export const onPhotoUpdate = functions.database.ref(
  '/users/{userId}/info/image').onWrite(async (snap, context) => {
    await firebase.auth().updateUser(context.params.userId, { photoURL: snap.after.val() })
  })
  