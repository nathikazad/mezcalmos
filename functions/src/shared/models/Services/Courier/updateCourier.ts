import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";


export async function cancelCourierFromDelivery(deliveryOrderId: number) {
    let chain = getHasura();
  
    let response =  await chain.mutation({
        update_delivery_courier_order: [{
            where: {
                delivery_order_id: {
                    _eq: deliveryOrderId
                }
            },
            _set: {
                cancellation_time: new Date()
            }
        }, {
            affected_rows: true
        }]
    })
    if(response.update_delivery_courier_order?.affected_rows == 0) {
        throw new MezError("orderNotFound");
    }
}