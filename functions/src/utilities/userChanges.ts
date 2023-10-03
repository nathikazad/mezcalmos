import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
import { getHasura } from "./hasura";
import { MezError } from "../shared/models/Generic/Generic";

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
          phone: user.phoneNumber
        }
      }, {
        id: true
      }
    ]
  })
  await addHasuraClaim(user.uid, null);
});

export interface DeleteAccountResponse {
  success: boolean,
  error?: DeleteAccountError
  unhandledError?: string
}
enum DeleteAccountError {
  UnhandledError = "unhandledError",
}

export async function deleteAccount(uid: number, data: any): Promise<DeleteAccountResponse> {
  try {
    await firebase.auth().deleteUser(data.firebaseId);
    return {
      success: true
    }
  } catch (e: any) {
    return {
      success: false,
      error: DeleteAccountError.UnhandledError,
      unhandledError: e.message as any
    }

  }
};

export interface HasuraClaimResponse {
  success: boolean,
  error?: HasuraClaimError
  unhandledError?: string
}
enum HasuraClaimError {
  UnhandledError = "unhandledError",
  Unauthenticated = "unauthenticated",
}

export async function addHasuraClaim(uid: string, _:null): Promise<HasuraClaimResponse> {
  try {
    console.log("[+] User Id ===> ", uid);
    functions.logger.info("[+] User Id ===> ", uid);

    let chain = getHasura();
    let response = await chain.query({
      user: [{
        where: {
          firebase_id: {
            _eq: uid
          }
        }
      }, {
        id: true,
        customer: {
          user_id: true
        }
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
              phone: authUser.phoneNumber,
              customer: {
                data: {
                }
              }
            }
          }, {
            id: true
          }
        ]
      })
      chain.mutation({
        insert_restaurant_cart_one: [
          {
            object: {
              customer_id: secondResponse.insert_user_one?.id
            }
          }, {
            customer_id: true
          }
        ]
      });
      hasuraUserId = secondResponse.insert_user_one?.id
    } else {
      hasuraUserId = response.user[0].id
    }
    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "anonymous",
        "x-hasura-allowed-roles": ["anonymous", "restaurant_operator", "customer", "mez_admin", "deliverer", "delivery_operator", "delivery_driver", "laundry_operator", "business_operator", "influencer"], // add admin role for admin users
        "x-hasura-user-id": hasuraUserId?.toString()
      }
    };
    await firebase.auth().setCustomUserClaims(uid, customClaims)
    return {
      success: true
    }
  } catch (e: any) {
      if (e instanceof MezError) {
          if (Object.values(HasuraClaimError).includes(e.message as any)) {
              return {
                  success: false,
                  error: e.message as any
              }
          } else {
              return {
                  success: false,
                  error: HasuraClaimError.UnhandledError,
                  unhandledError: e.message as any
              }
          }
      } else {
          throw e
      }
  }
}

