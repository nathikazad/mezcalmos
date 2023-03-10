import { HttpsError } from "firebase-functions/v1/auth";
import { getServiceProviderFromUniqueId } from "./graphql/getServiceProvider"
import { updateUniqueIdAndServiceLinks } from "./graphql/updateServiceProvider";
import { Operator, ServiceProvider } from "./models/Services/Service"

export interface UniqueIdDetails {
    currentuniqueId: string,
    newUniqueId: string
}
export async function changeUniqueId(ownerUserId: number, uniqueIdDetails: UniqueIdDetails) {
    let serviceProvider: ServiceProvider = await getServiceProviderFromUniqueId(uniqueIdDetails.currentuniqueId);
    let owner: Operator = serviceProvider.operators!.filter((o) => o.owner)[0];

    if(owner.userId != ownerUserId) {
        throw new HttpsError("internal", "Unauthorized Access");
    }
    
    updateUniqueIdAndServiceLinks(serviceProvider, uniqueIdDetails.newUniqueId);
}