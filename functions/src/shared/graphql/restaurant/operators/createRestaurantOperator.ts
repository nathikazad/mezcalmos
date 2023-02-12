import { HttpsError } from "firebase-functions/v1/auth";
import { AddOperatorDetails } from "../../../../restaurant/addRestaurantOperator";
import { getHasura } from "../../../../utilities/hasura";
import { AppType } from "../../../models/Generic/Generic";
import { Operator, OperatorStatus } from "../../../models/Services/Service";

export async function createRestaurantOperator(operatorUserId: number, addOpDetails: AddOperatorDetails): Promise<Operator> {

  let chain = getHasura();
  let response = await chain.query({
    restaurant_operator: [{
        where: {
            user_id: {
                _eq: operatorUserId,
            },
            restaurant_id: {
                _eq: addOpDetails.restaurantId
            }
        }
    }, {
        id: true,
    }],
    notification_info: [{
        where: {
            user_id: {
                _eq: operatorUserId
            },
            app_type_id: {
                _eq: AppType.RestaurantApp
            }
        }
    }, {
        id: true,
    }]
  })
  if(response.restaurant_operator.length) {
      throw new HttpsError(
          "internal",
          "The operator is already working for this restaurant"
      );
  }

  let mutationResponse = await chain.mutation({
    insert_restaurant_operator_one: [{
      object: {
        user_id: operatorUserId,
        restaurant_id: addOpDetails.restaurantId,
        operator_details: {
          data: {
            app_type_id: AppType.RestaurantApp,
            app_version: addOpDetails.appVersion,
            notification_info: (addOpDetails.notificationInfo) 
              ? {
                data: {
                  token: addOpDetails.notificationInfo.token,
                  user_id: operatorUserId,
                  turn_off_notifications: addOpDetails.notificationInfo.turnOffNotifications,
                  app_type_id: addOpDetails.notificationInfo.appType
                }
              }: undefined,
            status: OperatorStatus.AwaitingApproval,
          }
        }
      }
    }, {
      id: true,
    }]
  });
  if(mutationResponse.insert_restaurant_operator_one == null) {
    throw new HttpsError(
      "internal",
      "operator creation error"
    );
  }
  return {
    id: mutationResponse.insert_restaurant_operator_one.id,
    userId: operatorUserId,
    serviceProviderId: addOpDetails.restaurantId,
    status: OperatorStatus.AwaitingApproval,
    notificationInfo: addOpDetails.notificationInfo,
  }
}