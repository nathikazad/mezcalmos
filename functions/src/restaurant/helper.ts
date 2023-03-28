// import { checkDeliveryAdmin } from "../shared/helper/authorizer";
import { getRestaurantCheckDetails } from "../shared/graphql/restaurant/restaurantCheck";
import { isMezAdmin } from "../shared/helper";
import { MezError } from "../shared/models/Generic/Generic";
import { ChangeRestaurantStatusError } from "./adminStatusChanges";

export async function passChecksForRestaurant(orderId: number, userId: number) {

  let response = await getRestaurantCheckDetails(orderId, userId);
  let order = response.restaurant_order_by_pk;

  if (order == null) {
    throw new MezError(ChangeRestaurantStatusError.OrderNotFound);
  }

  if((await isMezAdmin(userId)) == false) {
    if (response.restaurant_operator.length == 0) {
      throw new MezError(ChangeRestaurantStatusError.UnauthorizedAccess);
    }
    if(response.restaurant_operator[0].restaurant_id != order.restaurant_id) {
      throw new MezError(ChangeRestaurantStatusError.IncorrectOrderId);
    }
  }
}