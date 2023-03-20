import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDriver, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType, AuthorizationStatus, Language } from "../../../models/Generic/Generic";

export async function deleteDeliveryDriver(deliveryDriverId: number): Promise<DeliveryDriver> {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_delivery_driver_by_pk: [{
            id: deliveryDriverId
        }, {
            user_id: true,
            delivery_company_type: true,
            delivery_company_id: true,
            status: true,
            online: true,
            user: {
                firebase_id: true,
                language_id: true,
                image: true,
                name: true,
                phone: true
            },
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
        }]
    });
    if(!(response.delete_delivery_driver_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect delivery driver id"
        );
    }
    return {
        id: deliveryDriverId,
        userId: response.delete_delivery_driver_by_pk.user_id,
        deliveryCompanyType: response.delete_delivery_driver_by_pk.delivery_company_type as DeliveryServiceProviderType,
        deliveryCompanyId: response.delete_delivery_driver_by_pk.delivery_company_id,
        status: response.delete_delivery_driver_by_pk.status as AuthorizationStatus,
        online: response.delete_delivery_driver_by_pk.online,
        user: {
            id: response.delete_delivery_driver_by_pk.user_id,
            firebaseId: response.delete_delivery_driver_by_pk.user.firebase_id,
            language: response.delete_delivery_driver_by_pk.user.language_id as Language,
            image: response.delete_delivery_driver_by_pk.user.image,
            name: response.delete_delivery_driver_by_pk.user.name,
            phoneNumber: response.delete_delivery_driver_by_pk.user.phone
        },
        notificationInfo: (response.delete_delivery_driver_by_pk.notification_info) ? {
            appType: AppType.DeliveryApp,
            token: response.delete_delivery_driver_by_pk.notification_info.token,
            turnOffNotifications: response.delete_delivery_driver_by_pk.notification_info.turn_off_notifications
        } : undefined,
    }
}