import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { Cart, CartItem } from "../../../models/Services/Restaurant/Cart";

export async function getCart(customerId: number): Promise<Cart> {
    let chain = getHasura();
   
    let response =  await chain.query({
        restaurant_cart: [{
            where: {
                customer_id: {
                    _eq: customerId
                }
            }
        }, {
            restaurant_id: true,
            cost: true,
            items: [{}, {
                id: true,
                restaurant_item_id: true,
                // selected_options: true,
                quantity: true,
                cost_per_one: true,                
            }]
        }]
    });

    if(response.restaurant_cart == null || response.restaurant_cart.length == 0) {
        throw new HttpsError(
          "internal",
          "Cart for that customer does not exist"
        );
    }
    let items: CartItem[] = response.restaurant_cart[0].items.map((i) => {
        return {
            cartItemId: i.id,
            customerId,
            costPerOne: i.cost_per_one,
            quantity: i.quantity,
            itemId: i.restaurant_item_id,
        }
    })
    return {
        customerId,
        restaurantId: response.restaurant_cart[0].restaurant_id,
        cost: response.restaurant_cart[0].cost,
        items,
    }
}