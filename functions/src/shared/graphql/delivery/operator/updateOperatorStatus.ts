import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus } from "../../../models/Generic/Generic";

export async function updateDeliveryOperatorStatusToAuthorized(deliveryOperatorId: number) {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator_by_pk: [{
            id: deliveryOperatorId
        }, {
            details_id: true
        }]
    });

    if(response.delivery_operator_by_pk == null) {
        throw new HttpsError(
            "internal",
            "incorrect delivery operator id"
        );
    }

    let mutationResponse = await chain.mutation({
        update_service_provider_operator_details_by_pk: [{
            pk_columns: {
                id: response.delivery_operator_by_pk.details_id
            },
            _set: {
                status: AuthorizationStatus.Authorized
            }
        }, {}],
    });
    if(!(mutationResponse.update_service_provider_operator_details_by_pk)) {
        throw new HttpsError(
            "internal",
            "delivery operator details not found"
        );
    }
}