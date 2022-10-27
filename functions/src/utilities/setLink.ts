import * as functions from "firebase-functions";
import { FirebaseDynamicLinks, ShortLinkResponse } from 'firebase-dynamic-links';
import {  ServerResponseStatus } from "../shared/models/Generic/Generic";
import { isSignedIn } from "../shared/helper/authorizer";
import {  providerLinkNode } from "../shared/databaseNodes/root";

export enum ServiceProviderType {
    Restaurant = "Restaurant",
    Taxi  =  "Taxi",
    Laundry = "Laundry"
}

// interface IDeepLink {
//     serviceProviderType: ServiceProviderType ,
//     link: string | null
// }


function initDynamicLink() : FirebaseDynamicLinks {
  return  new FirebaseDynamicLinks("AIzaSyCOVuUV0qhw0SbNrQMfMVTBDm-5bJVozYg");
}
 // node -> deeplinks/$type/$DeepLink/$provider_id <--- this is to keep track of all deeplinks 
 //       |_ because the restaurant has the ability to change it's deeplink so we have to check if it is already there or not.

 // node -> $providerType/info/$id/link <--- we write to it the link also

export const generateDeepLink = functions.https.onCall(async (data, context) => {
    const firebaseLinks:FirebaseDynamicLinks = initDynamicLink();
   
    let response = isSignedIn(context.auth)
    if (response != undefined)
      return response;
    
    if (!data.serviceProviderType) {
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "Required serviceProviderType !"
        }
    }
    const uid :string = context.auth!.uid;

    // we check if it is the first time the user is generating a dynamic link 
    // if so, we generate it this way : mezc.co/$auth_id <--- we're sure that's uniq 100%
    let firebaseNode = providerLinkNode(data.serviceProviderType as ServiceProviderType, uid);
    console.log(data.serviceProviderType as ServiceProviderType);
    if (firebaseNode === undefined) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Wrong serviceProviderType!"
      }
    }

    let link = (await firebaseNode.once('value')).val();
    if (link) {
      // // User is requesting to change the link , with the [data.linkId] given.
      // if (!data.linkId) {
      //   return {
      //     status: ServerResponseStatus.Error,
      //     errorMessage: "required new linkId to change !"
      //   }
      // }
      
      // let link = (await deepLinksNode(data.servicePrividerType , data.linkId).once('value')).val();
        return {
          status: ServerResponseStatus.Error,
          errorMessage: "Restaurant Already have link!"
        }
    }
    else {
      // first time generation

      const longLink:string = `https://www.mezcalmos.com/?type=${data.serviceProviderType}&id=${uid}`;
      const packgName:string = `com.mezcalmos.${data.serviceProviderType.toString().toLowerCase()}`
      try {
        const shortLink : ShortLinkResponse = await firebaseLinks.createLink({
          dynamicLinkInfo: {
            domainUriPrefix: `https://mezprovs.page.link/${uid}`,
            link: longLink,
            androidInfo: {
              androidPackageName: packgName,
              androidFallbackLink: longLink
            },
            iosInfo: {
              iosBundleId: packgName,
              iosFallbackLink : longLink
            },
          },
        });

        await firebaseNode.set(shortLink.shortLink);
        return {
          status: ServerResponseStatus.Success,
          errorMessage:  shortLink.shortLink
        }

      } catch (error) {
        return {
          status: ServerResponseStatus.Error,
          errorMessage:  error
        }
      }
      
    }
   

   


});




// export const setDeepLink = functions.https.onCall(async (data , context) => {
//     // let response = await _sendOTPForLogin(<sendOtpInterface>data);
//     let response = isSignedIn(context.auth)
//     if (response != undefined)
//       return response;

//     if (!data.servicePrividerType) {
//         return {
//           status: ServerResponseStatus.Error,
//           errorMessage: "Required serviceProviderType !"
//         }
//     }

//     if (!data.link) {
//         return {
//           status: ServerResponseStatus.Error,
//           errorMessage: "Required serviceProviderType !"
//         }
//     }

//     switch (key) {
//         case value:
            
//             break;
    
//         default:
//             break;
//     }
//     return response;
//   });




// async function _sendOTPForLogin(data: IDeepLink): Promise<ServerResponse> {
//     if (!data.phoneNumber) {
//       return {
//         status: ServerResponseStatus.Error,
//         errorMessage: "Required phone number"
//       }
//     }
  
//     let user;
//     try {
//       user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
//     } catch (a) {
//       let e: any = a;
//       if (e.errorInfo.code == "auth/user-not-found") {
//         try {
//           user = await firebase.auth().createUser({
//             phoneNumber: data.phoneNumber
//           })
//           firebase.database().ref(`/users/${user.uid}/info/phoneNumber`).set(data.phoneNumber);
//         } catch (a) {
//           let e: any = a;
//           return {
//             status: ServerResponseStatus.Error,
//             errorMessage: e.errorInfo.message,
//           }
//         }
//       } else {
//       return {
//         status: ServerResponseStatus.Error,
//         errorMessage: "User not found",
//       }
//       }
//     }
  
//     let response = await sendOTP(data, user.uid)
  
//     if (response != undefined) {
//       return response
//     }
  
//     return {
//       status: ServerResponseStatus.Success
//     }
//   }