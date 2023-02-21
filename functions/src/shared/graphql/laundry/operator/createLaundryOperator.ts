import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";
import { AddOperatorDetails } from "../../../operator/addOperator";

export async function createLaundryOperator(operatorUserId: number, addOpDetails: AddOperatorDetails): Promise<Operator> {

    let chain = getHasura();
    let response = await chain.query({
        laundry_operator: [{
            where: {
                _and: [{
                    user_id: {
                        _eq: operatorUserId,
                    },
                }, {
                    store_id: {
                        _eq: addOpDetails.serviceProviderId
                    }
                }]

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
                    _eq: AppType.LaundryApp
                }
            }
        }, {
            id: true,
        }]
    })
    if(response.laundry_operator.length) {
        throw new HttpsError(
            "internal",
            "The operator is already working for this laundry store"
        );
    }
  
    let mutationResponse = await chain.mutation({
        insert_laundry_operator_one: [{
            object: {
                user_id: operatorUserId,
                store_id: addOpDetails.serviceProviderId,
                operator_details: {
                    data: {
                        app_type_id: AppType.LaundryApp,
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
                        status: AuthorizationStatus.AwaitingApproval,
                    }
                },
            }
        }, {
            id: true,
            details_id: true,
        }]
    });
    if(mutationResponse.insert_laundry_operator_one == null) {
      throw new HttpsError(
        "internal",
        "operator creation error"
      );
    }
    return {
      id: mutationResponse.insert_laundry_operator_one.id,
      userId: operatorUserId,
      detailsId: mutationResponse.insert_laundry_operator_one.details_id,
      serviceProviderId: addOpDetails.serviceProviderId,
      status: AuthorizationStatus.AwaitingApproval,
      notificationInfo: addOpDetails.notificationInfo,
    }
  }