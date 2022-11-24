import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";

export async function checkCart(customerId: number, restaurantId: number) {
    let chain = getHasura();
  
    let response = await chain.query({
        restaurant_cart_by_pk: [{
            customer_id: customerId
        }, {
            restaurant_id: true,
        }]
    });
    if(response.restaurant_cart_by_pk?.restaurant_id != restaurantId) {
        throw new HttpsError(
            "internal",
            "Restaurant id mismatch"
        );
    }
}