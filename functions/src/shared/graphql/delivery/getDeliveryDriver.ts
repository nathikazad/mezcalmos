import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, Language } from "../../models/Generic/Generic";
import { DeliveryDriverType, DeliveryDriver, DeliveryCompanyType } from "../../models/Services/Delivery/DeliveryOrder";

export async function getDeliveryDriver(deliveryDriverId: number, deliveryDriverType: DeliveryDriverType): Promise<DeliveryDriver> {
  
  let chain = getHasura();
  let response;
  if(deliveryDriverType == DeliveryDriverType.RestaurantOperator) {
    response = await chain.query({
      restaurant_operator_by_pk: [{
        id: deliveryDriverId
      }, {
        user: {
          id: true,
          firebase_id: true,
          language_id: true,
        },
        notification_token: true
      }]
    });
    if(response.restaurant_operator_by_pk == null) {
      throw new HttpsError(
        "internal",
        "No operator with that id found"
      );
    }
    return {
      userId: response.restaurant_operator_by_pk.user.id,
      user: {
        id:  response.restaurant_operator_by_pk.user.id,
        firebaseId: response.restaurant_operator_by_pk.user.firebase_id,
        language: response.restaurant_operator_by_pk.user.language_id as Language
      },
      notificationInfo: (response.restaurant_operator_by_pk.notification_token) ? {
        AppTypeId: AppType.RestaurantApp,
        token: response.restaurant_operator_by_pk.notification_token
      } : undefined,
      deliveryDriverType: DeliveryDriverType.RestaurantOperator
    } 
  }
  else {
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
          language_id: true
        },
        notification_token: true,
      }]
    });
    if(response.delivery_driver_by_pk == null) {
      throw new HttpsError(
        "internal",
        "No delivery driver with that id found"
      );
    }
    return {
      id: deliveryDriverId,
      userId: response.delivery_driver_by_pk.user_id,
      deliveryCompanyType: response.delivery_driver_by_pk.delivery_company_type as DeliveryCompanyType,
      deliveryCompanyId: response.delivery_driver_by_pk.delivery_company_id,
      status: response.delivery_driver_by_pk.status,
      online: response.delivery_driver_by_pk.online,
      user: {
        id: response.delivery_driver_by_pk.user_id,
        firebaseId: response.delivery_driver_by_pk.user.firebase_id,
        language: response.delivery_driver_by_pk.user.language_id as Language
      },
      notificationInfo: (response.delivery_driver_by_pk.notification_token) ? {
        AppTypeId: AppType.DeliveryApp,
        token: response.delivery_driver_by_pk.notification_token
      } : undefined,
      deliveryDriverType: DeliveryDriverType.DeliveryDriver
    }
  }
}