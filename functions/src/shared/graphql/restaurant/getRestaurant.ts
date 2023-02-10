import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, Language } from "../../models/Generic/Generic";
import { OpenStatus, Operator, ServiceProvider } from "../../models/Services/Service";
import { AuthorizationStatus } from "../../models/Generic/Generic";

export async function getRestaurant(restaurantId: number): Promise<ServiceProvider> {
  let chain = getHasura();
  let response = await chain.query({
    restaurant_restaurant_by_pk: [{
      id: restaurantId
      
    }, {
      id: true,
      name: true,
      self_delivery:true,
      // schedule : [{path :'' },true],
      description: {
        translations: [{ }, {
          language_id: true,
          value: true
        }]
      },
      image: true,
      phone_number: true,
      open_status: true,     
      approved: true,
      stripe_info: [{}, true],
      accepted_payments: [{}, true],
      language_id: true,
      restaurant_operators: [{}, {
        id: true,
        user_id: true,
        status: true,
        owner: true,
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
        user: {
          firebase_id: true,
          language_id: true,
          name: true,
          email: true,
          phone: true,
        }
      }],
      delivery_partner: {
        delivery_company_id: true,
      },
      delivery: true,
      customer_pickup: true,
      location: {
        gps: true,
        address: true,
      }
    }],
  });

  if(response.restaurant_restaurant_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No restaurant with that id found"
    );
  }

  let operators: Operator[] = response.restaurant_restaurant_by_pk.restaurant_operators.map((r): Operator => {
    return {
      id: r.id,
      userId: r.user_id,
      serviceProviderId: restaurantId,
      status: r.status as AuthorizationStatus,
      owner: r.owner,
      notificationInfo: (r.notification_info) ? {
        appType: AppType.RestaurantApp,
        token: r.notification_info.token,
        turnOffNotifications: r.notification_info.turn_off_notifications
      } : undefined,
      user: {
        id: r.user_id,
        firebaseId: r.user.firebase_id,
        language: r.user.language_id as Language,
        name: r.user.name,
        email: r.user.email,
        phoneNumber: r.user.phone,
      }
    }
  });

  let restaurant: ServiceProvider = {
    id: response.restaurant_restaurant_by_pk.id,
    name: response.restaurant_restaurant_by_pk.name,
    image: response.restaurant_restaurant_by_pk.image,
    selfDelivery:response.restaurant_restaurant_by_pk.self_delivery,
    phoneNumber: response.restaurant_restaurant_by_pk.phone_number,
    location: {
      address: response.restaurant_restaurant_by_pk.location?.address,
      lat : response.restaurant_restaurant_by_pk.location?.gps.coordinates[1],
      lng: response.restaurant_restaurant_by_pk.location?.gps.coordinates[0]
    },
    description: response.restaurant_restaurant_by_pk.description?.translations.reduce((prev:Record<any, any>, current) => {
      prev[current.language_id] = current.value;
      return prev;
    }, {}),
    // schedule: response.restaurant_by_pk.schedule,
    openStatus: response.restaurant_restaurant_by_pk.open_status as OpenStatus,
    approved: response.restaurant_restaurant_by_pk.approved,
    stripeInfo: JSON.parse(response.restaurant_restaurant_by_pk.stripe_info),
    acceptedPayments: JSON.parse(response.restaurant_restaurant_by_pk.accepted_payments),
    operators,
    deliveryPartnerId: response.restaurant_restaurant_by_pk.delivery_partner?.delivery_company_id,
    customerPickup: response.restaurant_restaurant_by_pk.customer_pickup,
    delivery: response.restaurant_restaurant_by_pk.delivery,
    language: response.restaurant_restaurant_by_pk.language_id as Language
  }

  return restaurant;
}
