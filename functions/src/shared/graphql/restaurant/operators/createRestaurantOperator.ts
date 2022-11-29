import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { RestaurantOperator } from "../../../models/Services/Restaurant/Restaurant";

export async function createRestaurantOperator(operator: RestaurantOperator) {

  let chain = getHasura();

  let response = await chain.mutation({
    insert_restaurant_operator_one: [{
      object: {
        user_id: operator.userId,
        restaurant_id: operator.restaurantId,
        status: operator.status,
      }
    }, {
      id: true,
    }]
  });
  if(response.insert_restaurant_operator_one == null) {
    throw new HttpsError(
      "internal",
      "operator creation error"
    );
  }
  if(operator.notificationInfo != undefined) {
    await chain.mutation({
      insert_notification_info_one: [{
        object: {
          user_id: operator.userId,
          app_type_id: operator.notificationInfo.AppTypeId,
          token: operator.notificationInfo.token,
        }
      }, {
        id: true,
      }]
    });
  }
  operator.id = response.insert_restaurant_operator_one.id;
}