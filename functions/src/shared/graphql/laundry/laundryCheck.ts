import { getHasura } from "../../../utilities/hasura"

export async function getLaundryCheckDetails(orderId: number, userId: number) {
    let chain = getHasura();
    return await chain.query({
      laundry_order_by_pk: [
        { id: orderId }, {
          store_id: true,
        }
      ],
      laundry_operator: [{
        where: {
          user_id: {
            _eq: userId
          }
        }
      }, {
        store_id: true
      }],
    })
}