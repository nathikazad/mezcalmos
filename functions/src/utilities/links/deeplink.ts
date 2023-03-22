import { FirebaseDynamicLinks, ShortLinkRequestBody, ShortLinkResponse } from "firebase-dynamic-links";
import { AppType, MezError } from "../../shared/models/Generic/Generic";
import { generateQr } from "./qr";

export interface IDeepLink {
  url: string
  urlQrImage: string
}


const appPackageIds: Record<AppType, string> =  {
  [AppType.DeliveryApp]: "com.mezcalmos.delivery",
  [AppType.RestaurantApp]: "com.mezcalmos.restaurant",
  [AppType.LaundryApp]: "com.mezcalmos.laundry",
  [AppType.Customer]: "com.mezcalmos.customer",
  [AppType.DeliveryAdmin]: "com.mezcalmos.deliveryadmin",
  [AppType.MezAdmin]: "com.mezcalmos.mezadmin",
}

const appStoreIds: Record<AppType, string | undefined> =  {
  [AppType.DeliveryApp]: undefined,
  [AppType.RestaurantApp]: "6443621484",
  [AppType.LaundryApp]: undefined,
  [AppType.Customer]: "1595882320",
  [AppType.DeliveryAdmin]: undefined,
  [AppType.MezAdmin]: undefined,
}

export enum DeepLinkType {
  Customer,
  AddDriver,
  AddOperator
}


// first generate unique id
// generate 5 character secret
// call generate deeplinks
// save response to database including unique_id(sp.details) and secret(sp.service_links)


// write script to do this for all existing service providers
// make this happen when user creates a new service provider and accept a new param called uniqueId
// create a new function called serviceProvider-changeUniqueId
// Modify add operator and add driver to accept unique-id and secret

export async function generateDeepLinks(uniqueId: string, appType: AppType): Promise<Record<DeepLinkType, IDeepLink>> {
  let packageId = appPackageIds[AppType.Customer];
  let appStoreId = appStoreIds[AppType.Customer];
  let prefix = `https://mezc.co`

  // Customer Deep Links
  let customerDeeplink = `https://mezkala.app/${uniqueId}/`
  // let customerParameterisedLink = `${prefix}?link=${customerDeeplink}&apn=${packageId}&ibi=${packageId}&isi=${appStoreId}` //&ifl=${customerDeeplink}&afl={customerDeeplink}
  let customerRequestBody: ShortLinkRequestBody = {
    // longDynamicLink: customerParameterisedLink,
    dynamicLinkInfo: {
      domainUriPrefix: prefix,
      link: customerDeeplink,
      androidInfo: {
        androidPackageName: packageId
      },
      iosInfo: {
        iosBundleId: packageId,
        iosAppStoreId: appStoreId
      },
    },
    suffix: {
      option: 'SHORT'
    }
  }
  let customerLinkResponse = await generateDeepLink(customerRequestBody, uniqueId, "customer");
  // console.log("customerLinkResponse: ", customerLinkResponse)

  // Add Operator Deep Links
  packageId = appPackageIds[appType];
  appStoreId = appStoreIds[appType];

  let addOperatorDeeplink = `https://mezkala.app/op/${uniqueId}/`
  
  // let addOperatorParameterisedLink = `${prefix}?link=${addOperatorDeeplink}&apn=${packageId}&ibi=${packageId}`;
  // if(appStoreId)
  //   addOperatorParameterisedLink += `&isi=${appStoreId}`

  let addOperatorRequestBody: ShortLinkRequestBody = {
    // longDynamicLink: addOperatorParameterisedLink,
    dynamicLinkInfo: {
      domainUriPrefix: prefix,
      link: addOperatorDeeplink,
      androidInfo: {
        androidPackageName: packageId
      },
      iosInfo: {
        iosBundleId: packageId,
        iosAppStoreId: appStoreId
      },
    },
    suffix: {
      option: 'SHORT'
    }
  }
  let addOperatorLinkResponse = await generateDeepLink(addOperatorRequestBody, uniqueId, "operator");

  packageId = appPackageIds[AppType.DeliveryApp];
  appStoreId = appStoreIds[AppType.DeliveryApp];

  let addDriverDeeplink = `https://mezkala.app/dr/${uniqueId}/`
  // let addDriverParameterisedLink = `${prefix}?link=${addDriverDeeplink}&apn=${packageId}&ibi=${packageId}`;
  // if(appStoreId)
  // addDriverParameterisedLink += `&isi=${appStoreId}`

  let addDriverRequestBody: ShortLinkRequestBody = {
    // longDynamicLink: addDriverParameterisedLink,
    dynamicLinkInfo: {
      domainUriPrefix: prefix,
      link: addDriverDeeplink,
      androidInfo: {
        androidPackageName: packageId
      },
      iosInfo: {
        iosBundleId: packageId,
        iosAppStoreId: appStoreIds[appType]
      },
    },
    suffix: {
      option: 'SHORT'
    }
  }
  let addDriverLinkResponse = await generateDeepLink(addDriverRequestBody, uniqueId, "driver");

  return {
    [DeepLinkType.Customer]: customerLinkResponse,
    [DeepLinkType.AddOperator]: addOperatorLinkResponse,
    [DeepLinkType.AddDriver]: addDriverLinkResponse,
  }
};

// `https://mezprovs.page.link/?link=https://www.mezcalmos.com/?app%3D${appName}%26?type%3D${parameters['providerType']}%26id%3D${parameters['providerId']}&apn=${appPkgName}&ibi=${appPkgName}`
export async function generateDeepLink(requestBody: ShortLinkRequestBody, uniqueId: string, fileName: string): Promise<IDeepLink> {
  const firebaseLinks: FirebaseDynamicLinks = new FirebaseDynamicLinks("AIzaSyCOVuUV0qhw0SbNrQMfMVTBDm-5bJVozYg");
  let response: ShortLinkResponse
  try {
    response = 
    await firebaseLinks.createLink(requestBody)
    console.log("response: ", response.shortLink)
  } catch(err: any) {
    console.log("create link Error: ", err)
    throw new MezError("deepLinkError");
  }
  try {
    let qrUrl: string = await generateQr(`links/${uniqueId}/${fileName}`, response.shortLink)
    return {
      url: response.shortLink,
      urlQrImage: qrUrl
    }
  } catch(err: any) {
    console.log("QR image generation error: ", err)
    throw new MezError("QRGenerationError");
  }
  
  
  // result = {
  //   url: shortLinkResponse,
  //   urlQr: undefined
  // }

  // console.log("[+] result / ", result);

  // trying to generate the QR
  // TODO : restaurants/<id>/ is hardcoded now

  // console.log("[+] qrUrl / ", qrUrl);

  // if (qrUrl != null) result.urlQr = qrUrl;

  // return result;
}

// function generateString(): string {
//   let result = '';
//   const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//   const charactersLength = characters.length;
//   let counter = 0;
//   while (counter < 5) {
//     result += characters.charAt(Math.floor(Math.random() * charactersLength));
//     counter += 1;
//   }
//   return result;
// }
