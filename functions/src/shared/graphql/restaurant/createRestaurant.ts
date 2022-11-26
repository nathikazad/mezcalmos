import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType } from "../../models/Generic/Generic";
import { OperatorStatus, Restaurant } from "../../models/Services/Restaurant/Restaurant";

export async function createRestaurant(
  restaurant: Restaurant, 
  restaurantOperatorUserId: number, 
  restaurantOperatorNotificationToken: string = ""
) {

  let chain = getHasura();

  let response = await chain.mutation({
    insert_restaurant_one: [{
      object: {
        name: restaurant.name,
        image: restaurant.image,
        location_gps: JSON.stringify(restaurant.location.gps),
        location_text: restaurant.location.address,
        schedule_id: restaurant.scheduleId,
        firebase_id: restaurant.firebaseId ?? undefined,
        open_status: restaurant.openStatus,
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            status: OperatorStatus.Authorized,
            owner: true,
          }]
        }
      }
    }, {
      id: true
    }],
  });
  console.log("response: ", response);

  if(response.insert_restaurant_one == null) {
    throw new HttpsError(
      "internal",
      "restaurant creation error"
    );
  }
  if(restaurantOperatorNotificationToken != "") {
    await chain.mutation({
      insert_notification_info_one: [{
        object: {
          user_id: restaurantOperatorUserId,
          app_type_id: AppType.RestaurantApp,
          token: restaurantOperatorNotificationToken
        }
      }, {
        id: true
      }]
    });
  }
  restaurant.restaurantId = response.insert_restaurant_one.id
}