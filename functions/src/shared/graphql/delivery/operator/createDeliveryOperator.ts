import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType } from "../../../models/Generic/Generic";
import { DeliveryOperator } from "../../../models/Generic/Delivery";


export async function createDeliveryOperator(operator: DeliveryOperator) {
    let chain = getHasura();
    let response = await chain.query({
        delivery_operator: [{
            where: {
                user_id: {
                    _eq: operator.userId,
                },
                delivery_company_id: {
                    _eq: operator.deliveryCompanyId
                }
            }
        }, {
            id: true,
        }],
        notification_info: [{
            where: {
                user_id: {
                    _eq: operator.userId
                },
                app_type_id: {
                    _eq: AppType.DeliveryAdmin
                }
            }
        }, {
            id: true,
        }]
    })
    if(response.delivery_operator.length) {
        throw new HttpsError(
            "internal",
            "The operator is already working for this delivery company"
        );
    }
    let mutationResponse = await chain.mutation({
        insert_delivery_operator_one: [{
            object: {
                user_id: operator.userId,
                delivery_company_id: operator.deliveryCompanyId,
                status: operator.status,
            }
        }, {
            id: true,
        }]
    });
    if(mutationResponse.insert_delivery_operator_one == null) {
        throw new HttpsError(
          "internal",
          "operator creation error"
        );
    }
    if(!(response.notification_info.length) && operator.notificationInfo) {
        await chain.mutation({
            insert_notification_info_one: [{
                object: {
                    app_type_id: operator.notificationInfo.AppTypeId,
                    token: operator.notificationInfo.token,
                    user_id: operator.userId
                }
            }, {
                id: true
            }]
        });
    }
    operator.id = mutationResponse.insert_delivery_operator_one.id;
}