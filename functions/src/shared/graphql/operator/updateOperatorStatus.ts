import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AuthorizationStatus } from "../../models/Generic/Generic";

export async function updateOperatorStatusToAuthorized(operatorDetailsId: number) {
    let chain = getHasura();

    let mutationResponse = await chain.mutation({
        update_service_provider_operator_details_by_pk: [{
            pk_columns: {
                id: operatorDetailsId
            },
            _set: {
                status: AuthorizationStatus.Authorized
            }
        }, {
            status: true
        }],
    });
    if(!(mutationResponse.update_service_provider_operator_details_by_pk)) {
        throw new HttpsError(
            "internal",
            "operator details not found"
        );
    }
}