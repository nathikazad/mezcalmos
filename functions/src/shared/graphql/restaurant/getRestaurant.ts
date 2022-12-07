import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, Language } from "../../models/Generic/Generic";
import { OpenStatus, OperatorStatus, Restaurant, RestaurantOperator } from "../../models/Services/Restaurant/Restaurant";

export async function getRestaurant(restaurantId: number): Promise<Restaurant> {
  let chain = getHasura();
  let response = await chain.query({
    restaurant_by_pk: [{
      id: restaurantId
    }, {
      id: true,
      name: true,
      // schedule : [{path :'' },true],
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
      operator_deep_link: true,
      operator_qr_image_link:true,
     
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
      notification_token: true,
      user: {
        firebase_id: true,
        language_id: true,
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
      notificationInfo: (r.notification_token) ? {
        AppTypeId: AppType.RestaurantApp,
        token: r.notification_token
      } : undefined,
      user: {
        id: r.user_id,
        firebaseId: r.user.firebase_id,
        language: r.user.language_id as Language
      }
    }
  });


  let restaurant: Restaurant = {
    restaurantId: response.restaurant_by_pk.id,
    name: response.restaurant_by_pk.name,
    image: response.restaurant_by_pk.image,

    
    location: {
      address: response.restaurant_by_pk.location_text,
      lat : response.restaurant_by_pk.location_gps.coordinates[1],
      lng: response.restaurant_by_pk.location_gps.coordinates[0]
    },
    description: response.restaurant_by_pk.description?.translations.reduce((prev:Record<any, any>, current) => {
      prev[current.language_id] = current.value;
      return prev;
    }, {}),
    // schedule: response.restaurant_by_pk.schedule,
    openStatus: response.restaurant_by_pk.open_status as OpenStatus,
    approved: response.restaurant_by_pk.approved,
    restaurantOperators
  }

  return restaurant;
}
