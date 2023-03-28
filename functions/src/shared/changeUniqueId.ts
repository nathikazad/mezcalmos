import { getServiceProviderFromUniqueId } from "./graphql/getServiceProvider"
import { updateUniqueIdAndServiceLinks } from "./graphql/updateServiceProvider";
import { MezError } from "./models/Generic/Generic";
import { Operator, ServiceProvider } from "./models/Services/Service"

export interface UniqueIdDetails {
    currentuniqueId: string,
    newUniqueId: string
}
export interface ChangeUniqueIdResponse {
    success: boolean,
    error?: ChangeUniqueIdError
    unhandledError?: string,
}
export enum ChangeUniqueIdError {
    ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
    UnauthorizedAccess = "unauthorizedAccess",
    MutationError = "mutationError",
    InvalidServiceProviderType = "invalidServiceProviderType",
    DeepLinkError = "deepLinkError"
}

export async function changeUniqueId(ownerUserId: number, uniqueIdDetails: UniqueIdDetails): Promise<ChangeUniqueIdResponse> {
    try {
        let serviceProvider: ServiceProvider = await getServiceProviderFromUniqueId(uniqueIdDetails.currentuniqueId);
        let owner: Operator = serviceProvider.operators!.filter((o) => o.owner)[0];

        if(owner.userId != ownerUserId) {
            throw new MezError(ChangeUniqueIdError.UnauthorizedAccess);
        }
        
        updateUniqueIdAndServiceLinks(serviceProvider, uniqueIdDetails.newUniqueId);
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(ChangeUniqueIdError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}