import * as functions from "firebase-functions";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as rootNodes from "../shared/databaseNodes/root";
import { isSignedIn } from "../shared/helper/authorizer";
import { ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { getUserInfo } from "../shared/rootController";
import { OrderRequest } from "../shared/models/taxi/OrderRequest";
import { constructTaxiOrder } from "../shared/models/taxi/TaxiOrder";

export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  let customerId: string = context.auth!.uid;
  let orderRequest: OrderRequest = <OrderRequest>data;

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
    // let customerInProcessOrders = (await customerNodes.inProcessOrders(uid).once('value')).val();
    // check if customer is already in another taxi
    // if (customerCurrentOrder) {
    //   firebase.database().ref(`users/${uid}/lock`).remove()
    //   return {
    //     status: "Error",
    //     errorMessage: "Customer is already in another taxi"
    //   }
    // }

    // notification.notifyDriversNewRequest(firebase);

    let userInfo = await getUserInfo(customerId);
    let order = constructTaxiOrder(orderRequest, userInfo);
    let orderRef = await customerNodes.inProcessOrders(customerId).push(order);
    rootNodes.openOrders(OrderType.Taxi, orderRef.key!).set(order);

    return {
      status: ServerResponseStatus.Success,
      orderId: orderRef.key!
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
});