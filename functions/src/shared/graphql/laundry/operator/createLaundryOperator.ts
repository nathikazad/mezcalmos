import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { Operator, ServiceProvider } from "../../../models/Services/Service";
import { AddOperatorDetails, AddOperatorError } from "../../../operator/addOperator";

export async function createLaundryOperator(operatorUserId: number, addOpDetails: AddOperatorDetails, laundryStore: ServiceProvider): Promise<Operator> {

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
                        _eq: laundryStore.id
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
                    _eq: AppType.Laundry
                }
            }
        }, {
            id: true,
        }]
    })
    if(response.laundry_operator.length) {
        throw new MezError(AddOperatorError.UserAlreadyAnOperator);
    }
  
    let mutationResponse = await chain.mutation({
        insert_laundry_operator_one: [{
            object: {
                user_id: operatorUserId,
                store_id: laundryStore.id,
                operator_details: {
                    data: {
                        user_id: operatorUserId,
                        app_type_id: AppType.Laundry,
                        app_version: addOpDetails.appVersion,
                        notification_info: (addOpDetails.notificationToken) 
                        ? {
                            data: {
                                token: addOpDetails.notificationToken,
                                user_id: operatorUserId,
                                turn_off_notifications: false,
                                app_type_id: AppType.Laundry
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
        throw new MezError(AddOperatorError.OperatorCreationError);
    }
    return {
      id: mutationResponse.insert_laundry_operator_one.id,
      userId: operatorUserId,
      detailsId: mutationResponse.insert_laundry_operator_one.details_id,
      serviceProviderId: laundryStore.id,
      status: AuthorizationStatus.AwaitingApproval,
      online: true,
      notificationInfo: (addOpDetails.notificationToken) ? {
        appType: AppType.Laundry,
        token: addOpDetails.notificationToken,
        turnOffNotifications:  false
      }: undefined,
    }
  }