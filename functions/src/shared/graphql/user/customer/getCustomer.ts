import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { CustomerInfo } from "../../../models/Generic/User";

export async function getCustomer(customerId: number): Promise<CustomerInfo> {
    let chain = getHasura();
    let response = await chain.query({
        customer_customer_by_pk: [{
            user_id: customerId
        }, {
            app_version: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true,
                phone: true,
                name : true,
                image:true
            },
            stripe_info: [{}, true]
        }]
    })

    if(response.customer_customer_by_pk == null) {
        throw new HttpsError(
            "internal",
            "Customer not found"
        );
    }
    return {
        id: customerId,
        firebaseId: response.customer_customer_by_pk.user.firebase_id,
        language: response.customer_customer_by_pk.user.language_id as Language,
        name : response.customer_customer_by_pk.user.name,
        image : response.customer_customer_by_pk.user.image,
        notificationInfo: (response.customer_customer_by_pk.notification_info) ? {
            appType: AppType.Customer,
            token: response.customer_customer_by_pk.notification_info.token,
            turnOffNotifications: response.customer_customer_by_pk.notification_info.turn_off_notifications,
        } : undefined,
        appVersion: response.customer_customer_by_pk.app_version,
        stripeInfo: JSON.parse(response.customer_customer_by_pk.stripe_info),
        phoneNumber: response.customer_customer_by_pk.user.phone
    }
}