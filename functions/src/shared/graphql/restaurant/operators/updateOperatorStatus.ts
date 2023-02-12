import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { OperatorStatus } from "../../../models/Services/Service";

export async function updateRestaurantOperatorStatusToAuthorized(restaurantOperatorId: number) {
    let chain = getHasura();

    let response = await chain.query({
        restaurant_operator_by_pk: [{
            id: restaurantOperatorId
        }, {
            details_id: true
        }]
    });

    if(response.restaurant_operator_by_pk == null) {
        throw new HttpsError(
            "internal",
            "incorrect delivery operator id"
        );
    }

    let mutationResponse = await chain.mutation({
        update_service_provider_operator_details_by_pk: [{
            pk_columns: {
                id: response.restaurant_operator_by_pk.details_id
            },
            _set: {
                status: OperatorStatus.Authorized
            }
        }, {}],
    });
    if(!(mutationResponse.update_service_provider_operator_details_by_pk)) {
        throw new HttpsError(
            "internal",
            "delivery operator details not found"
        );
    }

    // let response = await chain.mutation({
    //     update_restaurant_operator_by_pk: [{
    //         pk_columns: {
    //             id: restaurantOperatorId
    //         },
    //         _set: {
    //             status: OperatorStatus.Authorized
    //         }
    //     }, {
    //         id: true
    //     }]
    // });
    // if(!(response.update_restaurant_operator_by_pk)) {
    //     throw new HttpsError(
    //         "internal",
    //         "incorrect restaurant operator id"
    //     );
    // }
}