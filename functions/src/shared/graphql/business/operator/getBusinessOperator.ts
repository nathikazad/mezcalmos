import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus, AppType, Language } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";

export async function getBusinessOperatorByUserId(restaurantOperatorUserId: number): Promise<Operator> {
    let chain = getHasura();
  
    let response = await chain.query({
      restaurant_operator: [{
        where: {
          user_id: {
            _eq: restaurantOperatorUserId
          },
        }
      }, {
        id: true,
        restaurant_id: true,
        operator_details: {
          id: true,
          status: true,
          owner: true,
          notification_info: {
          token: true,
          turn_off_notifications: true
          },
        },
        user: {
          firebase_id: true,
          language_id: true,
        }
      }]
    });
    if(response.restaurant_operator == null) {
      throw new HttpsError(
        "internal",
        "No restaurant operator with that user id or restaurant id found"
      );
    }
    return {
      id: response.restaurant_operator[0].id,
      detailsId: response.restaurant_operator[0].operator_details.id,
      userId: restaurantOperatorUserId,
      serviceProviderId: response.restaurant_operator[0].restaurant_id,
      status: response.restaurant_operator[0].operator_details.status as AuthorizationStatus,
      owner: response.restaurant_operator[0].operator_details.owner,
      notificationInfo: (response.restaurant_operator[0].operator_details.notification_info) ? {
        appType: AppType.RestaurantApp,
        token: response.restaurant_operator[0].operator_details.notification_info.token,
        turnOffNotifications: response.restaurant_operator[0].operator_details.notification_info.turn_off_notifications
      }: undefined,
      user: {
        id: restaurantOperatorUserId,
        firebaseId: response.restaurant_operator[0].user.firebase_id,
        language: response.restaurant_operator[0].user.language_id as Language
      }
    };
  }