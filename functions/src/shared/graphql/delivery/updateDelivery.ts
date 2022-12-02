import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder } from "../../models/Services/Delivery/DeliveryOrder";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();
  if(deliveryOrder.deliveryId == null) {
    throw new HttpsError(
      "internal",
      "delivery order id not provided"
    );
  }
  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        status: deliveryOrder.status,
      }
    }, { 
      status: true
    }]
  });
}