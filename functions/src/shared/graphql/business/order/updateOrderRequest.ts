import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { BusinessOrder } from "../../../models/Services/Business/BusinessOrder";

export async function confirmBusinessOrderFromOperator(order: BusinessOrder) {
    let chain = getHasura();

    let updates = order.items.map((i:any) => {
        return {
            where: {
                _and: [{
                    service_id: {
                        _eq: i.serviceId
                    }
                }, {
                    service_type: {
                        _eq: i.serviceType
                    }
                }]
            },
            _set: {
                cost: JSON.stringify(i.cost)
            }
        }
    })
    let response = await chain.mutation({
        update_business_order_request_by_pk: [{
            pk_columns: {
                id: order.orderDetails.orderId
            },
            _set: {
                status: order.status,
                final_cost: order.finalCost
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
        throw new MezError("updateStatusError");
    }
}

export async function updateBusinessOrderRequest(order: BusinessOrder) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_business_order_request_by_pk: [{
            pk_columns: {
                id: order.orderDetails.orderId
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