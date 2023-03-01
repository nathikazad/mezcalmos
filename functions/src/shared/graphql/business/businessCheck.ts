import { getHasura } from "../../../utilities/hasura"

export async function getBusinessCheckDetails(orderId: number, userId: number) {
    let chain = getHasura();

    return await chain.query({
        business_order_request_by_pk: [{
            id: orderId,
        }, {
            business_id: true,
        }],
        business_operator: [{
            where: {
                user_id: {
                    _eq: userId
                }
            }
        }, {
            business_id: true
        }]
    })
}