import { HttpsError } from "firebase-functions/v1/auth";
import { LaundryRequestDetails } from "../../../../laundry/laundryRequest";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryOrder, DeliveryOrderStatus } from "../../../models/Generic/Delivery";
import { AppType } from "../../../models/Generic/Generic";
import { DeliveryType, OrderType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { Laundry } from "../../../models/Services/Laundry/Laundry";
import { LaundryOrder, LaundryOrderStatus } from "../../../models/Services/Laundry/LaundryOrder";
import { ServiceProviderType } from "../../../models/Services/Service";

export async function createLaundryOrder(
    laundryOrder: LaundryOrder, 
    laundryStore: Laundry, 
    mezAdmins: MezAdmin[], 
    laundryRequestDetails: LaundryRequestDetails
): Promise<DeliveryOrder> {
    let chain = getHasura();
    let orderCategories = laundryOrder.categories.map((c) => {
        return {
            category_id: c.categoryId,
        }
    })
    let laundryOperatorsDetails = laundryStore.laundryOperators!.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.RestaurantApp
        };
    });
    let mezAdminDetails = mezAdmins!.map((m) => {
        return {
          participant_id: m.id,
          app_type_id: AppType.MezAdmin
        };
    });

    let response = await chain.mutation({
        insert_laundry_order_one: [{
            object: {
                customer_id: laundryOrder.customerId,
                store_id: laundryOrder.storeId,
                payment_type: laundryOrder.paymentType,
                delivery_type: laundryOrder.deliveryType,
                customer_app_type: laundryOrder.customerAppType,
                notes: laundryOrder.notes,
                tax: laundryOrder.tax,
                scheduled_time: laundryOrder.scheduledTime,
                stripe_fees: laundryOrder.stripeFees,
                discount_value: laundryOrder.discountValue,
                customer_location_gps: JSON.stringify({
                    "type": "Point",
                    "coordinates": [laundryOrder.customerLocation.lng, laundryOrder.customerLocation.lat ],
                }),
                customer_address: laundryOrder.customerLocation.address,
                delivery_cost: laundryOrder.deliveryCost,
                status: LaundryOrderStatus.OrderReceived,
                categories: {
                    data: orderCategories
                },
                chat: {
                    data: {
                        chat_participants: {
                            data: [{
                                participant_id: laundryOrder.customerId,
                                app_type_id: AppType.Customer
                            },
                            ...laundryOperatorsDetails,
                            ...mezAdminDetails]
                        }
                    }
                },
                from_customer_delivery: (laundryOrder.deliveryType == DeliveryType.Delivery) ? {
                    data: {
                        customer_id: laundryOrder.customerId,
                        order_type: OrderType.Laundry,
                        dropoff_gps: JSON.stringify({
                        "type": "Point",
                        "coordinates": [laundryOrder.customerLocation.lng, laundryOrder.customerLocation.lat ],
                        }),
                        dropoff_address: laundryOrder.customerLocation.address,
                        pickup_gps: JSON.stringify({
                            "type": "Point",
                            "coordinates": [laundryStore.location.lng, laundryStore.location.lat ],
                        }),
                        pickup_address: laundryStore.location.address,
                        schedule_time: laundryOrder.scheduledTime,
                        chat_with_customer: {
                        data: {
                            chat_participants: {
                                data: [{
                                    participant_id: laundryOrder.customerId,
                                    app_type_id: AppType.Customer
                                },]
                            }
                        }
                        },
                        chat_with_service_provider: {
                            data: {
                                chat_participants: {
                                    data: laundryOperatorsDetails
                                }
                            }
                        },
                        payment_type: laundryOrder.paymentType,
                        delivery_cost: laundryOrder.deliveryCost,
                    
                        status: DeliveryOrderStatus.OrderReceived,
                        service_provider_id: laundryOrder.storeId,
                        service_provider_type: ServiceProviderType.Laundry,
                        
                        scheduled_time: laundryOrder.scheduledTime,
                        trip_distance: laundryRequestDetails.tripDistance,
                        trip_duration: laundryRequestDetails.tripDuration,
                        trip_polyline: laundryRequestDetails.tripPolyline,
                    }
                }: undefined
            }
        }, {
            id: true,
            chat_id: true,
            order_time: true,
            from_customer_delivery: {
                id: true,
                chat_with_customer_id: true,
                chat_with_service_provider_id: true,
            }
        }]
    })

    if(response.insert_laundry_order_one == null || response.insert_laundry_order_one.from_customer_delivery == null) {
        throw new HttpsError(
            "internal",
            "order creation error"
        );
    }
    laundryOrder.orderId = response.insert_laundry_order_one.id;
    laundryOrder.chatId = response.insert_laundry_order_one.chat_id;
    laundryOrder.deliveryId = response.insert_laundry_order_one.from_customer_delivery.id;

    if(laundryOrder.deliveryType == DeliveryType.Delivery) {
        return {
            deliveryId: response.insert_laundry_order_one.from_customer_delivery.id,
            orderType: OrderType.Restaurant,
            pickupLocation: laundryStore.location,
            dropoffLocation: laundryOrder.customerLocation,
            chatWithServiceProviderId: response.insert_laundry_order_one.from_customer_delivery.chat_with_service_provider_id,
            chatWithCustomerId: response.insert_laundry_order_one.from_customer_delivery.chat_with_customer_id,
            paymentType: laundryOrder.paymentType,
            status: DeliveryOrderStatus.OrderReceived,
            customerId: laundryOrder.customerId,
            deliveryCost: laundryOrder.deliveryCost,
            packageCost: 0,
            orderTime: response.insert_laundry_order_one.order_time,
            tripDistance : laundryRequestDetails.tripDistance,
            tripDuration : laundryRequestDetails.tripDuration,
            tripPolyline : laundryRequestDetails.tripPolyline,
        }
    }
    return {
        deliveryId: 0,
        orderType: OrderType.Restaurant,
        pickupLocation: laundryStore.location,
        dropoffLocation: laundryOrder.customerLocation,
        chatWithServiceProviderId: 0,
        chatWithCustomerId: 0,
        paymentType: laundryOrder.paymentType,
        status: DeliveryOrderStatus.OrderReceived,
        customerId: laundryOrder.customerId,
        deliveryCost: laundryOrder.deliveryCost,
        packageCost: 0,
        orderTime: response.insert_laundry_order_one.order_time,
        tripDistance : laundryRequestDetails.tripDistance,
        tripDuration : laundryRequestDetails.tripDuration,
        tripPolyline : laundryRequestDetails.tripPolyline,
    }
}