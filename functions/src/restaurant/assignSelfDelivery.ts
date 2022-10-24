import * as functions from "firebase-functions";

import * as restaurantNodes from "../shared/databaseNodes/services/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import *  as rootNodes from "../shared/databaseNodes/root";
import {checkRestaurantOperator} from "../restaurant/helper"

import {
  ServerResponse,
  ServerResponseStatus,
} from "../shared/models/Generic/Generic";
import {  isSignedIn } from "../shared/helper/authorizer";
import { OrderType } from "../shared/models/Generic/Order";

export const assignSelfDelivery = functions.https.onCall(async (data, context) => {
  let response: ServerResponse | undefined = await isSignedIn(context.auth);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }
 let isOp = await checkRestaurantOperator(data.restaurantId, context.auth?.uid!)
  if (isOp != undefined) {
    return {
      ok: false,
      error: isOp
    };
  }
  // response = await checkDeliveryAdmin(context.auth!.uid);
  // if (response != undefined) {
  //   return {
  //     ok: false,
  //     error: response,
  //   };
  // }

  if (data.enable == undefined || !data.orderId || !data.customerId  || !data.restaurantId || !data.orderType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters orderId and restaurantId and orderType,customerId,enable",
    };
  }
  customerNodes.inProcessOrders(data.customerI, data.orderId).child("selfDelivery").set(data.enable);
  if (data.orderType == OrderType.Restaurant) {
    await restaurantNodes
      .inProcessOrders(data.restaurantId,data.orderId)
      .child("selfDelivery")
      .set(data.enable);
  } else if (data.orderType == OrderType.Laundry) {
    await laundryNodes
    .inProcessOrders(data.restaurantId,data.orderId)
    .child("selfDelivery")
    .set(data.enable);
  }
  rootNodes.inProcessOrders(data.orderType, data.orderId).child("selfDelivery").set(data.enable);
  return { status: ServerResponseStatus.Success };
});
export const assignSelfDeliveryTime = functions.https.onCall(async (data, context) => {
  // check auth //
  let response: ServerResponse | undefined = await isSignedIn(context.auth);
  if (response != undefined) {
    return {
      ok: false,
      error: response,
    };
  }
  // check params //
  if (!data.time || !data.orderId || !data.customerId  || !data.restaurantId || !data.orderType) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "required parameters orderId and restaurantId and orderType,customerId,time",
    };
  }
   // check is operator
  let isOp = await checkRestaurantOperator(data.restaurantId, context.auth?.uid!)
  if (isOp != undefined) {
    return {
      ok: false,
      error: isOp
    };
  }
  customerNodes.inProcessOrders(data.customerI, data.orderId).child("selfDeliveryDetails/estDeliveryTime").set(data.time);
  if (data.orderType == OrderType.Restaurant) {
    await restaurantNodes
      .inProcessOrders(data.restaurantId,data.orderId)
      .child("selfDeliveryDetails/estDeliveryTime")
      .set(data.time);
  } else if (data.orderType == OrderType.Laundry) {
    await laundryNodes
    .inProcessOrders(data.restaurantId,data.orderId)
    .child("selfDeliveryDetails/estDeliveryTime")
    .set(data.time);
  }
  rootNodes.inProcessOrders(data.orderType, data.orderId).child("selfDeliveryDetails/estDeliveryTime").set(data.time);
  
  return { status: ServerResponseStatus.Success };
});
