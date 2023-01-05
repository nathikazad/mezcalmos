import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";

export async function deleteDeliveryOperator(deliveryOperatorId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_delivery_operator_by_pk: [{
            id: deliveryOperatorId
        }, {
            id: true,
        }]
    });
    if(!(response.delete_delivery_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect delivery operator id"
        );
    }
}