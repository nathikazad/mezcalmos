// import { checkDeliveryAdmin } from "../shared/helper/authorizer";
import { getRestaurantCheckDetails } from "../shared/graphql/restaurant/restaurantCheck";
import { HttpsError } from "firebase-functions/v1/auth";

export async function passChecksForRestaurant(orderId: any, userId: number) {

  if (orderId == null) {
      throw new HttpsError(
        "internal",
        "order id not provided"
      );
  }

  let response = await getRestaurantCheckDetails(orderId, userId);
  let order = response.restaurant_order_by_pk;

  if (order == null) {
    throw new HttpsError(
      "internal",
      "order does not exist"
    );
  }

  if (response.restaurant_operator[0]) {

    if(response.restaurant_operator[0].restaurant_id != order.restaurant_id) {
      throw new HttpsError(
        "internal",
        "Only authorized restaurant operators can run this operation"
      );
    }
  } else {
    if (response.mez_admin_by_pk == null) {
      throw new HttpsError(
        "internal",
        "Only admins can run this operation"
      );
    }
  }
}