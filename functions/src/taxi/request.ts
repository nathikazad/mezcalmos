import * as functions from "firebase-functions";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as rootNodes from "../shared/databaseNodes/root";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import {  OrderType } from "../shared/models/Generic/Order";
import { TaxiOrderRequest } from "../shared/models/Services/Taxi/TaxiOrderRequest";
import { constructTaxiOrder } from "../shared/models/Services/Taxi/TaxiOrder";
import { getUser } from "../shared/graphql/user/getUser";
import { DeliveryAdmin } from "../shared/models/Generic/Delivery";
// import { pushNotification } from "../utilities/senders/notifyUser";

export async function requestRide(userId: string, data: any) {
  // let response = isSignedIn(userId)
  // if (response != undefined)
  //   return response;

  let customerId: string = userId;
  let orderRequest: TaxiOrderRequest = <TaxiOrderRequest>data;
  console.log(orderRequest);

  let transactionResponse = await customerNodes.lock(customerId).transaction(function (lock) {
    if (lock == true) {
      return
    } else {
      return true
    }
  })

  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: 'Customer lock not available'
    }
  }

  try {
    // let customerInProcessOrders: Record<string, Order> = (await customerNodes.inProcessOrders(customerId).once('value')).val();
    // check if customer is already in another taxi
    // if (customerInProcessOrders != null && Object.values(customerInProcessOrders).filter(order => order.orderType == OrderType.Taxi).length > 0) {
    //   return {
    //     status: "Error",
    //     errorMessage: "Customer is already in another taxi"
    //   }
    // }

    let userInfo = await getUser(parseInt(customerId));
    let order = constructTaxiOrder(orderRequest, userInfo);
    let orderRef = await customerNodes.inProcessOrders(customerId).push(order);
    let orderId = orderRef.key!
    rootNodes.openOrders(OrderType.Taxi, orderId).set(order);

    // let chat: ChatObject = await buildChatForOrder(
    //   orderId,
    //   OrderType.Taxi,
    // );

    
    // chat.addParticipant(
    // {
    //   ...userInfo,
    //   particpantType: ParticipantType.Customer
    // });

    // await chatController.setChat(parseInt(orderId), chat.chatData);


    deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
      let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
      // chatController.addParticipantsToChat(Object.keys(deliveryAdmins), chat, parseInt(orderId), ParticipantType.DeliveryOperator)
      notifyDeliveryAdminsNewOrder(deliveryAdmins, orderId)
    })
    

    return {
      status: ServerResponseStatus.Success,
      orderId: orderId
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order request error"
    }
  } finally {
    await customerNodes.lock(customerId).remove();
  }
};

async function notifyDeliveryAdminsNewOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {

  // let notification: Notification = {
  //   foreground: <OrderNotification>{
  //     time: (new Date()).toISOString(),
  //     notificationType: NotificationType.NewOrder,
  //     orderType: OrderType.Taxi,
  //     orderId: orderId,
  //     notificationAction: NotificationAction.ShowSnackBarAlways,
  //   },
  //   background: {
  //     [Language.ES]: {
  //       title: "Nueva Pedido",
  //       body: `Hay una nueva orden de taxi`
  //     },
  //     [Language.EN]: {
  //       title: "New Order",
  //       body: `There is a new taxi order`
  //     }
  //   },
  //   linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Taxi, orderId)
  // }

  // for (let adminId in deliveryAdmins) {
  //   pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  // }
}