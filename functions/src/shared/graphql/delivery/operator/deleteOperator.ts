import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";

export async function deleteDeliveryOperator(deliveryOperator: Operator) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_delivery_operator_by_pk: [{
            id: deliveryOperator.id
        }, {
            id: true,
        }],
        delete_service_provider_operator_details_by_pk: [{
            id: deliveryOperator.detailsId
        }, {
            id: true
        }]
    });
    if(!(response.delete_delivery_operator_by_pk)) {
        throw new MezError("incorrectOperatorId");
    }
}