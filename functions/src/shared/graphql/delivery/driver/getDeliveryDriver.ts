import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { DeliveryDriver, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { ParticipantType } from "../../../models/Generic/Chat";

export async function getDeliveryDriver(deliveryDriverId: number): Promise<DeliveryDriver> {

  let chain = getHasura();
  let response;
  // if (deliveryDriverType == ParticipantType.RestaurantOperator) {
  //   response = await chain.query({
  //     restaurant_operator_by_pk: [{
  //       id: deliveryDriverId
  //     }, {
  //       user: {
  //         id: true,
  //         firebase_id: true,
  //         language_id: true,
  //         image: true,
  //         name: true,
  //         phone: true
  //       },
  //       notification_info: {
  //         token: true,
  //         turn_off_notifications: true
  //       },
  //     }]
  //   });
  //   if (response.restaurant_operator_by_pk == null) {
  //     throw new HttpsError(
  //       "internal",
  //       "No operator with that id found"
  //     );
  //   }
  //   return {
  //     userId: response.restaurant_operator_by_pk.user.id,
  //     user: {
  //       id: response.restaurant_operator_by_pk.user.id,
  //       firebaseId: response.restaurant_operator_by_pk.user.firebase_id,
  //       language: response.restaurant_operator_by_pk.user.language_id as Language,
  //       image: response.restaurant_operator_by_pk.user.image,
  //       name: response.restaurant_operator_by_pk.user.name,
  //       phoneNumber: response.restaurant_operator_by_pk.user.phone
  //     },
  //     notificationInfo: (response.restaurant_operator_by_pk.notification_info) ? {
  //       appType: AppType.RestaurantApp,
  //       token: response.restaurant_operator_by_pk.notification_info.token,
  //       turnOffNotifications: response.restaurant_operator_by_pk.notification_info.turn_off_notifications
  //     } : undefined,
  //     deliveryDriverType: ParticipantType.RestaurantOperator
  //   }
  // }
  // else {
    response = await chain.query({
      delivery_driver_by_pk: [{
        id: deliveryDriverId
      }, {
        user_id: true,
        delivery_company_type: true,
        delivery_company_id: true,
        status: true,
        online: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      }]
    });
    if (response.delivery_driver_by_pk == null) {
      throw new HttpsError(
        "internal",
        "No delivery driver with that id found"
      );
    }
    return {
      id: deliveryDriverId,
      userId: response.delivery_driver_by_pk.user_id,
      deliveryCompanyType: response.delivery_driver_by_pk.delivery_company_type as DeliveryServiceProviderType,
      deliveryCompanyId: response.delivery_driver_by_pk.delivery_company_id,
      status: response.delivery_driver_by_pk.status,
      online: response.delivery_driver_by_pk.online,
      user: {
        id: response.delivery_driver_by_pk.user_id,
        firebaseId: response.delivery_driver_by_pk.user.firebase_id,
        language: response.delivery_driver_by_pk.user.language_id as Language,
        image: response.delivery_driver_by_pk.user.image,
        name: response.delivery_driver_by_pk.user.name,
        phoneNumber: response.delivery_driver_by_pk.user.phone
      },
      notificationInfo: (response.delivery_driver_by_pk.notification_info) ? {
        appType: AppType.DeliveryApp,
        token: response.delivery_driver_by_pk.notification_info.token,
        turnOffNotifications: response.delivery_driver_by_pk.notification_info.turn_off_notifications
      } : undefined,
      deliveryDriverType: ParticipantType.DeliveryDriver
    }
  // }
}