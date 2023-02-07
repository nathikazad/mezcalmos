import { OrderType } from "../shared/models/Generic/Order";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { DelivererStatus, DeliveryDriver, DeliveryOperatorStatus, DeliveryOrder, NewDeliveryOrderNotification, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { assignDeliveryDriver } from "../shared/graphql/delivery/driver/assignDeliverer";
import { setDeliveryChatInfo } from "../shared/graphql/chat/setChatInfo";
import { HttpsError } from "firebase-functions/v1/auth";
import { deleteDeliveryChatMessagesAndParticipant } from "../shared/graphql/chat/deleteChatMessages";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { isMezAdmin } from "../shared/helper";
import { OperatorStatus } from "../shared/models/Services/Service";
import { ParticipantType } from "../shared/models/Generic/Chat";

export interface AssignDriverDetails {
  deliveryOrderId: number,
  deliveryDriverId: number,
  orderType: OrderType,
  deliveryDriverType: ParticipantType,
  changeDriver?: boolean,
  deliveryCompanyId: number
}

export async function assignDriver(userId: number, assignDriverDetails: AssignDriverDetails) {

  let deliveryOrderPromise = getDeliveryOrder(assignDriverDetails.deliveryOrderId);
  let deliveryDriverPromise = getDeliveryDriver(assignDriverDetails.deliveryDriverId, assignDriverDetails.deliveryDriverType);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];

  if((await isMezAdmin(userId)) == false) {

    await checkIfOperatorAuthorized(deliveryOrder, userId);
  }
  if(deliveryDriver.status != DelivererStatus.Authorized) {
    throw new HttpsError(
      "internal",
      "delivery driver not authorized"
    );
  }
  if (deliveryOrder.deliveryDriverId != null){ 
    if (assignDriverDetails.changeDriver) {
      await deleteDeliveryChatMessagesAndParticipant(deliveryOrder);
    } else {
      throw new HttpsError(
        "internal",
        "delivery driver already assigned"
      );
    }
  }
  
  await assignDeliveryDriver(assignDriverDetails, deliveryDriver.userId);

  setDeliveryChatInfo(deliveryOrder, deliveryDriver, assignDriverDetails.orderType);
    
  sendNotificationToDriver(deliveryDriver, assignDriverDetails);
};

function sendNotificationToDriver(deliveryDriver: DeliveryDriver, assignDriverDetails: AssignDriverDetails) {
  if (deliveryDriver.notificationInfo) {

    let notification: Notification = {
      foreground: <NewDeliveryOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: assignDriverDetails.orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: assignDriverDetails.deliveryOrderId,
        deliveryDriverType: assignDriverDetails.deliveryDriverType
      },
      background: deliveryNewOrderMessage,
      linkUrl: orderUrl(assignDriverDetails.orderType, assignDriverDetails.deliveryOrderId)
    };

    pushNotification(
      deliveryDriver.user!.firebaseId!,
      notification,
      deliveryDriver.notificationInfo,
      deliveryDriver.deliveryDriverType
    );
  }
}

async function checkIfOperatorAuthorized(deliveryOrder: DeliveryOrder, userId: number) {
  let operator;
  switch (deliveryOrder.serviceProviderType) {
    case DeliveryServiceProviderType.DeliveryCompany:
      operator = await getDeliveryOperatorByUserId(userId);
      if (operator.status != DeliveryOperatorStatus.Authorized || operator.deliveryCompanyId != deliveryOrder.serviceProviderId) {
        throw new HttpsError(
          "internal",
          "Invalid operator"
        );
      }
      break;
    case DeliveryServiceProviderType.Restaurant:
      operator = await getRestaurantOperatorByUserId(userId);
      if (operator.status != OperatorStatus.Authorized || operator.serviceProviderId != deliveryOrder.serviceProviderId) {
        throw new HttpsError(
          "internal",
          "Invalid operator"
        );
      }
      break;
    default:
      break;
  }
}