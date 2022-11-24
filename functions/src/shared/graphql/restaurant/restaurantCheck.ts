import { getHasura } from "../../../utilities/hasura"

export async function getRestaurantCheckDetails(data: any, userId: number) {
    let chain = getHasura();
    return await chain.query({
      restaurant_order_by_pk: [
        { id: data.orderId }, {
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
      mez_admin_by_pk: [
        { user_id: userId }, {
          user_id: true
        }
      ]
    })
  }