import { HttpsError } from "firebase-functions/v1/auth";
import { RestaurantDetails } from "../../../restaurant/createNewRestaurant";
import { getHasura } from "../../../utilities/hasura";
import { generateDeepLink, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType } from "../../models/Generic/Generic";
import { OperatorStatus, ServiceProvider } from "../../models/Services/Service";

export async function createRestaurant(
  restaurantDetails: RestaurantDetails, 
  restaurantOperatorUserId: number
): Promise<ServiceProvider> {

  let chain = getHasura();

  let response = await chain.mutation({
    insert_restaurant_restaurant_one: [{
      object: {
        details: {
          data: {
            name: restaurantDetails.name,
            image: restaurantDetails.image,
            schedule: JSON.stringify(restaurantDetails.schedule),
            firebase_id: restaurantDetails.firebaseId ?? undefined,
            location: {
              data: {
                gps: JSON.stringify({
                  "type": "point",
                  "coordinates": [restaurantDetails.location.lng, restaurantDetails.location.lat]
                }),
                address: restaurantDetails.location.address
              }
            },
            delivery_details: 
              (restaurantDetails.deliveryDetails) ? { data:  {
                minimum_cost: restaurantDetails.deliveryDetails.minimumCost,
                cost_per_km: restaurantDetails.deliveryDetails.costPerKm,
                radius: restaurantDetails.deliveryDetails.radius,
                free_delivery_minimum_cost: restaurantDetails.deliveryDetails.freeDeliveryMinimumCost,
                free_delivery_km_range: restaurantDetails.deliveryDetails.freeDeliveryKmRange,
                delivery_available: restaurantDetails.deliveryDetails.deliveryAvailable,
                customer_pickup: restaurantDetails.deliveryDetails.customerPickup,
                self_delivery: restaurantDetails.deliveryDetails.selfDelivery
              }} : undefined,
            delivery_partners: (restaurantDetails.deliveryPartnerId) ? {
              data: [{
                delivery_company_id: restaurantDetails.deliveryPartnerId
              }]
            }: undefined,
          }
        },
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            operator_details: {
              data: {
                owner: true,
                status: OperatorStatus.Authorized,
                user_id: restaurantOperatorUserId,
                app_type_id: AppType.RestaurantApp,
                notification_info: (restaurantDetails.restaurantOperatorNotificationToken)? {
                  data: {
                    user_id: restaurantOperatorUserId,
                    app_type_id: AppType.RestaurantApp,
                    token: restaurantDetails.restaurantOperatorNotificationToken
                  }
                }: undefined
              }
            },
          }]
        }
      }
    }, {
      id: true,
      restaurant_operators: [{}, {
        id: true
      }]
    }]
  });
  console.log("response: ", response);

  if(response.insert_restaurant_restaurant_one == null) {
    throw new HttpsError(
      "internal",
      "restaurant creation error"
    );
  }
  // if(restaurant.deliveryPartnerId) {
  //   await chain.mutation({
  //     insert_service_provider_delivery_partner_one: [{
  //       object: {
  //         delivery_company_id: restaurant.deliveryPartnerId,
  //         service_provider_id: response.insert_restaurant_restaurant_one.id,
  //         service_provider_type: ServiceProviderType.Restaurant
  //       }
  //     }, {
  //       id: true,
  //     }]
  //   });
  // }
  
  // Generating 3 links/Qr
  let restaurantOpLinks : IDeepLink|null = await generateDeepLink("Restaurant", {"providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "addRestaurantOperator"})
  let customerLinks : IDeepLink|null = await generateDeepLink("Customer", {"providerType":"restaurant", "providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "publicLink"})
  let deliveryLinks : IDeepLink|null = await generateDeepLink("Delivery", {"providerType":"restaurant", "providerId": response.insert_restaurant_restaurant_one.id, "deepLinkType": "addDriver"})

  chain.mutation({
    insert_service_provider_service_link_one: [{
      object: {
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

  // if(restaurantDetails.restaurantOperatorNotificationToken) {
  //    chain.mutation({
  //     insert_notification_info_one: [{
  //       object: {
  //         user_id: restaurantOperatorUserId,
  //         app_type_id: AppType.RestaurantApp,
  //         token: restaurantDetails.restaurantOperatorNotificationToken
  //       }
  //     }, {
  //       id: true
  //     }]
  //   });
  // }
  return {
    id: response.insert_restaurant_restaurant_one.id,
    name: restaurantDetails.name,
    image: restaurantDetails.image,
    location: restaurantDetails.location,
    schedule: restaurantDetails.schedule,
    deliveryPartnerId: restaurantDetails.deliveryPartnerId,
    deliveryDetails: restaurantDetails.deliveryDetails,
    language: restaurantDetails.language,
    firebaseId: restaurantDetails.firebaseId,
  }
}