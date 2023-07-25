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
import { MezError } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Operator, OperatorApprovedNotification } from "../shared/models/Services/Service";
import { getBusinessOperator, getBusinessOperatorByUserId } from "../shared/graphql/business/operator/getBusinessOperator";
import { deleteBusinessOperator } from "../shared/graphql/business/operator/deleteOperator";

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
    InvalidParticipantType = "invalidParticipantType",
}

export async function authorizeOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails): Promise<AuthOperatorResponse> {
    try {
        let operator: Operator | undefined;

        await authorizationCheck();
        
        switch (authorizeDetails.participantType) {
            case ParticipantType.RestaurantOperator:
                operator = await getRestaurantOperator(authorizeDetails.newOperatorId);

                if (authorizeDetails.approved == false) {
                    await deleteRestaurantOperator(operator);
                }
                break;
            case ParticipantType.DeliveryOperator:
                operator = await getDeliveryOperator(authorizeDetails.newOperatorId);

                if(authorizeDetails.approved == false) {
                    await deleteDeliveryOperator(operator);
                }
                break;
            case ParticipantType.LaundryOperator:
                operator = await getLaundryOperator(authorizeDetails.newOperatorId);

                if (authorizeDetails.approved == false) {
                    await deleteLaundryOperator(operator);
                }
                break;
            case ParticipantType.BusinessOperator:
                operator = await getBusinessOperator(authorizeDetails.newOperatorId);

                if (authorizeDetails.approved == false) {
                    await deleteBusinessOperator(operator);
                }
                break;
            default:
                throw new MezError(AuthOperatorError.InvalidParticipantType);
        }
        if(authorizeDetails.approved)
            await updateOperatorStatusToAuthorized(operator, authorizeDetails.participantType);

        notifyOperator(authorizeDetails.participantType, operator);
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
            case ParticipantType.BusinessOperator:
                owner = await getBusinessOperatorByUserId(ownerUserId);
            default:
                throw new MezError(AuthOperatorError.UnauthorizedAccess);
        }
        if (!owner.owner) {
            throw new MezError(AuthOperatorError.UnauthorizedAccess);
        }
    }
}

