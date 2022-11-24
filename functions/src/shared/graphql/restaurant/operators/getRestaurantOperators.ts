import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType } from "../../../models/Generic/Generic";
import { OperatorStatus, RestaurantOperator } from "../../../models/Services/Restaurant/Restaurant";


export async function getRestaurantOperators(restaurantId: number): Promise<RestaurantOperator[]> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator: [{
      where: {
        restaurant_id: {
          _eq: restaurantId
        },
        status: {
          _eq: "authorized"
        }
      }
    }, {
      id: true,
      user_id: true,
      status: true,
      owner: true,
      notification_info: {
        token: true,
        app_type_id: true
      }
    }]
  });
  if(response.restaurant_operator == null) {
    throw new HttpsError(
      "internal",
      "No restaurant with that id found"
    );
  }
  
  return response.restaurant_operator.map((r): RestaurantOperator => {
    return {
      id: r.id,
      userId: r.user_id,
      restaurantId: restaurantId,
      status: r.status as OperatorStatus,
      owner: r.owner,
      notificationInfo: {
        AppTypeId: r.notification_info.app_type_id as AppType,
        token: r.notification_info.token
      }
    }
  });

}
