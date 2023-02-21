// import { HttpsError } from "firebase-functions/v1/auth";
// import { deleteDeliveryOperator } from "../shared/graphql/delivery/operator/deleteOperator";
// import { getDeliveryOperator, getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
// import { updateDeliveryOperatorStatusToAuthorized } from "../shared/graphql/delivery/operator/updateOperatorStatus";
// import { ParticipantType } from "../shared/models/Generic/Chat";
// import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
// import { DeliveryOperatorApprovedNotification } from "../shared/models/Generic/Delivery";
// import { pushNotification } from "../utilities/senders/notifyUser";

// export interface AuthorizeDetails {
//     newOperatorId: number,
//     approved: boolean
// }
 
// export async function authorizeDeliveryOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails) {

//     let deliveryOperator = await getDeliveryOperatorByUserId(ownerUserId);
//     if(!(deliveryOperator.owner)) {
//         throw new HttpsError(
//             "internal",
//             "Only owner can add operators"
//         );
//     }
//     let operator = await getDeliveryOperator(authorizeDetails.newOperatorId);
//     if(authorizeDetails.approved) {
//         await updateDeliveryOperatorStatusToAuthorized(authorizeDetails.newOperatorId)
//     } else {
//         await deleteDeliveryOperator(authorizeDetails.newOperatorId);
//     }

//     let notification: Notification = {
//         foreground: <DeliveryOperatorApprovedNotification>{
//             operatorId: authorizeDetails.newOperatorId,
//             approved: authorizeDetails.approved,
//             time: (new Date()).toISOString(),
//             notificationType: NotificationType.OperatorApproved,
//             notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
//         },
//         background: (authorizeDetails.approved) ? {
//             en: {
//                 title:  `Authorized`,
//                 body: `You have been approved as an operator`
//             },
//             es: {
//                 title: `Autorizado`,
//                 body: `Has sido aprobado como operador`
//             }
//         } : {
//             en: {
//                 title: `Not approved`,
//                 body: `Your request to become an operator has been denied`
//             },
//             es: {
//                 title: `No aprovado`,
//                 body: `Tu solicitud para convertirte en operador ha sido denegada`
//             }
//         },
//         linkUrl: `/`
//     }
//     if(operator.user) {
//         pushNotification(
//             operator.user.firebaseId, 
//             notification, 
//             operator.notificationInfo, 
//             ParticipantType.DeliveryOperator,
//             operator.user.language,
//         );
//     }
// }