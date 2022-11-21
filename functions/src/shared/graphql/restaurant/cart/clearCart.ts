import { getHasura } from "../../../../utilities/hasura";

export async function clearCart(customerId: number) {

    let chain = getHasura();

    await chain.mutation({
        delete_restaurant_cart_item: [{
            where: {
                customer_id: {
                    _eq: customerId
                }
            }
        }, { 
            affected_rows: true
        }],
        delete_restaurant_cart_by_pk: [{
            customer_id: customerId
        }, { 
            restaurant_id: true
        }]
    });
}
