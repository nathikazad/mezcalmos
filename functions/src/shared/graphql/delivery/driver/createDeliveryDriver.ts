import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, MezError } from "../../../models/Generic/Generic";
import { DeliveryDriver, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";;
import { AuthorizationStatus } from "../../../models/Generic/Generic";
import { AddDriverDetails } from "../../../../delivery/addDriver";

export async function createDeliveryDriver(userId: number, addDriverDetails: AddDriverDetails, deliveryServiceProviderType: DeliveryServiceProviderType ): Promise<DeliveryDriver> {
    let chain = getHasura();
    let response = await chain.query({
        delivery_driver: [{
            where: {
                user_id: {
                    _eq: userId,
                },
                delivery_company_type: {
                    _eq: deliveryServiceProviderType
                },
                delivery_company_id: {
                    _eq: addDriverDetails.deliveryCompanyId
                }
            }
        }, {
            id: true,
        }],
        notification_info: [{
            where: {
                user_id: {
                    _eq: userId
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
        throw new MezError("driverAlreadyExists");
    }
    let mutationResponse = await chain.mutation({
        insert_delivery_driver_one: [{
            object: {
                user_id: userId,
                delivery_company_type: deliveryServiceProviderType,
                delivery_company_id: addDriverDetails.deliveryCompanyId,
                status: AuthorizationStatus.AwaitingApproval,
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
    if(mutationResponse.insert_delivery_driver_one == null) {
        throw new MezError("driverCreationError");
    }
    if(!(response.notification_info.length) && addDriverDetails.notificationInfo) {
        await chain.mutation({
            insert_notification_info_one: [{
                object: {
                    app_type_id: addDriverDetails.notificationInfo.appType,
                    token: addDriverDetails.notificationInfo.token,
                    user_id: userId
                }
            }, {
                id: true
            }]
        });
    }
    return {
        id: mutationResponse.insert_delivery_driver_one?.id,
        userId,
        deliveryCompanyType: deliveryServiceProviderType,
        deliveryCompanyId: addDriverDetails.deliveryCompanyId,
        status: AuthorizationStatus.AwaitingApproval,
        notificationInfo: addDriverDetails.notificationInfo,
        user: {
            firebaseId: mutationResponse.insert_delivery_driver_one!.user.firebase_id,
            id: userId,
            language: mutationResponse.insert_delivery_driver_one!.user.language_id as Language,
            name: mutationResponse.insert_delivery_driver_one!.user.name,
            image: mutationResponse.insert_delivery_driver_one!.user.image
        }
        // deliveryDriverType: ParticipantType.DeliveryDriver
    }
}