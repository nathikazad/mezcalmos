import { ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
// import { checkDeliveryAdmin } from "../shared/helper/authorizer";
import { getRestaurantCheckDetails } from "../shared/graphql/restaurant/restaurantCheck";

export async function passChecksForRestaurant(data: any, userId: number): Promise<ValidationPass> {

  if (data.orderId == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected order id`,
        errorCode: "orderIdNotGiven"
      }
    }
  }

  let response = await getRestaurantCheckDetails(data, userId);
  let order = response.restaurant_order_by_pk;

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

  if (data.fromRestaurantOperator) {

    if(response.restaurant_operator[0]?.restaurant_id != order.restaurant_id) {
      return {
        ok: false,
        error: {
          status: ServerResponseStatus.Error,
          errorMessage: "Only authorized restaurant operators can run this operation"
        }
      };
    }
  } else {
    // let response = await checkDeliveryAdmin(userId);
    if (response.mez_admin_by_pk == null) {
      return {
        ok: false,
        error: {
          status: ServerResponseStatus.Error,
          errorMessage: "Only admins can run this operation"
        }
      };
    }
  }

  return {
    ok: true,
    // order: order
  }
}