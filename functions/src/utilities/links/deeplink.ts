import { FirebaseDynamicLinks } from "firebase-dynamic-links";

export enum providerType {

    Restaurant = "Restaurant",
    Laundry = "Laundry",
    Taxi = "Taxi",
}

export async function generateDeepLink(providerType: providerType, providerId:string): Promise<string | null> {

    const firebaseLinks:FirebaseDynamicLinks = new FirebaseDynamicLinks("AIzaSyCOVuUV0qhw0SbNrQMfMVTBDm-5bJVozYg");
    
    try {
      const { shortLink } = await firebaseLinks.createLink({
          longDynamicLink: `https://mezprovs.page.link/?link=https://www.mezcalmos.com/driver/?type%3D${providerType}%26id%3D${providerId}&apn=com.mezcalmos.delivery&ibi=com.mezcalmos.delivery`,
      });
      return shortLink;
    } catch (error) {
      console.log(`Error happend while generating the deeplink => \n${error}`);
      return null;
    }
};