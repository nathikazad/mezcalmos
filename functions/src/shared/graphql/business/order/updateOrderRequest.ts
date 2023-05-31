import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { BusinessOrder, BusinessOrderItem } from "../../../models/Services/Business/BusinessOrder";

export async function updateBusinessOrderByAdmin(order: BusinessOrder) {
    let chain = getHasura();

    let updates = order.items.map((i:BusinessOrderItem) => {
        return {
            where: {
                id: {  
                    _eq: i.id
                }
            },
            _set: {
                parameters: JSON.stringify(i.parameters),
            }
        }
    })
    let response = await chain.mutation({
        update_business_order_request_by_pk: [{
            pk_columns: {
                id: order.orderId
            },
            _set: {
                status: order.status,
                final_cost: order.finalCost,
                commence_time: order.commenceTime,
            }
        }, {
            status: true
        }],
        update_business_order_request_item_many: [{
            updates: updates
        }, {
            affected_rows: true,
        }]
    });
    if(response.update_business_order_request_by_pk == null) {
        throw new MezError("updateOrderError");
    }
}

export async function updateBusinessOrderStatus(order: BusinessOrder) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_business_order_request_by_pk: [{
            pk_columns: {
                id: order.orderId
            },
            _set: {
                status: order.status
            }
        }, {
            status: true
        }],
    });
    if(response.update_business_order_request_by_pk == null) {
        throw new MezError("updateStatusError");
    }
}