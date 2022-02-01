// const hasuraModule = require("../hasura");
// const hasura = new hasuraModule.Hasura(keys.hasura);
import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import * as customerNodes from "../shared/databaseNodes/customer";
import { isSignedIn } from "../shared/helper/authorizer";
import { AuthorizationStatus, ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { UserInfo } from "../shared/models/User";
import { Taxi } from "../shared/models/taxi/Taxi";
import { CounterOfferStatus, TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/taxi/TaxiOrder";
import { buildChatForOrder } from "../shared/helper/chat";
import { ParticipantType } from "../shared/models/Chat";
import { push } from "../shared/notification/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { getUserInfo } from "../shared/controllers/rootController";
import { getTaxi } from "../shared/controllers/taxiController";

export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  if (!data.orderId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Required orderId"
    }
  }
  let taxiId: string = data.counterOfferDriverId || context.auth!.uid;
  let orderId: string = data.orderId;
  let taxi: Taxi = (await getTaxi(taxiId));
  console.log(`Got taxi ${taxi}`);
  if (!taxi || !taxi.state ||
    taxi.state.authorizationStatus != AuthorizationStatus.Authorized) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "User is not an authorized driver"
    }
  }

  if (taxi.state.currentOrderId != undefined) {
    return {
      status: "Error",
      errorMessage: "Driver is already in another taxi"
    }
  }
  let driverInfo: UserInfo = await getUserInfo(taxiId);

  let transactionResponse = await rootNodes.openOrders(OrderType.Taxi, orderId).transaction(function (order) {
    if (order != null) {
      if (order.lock == true) {
        return
      } else {
        order.lock = true
        return order
      }
    }
    return order
  })


  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Order is locked in another request"
    };
  }

  try {
    let order: TaxiOrder = transactionResponse.snapshot.val();
    delete order.lock;
    if (!order) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Order is is not available anymore"
      };
    }

    if (order.customer.id == taxiId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Driver and Customer cannot have same id"
      }
    }

    if (order.status != TaxiOrderStatus.LookingForTaxi) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `${data.orderId} status is not lookingForTaxi but ${order.status}`
      };
    }

    if (data.counterOfferDriverId) {
      if (!order.counterOffers || !order.counterOffers![data.counterOfferDriverId]
        || order.counterOffers![data.counterOfferDriverId].status != CounterOfferStatus.Accepted) {
        return {
          status: ServerResponseStatus.Error,
          errorMessage: `No valid counter offer from driver ${data.counterOfferDriverId} found`
        }
      }
      order.cost = order.counterOffers![data.counterOfferDriverId].price
    }

    order.status = TaxiOrderStatus.OnTheWay;
    order.acceptRideTime = (new Date()).toISOString()
    order.driver = {
      id: taxiId,
      name: driverInfo.name,
      image: driverInfo.image,
      language: driverInfo.language,
      taxiNumber: taxi.details?.taxiNumber ?? "00-000",
    }

    await taxiNodes.inProcessOrders(taxiId, orderId).set(order);
    taxiNodes.currentOrderIdNode(taxiId).set(orderId);

    rootNodes.inProcessOrders(OrderType.Taxi, orderId).set(order);
    rootNodes.openOrders(OrderType.Taxi, orderId).remove();

    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);


    await buildChatForOrder(
      order.customer.id,
      {
        ...order.customer,
        particpantType: ParticipantType.Customer
      },
      taxiId,
      {
        ...driverInfo,
        particpantType: ParticipantType.Taxi
      },
      OrderType.Taxi,
      orderId);


    let notification: Notification = {
      foreground: <TaxiOrderStatusChangeNotification>{
        status: TaxiOrderStatus.OnTheWay,
        time: (new Date()).toISOString(),
        notificationType: NotificationType.OrderStatusChange,
        orderType: OrderType.Taxi,
        notificationAction: NotificationAction.ShowSnackBarAlways,
        orderId: orderId
      },
      background: taxiOrderStatusChangeMessages[TaxiOrderStatus.OnTheWay]
    }

    push(order.customer.id!, notification);

    return {
      status: ServerResponseStatus.Success,
      func: "accepted"
    };
  } catch (e) {
    
    functions.logger.error(`Order request error ${orderId}`);
    functions.logger.error(e);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order accept error"
    }
  } finally {
    rootNodes.openOrders(OrderType.Taxi, orderId).child("lock").remove();
  }

});
