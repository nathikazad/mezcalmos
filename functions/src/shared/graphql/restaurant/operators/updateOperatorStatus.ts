import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { OperatorStatus } from "../../../models/Services/Restaurant/Restaurant";

export async function updateRestaurantOperatorStatusToAuthorized(restaurantOperatorId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_restaurant_operator_by_pk: [{
            pk_columns: {
                id: restaurantOperatorId
            },
            _set: {
                status: OperatorStatus.Authorized
            }
        }, {
            status: true,
        }]
    });
    if(!(response.update_restaurant_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect restaurant operator id"
        );
    }
}