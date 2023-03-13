import { HttpsError } from "firebase-functions/v1/auth";
import { pushNotification } from "../../utilities/senders/notifyUser";
import { deleteDeliveryOperator } from "../graphql/delivery/operator/deleteOperator";
import { getDeliveryOperatorByUserId, getDeliveryOperator } from "../graphql/delivery/operator/getDeliveryOperator";
import { deleteLaundryOperator } from "../graphql/laundry/operator/deleteOperator";
import { getLaundryOperator, getLaundryOperatorByUserId } from "../graphql/laundry/operator/getLaundryOperator";
import { updateOperatorStatusToAuthorized } from "../graphql/operator/updateOperatorStatus";
import { deleteRestaurantOperator } from "../graphql/restaurant/operators/deleteOperator";
import { getRestaurantOperator, getRestaurantOperatorByUserId } from "../graphql/restaurant/operators/getRestaurantOperators";
import { isMezAdmin } from "../helper";
import { ParticipantType } from "../models/Generic/Chat";
import { DeliveryOperator, DeliveryOperatorApprovedNotification } from "../models/Generic/Delivery";
import { Notification, NotificationAction, NotificationType } from "../models/Notification";
import { Operator, OperatorApprovedNotification } from "../models/Services/Service";

export interface AuthorizeDetails {
    newOperatorId: number,
    approved: boolean,
    participantType: ParticipantType
}

export async function authorizeOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails) {

    let operator: Operator;
    let operatorDetailsId: number = 0;

    await authorizationCheck();
    
    switch (authorizeDetails.participantType) {
        case ParticipantType.RestaurantOperator:
            operator = await getRestaurantOperator(authorizeDetails.newOperatorId);

            if (authorizeDetails.approved) {
                operatorDetailsId = operator.detailsId;
            } else {
                await deleteRestaurantOperator(operator);
            }
            notifyOperator(ParticipantType.RestaurantOperator);
            break;
        case ParticipantType.DeliveryOperator:
            let deliveryOperator: DeliveryOperator = await getDeliveryOperator(authorizeDetails.newOperatorId);

            if(authorizeDetails.approved) {
                operatorDetailsId = deliveryOperator.operatorDetailsId;
            } else {
                await deleteDeliveryOperator(deliveryOperator);
            }
            notifyDeliveryOperator(deliveryOperator);
            break;
        case ParticipantType.LaundryOperator:
            operator = await getLaundryOperator(authorizeDetails.newOperatorId);

            if (authorizeDetails.approved) {
                operatorDetailsId = operator.detailsId;
            } else {
                await deleteLaundryOperator(operator);
            }
            notifyOperator(ParticipantType.LaundryOperator);
            break;
        default:
            break;
    }
    if(operatorDetailsId != 0) {
        updateOperatorStatusToAuthorized(operatorDetailsId);
    }
    
    
    function notifyOperator(participantType: ParticipantType) {
        let notification: Notification = {
            foreground: <OperatorApprovedNotification>{
                operatorId: authorizeDetails.newOperatorId,
                participantType,
                approved: authorizeDetails.approved,
                time: new Date().toISOString(),
                notificationType: NotificationType.OperatorApproved,
                notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
            },
            background: authorizeDetails.approved
                ? {
                    en: {
                        title: `Authorized`,
                        body: `You have been approved as an operator`,
                    },
                    es: {
                        title: `Autorizado`,
                        body: `Has sido aprobado como operador`,
                    },
                }
                : {
                    en: {
                        title: `Not approved`,
                        body: `Your request to become an operator has been denied`,
                    },
                    es: {
                        title: `No aprovado`,
                        body: `Tu solicitud para convertirte en operador ha sido denegada`,
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
            foreground: <DeliveryOperatorApprovedNotification>{
                operatorId: authorizeDetails.newOperatorId,
                approved: authorizeDetails.approved,
                time: (new Date()).toISOString(),
                notificationType: NotificationType.OperatorApproved,
                notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
            },
            background: (authorizeDetails.approved) ? {
                en: {
                    title: `Authorized`,
                    body: `You have been approved as an operator`
                },
                es: {
                    title: `Autorizado`,
                    body: `Has sido aprobado como operador`
                }
            } : {
                en: {
                    title: `Not approved`,
                    body: `Your request to become an operator has been denied`
                },
                es: {
                    title: `No aprovado`,
                    body: `Tu solicitud para convertirte en operador ha sido denegada`
                }
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
        if(await isMezAdmin(ownerUserId))
            return;
            
        switch (authorizeDetails.participantType) {
            case ParticipantType.RestaurantOperator:
                let restaurantOwner: Operator = await getRestaurantOperatorByUserId(ownerUserId);
                if (!restaurantOwner.owner) {
                    throw new HttpsError("internal", "Only owner can add operators");
                }
                break;
            case ParticipantType.DeliveryOperator:
                let deliveryOwner: DeliveryOperator = await getDeliveryOperatorByUserId(ownerUserId);
                if(!(deliveryOwner.owner)) {
                    throw new HttpsError(
                        "internal",
                        "Only owner can add operators"
                    );
                }
                break;
            case ParticipantType.LaundryOperator:
                let laundryOwner: Operator = await getLaundryOperatorByUserId(ownerUserId);
    
                if (!laundryOwner.owner) {
                    throw new HttpsError("internal", "Only owner can add operators");
                }
                break;
            default:
                break;
        }
    }
}

