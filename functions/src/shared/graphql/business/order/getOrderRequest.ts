import { getHasura } from "../../../../utilities/hasura";
import { CustomerAppType, MezError } from "../../../models/Generic/Generic";
import { BusinessItemParameters, BusinessOrder, BusinessOrderItem, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";

export async function getBusinessOrderRequest(orderId: number): Promise<BusinessOrder> {
    let chain = getHasura();
  
    let response =  await chain.query({
        business_order_request_by_pk: [{
            id: orderId
        }, {
            commence_time: true,
            customer_id: true,
            business_id: true,
            status: true,
            review_id: true,
            order_time: true,
            customer_app_type: true,
            estimated_cost: true,
            final_cost: true,
            notes: true,
            items: [{}, {
                id: true,
                item_details_id: true,
                available: true,
                parameters: [{}, true],
            }],
            business: {
                details_id: true,
            }
        }]
    })
    if(response.business_order_request_by_pk == null) {
        throw new MezError("orderRequestNotFound");
    }
  
    let items: BusinessOrderItem[] = response.business_order_request_by_pk.items.map((i) => {
        return {
            id: i.id,
            itemDetailsId: i.item_details_id,
            parameters: JSON.parse(i.parameters) as BusinessItemParameters,
            available: i.available,
        }
    });
    let businessOrder: BusinessOrder = {
        orderId,
        customerId: response.business_order_request_by_pk.customer_id,
        spDetailsId: response.business_order_request_by_pk.business.details_id,
        customerAppType: response.business_order_request_by_pk.customer_app_type as CustomerAppType,
        businessId: response.business_order_request_by_pk.business_id,
        status: response.business_order_request_by_pk.status as BusinessOrderRequestStatus,
        items,
        estimatedCost: response.business_order_request_by_pk.estimated_cost,
        finalCost: response.business_order_request_by_pk.final_cost,
        commenceTime: response.business_order_request_by_pk.commence_time,
        orderTime: response.business_order_request_by_pk.order_time,
    }
    return businessOrder;
}