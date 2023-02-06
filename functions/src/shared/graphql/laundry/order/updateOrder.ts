import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { LaundryOrder } from "../../../models/Services/Laundry/LaundryOrder";

export async function updateLaundryOrderStatus(order: LaundryOrder) {

    let chain = getHasura();

    if(order.orderId == null) {
        throw new HttpsError(
            "internal",
            "order id not provided"
        );
    }
    
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