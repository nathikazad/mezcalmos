import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { generateDeepLink, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType } from "../../models/Generic/Generic";
import { OperatorStatus, Restaurant } from "../../models/Services/Restaurant/Restaurant";
import { ServiceProviderType } from "../../models/Services/Service";

export async function createRestaurant(
  restaurant: Restaurant, 
  restaurantOperatorUserId: number, 
  restaurantOperatorNotificationToken?: string 
) {
 
  let chain = getHasura();

  let response = await chain.mutation({
    insert_restaurant_restaurant_one: [{
      object: {
        name: restaurant.name,
        
        image: restaurant.image,
        schedule: JSON.stringify(restaurant.schedule),
        firebase_id: restaurant.firebaseId ?? undefined,
        self_delivery: restaurant.selfDelivery,
        delivery: restaurant.delivery,
        customer_pickup: restaurant.customerPickup,
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            status: OperatorStatus.Authorized,
            owner: true,
          }]
        },
      }
    }, {
      service_provider_type : true,
      id: true
    }],
  });

  console.log("response: ", response);

  if(response.insert_restaurant_restaurant_one == null) {
    throw new HttpsError(
      "internal",
      "restaurant creation error"
    );
  }
  if(restaurant.deliveryPartnerId) {
    await chain.mutation({
      insert_service_provider_delivery_partner_one: [{
        object: {
          delivery_company_id: restaurant.deliveryPartnerId,
          service_provider_id: response.insert_restaurant_restaurant_one.id,
          service_provider_type: ServiceProviderType.Restaurant
        }
      }, {
        id: true,
      }]
    });
  }
  if(restaurant.deliveryDetails) {
    await chain.mutation({
      insert_delivery_details_one: [{
        object: {
          minimum_cost: restaurant.deliveryDetails.minimumCost,
          cost_per_km: restaurant.deliveryDetails.costPerKm,
          service_provider_id: response.insert_restaurant_restaurant_one?.id,
          service_provider_type: ServiceProviderType.Restaurant,
          radius: restaurant.deliveryDetails.radius,
          free_delivery_minimum_cost: restaurant.deliveryDetails.freeDeliveryMinimumCost,
          free_delivery_km_range: restaurant.deliveryDetails.freeDeliveryKmRange,
          location_gps: JSON.stringify({
            "type": "point",
            "coordinates": [restaurant.location.lng, restaurant.location.lat]
          }),
          location_text: restaurant.location.address
        }
      }, {
        service_provider_id: true,
        service_provider_type: true,
      }]
    });
  } else {
    await chain.mutation({
      insert_delivery_details_one: [{
        object: {
          service_provider_id: response.insert_restaurant_restaurant_one?.id,
          service_provider_type: ServiceProviderType.Restaurant,
          location_gps: JSON.stringify({
            "type": "point",
            "coordinates": [restaurant.location.lng, restaurant.location.lat]
          }),
          location_text: restaurant.location.address
        }
      }, {
        service_provider_id: true,
        service_provider_type: true,
      }]
    });
  }
  
  
  // Generating 3 links/Qr
  let restaurantOpLinks : IDeepLink|null = await generateDeepLink("Restaurant", {"providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "addRestaurantOperator"})
  let customerLinks : IDeepLink|null = await generateDeepLink("Customer", {"providerType":"restaurant", "providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "publicLink"})
  let deliveryLinks : IDeepLink|null = await generateDeepLink("Delivery", {"providerType":"restaurant", "providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "addDriver"})

  chain.mutation({
    insert_service_provider_service_link_one: [{
      object: {
        service_provider_id : response.insert_restaurant_restaurant_one.id,
        service_provider_type : response.insert_restaurant_restaurant_one.service_provider_type,
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
  restaurant.restaurantId = response.insert_restaurant_restaurant_one.id
}