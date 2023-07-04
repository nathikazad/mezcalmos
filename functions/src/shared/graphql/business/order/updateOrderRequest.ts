import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { BusinessOrder, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";

// export async function updateBusinessOrderByAdmin(order: BusinessOrder) {
//     let chain = getHasura();

//     let updates = order.items.map((i:BusinessOrderItem) => {
//         return {
//             where: {
//                 id: {  
//                     _eq: i.id
//                 }
//             },
//             _set: {
//                 parameters: JSON.stringify(i.parameters),
//             }
//         }
//     })
//     let cancellationTime: string | undefined;
//     if(order.status == BusinessOrderRequestStatus.CancelledByBusiness) {
//         cancellationTime = new Date().toISOString();
//     }
//     let response = await chain.mutation({
//         update_business_order_request_by_pk: [{
//             pk_columns: {
//                 id: order.orderId
//             },
//             _set: {
//                 status: order.status,
//                 cancellation_time: cancellationTime,
//             }
//         }, {
//             status: true
//         }],
//         update_business_order_request_item_many: [{
//             updates: updates
//         }, {
//             affected_rows: true,
//         }]
//     });
//     if(response.update_business_order_request_by_pk == null) {
//         throw new MezError("updateOrderError");
//     }
// }

export async function updateBusinessOrderRequest(order: BusinessOrder) {
    let chain = getHasura();

    let cancellationTime: string | undefined;
    if(order.status == BusinessOrderRequestStatus.CancelledByBusiness || order.status == BusinessOrderRequestStatus.CancelledByCustomer) {
        cancellationTime = new Date().toISOString();
    }
    let response = await chain.mutation({
        update_business_order_request_by_pk: [{
            pk_columns: {
                id: order.orderId
            },
            _set: {
                status: order.status,
                cancellationTime: cancellationTime,
            }
        }, {
            status: true
        }],
    });
    if(response.update_business_order_request_by_pk == null) {
        throw new MezError("updateStatusError");
    }
}
