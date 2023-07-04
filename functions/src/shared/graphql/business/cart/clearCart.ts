import { getHasura } from "../../../../utilities/hasura";

export async function clearBusinessCart(customerId: number) {

    let chain = getHasura();

    await chain.mutation({
        delete_business_cart_item: [{
            where: {
                customer_id: {
                    _eq: customerId
                }
            }
        }, {
            affected_rows: true
        }],
        delete_business_cart_by_pk: [{
            customer_id: customerId
        }, {
            business_id: true
        }]
    });
}
