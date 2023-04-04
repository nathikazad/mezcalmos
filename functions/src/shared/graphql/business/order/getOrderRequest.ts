import { getHasura } from "../../../../utilities/hasura";
import { CustomerAppType, MezError } from "../../../models/Generic/Generic";
import { DeliveryType, PaymentType } from "../../../models/Generic/Order";
import { ServiceType } from "../../../models/Services/Business/Business";
import { BusinessItemCost, BusinessOrder, BusinessOrderRequestItem, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";

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
            estimated_cost: true,
            final_cost: true,
            notes: true,
            items: [{}, {
                commence_time: true,
                cost: [{}, true],
                id: true,
                service_id: true,
                service_type: true,
                available: true,
            //     final_cost_per_one: true,
            }],
            business: {
                details_id: true,
            }
        }]
    })
    if(response.business_order_request_by_pk == null) {
        throw new MezError("orderRequestNotFound");
    }
  
    let items: BusinessOrderRequestItem[] = response.business_order_request_by_pk.items.map((i) => {
        return {
            id: i.id,
            serviceId: i.service_id,
            serviceType: i.service_type as ServiceType,
            cost: JSON.parse(i.cost) as BusinessItemCost,
            available: i.available,
        }
    })
    let businessOrder: BusinessOrder = {
        orderDetails: {
            orderId,
            customerId: response.business_order_request_by_pk.customer_id,
            spDetailsId: response.business_order_request_by_pk.business.details_id,
            customerAppType: response.business_order_request_by_pk.customer_app_type as CustomerAppType,
            paymentType: PaymentType.Cash,
            deliveryType: DeliveryType.Pickup,
            deliveryCost: 0,
        },
        businessId: response.business_order_request_by_pk.business_id,
        status: response.business_order_request_by_pk.status as BusinessOrderRequestStatus,
        items,
        estimatedCost: response.business_order_request_by_pk.estimated_cost,
        finalCost: response.business_order_request_by_pk.final_cost,
        
    }
    return businessOrder;
}