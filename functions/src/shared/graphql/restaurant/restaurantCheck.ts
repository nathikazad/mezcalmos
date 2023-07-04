import { getHasura } from "../../../utilities/hasura"

export async function getRestaurantCheckDetails(orderId: number, userId: number) {
    let chain = getHasura();
    return await chain.query({
      restaurant_order_by_pk: [
        { id: orderId }, {
          restaurant_id: true,
        }
      ],
      restaurant_operator: [{
        where: {
          user_id: {
            _eq: userId
          }
        }
      }, {
        restaurant_id: true
      }],
    })
  }