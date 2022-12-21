import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { generateDeepLink, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType } from "../../models/Generic/Generic";
import { OperatorStatus, Restaurant } from "../../models/Services/Restaurant/Restaurant";

export async function createRestaurant(
  restaurant: Restaurant, 
  restaurantOperatorUserId: number, 
  restaurantOperatorNotificationToken?: string 
) {
 
  let chain = getHasura();

  let response = await chain.mutation({
    insert_restaurant_one: [{
      object: {
        name: restaurant.name,
        
      
        image: restaurant.image,
        location_gps: JSON.stringify({
            "type": "point",
            "coordinates": [restaurant.location.lng, restaurant.location.lat]
          }),
        location_text: restaurant.location.address,
       schedule: JSON.stringify(restaurant.schedule),
        firebase_id: restaurant.firebaseId ?? undefined,
       
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            status: OperatorStatus.AwaitingApproval,
            owner: true,
          }]
        }
      }
    }, {
      service_provider_type : true,
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
  
  
  // Generating 3 links/Qr
  let restaurantOpLinks : IDeepLink|null = await generateDeepLink("Restaurant", {"providerId": response.insert_restaurant_one.id, "deepLinkType": "addRestaurantOperator"})
  let customerLinks : IDeepLink|null = await generateDeepLink("Customer", {"providerType":"restaurant", "providerId": response.insert_restaurant_one.id, "deepLinkType": "publicLink"})
  let deliveryLinks : IDeepLink|null = await generateDeepLink("Delivery", {"providerType":"restaurant", "providerId": response.insert_restaurant_one.id, "deepLinkType": "addDriver"})

  chain.mutation({
    insert_service_link_one: [{
      object: {
        service_provider_id : response.insert_restaurant_one.id,
        service_provider_type : response.insert_restaurant_one.service_provider_type,
        customer_deep_link : customerLinks?.url,
        customer_qr_image_link : customerLinks?.urlQr,
        driver_deep_link : deliveryLinks?.url,
        driver_qr_image_link : deliveryLinks?.urlQr,
        operator_deep_link : restaurantOpLinks?.url,
        operator_qr_image_link : restaurantOpLinks?.urlQr      
      }
    }, {
      id: true
    }]
  });

  if(restaurantOperatorNotificationToken) {
     chain.mutation({
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