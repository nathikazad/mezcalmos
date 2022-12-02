import { HttpsError } from "firebase-functions/v1/auth";
import { createRestaurantOperator } from "../shared/graphql/restaurant/operators/createRestaurantOperator";
import { getRestaurantOperator } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { AppType, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OperatorStatus, RestaurantOperator } from "../shared/models/Services/Restaurant/Restaurant";

export interface AuthorizeDetails {
  restaurantOwnerOperatorId: number,
  newOperatorUserId: number,
  newOperatorNotificationToken?: string
}

export async function authorizeOperator(ownerUserId: number, authorizeDetails: AuthorizeDetails) {
  
  let restaurantOwner: RestaurantOperator = await getRestaurantOperator(authorizeDetails.restaurantOwnerOperatorId);

  if(restaurantOwner.userId != ownerUserId) {
    throw new HttpsError(
      "internal",
      "User id mismatch"
    );
  }
  if(restaurantOwner.owner == false) {
    throw new HttpsError(
      "internal",
      "Only owner can add other operators"
    );
  }
  let newOperator: RestaurantOperator = {
    userId: authorizeDetails.newOperatorUserId,
    restaurantId: restaurantOwner.restaurantId,
    status: OperatorStatus.Authorized,
  }
  if(authorizeDetails.newOperatorNotificationToken != undefined) {
    newOperator.notificationInfo = {
      AppTypeId: AppType.RestaurantApp,
      token: authorizeDetails.newOperatorNotificationToken
    }
  }
  createRestaurantOperator(newOperator);

  return { status: ServerResponseStatus.Success }
}