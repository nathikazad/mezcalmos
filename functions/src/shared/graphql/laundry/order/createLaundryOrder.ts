import { CheckoutRequest } from "../../../../restaurant/checkoutCart";
import { getHasura } from "../../../../utilities/hasura";
import { MezAdmin } from "../../../models/Generic/User";
import { Restaurant } from "../../../models/Services/Restaurant/Restaurant";
import { RestaurantOrder } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function createLaundryOrder(restaurantOrder: RestaurantOrder, restaurant: Restaurant, checkoutReq : CheckoutRequest, mezAdmins: MezAdmin[])
{
    let chain = getHasura();

    await chain.mutation({
        
    })

}