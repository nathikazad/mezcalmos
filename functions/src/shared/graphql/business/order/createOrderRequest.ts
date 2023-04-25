import { OrderRequestDetails } from "../../../../business/orderRequest";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { DeliveryType, PaymentType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { Business } from "../../../models/Services/Business/Business";
import { BusinessOrder, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";
import { BusinessCart } from "../../../models/Services/Business/Cart";

export async function createOrderRequest(
    customerId: number,
    orderRequestDetails: OrderRequestDetails, 
    business: Business, 
    mezAdmins: MezAdmin[],
    cart: BusinessCart
): Promise<BusinessOrder> {
    let chain = getHasura();

    let businessOperatorsDetails = business.details.operators?.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.Business
        };
    }) ?? [];

    let mezAdminDetails = mezAdmins!.map((m:any) => {
        return {
          participant_id: m.id,
          app_type_id: AppType.MezAdmin
        };
    });
    let items = cart.items.map((i:any) => {
        return {
            service_id: i.serviceId,
            service_type: i.serviceType,
            commence_time: i.cost.fromTime,
            cost: JSON.stringify(i.cost),
        }
    })
    let response = await chain.mutation({
        insert_business_order_request_one: [{
            object: {
                customer_id: customerId,
                business_id: orderRequestDetails.businessId,
                status: BusinessOrderRequestStatus.RequestReceived,
                customer_app_type: orderRequestDetails.customerAppType,
                notes: orderRequestDetails.notes,
                estimated_cost: cart.cost,
                items: {
                    data: items
                },
                chat: {
                    data: {
                        chat_participants: {
                            data: [{
                                participant_id: customerId,
                                app_type_id: AppType.Business
                            },
                            ...businessOperatorsDetails,
                            ...mezAdminDetails]
                        }
                    }
                },
            }
        }, {
            id: true,
            chat_id: true,
            order_time: true,
            items: [{}, {
                id: true
            }]
        }],
    })

    if(response.insert_business_order_request_one == null) {
        throw new MezError("orderCreationError");
    }

    let businessOrder: BusinessOrder = {
        orderDetails: {
            orderId: response.insert_business_order_request_one.id,
            customerId,
            spDetailsId: business.details.serviceProviderDetailsId,
            paymentType: PaymentType.Cash,
            deliveryType: DeliveryType.Pickup,
            customerAppType: orderRequestDetails.customerAppType,
            deliveryCost: 0,
            notes: orderRequestDetails.notes,
            chatId: response.insert_business_order_request_one.chat_id,
        },
        businessId: orderRequestDetails.businessId,
        
        status: BusinessOrderRequestStatus.RequestReceived,
        estimatedCost: cart.cost,
        items: cart.items.map((i:any) => {
            return {
                id: 0,
                ...i
            }
        })
    }
    return businessOrder
}