import { Language, ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/Services/Taxi/TaxiOrder";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { BackgroundNotification, Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";

export async function forwardToLocalCompany(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.ForwardingToLocalCompany, userId)
  return response;
};

export async function submitForwardResult(userId: string, data: any) {
  if (data.forwardSuccessful)
    return await changeStatus(data, TaxiOrderStatus.ForwardingSuccessful, userId)
  else
    return await changeStatus(data, TaxiOrderStatus.ForwardingUnsuccessful, userId);
};


async function changeStatus(data: any, newStatus: TaxiOrderStatus, userId: string): Promise<ServerResponse> {

  let response = await isSignedIn(userId)
  if (response != undefined) {
    return response;
  }

  response = await checkDeliveryAdmin(userId)
  if (response != undefined) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId: string = data.orderId;
  let order: TaxiOrder;
  if (newStatus == TaxiOrderStatus.ForwardingToLocalCompany)
    order = (await rootDbNodes.openOrders(OrderType.Taxi, orderId).once('value')).val();
  else
    order = (await rootDbNodes.inProcessOrders(OrderType.Taxi, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }


  if (newStatus == TaxiOrderStatus.ForwardingToLocalCompany) {
    if (order.status != TaxiOrderStatus.LookingForTaxi)
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order cannot be forwarded because it is not looking`,
        errorCode: "orderNotIsLooking"
      }
  } else if (order.status != TaxiOrderStatus.ForwardingToLocalCompany)
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be set to forwarded result because status is not forwarding`,
      errorCode: "orderNotInForwarding"
    }

  order.status = newStatus;

  let backgroundNotification: BackgroundNotification = Object.assign({}, taxiOrderStatusChangeMessages[order.status]);
  if (newStatus == TaxiOrderStatus.ForwardingSuccessful && data.taxiNumber) {
    backgroundNotification[Language.EN].body.replace(", ", ` ${data.taxiNumber} `);
    backgroundNotification[Language.ES].body.replace(", ", ` ${data.taxiNumber} `);
    order.driver = {
      taxiNumber: data.taxiNumber,
      id: "none",
      image: "none"
    }
  }

  let notification: Notification = {
    foreground: <TaxiOrderStatusChangeNotification>{
      status: order.status,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Taxi,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: backgroundNotification!,
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Taxi, orderId)
  }

  pushNotification(order.customer.id!, notification);

  if (newStatus == TaxiOrderStatus.ForwardingToLocalCompany) {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Taxi, orderId).set(order);
    await rootDbNodes.openOrders(OrderType.Taxi, orderId).remove();
  } else {
    await rootDbNodes.pastOrders(OrderType.Taxi, orderId).set(order);
    await rootDbNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
    customerNodes.inProcessOrders(order.customer.id!, orderId).remove();
    customerNodes.pastOrders(order.customer.id!, orderId).set(order);
  }
  return { status: ServerResponseStatus.Success }
}