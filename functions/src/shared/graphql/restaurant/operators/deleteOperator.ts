import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { Operator } from "../../../models/Services/Service";

export async function deleteRestaurantOperator(operator: Operator) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_restaurant_operator_by_pk: [{
            id: operator.id
        }, {
            details_id: true,
        }],
        delete_service_provider_operator_details_by_pk: [{
            id: operator.detailsId
        }, {
            id: true
        }]
    });
    if(!(response.delete_restaurant_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect restaurant operator id"
        );
    }
}