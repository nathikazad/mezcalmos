import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus } from "../../../models/Generic/Generic";
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
        throw new HttpsError(
          "internal",
          "operator creation error or operator is already working for this delivery company"
        );
    }
    return {
        id: mutationResponse.insert_delivery_operator_one.id,
        userId: operatorUserId,
        operatorDetailsId: mutationResponse.insert_delivery_operator_one.details_id,
        deliveryCompanyId: deliveryCompany.id,
        status: AuthorizationStatus.AwaitingApproval,
        notificationInfo: addOperatorDetails.notificationInfo,
        owner: false,
        online: true,
    }
}