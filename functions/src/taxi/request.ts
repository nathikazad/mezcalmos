// const notification = require("../notification");
// const firebase = require("firebase-admin");
// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");
// const hasura = new hasuraModule.Hasura(keys.hasura)
import * as functions from "firebase-functions";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as rootNodes from "../shared/databaseNodes/root";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic";
import { OrderType } from "../shared/models/Order";
import { OrderRequest } from "./models/OrderRequest";
import { constructTaxiOrder } from "./models/TaxiOrder";

export = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = await request(context.auth.uid, <OrderRequest>data)
  return response
});

async function request(uid: string, orderRequest: OrderRequest): Promise<ServerResponse> {
  let response = await customerNodes.lock(uid).transaction(function (lock) {
    if (lock == true) {
      return
    } else {
      return true
    }
  })

  if (!response.committed) {
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

    let userInfo = (await rootNodes.userInfo(uid).once('value')).val();
    let order = constructTaxiOrder(orderRequest, userInfo);
    let orderRef = await customerNodes.inProcessOrders(uid).push(order);
    rootNodes.openOrders(OrderType.Taxi, orderRef.key!).set(order);
    await customerNodes.lock(uid).remove();
    return {
      status: ServerResponseStatus.Success,
      orderId: orderRef.key!
    }
  } catch (e) {
    console.log("Order creation error");
    await customerNodes.lock(uid).remove();
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order creation error"
    }
  }
}