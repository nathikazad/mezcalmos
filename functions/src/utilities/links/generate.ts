// import * as functions from "firebase-functions";
import {
  ServerResponseStatus,
} from "../../shared/models/Generic/Generic";

// import * as firebase from "firebase-admin";
import { generateDeepLink, linkRecipientType, providerType } from "./deeplink";
import { generateQr } from "./qr";
// import { getRestaurant } from "../../shared/graphql/restaurant/getRestaurant";
// import { Restaurant } from "../../shared/models/Services/Restaurant/Restaurant";
import {
  insertServiceLink,
  // setOperatorDeepLink,
  // setOperatorQrImageLink,
  updateDriverLink,
  updateOperatorLink,
} from "../../shared/graphql/restaurant/setLinks";
import { ServiceLink, ServiceProviderType } from "../../shared/models/Services/Service";
import { getRestaurantLinks } from "../../shared/graphql/restaurant/getRestaurantLinks";



export interface restaurantLinks {
  providerId: number,
  providerType:string ,
  
}

export async function generateOperatorLink(userId: number, restaurantLinks: restaurantLinks) {
  // let response: ServerResponse | undefined = await isSignedIn(context.auth);
  // if (response != undefined) {
  //   return {
  //     ok: false,
  //     error: response,
  //   };
  // }

  if (!restaurantLinks.providerId || !restaurantLinks.providerType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters providerId and providerType.",
    };
  }
  console.log("inside generate restaurant links ")
  let oldRestaurantLinks: ServiceLink|null = await getRestaurantLinks(restaurantLinks.providerId);
  let restLink: string;
  let restQr;
  
  if (oldRestaurantLinks == null || !oldRestaurantLinks.operator_deep_link || !oldRestaurantLinks.operator_qr_image_link) {
    //  const pTypeAsOrderType: OrderType = (data.providerType as string).toLowerCase() as OrderType;
    const link: string | null = await generateDeepLink(
      providerType.Restaurant,
      restaurantLinks.providerId,
      linkRecipientType.restaurantOperator
    );
    if (!link) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Failed generating your link, try later!",
      };
    }
    restLink = link;
       const qr: string | null = await generateQr(restLink!);
    if (!qr) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Failed generating your link, try later!",
      };
    }
    restQr = qr;
    let serviceLink: ServiceLink = {
      service_provider_id: restaurantLinks.providerId ,
      service_provider_type:restaurantLinks.providerType as ServiceProviderType,
      operator_deep_link: restLink,
      operator_qr_image_link : qr,
      
    }
    if (oldRestaurantLinks == null) {
      // insert for the first time 
      await insertServiceLink(serviceLink);
    } else {
      // update operator links
      serviceLink.id = oldRestaurantLinks.id;
      await updateOperatorLink(serviceLink);

    }
    

  } 
  return {
    status: ServerResponseStatus.Success,
    results: {
      qr: restQr,
      link: restLink!,
    },
    // errorMessage:
    //   "Failed generating your link, try later!",
  };
}


export async function generateDriverLink(userId: number, restaurantLinks: restaurantLinks) {
  // let response: ServerResponse | undefined = await isSignedIn(context.auth);
  // if (response != undefined) {
  //   return {
  //     ok: false,
  //     error: response,
  //   };
  // }

  if (!restaurantLinks.providerId || !restaurantLinks.providerType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters providerId and providerType.",
    };
  }
  console.log("inside generate driver links ")
  let oldRestaurantLinks: ServiceLink|null = await getRestaurantLinks(restaurantLinks.providerId);
  let restLink: string;
  let restQr;
  
  if (oldRestaurantLinks == null || !oldRestaurantLinks.driver_deep_link || !oldRestaurantLinks.driver_qr_image_link) {
    //  const pTypeAsOrderType: OrderType = (data.providerType as string).toLowerCase() as OrderType;
    const link: string | null = await generateDeepLink(
      providerType.Restaurant,
      restaurantLinks.providerId,
      linkRecipientType.deliveryDriver
    );
    if (!link) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Failed generating your link, try later!",
      };
    }
    restLink = link;
       const qr: string | null = await generateQr(restLink!);
    if (!qr) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Failed generating your link, try later!",
      };
    }
    restQr = qr;
    let serviceLink: ServiceLink = {
      service_provider_id: restaurantLinks.providerId ,
      service_provider_type:restaurantLinks.providerType as ServiceProviderType,
      driver_deep_link: restLink,
      driver_qr_image_link : qr,
      
    }
    if (oldRestaurantLinks == null) {
      // insert for the first time 
      await insertServiceLink(serviceLink);
    } else {

      // update driver links
      serviceLink.id = oldRestaurantLinks.id;
      await updateDriverLink(serviceLink);

    }
    

  } 
  return {
    status: ServerResponseStatus.Success,
    results: {
      qr: restQr,
      link: restLink!,
    },
    // errorMessage:
    //   "Failed generating your link, try later!",
  };
}


