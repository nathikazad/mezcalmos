import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, MezError } from "../../../models/Generic/Generic";
import { DeliveryDriver, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";;
import { AuthorizationStatus } from "../../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../../models/Services/Service";
import { AddDriverDetails } from "../../../../delivery/addDriver";

export async function createDeliveryDriver(userId: number, serviceProvider: ServiceProvider, addDriverDetails: AddDriverDetails): Promise<DeliveryDriver> {
    let chain = getHasura();
    let response = await chain.query({
        delivery_driver: [{
            where: {
                user_id: {
                    _eq: userId,
                },
                delivery_company_type: {
                    _eq: serviceProvider.serviceProviderType
                },
                delivery_company_id: {
                    _eq: serviceProvider.id
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
                delivery_company_type: serviceProvider.serviceProviderType,
                delivery_company_id: serviceProvider.id,
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
    if(!(response.notification_info.length) && addDriverDetails.notificationToken) {
        await chain.mutation({
            insert_notification_info_one: [{
                object: {
                    app_type_id: AppType.DeliveryApp,
                    token: addDriverDetails.notificationToken,
                    user_id: userId
                }
            }, {
                id: true
            }]
        });
    }
    let deliveryCompanyType: DeliveryServiceProviderType;
    switch (serviceProvider.serviceProviderType) {
        case ServiceProviderType.Restaurant:
            deliveryCompanyType = DeliveryServiceProviderType.Restaurant
            break;
        case ServiceProviderType.Laundry:
            deliveryCompanyType = DeliveryServiceProviderType.Laundry
            break;
        case ServiceProviderType.Delivery:
            deliveryCompanyType = DeliveryServiceProviderType.DeliveryCompany
            break;
        default:
            throw new HttpsError(
                "internal",
                "invalid service provider type"
            )
    }
    return {
        id: mutationResponse.insert_delivery_driver_one?.id,
        userId,
        deliveryCompanyType,
        deliveryCompanyId: serviceProvider.id,
        status: AuthorizationStatus.AwaitingApproval,
        notificationInfo: (addDriverDetails.notificationToken) ? {
            appType: AppType.DeliveryApp,
            token: addDriverDetails.notificationToken,
            turnOffNotifications: false
        }: undefined,
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