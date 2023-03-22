import { getHasura } from "../../../utilities/hasura";
import { AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { AuthOperatorError } from "../../operator/authorizeOperator";

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
        throw new MezError(AuthOperatorError.OperatorDetailsNotFound); 
    }
}