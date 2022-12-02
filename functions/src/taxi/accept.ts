// const hasuraModule = require("../hasura");
// const hasura = new hasuraModule.Hasura(keys.hasura);
import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import * as customerNodes from "../shared/databaseNodes/customer";
import { AuthorizationStatus, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { UserInfo } from "../shared/models/Generic/User";
import { Taxi } from "../shared/models/Drivers/Taxi";
import { CounterOfferStatus, TaxiInfo, TaxiOrder, TaxiOrderStatus, TaxiOrderStatusChangeNotification } from "../shared/models/Services/Taxi/TaxiOrder";
import * as chatController from "../shared/controllers/chatController";
import { ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { taxiOrderStatusChangeMessages } from "./bgNotificationMessages";
import { getUserInfo } from "../shared/controllers/rootController";
import { getTaxi } from "../shared/controllers/taxiController";
import { orderUrl } from "../utilities/senders/appRoutes";

export async function acceptRide(userId: string, data: any) {
  // let response = isSignedIn(userId)
  // if (response != undefined)
  //   return response;

  if (!data.orderId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Required orderId"
    }
  }
  let taxiId: string = data.counterOfferDriverId ?? userId;
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

    if (order.customer.firebaseId == taxiId) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: "Driver and Customer cannot have same id"
      }
    }

    if (order.status != TaxiOrderStatus.LookingForTaxi && order.status != TaxiOrderStatus.LookingForTaxiScheduled) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `${data.orderId} status is not lookingForTaxi but ${order.status}`
      };
    }

    if (data.counterOfferDriverId) {
      let orderFromCustomerNode : TaxiOrder = (await customerNodes.inProcessOrders(order.customer.firebaseId, orderId).get()).val();

      if (!orderFromCustomerNode.counterOffers || !orderFromCustomerNode.counterOffers![data.counterOfferDriverId]
        || orderFromCustomerNode.counterOffers![data.counterOfferDriverId].status != CounterOfferStatus.Accepted) {
        return {
          status: ServerResponseStatus.Error,
          errorMessage: `No valid counter offer from driver ${data.counterOfferDriverId} found`
        }
      }
      order.cost = orderFromCustomerNode.counterOffers![data.counterOfferDriverId].price
    }

    order.status = (order.status == TaxiOrderStatus.LookingForTaxi) ? TaxiOrderStatus.OnTheWay : TaxiOrderStatus.Scheduled;
    order.acceptRideTime = (new Date()).toISOString()
    order.driver = <TaxiInfo>{
      id: parseInt(taxiId),
      name: driverInfo.name,
      image: driverInfo.image,
      firebaseId: driverInfo.firebaseId,
      language: driverInfo.language,
      taxiNumber: taxi.details?.taxiNumber ?? "00-000",
    }

    await taxiNodes.inProcessOrders(taxiId, orderId).set(order);
    await taxiNodes.currentOrderIdNode(taxiId).set(orderId);

    rootNodes.inProcessOrders(OrderType.Taxi, orderId).set(order);
    rootNodes.openOrders(OrderType.Taxi, orderId).remove();

    customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);



    let chat: ChatObject = await chatController.getChat(orderId);
    chat.addParticipant({
      ...driverInfo,
      particpantType: ParticipantType.Taxi
    });

    await chatController.setChat(orderId, chat.chatData);

    // Notify customer only if driver is the one initiating the accept
    // not notifying driver because driver will get response within 30 
    // seconds after sending counter offer, can be assumed his phone
    // will be on.
    if (!data.counterOfferDriverId) {
      let notification: Notification = {
        foreground: <TaxiOrderStatusChangeNotification>{
          status: TaxiOrderStatus.OnTheWay,
          time: (new Date()).toISOString(),
          notificationType: NotificationType.OrderStatusChange,
          orderType: OrderType.Taxi,
          notificationAction: NotificationAction.ShowSnackBarAlways,
          orderId: parseInt(orderId)
        },
        background: taxiOrderStatusChangeMessages[TaxiOrderStatus.OnTheWay],
        linkUrl: orderUrl(OrderType.Taxi, parseInt(orderId))
      }

      pushNotification(order.customer.firebaseId!, notification);
    }

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

};
