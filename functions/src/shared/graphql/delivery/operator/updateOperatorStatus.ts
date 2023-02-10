import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus } from "../../../models/Generic/Generic";

export async function updateDeliveryOperatorStatusToAuthorized(deliveryOperatorId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_delivery_operator_by_pk: [{
            pk_columns: {
                id: deliveryOperatorId
            },
            _set: {
                status: AuthorizationStatus.Authorized
            }
        }, {
            status: true,
        }]
    });
    if(!(response.update_delivery_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect delivery operator id"
        );
    }
}