import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { OrderStripeInfo } from "../../../../utilities/stripe/model";
import { LaundryOrder } from "../../../models/Services/Laundry/LaundryOrder";

export async function updateLaundryOrderStatus(order: LaundryOrder) {

    let chain = getHasura();

    await chain.mutation({
        update_laundry_order_by_pk: [{
            pk_columns: {
                id: order.orderId
            }, 
            _set: {
                status: order.status,
                refund_amount: order.refundAmount
            }
        }, { 
            status: true
        }]
    });
}

export async function updateLaundryOrderStripe(orderId: number, orderStripePaymentInfo: OrderStripeInfo) {
    let chain = getHasura();
    
    let response = await chain.mutation({
        update_laundry_order_by_pk: [{
            pk_columns: {
                id: orderId
            }, 
            _set: {
                stripe_info: JSON.stringify(orderStripePaymentInfo),
                stripe_fees: orderStripePaymentInfo.stripeFees
            }
        }, { 
            stripe_info: [{}, true]
        }]
    });
    if(!(response.update_laundry_order_by_pk)) {
        throw new HttpsError(
            "internal",
            "error in updating order"
        );
    }
}

