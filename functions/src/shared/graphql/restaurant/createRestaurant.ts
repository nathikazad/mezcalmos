import { HttpsError } from "firebase-functions/v1/auth";
import { notification_info_constraint, notification_info_update_column } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { RestaurantDetails } from "../../../restaurant/createNewRestaurant";
import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, generateDeepLinks, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus } from "../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { PaymentType } from '../../models/Generic/Order';


export async function createRestaurant(
  restaurantDetails: RestaurantDetails,
  restaurantOperatorUserId: number
): Promise<ServiceProvider> {
  let chain = getHasura();

  let linksResponse: Record<DeepLinkType, IDeepLink> = await generateDeepLinks(restaurantDetails.uniqueId, AppType.RestaurantApp)
  
  let response = await chain.mutation({
    insert_restaurant_restaurant_one: [{
      object: {
        delivery_details: {
          data: {
            minimum_cost: restaurantDetails.deliveryDetails.minimumCost ?? 0,
            cost_per_km: restaurantDetails.deliveryDetails.costPerKm ?? 0,
            radius: restaurantDetails.deliveryDetails.radius ?? 0,
            free_delivery_minimum_cost: restaurantDetails.deliveryDetails.freeDeliveryMinimumCost,
            free_delivery_km_range: restaurantDetails.deliveryDetails.freeDeliveryKmRange,
            delivery_available: restaurantDetails.deliveryDetails.deliveryAvailable,
            customer_pickup: restaurantDetails.deliveryDetails.customerPickup,
            self_delivery: restaurantDetails.deliveryDetails.selfDelivery
          }
        },
        details: {
          data: {
            name: restaurantDetails.name,
            image: restaurantDetails.image,
            schedule: JSON.stringify(restaurantDetails.schedule),
            firebase_id: restaurantDetails.firebaseId ?? undefined,
            language: JSON.stringify(restaurantDetails.language),
            service_provider_type: ServiceProviderType.Restaurant,
            unique_id: restaurantDetails.uniqueId,
            accepted_payments: JSON.stringify(<Record<PaymentType, boolean>>{
              [PaymentType.Cash]: true,
              [PaymentType.Card]: false,
              [PaymentType.BankTransfer]: false,
            }),
            location: {
              data: {
                gps: JSON.stringify({
                  "type": "point",
                  "coordinates": [restaurantDetails.location.lng, restaurantDetails.location.lat]
                }),
                address: restaurantDetails.location.address
              }
            },
            service_link: {
              data: {
                customer_deep_link: linksResponse[DeepLinkType.Customer].url,
                customer_qr_image_link: linksResponse[DeepLinkType.Customer].urlQrImage,
                operator_deep_link: linksResponse[DeepLinkType.AddOperator].url,
                operator_qr_image_link: linksResponse[DeepLinkType.AddOperator].urlQrImage,
                driver_deep_link: linksResponse[DeepLinkType.AddDriver].url,
                driver_qr_image_link: linksResponse[DeepLinkType.AddDriver].urlQrImage,
              }
            }
          }
        },
        delivery_partners: (restaurantDetails.deliveryPartnerId) ? {
          data: [{
            delivery_company_id: restaurantDetails.deliveryPartnerId
          }]
        }: undefined,
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            operator_details: {
              data: {
                owner: true,
                status: AuthorizationStatus.Authorized,
                user_id: restaurantOperatorUserId,
                app_type_id: AppType.RestaurantApp,
              }
            },
          }]
        }
      }
    }, {
      id: true,
      details_id: true,
      restaurant_operators: [{}, {
        id: true
      }]
    }]
  })
  console.log("response: ", response);

  if (response.insert_restaurant_restaurant_one == null) {
    throw new HttpsError("internal", "restaurant creation error");
  }
  if(restaurantDetails.restaurantOperatorNotificationToken) {
    chain.mutation({
      insert_notification_info_one: [{
        object: {
          app_type_id: AppType.RestaurantApp,
          token: restaurantDetails.restaurantOperatorNotificationToken,
          user_id: restaurantOperatorUserId
        },
        on_conflict: {
          constraint: (
            notification_info_constraint.notification_info_app_type_id_user_id_key
          ),
          update_columns: [notification_info_update_column.token]
        }
      }, {
        id: true
      }]
    })
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
  // let restaurantOpLinks: IDeepLink | null = await generateDeepLink(
  //   "Restaurant",
  //   {
  //     providerId: response.insert_restaurant_restaurant_one.id,
  //     deepLinkType: "addRestaurantOperator",
  //   }
  // );
  // let customerLinks: IDeepLink | null = await generateDeepLink("Customer", {
  //   providerType: "restaurant",
  //   providerId: response.insert_restaurant_restaurant_one.id,
  //   deepLinkType: "publicLink",
  // });
  // let deliveryLinks: IDeepLink | null = await generateDeepLink("Delivery", {
  //   providerType: "restaurant",
  //   providerId: response.insert_restaurant_restaurant_one.id,
  //   deepLinkType: "addDriver",
  // });

  // chain.mutation({
  //   insert_service_provider_service_link_one: [
  //     {
  //       object: {
  //         customer_deep_link: customerLinks?.url,
  //         customer_qr_image_link: customerLinks?.urlQr,
  //         driver_deep_link: deliveryLinks?.url,
  //         driver_qr_image_link: deliveryLinks?.urlQr,
  //         operator_deep_link: restaurantOpLinks?.url,
  //         operator_qr_image_link: restaurantOpLinks?.urlQr,
  //       },
  //     },
  //     {
  //       id: true,
  //     },
  //   ],
  // });

  return {
    id: response.insert_restaurant_restaurant_one.id,
    serviceProviderDetailsId: response.insert_restaurant_restaurant_one.details_id,
    name: restaurantDetails.name,
    image: restaurantDetails.image,
    location: restaurantDetails.location,
    schedule: restaurantDetails.schedule,
    deliveryPartnerId: restaurantDetails.deliveryPartnerId,
    deliveryDetails: restaurantDetails.deliveryDetails,
    language: restaurantDetails.language,
    firebaseId: restaurantDetails.firebaseId,
  };
}
