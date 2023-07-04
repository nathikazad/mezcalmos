import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";

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
        throw new MezError("restaurantIdMismatch");
    }
}