import { pushNotification } from "../../utilities/senders/notifyUser";
import { createDeliveryOperator } from "../graphql/delivery/operator/createDeliveryOperator";
import { getDeliveryOperators } from "../graphql/delivery/operator/getDeliveryOperator";
import { createLaundryOperator } from "../graphql/laundry/operator/createLaundryOperator";
import { getLaundryOperators } from "../graphql/laundry/operator/getLaundryOperator";
import { createRestaurantOperator } from "../graphql/restaurant/operators/createRestaurantOperator";
import { getRestaurantOperators } from "../graphql/restaurant/operators/getRestaurantOperators";
import { getUser } from "../graphql/user/getUser";
import { ParticipantType } from "../models/Generic/Chat";
import { DeliveryOperator } from "../models/Generic/Delivery";
import { AppType, NotificationInfo } from "../models/Generic/Generic";
import { UserInfo } from "../models/Generic/User";
import { AuthorizeOperatorNotification, NotificationType, NotificationAction, Notification } from "../models/Notification";
import { Operator } from "../models/Services/Service";


export interface AddOperatorDetails {
    serviceProviderId: number,
    appType: AppType
    notificationInfo?: NotificationInfo,
    appVersion?: string
}
export async function addOperator(operatorUserId: number, addOpDetails: AddOperatorDetails) {
    let operatorUserInfo: UserInfo = await getUser(operatorUserId);

    switch (addOpDetails.appType) {
        case AppType.RestaurantApp:
            await createRestaurantOperator(operatorUserId, addOpDetails);
            break;
        case AppType.DeliveryAdmin:
            await createDeliveryOperator(operatorUserId, addOpDetails)
            break;
        case AppType.LaundryApp:
            await createLaundryOperator(operatorUserId, addOpDetails)
            break;
        default:
            break;
    }
    
    notify(operatorUserInfo, addOpDetails);
}

async function notify(operatorUserInfo: UserInfo, addOpDetails: AddOperatorDetails) {

    let notification: Notification = {
        foreground: <AuthorizeOperatorNotification>{
            newOperatorName: operatorUserInfo.name,
            newOperatorImage: operatorUserInfo.image,
            serviceProviderId: addOpDetails.serviceProviderId,
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
    switch (addOpDetails.appType) {
        case AppType.RestaurantApp:
            operators = await getRestaurantOperators(addOpDetails.serviceProviderId);
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
        case AppType.DeliveryAdmin:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(addOpDetails.serviceProviderId);
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
        case AppType.LaundryApp:
            operators = await getLaundryOperators(addOpDetails.serviceProviderId);
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
