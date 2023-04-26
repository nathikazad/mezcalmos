import { pushNotification } from "../utilities/senders/notifyUser";
import { deleteDeliveryOperator } from "../shared/graphql/delivery/operator/deleteOperator";
import { getDeliveryOperatorByUserId, getDeliveryOperator } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { deleteLaundryOperator } from "../shared/graphql/laundry/operator/deleteOperator";
import { getLaundryOperator, getLaundryOperatorByUserId } from "../shared/graphql/laundry/operator/getLaundryOperator";
import { updateOperatorStatusToAuthorized } from "../shared/graphql/operator/updateOperatorStatus";
import { deleteRestaurantOperator } from "../shared/graphql/restaurant/operators/deleteOperator";
import { getRestaurantOperator, getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { isMezAdmin } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryOperatorApprovedNotification } from "../shared/models/Generic/Delivery";
import { MezError } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Operator, OperatorApprovedNotification } from "../shared/models/Services/Service";

export interface AuthorizeDetails {
    newOperatorId: number,
    approved: boolean,
    participantType: ParticipantType
}
export interface AuthOperatorResponse {
    success: boolean,
    error?: AuthOperatorError
    unhandledError?: string,
}
export enum AuthOperatorError {
    UnhandledError = "unhandledError",
    OperatorNotFound = "operatorNotFound",
    UnauthorizedAccess = "unauthorizedAccess",
    IncorrectOperatorId = "incorrectOperatorId",
    OperatorDetailsNotFound = "operatorDetailsNotFound",
}

export async function authorizeOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails): Promise<AuthOperatorResponse> {
    try {
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
                notifyOperator(ParticipantType.RestaurantOperator, operator);
                break;
            case ParticipantType.DeliveryOperator:
                let deliveryOperator: Operator = await getDeliveryOperator(authorizeDetails.newOperatorId);

                if(authorizeDetails.approved) {
                    operatorDetailsId = deliveryOperator.detailsId;
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
                notifyOperator(ParticipantType.LaundryOperator, operator);
                break;
            default:
                break;
        }
        if(operatorDetailsId != 0) {
            await updateOperatorStatusToAuthorized(operatorDetailsId);
        }
        return {
            success: true
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(AuthOperatorError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: AuthOperatorError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
    
    function notifyOperator(participantType: ParticipantType, operator: Operator) {
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

    function notifyDeliveryOperator(deliveryOperator: Operator) {
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
        if((await isMezAdmin(ownerUserId)) == true)
            return;
        
        let owner: Operator;
        switch (authorizeDetails.participantType) {
            case ParticipantType.RestaurantOperator:
                owner = await getRestaurantOperatorByUserId(ownerUserId);
                break;
            case ParticipantType.DeliveryOperator:
                owner = await getDeliveryOperatorByUserId(ownerUserId);
                break;
            case ParticipantType.LaundryOperator:
                owner = await getLaundryOperatorByUserId(ownerUserId);
                break;
            default:
                throw new MezError(AuthOperatorError.UnauthorizedAccess);
        }
        if (!owner.owner) {
            throw new MezError(AuthOperatorError.UnauthorizedAccess);
        }
    }
}

