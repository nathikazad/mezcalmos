import { CourierRequest, CreateCourierError } from "../../../../delivery/createCourierOrder";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { OrderType, PaymentType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { CourierOrder } from "../../../models/Services/Courier/Courier";


export async function createNewCourierOrder(
    customerId: number,
    // restaurant: ServiceProvider, 
    courierRequest: CourierRequest, 
    // customerCart: Cart, 
    mezAdmins: MezAdmin[]
): Promise<CourierOrder> {

    let chain = getHasura();

    let mezAdminDetails = mezAdmins!.map((v) => {
        return {
            participant_id: v.id,
            app_type_id: AppType.MezAdmin
        };
    });
    let packageCost = 0;
    courierRequest.items.forEach((i) => {
        packageCost += i.estimatedCost ?? 0;
    })

    let response = await chain.mutation({
        insert_delivery_courier_order_one: [{
            object: {
                from_location_gps: (courierRequest.fromLocationGps) ? JSON.stringify({
                    "type": "Point",
                    "coordinates": [courierRequest.fromLocationGps.lng, courierRequest.fromLocationGps.lat ],
                }): undefined,
                from_location_text: courierRequest.fromLocationText,
                to_location_address: courierRequest.toLocation.address,
                to_location_gps: JSON.stringify({
                    "type": "Point",
                    "coordinates": [courierRequest.toLocation.lng, courierRequest.toLocation.lat ],
                }),
                customer_id: customerId,
                stripe_fees: courierRequest.stripeFees ?? undefined,
                tax: courierRequest.tax ?? undefined,
                customer_app_type: courierRequest.customerAppType,
                refund_amount: courierRequest.refundAmount ?? undefined,
                discount_value: courierRequest.discountValue ?? undefined,
                items: {
                    data: courierRequest.items.map((i) => {
                        return {
                            name: i.name,
                            image: i.image,
                            estimated_cost: i.estimatedCost,
                            notes: i.notes,
                        }
                    })
                },
                delivery_order: {
                    data: {
                        customer_id: customerId,
                        order_type: OrderType.Courier,
                        dropoff_gps: JSON.stringify({
                            "type": "Point",
                            "coordinates": [courierRequest.toLocation.lng, courierRequest.toLocation.lat ],
                        }),
                        dropoff_address: courierRequest.toLocation.address,
                        pickup_gps: (courierRequest.fromLocationGps) ? JSON.stringify({
                            "type": "Point",
                            "coordinates": [courierRequest.fromLocationGps.lng, courierRequest.fromLocationGps.lat ],
                        }): undefined,
                        pickup_address: courierRequest.fromLocationText,
                        schedule_time: courierRequest.scheduledTime,
                        chat_with_customer: {
                            data: {
                                chat_participants: {
                                    data: [{
                                        participant_id: customerId,
                                        app_type_id: AppType.Customer
                                    }, 
                                    ...mezAdminDetails]
                                }
                            }
                        },
                        delivery_cost: courierRequest.deliveryCost ?? 0,
                        
                        status: DeliveryOrderStatus.OrderReceived,
                        service_provider_id: courierRequest.deliveryCompanyId,
                        service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
                        trip_distance: courierRequest.tripDistance,
                        trip_duration: courierRequest.tripDuration,
                        trip_polyline: courierRequest.tripPolyline,
                        package_cost: packageCost,
                        distance_from_base: courierRequest.distanceFromBase
                    }
                }
            }
        }, {
            id: true,
            order_time: true,
            delivery_order: {
                id: true,
                chat_with_customer_id: true,
            },
            // items: [{}, {
            //     id: true,
            // }]
        }]
    });
    if(response.insert_delivery_courier_order_one == null) {
        throw new MezError(CreateCourierError.OrderCreationError);
    }

    return {
        id: response.insert_delivery_courier_order_one.id,
        fromLocationGps: courierRequest.fromLocationGps,
        fromLocationText: courierRequest.fromLocationText,
        toLocation: courierRequest.toLocation,
        items: courierRequest.items,
        customerId,
        orderTime: response.insert_delivery_courier_order_one.order_time,
        paymentType: PaymentType.Cash,
        tax: courierRequest.tax,
        stripeFees: courierRequest.stripeFees,
        discountValue: courierRequest.discountValue,
        deliveryOrder: {
            deliveryId: response.insert_delivery_courier_order_one.delivery_order.id,
            orderType: OrderType.Courier,
            pickupLocation: courierRequest.fromLocationGps,
            pickupLocationText: courierRequest.fromLocationText,
            dropoffLocation: courierRequest.toLocation,
            chatWithCustomerId: response.insert_delivery_courier_order_one.delivery_order.chat_with_customer_id,
            paymentType: PaymentType.Cash,
            status: DeliveryOrderStatus.OrderReceived,
            customerId,
            deliveryCost: courierRequest.deliveryCost ?? 0,
            packageCost,
            orderTime: response.insert_delivery_courier_order_one.order_time,
            tripDistance : courierRequest.tripDistance,
            tripDuration : courierRequest.tripDuration,
            tripPolyline : courierRequest.tripPolyline,
            serviceProviderId: courierRequest.deliveryCompanyId,
            serviceProviderType: DeliveryServiceProviderType.DeliveryCompany,
            direction: DeliveryDirection.ToCustomer,
            packageReady: true,
            distanceFromBase: courierRequest.distanceFromBase
        }
    }
}