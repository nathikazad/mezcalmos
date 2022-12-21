import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";

export async function deleteRestaurantOperator(restaurantOperatorId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_restaurant_operator_by_pk: [{
            id: restaurantOperatorId
        }, {
            id: true,
        }]
    });
    if(!(response.delete_restaurant_operator_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect restaurant operator id"
        );
    }
}