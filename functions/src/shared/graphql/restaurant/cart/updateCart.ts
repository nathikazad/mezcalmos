import { getHasura } from "../../../../utilities/hasura";
import { Cart } from "../../../models/Services/Restaurant/Cart";

export async function updateCartDiscount(cart: Cart) {
    let chain = getHasura();
   
    // let response =  
    await chain.mutation({
        update_restaurant_cart_by_pk: [{
            pk_columns: {
                customer_id: cart.customerId
            },
            _set: {
                discount_value: cart.discountValue
            }
        }, {
            customer_id: true
        }]
    });
}