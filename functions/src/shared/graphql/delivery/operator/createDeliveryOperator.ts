import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { DeliveryOperator } from "../../../models/Generic/Delivery";
import { AddOperatorDetails } from "../../../operator/addOperator";
import { ServiceProvider } from "../../../models/Services/Service";

export async function createDeliveryOperator(operatorUserId: number, addOperatorDetails: AddOperatorDetails, deliveryCompany: ServiceProvider): Promise<DeliveryOperator> {
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
        throw new MezError("operatorCreationError");
    }
    return {
        id: mutationResponse.insert_delivery_operator_one.id,
        userId: operatorUserId,
        operatorDetailsId: mutationResponse.insert_delivery_operator_one.details_id,
        deliveryCompanyId: deliveryCompany.id,
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