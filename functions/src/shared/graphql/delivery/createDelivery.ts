import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { AppType } from "../../models/Generic/Generic";
import { OrderType } from "../../models/Generic/Order";
import { LaundryOrder } from "../../models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../../models/Services/Service";

export async function createLaundryToCustomerDeliveryOrder(
    laundryOrder: LaundryOrder, 
    laundryStore: ServiceProvider, 
    fromCustomerDelivery: DeliveryOrder
): Promise<DeliveryOrder> {
    let chain = getHasura();

    let laundryOperatorsDetails = laundryStore.operators?.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.LaundryApp
        };
    }) ?? [];

    let response = await chain.mutation({
        insert_delivery_order_one: [{
            object: {
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
                direction : DeliveryDirection.ToCustomer,
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
                delivery_cost: laundryOrder.deliveryCost / 2,
            
                status: DeliveryOrderStatus.OrderReceived,
                service_provider_id: (laundryStore.deliveryDetails.selfDelivery) 
                    ? laundryStore.id 
                    : laundryStore.deliveryPartnerId,
                service_provider_type: (laundryStore.deliveryDetails.selfDelivery) 
                ? DeliveryServiceProviderType.Laundry
                : DeliveryServiceProviderType.DeliveryCompany,
                
                scheduled_time: laundryOrder.scheduledTime,
                trip_distance: fromCustomerDelivery.tripDistance,
                trip_duration: fromCustomerDelivery.tripDuration,
                trip_polyline: fromCustomerDelivery.tripPolyline,
            }
        }, { 
            id: true,
            chat_with_customer_id: true,
            chat_with_service_provider_id: true,
            order_time: true
        }]
    });
    if(!(response.insert_delivery_order_one)) {
        throw new HttpsError(
            "internal",
            "order creation error"
        );
    }
    await chain.mutation({
        update_laundry_order_by_pk: [{
            pk_columns: {
                id: laundryOrder.orderId
            },
            _set: {
                to_customer_delivery_id: response.insert_delivery_order_one.id
            }
        }, {
            id: true,
        }]
    });
    laundryOrder.toCustomerDeliveryId = response.insert_delivery_order_one.id;
    return {
        deliveryId: response.insert_delivery_order_one.id,
        orderType: OrderType.Laundry,
        pickupLocation: laundryOrder.customerLocation,
        dropoffLocation: laundryStore.location,
        chatWithServiceProviderId: response.insert_delivery_order_one.chat_with_service_provider_id,
        chatWithCustomerId: response.insert_delivery_order_one.chat_with_customer_id,
        paymentType: laundryOrder.paymentType,
        status: DeliveryOrderStatus.OrderReceived,
        customerId: laundryOrder.customerId,
        deliveryCost: laundryOrder.deliveryCost / 2,
        packageCost: laundryOrder.itemsCost,
        orderTime: response.insert_delivery_order_one.order_time,
        tripDistance : fromCustomerDelivery.tripDistance,
        tripDuration : fromCustomerDelivery.tripDuration,
        tripPolyline : fromCustomerDelivery.tripPolyline,
        serviceProviderType: DeliveryServiceProviderType.Laundry,
        serviceProviderId: laundryStore.id,
        direction: DeliveryDirection.ToCustomer,
        packageReady: false,
    }
}