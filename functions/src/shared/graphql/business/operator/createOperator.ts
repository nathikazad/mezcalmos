import { AddOperatorDetails, AddOperatorError } from "../../../../serviceProvider/addOperator";
import { notification_info_constraint, notification_info_update_column } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { Operator, ServiceProvider } from "../../../models/Services/Service";

export async function createBusinessOperator(operatorUserId: number, addOpDetails: AddOperatorDetails, businessDetails: ServiceProvider): Promise<Operator> {

    let chain = getHasura();
    let response = await chain.query({
        business_operator: [{
            where: {
                _and: [{
                    user_id: {
                        _eq: operatorUserId,
                    },
                }, {
                    business_id: {
                        _eq: businessDetails.id
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
                    _eq: AppType.Business
                }
            }
        }, {
            id: true,
        }]
    })
    if(response.business_operator.length) {
        throw new MezError(AddOperatorError.UserAlreadyAnOperator);
    }
  
    let mutationResponse = await chain.mutation({
        insert_business_operator_one: [{
            object: {
                user_id: operatorUserId,
                business_id: businessDetails.id,
                operator_details: {
                    data: {
                        user_id: operatorUserId,
                        app_type_id: AppType.Business,
                        app_version: addOpDetails.appVersion,
                        status: AuthorizationStatus.AwaitingApproval,
                    }
                },
            }
        }, {
            id: true,
            details_id: true,
        }]
    });
    if(mutationResponse.insert_business_operator_one == null) {
        throw new MezError(AddOperatorError.OperatorCreationError);
    }

    if(addOpDetails.notificationToken) {
        chain.mutation({
          insert_notification_info_one: [{
            object: {
              app_type_id: AppType.Business,
              token: addOpDetails.notificationToken,
              user_id: operatorUserId,
              turn_off_notifications: false,
            },
            on_conflict: {
              constraint: (
                notification_info_constraint.notification_info_app_type_id_user_id_key
              ),
              update_columns: [notification_info_update_column.token]
            }
          }, {
            id: true
          }]
        })
      }
    return {
      id: mutationResponse.insert_business_operator_one.id,
      userId: operatorUserId,
      detailsId: mutationResponse.insert_business_operator_one.details_id,
      serviceProviderId: businessDetails.id,
      status: AuthorizationStatus.AwaitingApproval,
      online: true,
      notificationInfo: (addOpDetails.notificationToken) ? {
        appType: AppType.Business,
        token: addOpDetails.notificationToken,
        turnOffNotifications:  false
      }: undefined,
    }
  }