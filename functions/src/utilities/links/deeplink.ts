import { FirebaseDynamicLinks } from "firebase-dynamic-links";
import { generateQr } from "./qr";

export enum providerType {

    Restaurant = "Restaurant",
    Laundry = "Laundry",
    Taxi = "Taxi",
}export enum linkRecipientType {

  restaurantOperator = "restaurantOperator",
    deliveryDriver = "deliveryDriver",
  
}

export interface IDeepLink {
  url:string|undefined
  urlQr:string|undefined
}


enum AppPackageId {

  Delivery = "com.mezcalmos.delivery",
  Restaurant = "com.mezcalmos.restaurant",
  Customer = "com.mezcalmos.customer"
}



export async function generateDeepLink(appName:string, parameters:Record<string, any>): Promise<IDeepLink|null> {
  console.log("[+] generateDeepLink :: called :: params :: ", parameters);
  let result : IDeepLink|undefined = undefined; 
  const firebaseLinks:FirebaseDynamicLinks = new FirebaseDynamicLinks("AIzaSyCOVuUV0qhw0SbNrQMfMVTBDm-5bJVozYg");
  let appPkgName : AppPackageId|undefined;

  switch (appName.toLowerCase()) {
    case "delivery":
      appPkgName = AppPackageId.Delivery
      break;
    case "restaurant":
      appPkgName = AppPackageId.Restaurant
      break;
    case "customer":
      appPkgName = AppPackageId.Customer
    default:
      break;
  }
  console.log("-- AppName ----> ", appName);
  console.log("-- Pkg ----> ", appPkgName);
  if (!appPkgName || !checkParams(appPkgName , parameters) ) {
    console.log("[+] appPkgName / checkParams -> Failed!");

    return null;
  }

  try {
    const { shortLink } = await firebaseLinks.createLink({
        longDynamicLink: `https://mezprovs.page.link/?link=https://www.mezcalmos.com/?app%3D${appName}%26?type%3D${parameters['providerType']}%26id%3D${parameters['providerId']}&apn=${appPkgName}&ibi=${appPkgName}`,
    });
    

    result = {
      url : shortLink,
      urlQr : undefined
    }

    console.log("[+] result / ", result);

    // trying to generate the QR
    // TODO : restaurants/<id>/ is hardcoded now
    let qrUrl : string|null  = await generateQr(`restaurants/${parameters['providerId']}` , shortLink)
    console.log("[+] qrUrl / ", qrUrl);

    if (qrUrl != null) result.urlQr = qrUrl;

    return result;
  } catch (error) {
    console.log(`[+] Error happend while generating the deeplink => \n${error}`);
    return null;
  }
};


function checkParams(appId: AppPackageId  , params:Record<string, any>) : boolean {
  console.log("params :: ", params );
  switch (appId) {
    case AppPackageId.Customer:
      return params['providerType'] != null && params['providerId'] != null;
      
    case AppPackageId.Delivery:
      return params['providerType'] != null && params['providerId'] != null;
      
    case AppPackageId.Restaurant:
      return params['providerId'] != null;

    default:
      return false;
  }
}