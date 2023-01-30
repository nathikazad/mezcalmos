import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType } from "../../../models/Generic/Generic";
import { RestaurantOperator } from "../../../models/Services/Restaurant/Restaurant";

export async function createRestaurantOperator(operator: RestaurantOperator) {

  let chain = getHasura();
  let response = await chain.query({
    restaurant_operator: [{
        where: {
            user_id: {
                _eq: operator.userId,
            },
            restaurant_id: {
                _eq: operator.restaurantId
            }
        }
    }, {
        id: true,
    }],
    notification_info: [{
        where: {
            user_id: {
                _eq: operator.userId
            },
            app_type_id: {
                _eq: AppType.RestaurantApp
            }
        }
    }, {
        id: true,
    }]
  })
  if(response.restaurant_operator.length) {
      throw new HttpsError(
          "internal",
          "The operator is already working for this restaurant"
      );
  }

  let mutationResponse = await chain.mutation({
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
  if(mutationResponse.insert_restaurant_operator_one == null) {
    throw new HttpsError(
      "internal",
      "operator creation error"
    );
  }
  if(!(response.notification_info.length) && operator.notificationInfo) {
    await chain.mutation({
        insert_notification_info_one: [{
            object: {
                app_type_id: operator.notificationInfo.appType,
                token: operator.notificationInfo.token,
                user_id: operator.userId
            }
        }, {
            id: true
        }]
    });
  }
  operator.id = mutationResponse.insert_restaurant_operator_one.id;
}