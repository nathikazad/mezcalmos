import { FirebaseDynamicLinks } from "firebase-dynamic-links";
import { AppType } from "../../shared/models/Generic/Generic";
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
  [AppType.RestaurantApp]: "com.mezcalmos.restaurant",
  [AppType.LaundryApp]: undefined,
  [AppType.Customer]: "com.mezcalmos.customer",
  [AppType.DeliveryAdmin]: undefined,
  [AppType.MezAdmin]: undefined,
}

enum DeepLinkType {
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
  

  // Customer Deep Links
  let customerShortLink = `https://mezc.co/${uniqueId}`
  let customerDeeplink = `https://mezkala.app/${uniqueId}`
  let customerLongLink = `${customerShortLink}?link=${customerDeeplink}&apn=${packageId}&ibi=${packageId}&isi=${appStoreId}` //&ifl=${customerDeeplink}&afl={customerDeeplink}
  let customerQrImageUrl = await generateDeepLink(customerLongLink, customerDeeplink, uniqueId);

  // Add Operator Deep Links
  packageId = appPackageIds[appType];
  appStoreId = appStoreIds[appType];

  let addOperatorShortlink = `https://mezc.co/op/${generateString()}`
  let addOperatorDeeplink = `https://mezkala.app/op/${uniqueId}`
  let addOperatorLongLink = `${addOperatorShortlink}?link=${addOperatorDeeplink}&apn=${packageId}&ibi=${packageId}`;
  if(appStoreId)
    addOperatorLongLink += `&isi=${appStoreId}`
  let addOperatorQrImageUrl = await generateDeepLink(addOperatorLongLink, addOperatorDeeplink, uniqueId);

  let addDriverShortLink = `https://mezc.co/dr/${generateString()}`
  let addDriverDeeplink = `https://mezkala.app/dr/${uniqueId}`
  let addDriverLongLink = `https://mezc.co/dr/${uniqueId}?link=${addDriverDeeplink}&apn=${packageId}&ibi=${packageId}`;
  if(appStoreId)
  addDriverLongLink += `&isi=${appStoreId}`
  let addDriverQrImageUrl = await generateDeepLink(addDriverLongLink, addDriverDeeplink, uniqueId);

  return {
    [DeepLinkType.Customer]: {
      url: customerShortLink,
      urlQrImage: customerQrImageUrl
    },
    [DeepLinkType.AddOperator]: {
      url: addOperatorShortlink,
      urlQrImage: addOperatorQrImageUrl
    },
    [DeepLinkType.AddDriver]: {
      url: addDriverShortLink,
      urlQrImage: addDriverQrImageUrl
    },
  }
};

// `https://mezprovs.page.link/?link=https://www.mezcalmos.com/?app%3D${appName}%26?type%3D${parameters['providerType']}%26id%3D${parameters['providerId']}&apn=${appPkgName}&ibi=${appPkgName}`
export async function generateDeepLink(longLink:string, shortLink:string, uniqueId:string): Promise<string> {
  const firebaseLinks: FirebaseDynamicLinks = new FirebaseDynamicLinks("AIzaSyCOVuUV0qhw0SbNrQMfMVTBDm-5bJVozYg");
  // const { shortLinkResponse } = 
  await firebaseLinks.createLink({
    longDynamicLink: longLink,
  });
  let qrUrl: string = await generateQr(`links/${uniqueId}/`, shortLink)
  return qrUrl;

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

function generateString(): string {
  return "random"
}
