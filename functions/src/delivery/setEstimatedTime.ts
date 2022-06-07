import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { DeliveryAction, TwoWayDeliverableOrder } from "../shared/models/Generic/Order";
import * as customerNodes from "../shared/databaseNodes/customer";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { isSignedIn } from "../shared/helper/authorizer";
import { DeliveryDriverType } from "../shared/models/Drivers/DeliveryDriver";
import { updateServiceProviderOrder } from "../shared/controllers/orderController";

export = functions.https.onCall(async (data, context) => {

  if (data.orderId == null || data.estimatedTime == null || data.deliveryDriverType == null
    || data.deliveryAction == null || data.orderType == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected estimatedFoodReadyTime, deliveryDriverType & deliveryAction`,
      errorCode: "orderIdNotGiven"
    }
  }

  let deliveryDriverType: DeliveryDriverType = data.deliveryDriverType;
  let orderId = data.orderId;
  let deliveryAction: DeliveryAction = data.deliveryAction;

  let validationPass = await passChecksForDriver(data, context.auth);
  if (!validationPass.ok) {
    return validationPass.error;
  }

  let order: TwoWayDeliverableOrder = validationPass.order;
  console.log("[Before] estimatedDeliveryTimes ==>",order.estimatedDeliveryTimes);
  if(!order.estimatedDeliveryTimes )
  {
    order.estimatedDeliveryTimes = {
      pickup: {
        pickup: null,
        dropoff: null
      }, 
      dropoff: {
        pickup: null,
        dropoff: null
      }
    };
  }
  console.log("[After] estimatedDeliveryTimes ==>",order.estimatedDeliveryTimes);
  if (!order.estimatedDeliveryTimes[deliveryDriverType]) {
    order.estimatedDeliveryTimes[deliveryDriverType] = {
      pickup : null,
      dropoff: null,
    }
  }
  order.estimatedDeliveryTimes[deliveryDriverType]![deliveryAction] = data.estimatedTime;
 
  updateServiceProviderOrder(orderId, order);
  customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
  rootDbNodes.inProcessOrders(order.orderType, orderId).update(order);

  switch (deliveryDriverType) {
    case DeliveryDriverType.DropOff:
      deliveryDriverNodes.inProcessOrders(order.dropoffDriver!.id, orderId).update(order);
      break;
    case DeliveryDriverType.Pickup:
      deliveryDriverNodes.inProcessOrders(order.pickupDriver!.id, orderId).update(order);
      break;
  }


  return { status: ServerResponseStatus.Success }
});

async function passChecksForDriver(data: any, auth?: AuthData): Promise<ValidationPass> {
  let response = await isSignedIn(auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }

  let orderId: string = data.orderId;
  let order: TwoWayDeliverableOrder = (await rootDbNodes.inProcessOrders(data.orderType, orderId).once('value')).val();
  if (order == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not exist`,
        errorCode: "orderDontExist"
      }
    }
  }
   switch (data.deliveryDriverType) {
    case DeliveryDriverType.Pickup:
      if (order.pickupDriver != null && order.pickupDriver.id != auth!.uid)
        return {
          ok: false,
          error: {
            status: ServerResponseStatus.Error,
            errorMessage: `Driver is not pickup driver`,
            errorCode: "driverNotAuthorized"
          }
        }
    case DeliveryDriverType.DropOff:
      if (order.dropoffDriver != null && order.dropoffDriver.id != auth!.uid)
        return {
          ok: false,
          error: {
            status: ServerResponseStatus.Error,
            errorMessage: `Driver is not drop off driver`,
            errorCode: "driverNotAuthorized"
          }
        }
  }

  return {
    ok: true,
    order: order
  }
}
