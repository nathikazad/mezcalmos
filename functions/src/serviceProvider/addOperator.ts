import { pushNotification } from "../utilities/senders/notifyUser";
import { createDeliveryOperator } from "../shared/graphql/delivery/operator/createDeliveryOperator";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getServiceProviderFromUniqueId } from "../shared/graphql/getServiceProvider";
import { createLaundryOperator } from "../shared/graphql/laundry/operator/createLaundryOperator";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { createRestaurantOperator } from "../shared/graphql/restaurant/operators/createRestaurantOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { getUser } from "../shared/graphql/user/getUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { MezError } from "../shared/models/Generic/Generic";
import { UserInfo } from "../shared/models/Generic/User";
import { AuthorizeOperatorNotification, NotificationType, NotificationAction, Notification } from "../shared/models/Notification";
import { Operator, ServiceProvider, ServiceProviderType } from "../shared/models/Services/Service";

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
    let participantType: ParticipantType;
    switch (serviceProvider.serviceProviderType) {
        case ServiceProviderType.Restaurant:
            operators = await getRestaurantOperators(serviceProvider.id);
            participantType = ParticipantType.RestaurantOperator;
            break;
        case ServiceProviderType.DeliveryCompany:
            operators = await getDeliveryOperators(serviceProvider.id);
            participantType = ParticipantType.DeliveryOperator;
            break;
        case ServiceProviderType.Laundry:
            operators = await getLaundryOperators(serviceProvider.id);
            participantType = ParticipantType.LaundryOperator;
            break;
        default:
            return;
    }
    operators.forEach((o) => {
        if (o.owner && o.user) {
            pushNotification(
                o.user.firebaseId,
                notification,
                o.notificationInfo,
                participantType,
                o.user.language
            );
        }
    });
}
