import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, AuthorizationStatus, Language } from "../../models/Generic/Generic";
import { OrderType, PaymentType } from "../../models/Generic/Order";
import { DeliveryDirection, DeliveryDriver, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { ParticipantType } from "../../models/Generic/Chat";

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
    throw new HttpsError(
      "internal",
      "No order with that id found"
    );
  }
  let delivery: DeliveryOrder = {
    packageReady: response.delivery_order_by_pk.package_ready,
    deliveryId: deliveryId,
    serviceProviderId: response.delivery_order_by_pk.service_provider_id,
    orderType: response.delivery_order_by_pk.order_type as OrderType,
    pickupLocation: {
      lat: response.delivery_order_by_pk.pickup_gps.coordinates[1],
      lng: response.delivery_order_by_pk.pickup_gps.coordinates[0],
      address: response.delivery_order_by_pk.pickup_address,
    },
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
      deliveryCompanyId: response.delivery_order_by_pk.delivery_driver.delivery_company_id,
      status: response.delivery_order_by_pk.delivery_driver.status as AuthorizationStatus,
      userId: response.delivery_order_by_pk.delivery_driver.user.id,
      user: {
        id: response.delivery_order_by_pk.delivery_driver.user.id,
        firebaseId: response.delivery_order_by_pk.delivery_driver.user.firebase_id,
        language: response.delivery_order_by_pk.delivery_driver.user.language_id as Language
      },
      notificationInfo: (response.delivery_order_by_pk.delivery_driver.notification_info) ? {
        appType: AppType.DeliveryApp,
        token: response.delivery_order_by_pk.delivery_driver.notification_info.token,
        turnOffNotifications: response.delivery_order_by_pk.delivery_driver.notification_info.turn_off_notifications,
      } : undefined,
    }: undefined
  }
  
  return delivery;
}

export async function getDeliveryCompanyOrders(): Promise<DeliveryOrder[]> {
  let chain = getHasura();

  let response = await chain.query({
    delivery_order: [{
      where: {
        service_provider_type: {
          _eq: DeliveryServiceProviderType.DeliveryCompany,
        }
      }
    }, {
      id: true,
      pickup_gps: true,
      dropoff_gps: true,
      chat_with_customer_id: true,
      payment_type: true,
      status: true,
      customer_id: true,
      delivery_cost: true,
      order_time: true,
      order_type: true,
      package_ready: true,
      service_provider_id: true,
      direction: true,
      delivery_driver: {
        id: true,
        delivery_driver_type: true,
        status: true,
        user: {
          firebase_id: true,
          id: true,
          language_id: true,
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      }
    }]
  });

  return response.delivery_order.map((d) => {
    let delivery: DeliveryOrder = {
      packageReady: d.package_ready,
      deliveryId: d.id,
      pickupLocation: {
        lat: d.pickup_gps.coordinates[1],
        lng: d.pickup_gps.coordinates[0],
      },
      dropoffLocation: {
        lat: d.dropoff_gps.coordinates[1],
        lng: d.dropoff_gps.coordinates[0],
      },
      chatWithCustomerId: d.chat_with_customer_id,
      paymentType: d.payment_type as PaymentType,
      status: d.status as DeliveryOrderStatus,
      customerId: d.customer_id,
      deliveryCost: d.delivery_cost,
      orderTime: d.order_time,
      orderType: d.order_type as OrderType,
      serviceProviderId: d.service_provider_id,
      serviceProviderType: DeliveryServiceProviderType.DeliveryCompany,
      direction: d.direction as DeliveryDirection,
      deliveryDriver: (d.delivery_driver) ? <DeliveryDriver>{
        id: d.delivery_driver.id,
        userId: d.delivery_driver.user.id,
        deliveryDriverType: d.delivery_driver.delivery_driver_type as ParticipantType,
        status: d.delivery_driver.status as AuthorizationStatus,
        user: {
          id: d.delivery_driver.user.id,
          firebaseId: d.delivery_driver.user.firebase_id,
          language: d.delivery_driver.user.language_id as Language
        },
        notificationInfo: (d.delivery_driver.notification_info) ? {
          appType: AppType.DeliveryApp,
          token: d.delivery_driver.notification_info.token,
          turnOffNotifications: d.delivery_driver.notification_info.turn_off_notifications
        } : undefined,
      } : undefined
    }
    return delivery;
  })
}