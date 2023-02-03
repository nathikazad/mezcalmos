import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Restaurant } from "../../models/Services/Restaurant/Restaurant";

export async function updateRestaurantStripe(restaurant: Restaurant) {
    let chain = getHasura();
    if(!(restaurant.id)) {
        throw new HttpsError(
            "internal",
            "restaurant id not found"
        );
    }
    let response = await chain.mutation({
        update_restaurant_restaurant_by_pk: [{
            pk_columns: {
                id: restaurant.id
            },
            _set: {
                stripe_info: JSON.stringify(restaurant.stripeInfo),
                accepted_payments: JSON.stringify(restaurant.acceptedPayments)
            }
        }, {
            accepted_payments: [{}, true],
            stripe_info:[{}, true]
        }]
    });
    if(!(response.update_restaurant_restaurant_by_pk)) {
        throw new HttpsError(
          "internal",
          "restaurant update error"
        );
    }
}
