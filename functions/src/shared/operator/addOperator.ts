import { pushNotification } from "../../utilities/senders/notifyUser";
import { createDeliveryOperator } from "../graphql/delivery/operator/createDeliveryOperator";
import { getDeliveryOperators } from "../graphql/delivery/operator/getDeliveryOperator";
import { getServiceProviderFromUniqueId } from "../graphql/getServiceProvider";
import { createLaundryOperator } from "../graphql/laundry/operator/createLaundryOperator";
import { getLaundryOperators } from "../graphql/laundry/operator/getLaundryOperator";
import { createRestaurantOperator } from "../graphql/restaurant/operators/createRestaurantOperator";
import { getRestaurantOperators } from "../graphql/restaurant/operators/getRestaurantOperators";
import { getUser } from "../graphql/user/getUser";
import { ParticipantType } from "../models/Generic/Chat";
import { DeliveryOperator } from "../models/Generic/Delivery";
import { MezError } from "../models/Generic/Generic";
import { UserInfo } from "../models/Generic/User";
import { AuthorizeOperatorNotification, NotificationType, NotificationAction, Notification } from "../models/Notification";
import { Operator, ServiceProvider, ServiceProviderType } from "../models/Services/Service";

export interface AddOperatorDetails {
    uniqueId: string,
    notificationToken?: string,
    appVersion?: string
}
export interface AddOperatorResponse {
    success: boolean,
    error?: AddOperatorError
    unhandledError?: string,
}
export enum AddOperatorError {
    UnhandledError = "unhandledError",
    UserNotFound = "userNotFound",
    ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
    UserAlreadyAnOperator = "userAlreadyAnOperator",
    OperatorCreationError = "operatorCreationError",
    RestaurantNotfound = "restaurantNotfound",
    DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound",
    LaundryStoreNotfound = "laundryStoreNotfound"
}
export async function addOperator(operatorUserId: number, addOpDetails: AddOperatorDetails): Promise<AddOperatorResponse> {
    try {
        let operatorUserInfo: UserInfo = await getUser(operatorUserId);
        let serviceProvider: ServiceProvider = await getServiceProviderFromUniqueId(addOpDetails.uniqueId)

        switch (serviceProvider.serviceProviderType) {
            case ServiceProviderType.Restaurant:
                await createRestaurantOperator(operatorUserId, addOpDetails, serviceProvider);
                break;
            case ServiceProviderType.DeliveryCompany:
                await createDeliveryOperator(operatorUserId, addOpDetails, serviceProvider)
                break;
            case ServiceProviderType.Laundry:
                await createLaundryOperator(operatorUserId, addOpDetails, serviceProvider)
                break;
            default:
                break;
        }
        
        notify(operatorUserInfo, serviceProvider);
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(AddOperatorError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: AddOperatorError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

async function notify(operatorUserInfo: UserInfo, serviceProvider: ServiceProvider) {

    let notification: Notification = {
        foreground: <AuthorizeOperatorNotification>{
            newOperatorName: operatorUserInfo.name,
            newOperatorImage: operatorUserInfo.image,
            serviceProviderId: serviceProvider.id,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.AuthorizeOperator,
            notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
            en: {
                title: `Authorize Operator`,
                body: `An operator named ${operatorUserInfo.name} is requesting to join`
            },
            es: {
                title: `Authorize Operator`,
                body: `An operator named ${operatorUserInfo.name} is requesting to join`
            }
        },
        linkUrl: `/`
    };
    let operators: Operator[];
    switch (serviceProvider.serviceProviderType) {
        case ServiceProviderType.Restaurant:
            operators = await getRestaurantOperators(serviceProvider.id);
            operators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.RestaurantOperator,
                        o.user.language
                    );
                }
            });
            break;
        case ServiceProviderType.DeliveryCompany:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(serviceProvider.id);
            deliveryOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.DeliveryOperator,
                        o.user.language
                    );
                }
            });
            break;
        case ServiceProviderType.Laundry:
            operators = await getLaundryOperators(serviceProvider.id);
            operators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.LaundryOperator,
                        o.user.language
                    );
                }
            });
            break;
        default:
            break;
    }

}
