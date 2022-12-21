import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { DelivererStatus, DeliveryDriver } from "../../../models/Services/Delivery/DeliveryOrder";

export async function createDeliveryDriver(deliveryDriver: DeliveryDriver)/*: Promise<DeliveryDriver>*/ {
    let chain = getHasura();
    let response = await chain.query({
        delivery_driver: [{
            where: {
                user_id: {
                    _eq: deliveryDriver.userId,
                },
                delivery_company_type: {
                    _eq: deliveryDriver.deliveryCompanyType
                },
                delivery_company_id: {
                    _eq: deliveryDriver.deliveryCompanyId
                }
            }
        }, {
            id: true,
        }],
        notification_info: [{
            where: {
                user_id: {
                    _eq: deliveryDriver.userId
                },
                app_type_id: {
                    _eq: AppType.DeliveryApp
                }
            }
        }, {
            id: true,
        }]
    })
    if(response.delivery_driver.length) {
        throw new HttpsError(
            "internal",
            "The driver is already working for this delivery company or restaurant"
        );
    }
    let mutationResponse = await chain.mutation({
        insert_delivery_driver_one: [{
            object: {
                user_id: deliveryDriver.userId,
                delivery_company_type: deliveryDriver.deliveryCompanyType,
                delivery_company_id: deliveryDriver.deliveryCompanyId,
                status: DelivererStatus.AwaitingApproval,
            }
        }, {
            id: true,
            user: {
                firebase_id: true,
                image: true,
                language_id: true,
                name: true,
            }
        }]
    })
    if(!(response.notification_info.length) && deliveryDriver.notificationInfo) {
        await chain.mutation({
            insert_notification_info_one: [{
                object: {
                    app_type_id: deliveryDriver.notificationInfo.AppTypeId,
                    token: deliveryDriver.notificationInfo.token,
                    user_id: deliveryDriver.userId
                }
            }, {
                id: true
            }]
        });
    }
    deliveryDriver.user = {
        firebaseId: mutationResponse.insert_delivery_driver_one!.user.firebase_id,
        id: deliveryDriver.userId,
        language: mutationResponse.insert_delivery_driver_one!.user.language_id as Language,
        name: mutationResponse.insert_delivery_driver_one!.user.name,
        image: mutationResponse.insert_delivery_driver_one!.user.image
    }
}