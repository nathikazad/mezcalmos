import { getHasura } from "../../../utilities/hasura";
import { AppType, Language, MezError } from "../../models/Generic/Generic";
import { OpenStatus, Operator, ServiceProvider, ServiceProviderType } from "../../models/Services/Service";
import { AuthorizationStatus } from "../../models/Generic/Generic";

export async function getRestaurant(restaurantId: number): Promise<ServiceProvider> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_restaurant_by_pk: [{
      id: restaurantId
    },{
      details_id: true,
      delivery_partners: [{}, {
        delivery_company_id: true,
      }],
      delivery_details: {
        cost_per_km: true,
        free_delivery_km_range: true,
        free_delivery_minimum_cost: true,
        minimum_cost: true,
        radius: true,
        delivery_available: true,
        customer_pickup: true,
        self_delivery: true,
      },
      details: {
        name: true,
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
        creation_time: true,
        schedule: [{}, true],
        stripe_info: {
          stripe_id: true,
          status: true,
          charge_fees_on_customer: true,
          charges_enabled: true,
          payouts_enabled: true,
          details_submitted: true,
          //requirements
          email: true,
        },
        accepted_payments: [{}, true],
        language: [{}, true],
        location: {
          gps: true,
          address: true,
        },
      },
      restaurant_operators: [{}, {
        id: true,
        user_id: true,
        details_id: true,
        operator_details: {
          status: true,
          owner: true,
          online: true,
          notification_info: {
            token: true,
            turn_off_notifications: true
          }
        },
        user: {
          firebase_id: true,
          language_id: true,
          name: true,
          email: true,
          phone: true,
        }
      }]
    }]
  });

  if(response.restaurant_restaurant_by_pk == null || response.restaurant_restaurant_by_pk.details == null) {
    throw new MezError("restaurantNotFound");
  }

  let operators: Operator[] = response.restaurant_restaurant_by_pk.restaurant_operators.map((r : any): Operator => {
    return {
      id: r.id,
      userId: r.user_id,
      detailsId: r.details_id,
      serviceProviderId: restaurantId,
      status: r.operator_details.status as AuthorizationStatus,
      owner: r.operator_details.owner,
      online: r.operator_details.online,
      notificationInfo: (r.operator_details.notification_info) ? {
        appType: AppType.Restaurant,
        token: r.operator_details.notification_info.token,
        turnOffNotifications: r.operator_details.notification_info.turn_off_notifications
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
    id: restaurantId,
    serviceProviderType: ServiceProviderType.Restaurant,
    serviceProviderDetailsId: response.restaurant_restaurant_by_pk.details_id,
    name: response.restaurant_restaurant_by_pk.details.name,
    image: response.restaurant_restaurant_by_pk.details.image,
    phoneNumber: response.restaurant_restaurant_by_pk.details.phone_number,
    location: {
      address: response.restaurant_restaurant_by_pk.details.location?.address,
      lat : response.restaurant_restaurant_by_pk.details.location?.gps.coordinates[1],
      lng: response.restaurant_restaurant_by_pk.details.location?.gps.coordinates[0]
    },
    description: response.restaurant_restaurant_by_pk.details.description?.translations.reduce((prev:Record<any, any>, current) => {
      prev[current.language_id] = current.value;
      return prev;
    }, {}),
    schedule: JSON.parse(response.restaurant_restaurant_by_pk.details.schedule),
    creationTime: response.restaurant_restaurant_by_pk.details.creation_time,
    openStatus: response.restaurant_restaurant_by_pk.details.open_status as OpenStatus,
    approved: response.restaurant_restaurant_by_pk.details.approved,
    stripeInfo: (response.restaurant_restaurant_by_pk.details.stripe_info) 
      ? {
        id: response.restaurant_restaurant_by_pk.details.stripe_info.stripe_id,
        status: response.restaurant_restaurant_by_pk.details.stripe_info.status,
        chargeFeesOnCustomer: response.restaurant_restaurant_by_pk.details.stripe_info.charge_fees_on_customer ?? null,
        chargesEnabled: response.restaurant_restaurant_by_pk.details.stripe_info.charges_enabled,
        detailsSubmitted: response.restaurant_restaurant_by_pk.details.stripe_info.details_submitted,
        payoutsEnabled: response.restaurant_restaurant_by_pk.details.stripe_info.payouts_enabled,
        email: response.restaurant_restaurant_by_pk.details.stripe_info.email ?? null,
        //requirements
      }: undefined,
    acceptedPayments: JSON.parse(response.restaurant_restaurant_by_pk.details.accepted_payments),
    operators,
    deliveryPartnerId: response.restaurant_restaurant_by_pk.delivery_partners[0] 
      ? response.restaurant_restaurant_by_pk.delivery_partners[0].delivery_company_id
      : undefined,
    language: /*JSON.parse(*/response.restaurant_restaurant_by_pk.details.language,
    deliveryDetails: {
      costPerKm: response.restaurant_restaurant_by_pk.delivery_details.cost_per_km,
      freeDeliveryKmRange: response.restaurant_restaurant_by_pk.delivery_details.free_delivery_km_range,
      freeDeliveryMinimumCost: response.restaurant_restaurant_by_pk.delivery_details.free_delivery_minimum_cost,
      minimumCost: response.restaurant_restaurant_by_pk.delivery_details.minimum_cost,
      radius: response.restaurant_restaurant_by_pk.delivery_details.radius,
      customerPickup: response.restaurant_restaurant_by_pk.delivery_details.customer_pickup,
      deliveryAvailable: response.restaurant_restaurant_by_pk.delivery_details.delivery_available,
      selfDelivery: response.restaurant_restaurant_by_pk.delivery_details.self_delivery
    }
  }

  return restaurant;
}
