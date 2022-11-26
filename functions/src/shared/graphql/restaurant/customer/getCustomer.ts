import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { CustomerInfo } from "../../../models/Generic/User";

export async function getCustomer(customerId: number): Promise<CustomerInfo> {
    let chain = getHasura();
    
    let response = await chain.query({
        customer_by_pk: [{
            user_id: customerId
        }, {
            app_version: true,
            notification_token: true,
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    });
    if(response.customer_by_pk == null) {
        throw new HttpsError(
            "internal",
            "Customer not found"
        );
    }
    
    return {
        id: customerId,
        firebaseId: response.customer_by_pk?.user.firebase_id ?? "",
        language: response.customer_by_pk?.user.language_id as Language,
        notificationInfo: {
            AppTypeId: AppType.CustomerMobile,
            token: response.customer_by_pk?.notification_token ?? ""
        },
        appVersion: response.customer_by_pk.app_version
    }
}