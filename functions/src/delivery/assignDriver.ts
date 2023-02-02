import { OrderType } from "../shared/models/Generic/Order";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import { DelivererStatus, DeliveryCompanyType, DeliveryDriver, DeliveryDriverType, DeliveryOperatorStatus, DeliveryOrder, DeliveryOrderStatus, NewDeliveryOrderNotification, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { assignDeliveryDriver } from "../shared/graphql/delivery/driver/assignDeliverer";
import { setDeliveryChatInfo } from "../shared/graphql/chat/setChatInfo";
import { HttpsError } from "firebase-functions/v1/auth";
import { deleteDeliveryChatMessagesAndParticipant } from "../shared/graphql/chat/deleteChatMessages";
import { getDeliveryOperatorByUserId } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperatorByUserId } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { OperatorStatus } from "../shared/models/Services/Restaurant/Restaurant";
import { isMezAdmin } from "../shared/helper";

export interface AssignDriverDetails {
  deliveryOrderId: number,
  deliveryDriverId: number,
  orderType: OrderType,
  deliveryDriverType: DeliveryDriverType,
  changeDriver?: boolean,
  deliveryCompanyId: number
}

export async function assignDriver(userId: number, assignDriverDetails: AssignDriverDetails) {

  let deliveryOrderPromise = getDeliveryOrder(assignDriverDetails.deliveryOrderId);
  let deliveryDriverPromise = getDeliveryDriver(assignDriverDetails.deliveryDriverId, assignDriverDetails.deliveryDriverType);
  let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
  let deliveryOrder: DeliveryOrder = promiseResponse[0];
  let deliveryDriver: DeliveryDriver = promiseResponse[1];
  if(!(deliveryOrder.serviceProviderType)) {
    throw new HttpsError(
      "internal",
      "delivery order does not have a service provider"
    );
  }
  if(!isMezAdmin(userId)) {
    let operator;
    if(deliveryOrder.serviceProviderType == DeliveryServiceProviderType.DeliveryCompany) {
      operator = await getDeliveryOperatorByUserId(userId);
      if(operator.status != DeliveryOperatorStatus.Authorized) {
        throw new HttpsError(
          "internal",
          "delivery operator not authorized"
        );
      }
      if(operator.deliveryCompanyId != deliveryOrder.serviceProviderId) {
        throw new HttpsError(
          "internal",
          "delivery company assigned to order and that of operator do not match"
        );
      }
    } else {
      operator = await getRestaurantOperatorByUserId(userId);
    
      if(operator.status != OperatorStatus.Authorized) {
        throw new HttpsError(
          "internal",
          "Restaurant operator not authorized"
        );
      }
      if(operator.restaurantId != deliveryOrder.serviceProviderId) {
        throw new HttpsError(
          "internal",
          "Restaurant belonging to this order and the restaurant of operator do not match"
        );
      }
    }
  }
  if(deliveryOrder.status != DeliveryOrderStatus.OrderReceived && 
    deliveryOrder.status != DeliveryOrderStatus.PackageReady) {
    throw new HttpsError(
      "internal",
      "delivery order is already assigned, complete or cancelled"
    );
  }
  if(deliveryOrder.deliveryDriverId != null) {
    throw new HttpsError(
      "internal",
      "delivery driver already assigned"
    );
  }
  if(deliveryDriver.deliveryDriverType == DeliveryDriverType.DeliveryDriver) {
    if(deliveryDriver.status != DelivererStatus.Authorized) {
      throw new HttpsError(
        "internal",
        "delivery driver not authorized"
      );
    }
    if(deliveryDriver.online != true) {
      throw new HttpsError(
        "internal",
        "delivery driver not online"
      );
    }
  }
  if(((deliveryOrder.serviceProviderType == DeliveryServiceProviderType.DeliveryCompany) 
      && (deliveryDriver.deliveryCompanyType == DeliveryCompanyType.Restaurant))
    || ((deliveryOrder.serviceProviderType == DeliveryServiceProviderType.Restaurnt) 
      && (deliveryDriver.deliveryCompanyType == DeliveryCompanyType.DeliveryCompany))) {
    throw new HttpsError(
      "internal",
      "Order service provider type and driver company type does not match"
    );
  }
  if(deliveryOrder.serviceProviderId != deliveryDriver.deliveryCompanyId) {
    throw new HttpsError(
      "internal",
      "Order service provider id and driver company id does not match"
    );
  }
  if (assignDriverDetails.changeDriver) {
    await deleteDeliveryChatMessagesAndParticipant(deliveryOrder);
  }
  
  await assignDeliveryDriver(assignDriverDetails, deliveryDriver.userId);

  setDeliveryChatInfo(deliveryOrder, deliveryDriver);
    
  if(deliveryDriver.notificationInfo) {

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
    }
    let participantType: ParticipantType = deliveryDriver.deliveryDriverType == DeliveryDriverType.DeliveryDriver
      ? ParticipantType.DeliveryDriver
      : ParticipantType.RestaurantOperator;

    pushNotification(
      deliveryDriver.user?.firebaseId!, 
      notification, 
      deliveryDriver.notificationInfo, 
      participantType
    );
  }
};