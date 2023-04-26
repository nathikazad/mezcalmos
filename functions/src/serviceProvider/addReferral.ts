import { addReferral } from "../shared/graphql/referral"
import { MezError } from "../shared/models/Generic/Generic";

export interface AddReferralDetails {
    uniqueId: string,
}
export interface AddReferralResponse {
    success: boolean,
    error?: AddReferralError
    unhandledError?: string,
}
export enum AddReferralError {
    UnhandledError = "unhandledError",
    IncorrectUniqueId = "incorrectUniqueId",
    AlreadyReferred = "alreadyReferred",
    InvalidServiceProviderType = "invalidServiceProviderType",
}
export async function addNewReferral(customerId: number, addRefDetails: AddReferralDetails): Promise<AddReferralResponse> {
    try {
        await addReferral(customerId, addRefDetails.uniqueId);
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(AddReferralError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: AddReferralError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}
