import { OrderRequestDetails } from "../../../../business/orderRequest";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { MezAdmin } from "../../../models/Generic/User";
import { Business } from "../../../models/Services/Business/Business";
import { BusinessCart, BusinessOrder, BusinessOrderItem, BusinessOrderRequestStatus } from "../../../models/Services/Business/BusinessOrder";

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
    let items = cart.items.map((i:BusinessOrderItem) => {
        return {
            item_details_id: i.itemDetailsId,
            parameters: JSON.stringify(i.parameters),
        }
    })
    let commenceTime: string = cart.items[0].parameters.estimatedFromTime;
    cart.items.forEach((i:BusinessOrderItem) => {
        if(new Date(i.parameters.estimatedFromTime).valueOf() < new Date(commenceTime).valueOf()) {
            commenceTime = i.parameters.estimatedFromTime;
        }
    });
    let response = await chain.mutation({
        insert_business_order_request_one: [{
            object: {
                customer_id: customerId,
                business_id: orderRequestDetails.businessId,
                status: BusinessOrderRequestStatus.RequestReceived,
                customer_app_type: orderRequestDetails.customerAppType,
                notes: orderRequestDetails.notes,
                estimated_cost: cart.cost,
                commence_time: commenceTime,
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
        orderId: response.insert_business_order_request_one.id,
        customerId,
        businessId: orderRequestDetails.businessId,
        spDetailsId: business.details.serviceProviderDetailsId,
        customerAppType: orderRequestDetails.customerAppType,
        notes: orderRequestDetails.notes,
        chatId: response.insert_business_order_request_one.chat_id,
        estimatedCost: cart.cost,
        orderTime: response.insert_business_order_request_one.order_time,
        status: BusinessOrderRequestStatus.RequestReceived,
        commenceTime: commenceTime,
        items: cart.items.map((i:BusinessOrderItem) => {
            return {
                id: 0,
                itemDetailsId: i.itemDetailsId,
                parameters: i.parameters,
                orderRequestId: response.insert_business_order_request_one!.id,
            }
        })
    }
    return businessOrder
}