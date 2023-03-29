import { HttpsError } from "firebase-functions/v1/auth";
import { OrderRequestDetails } from "../../../../business/orderRequest";
import { getHasura } from "../../../../utilities/hasura";
import { AppType } from "../../../models/Generic/Generic";
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

    let businessOperatorsDetails = business.operators?.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.Business
        };
    }) ?? [];

    let mezAdminDetails = mezAdmins!.map((m) => {
        return {
          participant_id: m.id,
          app_type_id: AppType.MezAdmin
        };
    });
    let items = cart.items.map((i) => {
        return {
            service_id: i.serviceId,
            service_type: i.serviceType,
            quantity: i.quantity,
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
        }],
    })

    if(response.insert_business_order_request_one == null) {
        throw new HttpsError(
            "internal",
            "order creation error"
        );
    }
    let businessOrder: BusinessOrder = {
        orderId: response.insert_business_order_request_one.id,
        customerId,
        businessId: orderRequestDetails.businessId,
        spDetailsId: business.serviceProviderDetailsId,
        paymentType: PaymentType.Cash,
        deliveryType: DeliveryType.Pickup,
        customerAppType: orderRequestDetails.customerAppType,
        notes: orderRequestDetails.notes,
        deliveryCost: 0,
        status: BusinessOrderRequestStatus.RequestReceived,
        chatId: response.insert_business_order_request_one.chat_id,
        estimatedCost: cart.cost,
        items: cart.items
    }
    return businessOrder
}