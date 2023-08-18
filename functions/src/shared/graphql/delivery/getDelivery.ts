import { getHasura } from "../../../utilities/hasura";
import { AppType, AuthorizationStatus, Language, MezError } from "../../models/Generic/Generic";
import { OrderType, PaymentType } from "../../models/Generic/Order";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { Operator, ServiceProvider, ServiceProviderType } from "../../models/Services/Service";

export async function getDeliveryOrder(deliveryId: number): Promise<DeliveryOrder> {
  let chain = getHasura();

  let response = await chain.query({
    delivery_order_by_pk: [{
      id: deliveryId
    }, {
      pickup_gps: true,
      pickup_address: true,
      dropoff_gps: true,
      dropoff_address: true,
      chat_with_service_provider_id: true,
      chat_with_customer_id: true,
      package_ready: true,
      payment_type: true,
      status: true,
      customer_id: true,
      delivery_cost: true,
      service_provider_type: true,
      service_provider_id: true,
      package_cost: true,
      order_time: true,
      delivery_driver_id: true,
      direction: true,
      order_type: true,
      trip_distance: true,
      trip_duration: true,
      trip_polyline: true,
      counter_offers: [{}, true],
      customer_offer: true,
      notified_drivers: [{}, true],
      chosen_companies: [{}, true],
      delivery_driver: {
        id: true,
        delivery_company_type: true,
        delivery_company_id: true,
        user: {
          id: true,
          firebase_id: true,
          language_id: true,
        },
        status: true,
        notification_info: {
          token: true,
          turn_off_notifications: true
        }
      },
      // restaurant_operator: {
      //   user: {
      //     id: true,
      //     firebase_id: true,
      //     language_id: true,
      //   },
      //   notification_info: {
      //     token: true,
      //     turn_off_notifications: true
      //   }
      // }
    }]
  });
  if (response.delivery_order_by_pk == null) {
    throw new MezError("orderNotFound");
  }
  let delivery: DeliveryOrder = {
    packageReady: response.delivery_order_by_pk.package_ready,
    deliveryId: deliveryId,
    serviceProviderId: response.delivery_order_by_pk.service_provider_id!,
    orderType: response.delivery_order_by_pk.order_type as OrderType,
    pickupLocation:  (response.delivery_order_by_pk.pickup_gps && response.delivery_order_by_pk.pickup_gps.coordinates && response.delivery_order_by_pk.pickup_address ) ? {
      lat: response.delivery_order_by_pk.pickup_gps.coordinates[1],
      lng: response.delivery_order_by_pk.pickup_gps.coordinates[0],
      address: response.delivery_order_by_pk.pickup_address,
    }: undefined,
    dropoffLocation: {
      lat: response.delivery_order_by_pk.dropoff_gps.coordinates[1],
      lng: response.delivery_order_by_pk.dropoff_gps.coordinates[0],
      address: response.delivery_order_by_pk.dropoff_address,
    },
    chatWithServiceProviderId: response.delivery_order_by_pk.chat_with_service_provider_id,
    chatWithCustomerId: response.delivery_order_by_pk.chat_with_customer_id,
    paymentType: response.delivery_order_by_pk.payment_type as PaymentType,
    status: response.delivery_order_by_pk.status as DeliveryOrderStatus,
    customerId: response.delivery_order_by_pk.customer_id,
    deliveryCost: parseFloat(response.delivery_order_by_pk.delivery_cost.replace("$", "")),
    packageCost: parseFloat(response.delivery_order_by_pk.package_cost.replace("$", "")),
    orderTime: response.delivery_order_by_pk.order_time,
    serviceProviderType: response.delivery_order_by_pk.service_provider_type as DeliveryServiceProviderType,
    direction: response.delivery_order_by_pk.direction as DeliveryDirection,
    deliveryDriverId: response.delivery_order_by_pk.delivery_driver_id,
    tripDistance: response.delivery_order_by_pk.trip_distance,
    tripDuration: response.delivery_order_by_pk.trip_duration,
    tripPolyline: response.delivery_order_by_pk.trip_polyline,
    deliveryDriver: (response.delivery_order_by_pk.delivery_driver) ? {
      id: response.delivery_order_by_pk.delivery_driver.id,
      deliveryCompanyType: response.delivery_order_by_pk.delivery_driver.delivery_company_type as DeliveryServiceProviderType,
      companyId: response.delivery_order_by_pk.delivery_driver.delivery_company_id,
      status: response.delivery_order_by_pk.delivery_driver.status as AuthorizationStatus,
      userId: response.delivery_order_by_pk.delivery_driver.user.id,
      user: {
        id: response.delivery_order_by_pk.delivery_driver.user.id,
        firebaseId: response.delivery_order_by_pk.delivery_driver.user.firebase_id,
        language: response.delivery_order_by_pk.delivery_driver.user.language_id as Language
      },
      notificationInfo: (response.delivery_order_by_pk.delivery_driver.notification_info) ? {
        appType: AppType.Delivery,
        token: response.delivery_order_by_pk.delivery_driver.notification_info.token,
        turnOffNotifications: response.delivery_order_by_pk.delivery_driver.notification_info.turn_off_notifications,
      } : undefined,
    }: undefined,
    customerOffer: response.delivery_order_by_pk.customer_offer,
    counterOffers: response.delivery_order_by_pk.counter_offers,
    chosenCompanies: response.delivery_order_by_pk.chosen_companies,
    notifiedDrivers: response.delivery_order_by_pk.notified_drivers,
  }
  
  return delivery;
}

export async function getNotifiedDrivers(): Promise<any> {
  let chain = getHasura();

  let response = await chain.query({
    delivery_order: [{
      where: {
        service_provider_type: {
          _eq: DeliveryServiceProviderType.DeliveryCompany,
        },
        delivery_driver_id: {
          _is_null: true,
        },
        status: {
          _eq: DeliveryOrderStatus.OrderReceived
        },
        notified_drivers: {
          _is_null: false
        },
        order_time: {
          _gte: new Date(new Date().getTime() - 1000 * 60).toISOString()
        }
      }
    }, {
      id: true,
      order_type: true,
      notified_drivers: [{}, true]
    }]
  });

  return response.delivery_order.map((d) => {
    return {
      deliveryId: d.id,
      orderType: d.order_type as OrderType,
      notifiedDrivers: d.notified_drivers as Record<number, boolean>
    }
  });
}
export async function getDeliveryCompany(companyId: number): Promise<ServiceProvider> {
  let chain = getHasura();

  let response = await chain.query({
    delivery_company_by_pk: [{
      id: companyId,
    }, {
      details: {
        id: true,
        name: true,
        image: true,
        phone_number: true,
        location: {
          gps: true,
          address: true,
        },
        language: [{}, true],
      },
      delivery_operators: [{}, {
        id: true,
        details_id: true,
        delivery_company_id: true,
        user_id: true,
        operator_details: {
            status: true,
            online: true,
        },
        user: {
            firebase_id: true,
            language_id: true
        }
      }]
    }]
  });

  if(response.delivery_company_by_pk == null || response.delivery_company_by_pk.details == null) {
    throw new MezError("deliveryCompanyNotFound");
  } 
  let operators: Operator[] = response.delivery_company_by_pk.delivery_operators.map((o:any) => {
    return {
      id: o.id,
      detailsId: o.details_id,
      serviceProviderId: companyId,
      userId: o.user_id,
      status: o.operator_details.status as AuthorizationStatus,
      online: o.operator_details.online,
    }
  })

  return {
    id: companyId,
    serviceProviderDetailsId: response.delivery_company_by_pk.details.id,
    name: response.delivery_company_by_pk.details.name,
    image: response.delivery_company_by_pk.details.image,
    location: {
      lat: response.delivery_company_by_pk?.details?.location.gps.coordinates[1],
      lng: response.delivery_company_by_pk?.details?.location.gps.coordinates[0],
      address: response.delivery_company_by_pk?.details?.location.address
    },
    language: response.delivery_company_by_pk?.details?.language,
    phoneNumber: response.delivery_company_by_pk?.details?.phone_number,
    deliveryDetails: {
      deliveryAvailable: true,
      customerPickup: false,
      selfDelivery: true,
    },
    serviceProviderType: ServiceProviderType.DeliveryCompany,
    operators
  }
}