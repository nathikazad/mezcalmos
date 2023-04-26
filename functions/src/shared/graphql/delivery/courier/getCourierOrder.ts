import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType, AuthorizationStatus, Language, Location, MezError } from "../../../models/Generic/Generic";
import { OrderType, PaymentType } from "../../../models/Generic/Order";
import { CourierItem, CourierOrder } from "../../../models/Services/Courier/Courier";


export async function getCourierOrder(orderId: number): Promise<CourierOrder> {
    let chain = getHasura();
  
    let response =  await chain.query({
      delivery_courier_order_by_pk: [
            { id: orderId }, {
                id: true,
                cancellation_time: true,
                customer_id: true,
                discount_value: true,
                from_location_gps: true,
                from_location_text: true,
                payment_type: true,
                order_time: true,
                refund_amount: true,
                stripe_fees: true,
                tax: true,
                to_location_address: true,
                to_location_gps: true,
                customer_app_type: true,
                delivery_order_id: true,
                stripe_info: [{}, true],
                delivery_order: {
                    pickup_gps: true,
                    pickup_address: true,
                    dropoff_gps: true,
                    dropoff_address: true,
                    chat_with_service_provider_id: true,
                    chat_with_customer_id: true,
                    package_ready: true,
                    payment_type: true,
                    status: true,
                    customer_id: true,
                    delivery_cost: true,
                    service_provider_type: true,
                    service_provider_id: true,
                    package_cost: true,
                    order_time: true,
                    delivery_driver_id: true,
                    direction: true,
                    order_type: true,
                    trip_distance: true,
                    trip_duration: true,
                    trip_polyline: true,
                    change_price_request: [{}, true],
                    delivery_driver: {
                        id: true,
                        delivery_company_type: true,
                        delivery_company_id: true,
                        user: {
                        id: true,
                        firebase_id: true,
                        language_id: true,
                        },
                        status: true,
                        notification_info: {
                        token: true,
                        turn_off_notifications: true
                        }
                    },
                },
                items: [{}, {
                    id: true,
                    name: true,
                    unavailable: true,
                }]
            }
        ]
    })
    if(response.delivery_courier_order_by_pk == null) {
        throw new MezError("orderNotFound");
    }
    
    let toLocation: Location = {
      lat: response.delivery_courier_order_by_pk.to_location_gps.coordinates[1],
      lng: response.delivery_courier_order_by_pk.to_location_gps.coordinates[0],
      address: response.delivery_courier_order_by_pk.to_location_address
    }
  
    let items: CourierItem[] = response.delivery_courier_order_by_pk.items.map((i:any) => {
      return {
        id: i.id,
        name: i.name,
        unavailable: true
      }
    })
    let courierOrder: CourierOrder = {
        id: orderId,
        orderTime: response.delivery_courier_order_by_pk.order_time,
        paymentType: response.delivery_courier_order_by_pk.payment_type as PaymentType,
        discountValue: response.delivery_courier_order_by_pk.discount_value,
        fromLocationGps: (response.delivery_courier_order_by_pk.from_location_gps && response.delivery_courier_order_by_pk.from_location_text) ? {
            lat: response.delivery_courier_order_by_pk.from_location_gps.coordinates[1],
            lng: response.delivery_courier_order_by_pk.from_location_gps.coordinates[0],
            address: response.delivery_courier_order_by_pk.from_location_text,
        }: undefined,
        fromLocationText: response.delivery_courier_order_by_pk.from_location_text,
        toLocation,
        customerId: response.delivery_courier_order_by_pk.customer_id,
        stripeInfo: JSON.parse(response.delivery_courier_order_by_pk.stripe_info),
        stripeFees: response.delivery_courier_order_by_pk.stripe_fees,
        tax: response.delivery_courier_order_by_pk.tax,
        items,
        deliveryOrder: {
            packageReady: response.delivery_courier_order_by_pk.delivery_order.package_ready,
            deliveryId: response.delivery_courier_order_by_pk.delivery_order_id,
            serviceProviderId: response.delivery_courier_order_by_pk.delivery_order.service_provider_id,
            orderType: response.delivery_courier_order_by_pk.delivery_order.order_type as OrderType,
            pickupLocation: (response.delivery_courier_order_by_pk.delivery_order.pickup_gps && response.delivery_courier_order_by_pk.delivery_order.pickup_address) ? {
                lat: response.delivery_courier_order_by_pk.delivery_order.pickup_gps.coordinates[1],
                lng: response.delivery_courier_order_by_pk.delivery_order.pickup_gps.coordinates[0],
                address: response.delivery_courier_order_by_pk.delivery_order.pickup_address,
            }: undefined,
            dropoffLocation: {
                lat: response.delivery_courier_order_by_pk.delivery_order.dropoff_gps.coordinates[1],
                lng: response.delivery_courier_order_by_pk.delivery_order.dropoff_gps.coordinates[0],
                address: response.delivery_courier_order_by_pk.delivery_order.dropoff_address,
            },
            chatWithServiceProviderId: response.delivery_courier_order_by_pk.delivery_order.chat_with_service_provider_id,
            chatWithCustomerId: response.delivery_courier_order_by_pk.delivery_order.chat_with_customer_id,
            paymentType: response.delivery_courier_order_by_pk.delivery_order.payment_type as PaymentType,
            status: response.delivery_courier_order_by_pk.delivery_order.status as DeliveryOrderStatus,
            customerId: response.delivery_courier_order_by_pk.delivery_order.customer_id,
            deliveryCost: parseFloat(response.delivery_courier_order_by_pk.delivery_order.delivery_cost.replace("$", "")),
            packageCost: parseFloat(response.delivery_courier_order_by_pk.delivery_order.package_cost.replace("$", "")),
            orderTime: response.delivery_courier_order_by_pk.delivery_order.order_time,
            serviceProviderType: response.delivery_courier_order_by_pk.delivery_order.service_provider_type as DeliveryServiceProviderType,
            direction: response.delivery_courier_order_by_pk.delivery_order.direction as DeliveryDirection,
            deliveryDriverId: response.delivery_courier_order_by_pk.delivery_order.delivery_driver_id,
            tripDistance: response.delivery_courier_order_by_pk.delivery_order.trip_distance,
            tripDuration: response.delivery_courier_order_by_pk.delivery_order.trip_duration,
            tripPolyline: response.delivery_courier_order_by_pk.delivery_order.trip_polyline,
            changePriceRequest: (response.delivery_courier_order_by_pk.delivery_order.change_price_request)
                ? JSON.parse(response.delivery_courier_order_by_pk.delivery_order.change_price_request)
                : undefined,
            deliveryDriver: (response.delivery_courier_order_by_pk.delivery_order.delivery_driver) ? {
                id: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.id,
                deliveryCompanyType: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.delivery_company_type as DeliveryServiceProviderType,
                deliveryCompanyId: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.delivery_company_id,
                status: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.status as AuthorizationStatus,
                userId: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.user.id,
                user: {
                    id: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.user.id,
                    firebaseId: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.user.firebase_id,
                    language: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.user.language_id as Language
                },
                notificationInfo: (response.delivery_courier_order_by_pk.delivery_order.delivery_driver.notification_info) ? {
                    appType: AppType.Delivery,
                    token: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.notification_info.token,
                    turnOffNotifications: response.delivery_courier_order_by_pk.delivery_order.delivery_driver.notification_info.turn_off_notifications,
                } : undefined,
            }: undefined
        }
    }

    return courierOrder;
}

export async function getCourierOrderFromDelivery(deliveryOrder: DeliveryOrder): Promise<CourierOrder> {
    let chain = getHasura();
  
    let response =  await chain.query({
        delivery_courier_order: [{
            where: {
                delivery_order_id: {
                    _eq: deliveryOrder.deliveryId
                }
            } 
        }, {
            id: true,
            cancellation_time: true,
            customer_id: true,
            discount_value: true,
            from_location_gps: true,
            from_location_text: true,
            payment_type: true,
            order_time: true,
            refund_amount: true,
            stripe_fees: true,
            tax: true,
            to_location_address: true,
            to_location_gps: true,
            customer_app_type: true,
            delivery_order_id: true,
            stripe_info: [{}, true],
            items: [{}, {
                id: true,
                name: true,
                unavailable: true,
            }]
        }]
    })
    if(response.delivery_courier_order.length == 0) {
        throw new MezError("orderNotFound");
    }
    
    let toLocation: Location = {
      lat: response.delivery_courier_order[0].to_location_gps.coordinates[1],
      lng: response.delivery_courier_order[0].to_location_gps.coordinates[0],
      address: response.delivery_courier_order[0].to_location_address,
    }
  
    let items: CourierItem[] = response.delivery_courier_order[0].items.map((i:any) => {
      return {
        id: i.id,
        name: i.name,
        unavailable: true
      }
    })
    let courierOrder: CourierOrder = {
        id: response.delivery_courier_order[0].id,
        orderTime: response.delivery_courier_order[0].order_time,
        paymentType: response.delivery_courier_order[0].payment_type as PaymentType,
        discountValue: response.delivery_courier_order[0].discount_value,
        fromLocationGps: (response.delivery_courier_order[0].from_location_gps && response.delivery_courier_order[0].from_location_text) ? {
            lat: response.delivery_courier_order[0].from_location_gps.coordinates[1],
            lng: response.delivery_courier_order[0].from_location_gps.coordinates[0],
            address: response.delivery_courier_order[0].from_location_text
        }: undefined,
        fromLocationText: response.delivery_courier_order[0].from_location_text,
        toLocation,
        customerId: response.delivery_courier_order[0].customer_id,
        stripeInfo: JSON.parse(response.delivery_courier_order[0].stripe_info),
        stripeFees: response.delivery_courier_order[0].stripe_fees,
        tax: response.delivery_courier_order[0].tax,
        items,
        deliveryOrder
    }

    return courierOrder;
}