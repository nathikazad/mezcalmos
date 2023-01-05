import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { RestaurantOrder } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function updateRestaurantOrderStatus(order: RestaurantOrder) {
  let chain = getHasura();
  if(order.orderId == null) {
    throw new HttpsError(
      "internal",
      "order id not provided"
    );
  }
  await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: order.orderId
      }, 
      _set: {
        status: order.status,
        refund_amount: order.refundAmount
      }
    }, { 
      status: true
    }]
  });
}

export async function setEstFoodReadyTime(orderId: number, estimatedFoodReadyTime: string) {
  let chain = getHasura();
  if(orderId == null) {
    throw new HttpsError(
      "internal",
      "order id not provided"
    );
  }
  await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: orderId
      }, 
      _set: {
        estimated_food_ready_time: estimatedFoodReadyTime
      }
    }, { }]
  });
}
