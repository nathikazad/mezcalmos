import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { DeliveryOperator } from "../../../models/Generic/Delivery";
import { AddOperatorDetails } from "../../../operator/addOperator";

export async function createDeliveryOperator(operatorUserId: number, addOperatorDetails: AddOperatorDetails): Promise<DeliveryOperator> {
    let chain = getHasura();

    let mutationResponse = await chain.mutation({
        insert_delivery_operator_one: [{
            object: {
                user_id: operatorUserId,
                delivery_company_id: addOperatorDetails.serviceProviderId,
                operator_details: {
                    data: {
                        status: AuthorizationStatus.AwaitingApproval,
                        app_type_id: AppType.DeliveryAdmin,
                        user_id: operatorUserId,
                        notification_info: (addOperatorDetails.notificationInfo) ? {
                            data: {
                                app_type_id: AppType.DeliveryAdmin,
                                token: addOperatorDetails.notificationInfo.token,
                                user_id: operatorUserId
                            }
                        }: undefined
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
        deliveryCompanyId: addOperatorDetails.serviceProviderId,
        status: AuthorizationStatus.AwaitingApproval,
        notificationInfo: addOperatorDetails.notificationInfo,
        owner: false,
        online: true,
    }
}