import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { Operator } from "../../../models/Services/Service";

export async function deleteLaundryOperator(operator: Operator) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_laundry_operator_by_pk: [{
            id: operator.id
        }, {
            id: true,
        }],
        delete_service_provider_operator_details_by_pk: [{
            id: operator.detailsId
        }, {
            id: true
        }]
    });
    if(!(response.delete_laundry_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect laundry operator id"
        );
    }
}