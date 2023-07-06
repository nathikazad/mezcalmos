import { $, notification_info_constraint, notification_info_update_column } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { RestaurantDetails, RestaurantError } from "../../../restaurant/createNewRestaurant";
import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, generateDeepLinks, IDeepLink } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { PaymentType } from '../../models/Generic/Order';
import { QRFlyerLinks, createQRFlyerPDF } from "../../../utilities/links/flyer";


export async function createRestaurant(
  restaurantDetails: RestaurantDetails,
  restaurantOperatorUserId: number
): Promise<ServiceProvider> {
  let chain = getHasura();

  if(restaurantDetails.uniqueId) {
    let queryResponse = await chain.query({
        service_provider_details: [{
            where: {
                unique_id: {
                    _eq: restaurantDetails.uniqueId
                }
            }
        }, {
            id: true,
        }]
    });
    if(queryResponse.service_provider_details.length) {
        throw new MezError(RestaurantError.UniqueIdAlreadyExists);
    }
  }
  if(restaurantDetails.phoneNumber.length == 10) {
    restaurantDetails.phoneNumber = `+52${restaurantDetails.phoneNumber}`;
}
  let uniqueId: string = restaurantDetails.uniqueId ?? generateString();

  let linksResponse: Partial<Record<DeepLinkType, IDeepLink>> = await generateDeepLinks(uniqueId, AppType.Restaurant)
  let QRflyer: QRFlyerLinks = await createQRFlyerPDF(uniqueId);
  
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
            phone_number: restaurantDetails.phoneNumber,
            schedule: $`schedule`,
            firebase_id: restaurantDetails.firebaseId ?? undefined,
            language: $`language`,
            service_provider_type: ServiceProviderType.Restaurant,
            unique_id: uniqueId,
            accepted_payments: $`accepted_payments`,
            location: {
              data: {
                gps: $`gps`,
                address: restaurantDetails.location.address
              }
            },
            service_link: {
              data: {
                customer_qr_image_link: QRflyer.customerQRImageLink,
                operator_deep_link: linksResponse[DeepLinkType.AddOperator]?.url,
                operator_qr_image_link: linksResponse[DeepLinkType.AddOperator]?.urlQrImage,
                driver_deep_link: linksResponse[DeepLinkType.AddDriver]?.url,
                driver_qr_image_link: linksResponse[DeepLinkType.AddDriver]?.urlQrImage,
                customer_flyer_links: $`customer_flyer_links`,
              }
            }
          }
        },
        restaurant_operators: {
          data: [{
            user_id: restaurantOperatorUserId,
            operator_details: {
              data: {
                owner: true,
                status: AuthorizationStatus.Authorized,
                user_id: restaurantOperatorUserId,
                app_type_id: AppType.Restaurant,
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
  }, {
    "schedule": restaurantDetails.schedule,
    "language": restaurantDetails.language,
    "accepted_payments":<Record<PaymentType, boolean>>{
      [PaymentType.Cash]: true,
      [PaymentType.Card]: false,
      [PaymentType.BankTransfer]: false,
    },
    "gps": {
      "type": "Point",
      "coordinates": [restaurantDetails.location.lng, restaurantDetails.location.lat]
    },
    "customer_flyer_links": QRflyer.flyerLinks
  })
  console.log("response: ", response);

  if (response.insert_restaurant_restaurant_one == null) {

    throw new MezError(RestaurantError.RestaurantCreationError);
  }
  if(restaurantDetails.restaurantOperatorNotificationToken) {
    chain.mutation({
      insert_notification_info_one: [{
        object: {
          app_type_id: AppType.Restaurant,
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
    deliveryDetails: restaurantDetails.deliveryDetails,
    language: restaurantDetails.language,
    firebaseId: restaurantDetails.firebaseId,
    serviceProviderType: ServiceProviderType.Restaurant,
    uniqueId
  };
}

function generateString(): string {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;
  let counter = 0;
  while (counter < 8) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
    counter += 1;
  }
  return result;
}
