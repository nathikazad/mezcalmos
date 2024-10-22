import { AddOperatorDetails, AddOperatorError } from "../../../../serviceProvider/addOperator";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { Operator, ServiceProvider } from "../../../models/Services/Service";

export async function createDeliveryOperator(operatorUserId: number, addOperatorDetails: AddOperatorDetails, deliveryCompany: ServiceProvider): Promise<Operator> {
    let chain = getHasura();

    let mutationResponse = await chain.mutation({
        insert_delivery_operator_one: [{
            object: {
                user_id: operatorUserId,
                delivery_company_id: deliveryCompany.id,
                operator_details: {
                    data: {
                        status: AuthorizationStatus.AwaitingApproval,
                        app_type_id: AppType.DeliveryAdmin,
                        user_id: operatorUserId,
                        notification_info: (addOperatorDetails.notificationToken) 
                        ? {
                          data: {
                            token: addOperatorDetails.notificationToken,
                            user_id: operatorUserId,
                            turn_off_notifications: false,
                            app_type_id: AppType.DeliveryAdmin
                          }
                        }: undefined,
                    }
                }
            }
        }, {
            id: true,
            details_id: true,
        }]
    });
    if(mutationResponse.insert_delivery_operator_one == null) {
        throw new MezError(AddOperatorError.OperatorCreationError);
    }
    return {
        id: mutationResponse.insert_delivery_operator_one.id,
        userId: operatorUserId,
        detailsId: mutationResponse.insert_delivery_operator_one.details_id,
        serviceProviderId: deliveryCompany.id,
        status: AuthorizationStatus.AwaitingApproval,
        notificationInfo: (addOperatorDetails.notificationToken) ? {
            appType: AppType.DeliveryAdmin,
            token: addOperatorDetails.notificationToken,
            turnOffNotifications:  false
          }: undefined,
        owner: false,
        online: true,
    }
}