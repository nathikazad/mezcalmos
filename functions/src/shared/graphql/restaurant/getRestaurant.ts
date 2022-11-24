import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType } from "../../models/Generic/Generic";
import { OpenStatus, OperatorStatus, Restaurant, RestaurantOperator } from "../../models/Services/Restaurant/Restaurant";

export async function getRestaurant(restaurantId: number): Promise<Restaurant> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_by_pk: [{
      id: restaurantId
    }, {
      id: true,
      name: true,
      description: {
        translations: [{ }, {
          language_id: true,
          value: true
        }]
      },
      image: true,
      location_gps: true,
      location_text: true,
      open_status: true,
      schedule_id: true,
      approved: true
    }],
    restaurant_operator: [{
      where: { 
        restaurant_id: {
          _eq: restaurantId
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

  if(response.restaurant_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No restaurant with that id found"
    );
  }

  let restaurantOperators: RestaurantOperator[] = response.restaurant_operator.map((r): RestaurantOperator => {
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


  let restaurant: Restaurant = {
    restaurantId: response.restaurant_by_pk.id,
    name: response.restaurant_by_pk.name,
    image: response.restaurant_by_pk.image,
    location: {
      address: response.restaurant_by_pk.location_text,
      gps: response.restaurant_by_pk.location_gps
    },
    description: response.restaurant_by_pk.description?.translations.reduce((prev:Record<any, any>, current) => {
      prev[current.language_id] = current.value;
      return prev;
    }, {}),
    scheduleId: response.restaurant_by_pk.schedule_id,
    openStatus: response.restaurant_by_pk.open_status as OpenStatus,
    approved: response.restaurant_by_pk.approved,
    restaurantOperators
  }

  return restaurant;
}
