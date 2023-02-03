import { CheckoutRequest } from "../../../../restaurant/checkoutCart";
import { getHasura } from "../../../../utilities/hasura";
import { MezAdmin } from "../../../models/Generic/User";
import { LaundryOrder, LaundryOrderStatus } from "../../../models/Services/Laundry/LaundryOrder";
import { Restaurant } from "../../../models/Services/Restaurant/Restaurant";

export async function createLaundryOrder(laundryOrder: LaundryOrder, restaurant: Restaurant, checkoutReq : CheckoutRequest, mezAdmins: MezAdmin[])
{
    let chain = getHasura();
    let orderCategories = laundryOrder.categories.map((c) => {
        return {
            
        }
    })

    await chain.mutation({
        insert_laundry_order_one: [{
            object: {
                customer_id: laundryOrder.customerId,
                store_id: laundryOrder.storeId,
                payment_type: laundryOrder.paymentType,
                delivery_type: laundryOrder.deliveryType,
                customer_app_type: laundryOrder.customerAppType,
                notes: laundryOrder.notes,
                tax: laundryOrder.tax,
                scheduled_time: laundryOrder.scheduledTime,
                stripe_fees: laundryOrder.stripeFees,
                discount_value: laundryOrder.discountValue,
                customer_location_gps: JSON.stringify({
                    "type": "Point",
                    "coordinates": [laundryOrder.customerLocation.lng, laundryOrder.customerLocation.lat ],
                }),
                customer_address: laundryOrder.customerLocation.address,
                delivery_cost: laundryOrder.deliveryCost,
                status: LaundryOrderStatus.OrderReceived,
                

            }
        }, {

        }]
    })

}