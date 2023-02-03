import { CheckoutRequest } from "../../../../restaurant/checkoutCart";
import { getHasura } from "../../../../utilities/hasura";
import { MezAdmin } from "../../../models/Generic/User";
import { LaundryOrder } from "../../../models/Services/Laundry/LaundryOrder";
import { Restaurant } from "../../../models/Services/Restaurant/Restaurant";

export async function createLaundryOrder(laundryOrder: LaundryOrder, restaurant: Restaurant, checkoutReq : CheckoutRequest, mezAdmins: MezAdmin[])
{
    let chain = getHasura();

    await chain.mutation({
        insert_laundry_order_one: [{
            object: {
                customer_id: laundryOrder.customerId,
                store_id: laundryOrder.storeId
            }
        }, {}]
    })

}