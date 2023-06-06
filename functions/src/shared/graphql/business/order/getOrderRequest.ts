import { getHasura } from "../../../../utilities/hasura";
import { CustomerAppType, MezError } from "../../../models/Generic/Generic";
import { OfferingType } from "../../../models/Services/Business/Business";
import { BusinessItemParameters, BusinessOrder, BusinessOrderItem, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";

export async function getBusinessOrderRequest(orderId: number): Promise<BusinessOrder> {
    let chain = getHasura();
  
    let response =  await chain.query({
        business_order_request_by_pk: [{
            id: orderId
        }, {
            customer_id: true,
            business_id: true,
            status: true,
            review_id: true,
            order_time: true,
            customer_app_type: true,
            cost: true,
            notes: true,
            items: [{}, {
                id: true,
                cost: true,
                item_id : true,
                offering_type: true,
                time: true,
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
            itemId: i.item_id,
            cost: i.cost,
            offeringType: i.offering_type as OfferingType,
            orderRequestId: orderId,
            time: i.time,
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
        cost: response.business_order_request_by_pk.cost,
        orderTime: response.business_order_request_by_pk.order_time,
    }
    return businessOrder;
}