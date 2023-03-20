import { HttpsError } from "firebase-functions/v1/auth";
import { pushNotification } from "../../utilities/senders/notifyUser";
import { deleteDeliveryOperator } from "../graphql/delivery/operator/deleteOperator";
import { getDeliveryOperator, getDeliveryOperatorByUserId } from "../graphql/delivery/operator/getDeliveryOperator";
import { deleteLaundryOperator } from "../graphql/laundry/operator/deleteOperator";
import { getLaundryOperator, getLaundryOperatorByUserId } from "../graphql/laundry/operator/getLaundryOperator";
import { deleteRestaurantOperator } from "../graphql/restaurant/operators/deleteOperator";
import { getRestaurantOperator, getRestaurantOperatorByUserId } from "../graphql/restaurant/operators/getRestaurantOperators";
import { isMezAdmin } from "../helper";
import { ParticipantType } from "../models/Generic/Chat";
import { DeliveryOperator, DeliveryOperatorRemovedNotification } from "../models/Generic/Delivery";
import { NotificationType, NotificationAction, Notification } from "../models/Notification";
import { Operator, OperatorRemovedNotification } from "../models/Services/Service";


export interface RemoveOperatorDetails {
    operatorId: number,
    participantType: ParticipantType
}
export async function removeOperator(ownerUserId: number, removeOpDetails: RemoveOperatorDetails) {
    let operator: Operator;

    await authorizationCheck();
    
    switch (removeOpDetails.participantType) {
        case ParticipantType.RestaurantOperator:
            operator = await getRestaurantOperator(removeOpDetails.operatorId);

            await deleteRestaurantOperator(operator);

            notifyOperator(ParticipantType.RestaurantOperator);
            break;
        case ParticipantType.DeliveryOperator:
            let deliveryOperator: DeliveryOperator = await getDeliveryOperator(removeOpDetails.operatorId);

            await deleteDeliveryOperator(deliveryOperator);

            notifyDeliveryOperator(deliveryOperator);
            break;
        case ParticipantType.LaundryOperator:
            operator = await getLaundryOperator(removeOpDetails.operatorId);

            await deleteLaundryOperator(operator);

            notifyOperator(ParticipantType.LaundryOperator);
            break;
        default:
            break;
    }
    
    function notifyOperator(participantType: ParticipantType) {
        let notification: Notification = {
            foreground: <OperatorRemovedNotification>{
                operatorId: removeOpDetails.operatorId,
                participantType,
                time: new Date().toISOString(),
                notificationType: NotificationType.OperatorRemoved,
                notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
            },
            background: {
                en: {
                    title: `Fired`,
                    body: `You have been removed as an operator`,
                },
                es: {
                    title: `Despedido`,
                    body: `Has sido eliminado como operador`,
                },
            },
            linkUrl: `/`,
        };
        if (operator.user) {
            pushNotification(
                operator.user.firebaseId,
                notification,
                operator.notificationInfo,
                participantType,
                operator.user.language
            );
        }
    }

    function notifyDeliveryOperator(deliveryOperator: DeliveryOperator) {
        let notification: Notification = {
            foreground: <DeliveryOperatorRemovedNotification>{
                operatorId: removeOpDetails.operatorId,
                time: (new Date()).toISOString(),
                notificationType: NotificationType.OperatorRemoved,
                notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
            },
            background: {
                en: {
                    title: `Fired`,
                    body: `You have been removed as an operator`,
                },
                es: {
                    title: `Despedido`,
                    body: `Has sido eliminado como operador`,
                },
            },
            linkUrl: `/`
        };
        if (deliveryOperator.user) {
            pushNotification(
                deliveryOperator.user.firebaseId,
                notification,
                deliveryOperator.notificationInfo,
                ParticipantType.DeliveryOperator,
                deliveryOperator.user.language
            );
        }
    }

    async function authorizationCheck() {
        if((await isMezAdmin(ownerUserId)) == true)
            return;
        
        let owner: boolean = true;
        switch (removeOpDetails.participantType) {
            case ParticipantType.RestaurantOperator:
                let restaurantOwner: Operator = await getRestaurantOperatorByUserId(ownerUserId);
                owner = restaurantOwner.owner ?? false;
                break;
            case ParticipantType.DeliveryOperator:
                let deliveryOwner: DeliveryOperator = await getDeliveryOperatorByUserId(ownerUserId);
                owner = deliveryOwner.owner;
                break;
            case ParticipantType.LaundryOperator:
                let laundryOwner: Operator = await getLaundryOperatorByUserId(ownerUserId);
                owner = laundryOwner.owner ?? false;
                break;
            default:
                break;
        }
        if (!owner) {
            throw new HttpsError("internal", "Only owner can remove operators");
        }
    }

}