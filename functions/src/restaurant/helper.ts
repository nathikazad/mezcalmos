// import { checkDeliveryAdmin } from "../shared/helper/authorizer";
import { getRestaurantCheckDetails } from "../shared/graphql/restaurant/restaurantCheck";
import { HttpsError } from "firebase-functions/v1/auth";
import { isMezAdmin } from "../shared/helper";

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

  if((await isMezAdmin(userId)) == false) {
    if (response.restaurant_operator.length == 0) {
      throw new HttpsError(
        "internal",
        "Only authorized restaurant operators or MezAdmin can run this operation"
      );
    }
    if(response.restaurant_operator[0].restaurant_id != order.restaurant_id) {
      throw new HttpsError(
        "internal",
        "Only authorized restaurant operators can run this operation"
      );
    }
  }
}