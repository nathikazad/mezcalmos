import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
// import { setUserInfo } from "../shared/controllers/rootController";
// import { isSignedIn } from "../shared/helper/authorizer";
// import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "./hasura";

// Customer Canceling
export const processSignUp = functions.auth.user().onCreate(async user => {
  let chain = getHasura();
  await chain.mutation({
    insert_user_one: [
      {
        object: {
          name: user.displayName,
          image: user.photoURL,
          firebase_id: user.uid,
        }
      }, {
        id: true
      }
    ]
  })
  await addHasuraClaim(user.uid);
});

// export async function deleteAccount(userId: string, data: any) {

//   let response = isSignedIn(userId);
//   if (response != undefined) {
//     return response;
//   }
//   await firebase.auth().updateUser(userId, { disabled: true });
//   return { status: ServerResponseStatus.Success }
// };



export async function addHasuraClaim(uid: string | undefined) {
  try {
    console.log("[+] User Id ===> ",uid);
    functions.logger.info("[+] User Id ===> ",uid);
    if (!uid) {
      throw new HttpsError(
        "unauthenticated",
        "Request was not authenticated.",
      );
    }

    let chain = getHasura();
    let response = await chain.query({
      user: [{
        where: {
          firebase_id: {
            _eq: uid
          }
        }
      }, {
        id: true
      }]
    })
    let hasuraUserId;
    if (response.user.length == 0) {
      let authUser = await firebase.auth().getUser(uid);
      let secondResponse = await chain.mutation({
        insert_user_one: [
          {
            object: {
              name: authUser.displayName,
              image: authUser.photoURL,
              firebase_id: uid,
              email: authUser.email,
              phone: authUser.phoneNumber
            }
          }, {
            id: true
          }
        ]
      })
      hasuraUserId = secondResponse.insert_user_one?.id
    } else {
      hasuraUserId = response.user[0].id
    }
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "anonymous",
        "x-hasura-allowed-roles": ["anonymous","restaurant_operator","customer","mez_admin","deliverer", "delivery_operator"], // add admin role for admin users
      "x-hasura-user-id": hasuraUserId?.toString()
      }
    };
    await firebase.auth().setCustomUserClaims(uid, customClaims)
    return { status: "success" }
  } catch (error) {
    console
    return { status: "failure", message: error }
  }
}

