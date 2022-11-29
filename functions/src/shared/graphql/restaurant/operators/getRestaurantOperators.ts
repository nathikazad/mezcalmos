import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { OperatorStatus, RestaurantOperator } from "../../../models/Services/Restaurant/Restaurant";


export async function getRestaurantOperators(restaurantId: number): Promise<RestaurantOperator[]> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator: [{
      where: {
        restaurant_id: {
          _eq: restaurantId
        },
        status: {
          _eq: "authorized"
        }
      }
    }, {
      id: true,
      user_id: true,
      status: true,
      owner: true,
      notification_token: true,
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.restaurant_operator == null) {
    throw new HttpsError(
      "internal",
      "No restaurant with that id found"
    );
  }
  
  return response.restaurant_operator.map((r): RestaurantOperator => {
    return {
      id: r.id,
      userId: r.user_id,
      restaurantId: restaurantId,
      status: r.status as OperatorStatus,
      owner: r.owner,
      notificationInfo: (r.notification_token) ? {
        AppTypeId: AppType.RestaurantApp,
        token: r.notification_token
      }: undefined,
      user: {
        id: r.user_id,
        firebaseId: r.user.firebase_id,
        language: r.user.language_id as Language
      }
    }
  });

}

export async function getRestaurantOperator(restaurantOperatorId: number): Promise<RestaurantOperator> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator_by_pk: [{
      id: restaurantOperatorId
    }, {
      id: true,
      user_id: true,
      status: true,
      owner: true,
      restaurant_id: true,
      notification_token: true,
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.restaurant_operator_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No restaurant operator with that id found"
    );
  }
  return {
    id: response.restaurant_operator_by_pk.id,
    userId: response.restaurant_operator_by_pk.user_id,
    restaurantId: response.restaurant_operator_by_pk.restaurant_id,
    status: response.restaurant_operator_by_pk.status as OperatorStatus,
    owner: response.restaurant_operator_by_pk.owner,
    notificationInfo: (response.restaurant_operator_by_pk.notification_token) ? {
      AppTypeId: AppType.RestaurantApp,
      token: response.restaurant_operator_by_pk.notification_token
    }: undefined,
    user: {
      id: response.restaurant_operator_by_pk.user_id,
      firebaseId: response.restaurant_operator_by_pk.user.firebase_id,
      language: response.restaurant_operator_by_pk.user.language_id as Language
    }
  };
}