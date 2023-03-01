import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus, AppType, Language } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";

export async function getBusinessOperatorByUserId(businessOperatorUserId: number): Promise<Operator> {
  let chain = getHasura();

  let response = await chain.query({
    business_operator: [{
      where: {
        user_id: {
          _eq: businessOperatorUserId
        }
      }
    }, {
      id: true,
      business_id: true,
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
  if(response.business_operator == null) {
    throw new HttpsError(
      "internal",
      "No business operator with that user id found"
    );
  }
  return {
    id: response.business_operator[0].id,
    detailsId: response.business_operator[0].operator_details.id,
    userId: businessOperatorUserId,
    serviceProviderId: response.business_operator[0].business_id,
    status: response.business_operator[0].operator_details.status as AuthorizationStatus,
    owner: response.business_operator[0].operator_details.owner,
    notificationInfo: (response.business_operator[0].operator_details.notification_info) ? {
      appType: AppType.BusinessApp,
      token: response.business_operator[0].operator_details.notification_info.token,
      turnOffNotifications: response.business_operator[0].operator_details.notification_info.turn_off_notifications
    }: undefined,
    user: {
      id: businessOperatorUserId,
      firebaseId: response.business_operator[0].user.firebase_id,
      language: response.business_operator[0].user.language_id as Language
    }
  };
}


export async function getBusinessOperators(businessId: number): Promise<Operator[]> {
  let chain = getHasura();

  let response = await chain.query({
    business_operator: [{
      where: {
        business_id: {
          _eq: businessId
        }
      }
    }, {
      id: true,
      business_id: true,
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
        id: true,
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.business_operator.length == 0) {
    throw new HttpsError(
      "internal",
      "No business operator with that business id found"
    );
  }
  return response.business_operator.map((o) => {
    return {
      id: o.id,
      detailsId: o.operator_details.id,
      userId: o.user.id,
      serviceProviderId: o.business_id,
      status: o.operator_details.status as AuthorizationStatus,
      owner: o.operator_details.owner,
      notificationInfo: (o.operator_details.notification_info) ? {
        appType: AppType.BusinessApp,
        token: o.operator_details.notification_info.token,
        turnOffNotifications: o.operator_details.notification_info.turn_off_notifications
      }: undefined,
      user: {
        id: o.user.id,
        firebaseId: o.user.firebase_id,
        language: o.user.language_id as Language
      }
    }
  })
}