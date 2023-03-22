import { getHasura } from "../../../../utilities/hasura";
import { DeliveryOperator } from "../../../models/Generic/Delivery";
import { MezError } from "../../../models/Generic/Generic";

export async function deleteDeliveryOperator(deliveryOperator: DeliveryOperator) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_delivery_operator_by_pk: [{
            id: deliveryOperator.id
        }, {
            id: true,
        }],
        delete_service_provider_operator_details_by_pk: [{
            id: deliveryOperator.operatorDetailsId
        }, {
            id: true
        }]
    });
    if(!(response.delete_delivery_operator_by_pk)) {
        throw new MezError("incorrectOperatorId");
    }
}