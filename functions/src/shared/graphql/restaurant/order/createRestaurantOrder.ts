import { HttpsError } from "firebase-functions/v1/auth";
import { CheckoutRequest } from "../../../../restaurant/checkoutCart";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType } from "../../../models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { Cart } from "../../../models/Services/Restaurant/Cart";
import { OrderItem, RestaurantOrder, RestaurantOrderStatus } from "../../../models/Services/Restaurant/RestaurantOrder";
import { ServiceProvider } from "../../../models/Services/Service";


export async function createRestaurantOrder(restaurant: ServiceProvider, checkoutReq : CheckoutRequest, customerCart: Cart, mezAdmins: MezAdmin[])
  : Promise<{restaurantOrder: RestaurantOrder, deliveryOrder: DeliveryOrder}> {

  let chain = getHasura();

  let restaurantOperatorsDetails = restaurant.operators!.map((v) => {
    return {
      participant_id: v.userId,
      app_type_id: AppType.RestaurantApp
    };
  });
  let mezAdminDetails = mezAdmins!.map((v) => {
    return {
      participant_id: v.id,
      app_type_id: AppType.MezAdmin
    };
  });
  let response = await chain.mutation({
    insert_restaurant_order_one: [{
      object: {
       scheduled_time: checkoutReq.scheduledTime,
        customer_id: customerCart.customerId,
        restaurant_id: checkoutReq.restaurantId,
        customer_app_type: checkoutReq.customerAppType,
        delivery_type: checkoutReq.deliveryType,
        chat: {
          data: {
            chat_participants: {
              data: [{
                participant_id: customerCart.customerId,
                app_type_id: AppType.Customer
              },
              ...restaurantOperatorsDetails,
              ...mezAdminDetails]
            }
          }
        },
        delivery_cost: checkoutReq.deliveryCost,
        delivery: (checkoutReq.deliveryType == DeliveryType.Delivery) ? {
          data: {
            customer_id: customerCart.customerId,
            order_type: OrderType.Restaurant,
            dropoff_gps: JSON.stringify({
              "type": "Point",
              "coordinates": [checkoutReq.customerLocation.lng, checkoutReq.customerLocation.lat ],
            }),
            dropoff_address: checkoutReq.customerLocation.address,
            pickup_gps: JSON.stringify({
              "type": "Point",
              "coordinates": [restaurant.location.lng, restaurant.location.lat ],
            }),
            pickup_address: restaurant.location.address,
            schedule_time: checkoutReq.scheduledTime,
            chat_with_customer: {
              data: {
                chat_participants: {
                  data: [{
                    participant_id: customerCart.customerId,
                    app_type_id: AppType.Customer
                  },]
                }
              }
            },
            chat_with_service_provider: {
              data: {
                chat_participants: {
                  data: [...restaurantOperatorsDetails, ...mezAdminDetails]
                }
              }
            },
            payment_type: checkoutReq.paymentType,
            delivery_cost: checkoutReq.deliveryCost,
          
            status: DeliveryOrderStatus.OrderReceived,
            service_provider_id: checkoutReq.restaurantId,
            service_provider_type: DeliveryServiceProviderType.Restaurant,
            
            scheduled_time: checkoutReq.scheduledTime,
            trip_distance: checkoutReq.tripDistance,
            trip_duration: checkoutReq.tripDuration,
            trip_polyline: checkoutReq.tripPolyline,
            package_cost: customerCart.cost
          }
        }: undefined,
        payment_type: checkoutReq.paymentType,
        to_location_gps: JSON.stringify({
          "type": "Point",
          "coordinates": [checkoutReq.customerLocation.lng, checkoutReq.customerLocation.lat ],
        }),
        to_location_address: checkoutReq.customerLocation.address,
        notes: checkoutReq.notes,
        status: RestaurantOrderStatus.OrderReceived,
        items: {
          data: customerCart.items!.map((i) => {
            console.log("+ SelectedOptions of item ", i.itemId , ": ",i.selectedOptions);
            console.log("+ ItemName ", i.name);
            return {
              cost_per_one: i.costPerOne,
              notes: i.notes,
              quantity: i.quantity,
              restaurant_item_id: i.itemId,
              in_json: 
               JSON.stringify({
                name: i.name,
                image : i.image,
                selected_options: i.selectedOptions
              }),
            };
          })
        },
      }
    }, {
      id: true,
      chat_id: true,
      order_time: true,
      items_cost: true,
      delivery: {
        id: true,
        chat_with_customer_id: true,
        chat_with_service_provider_id: true,
      }
    }],
  });

  if(response.insert_restaurant_order_one == null) {
    throw new HttpsError(
      "internal",
      "order creation error"
    );
  }
  let orderItems: OrderItem[] = customerCart.items.map((i) => {
    return {
      itemId: i.itemId,
      name: i.name,
      image: i.image,
      selectedOptions: i.selectedOptions,
      notes: i.notes,
      quantity: i.quantity,
      costPerOne: i.costPerOne
    }
  })
  let restaurantOrder: RestaurantOrder = {
    orderId: response.insert_restaurant_order_one.id,
    customerId: customerCart.customerId,
    restaurantId: checkoutReq.restaurantId,
    paymentType: checkoutReq.paymentType,
    toLocation: checkoutReq.customerLocation,
    status: RestaurantOrderStatus.OrderReceived,
    deliveryType: checkoutReq.deliveryType ?? DeliveryType.Delivery,
    customerAppType: checkoutReq.customerAppType,
    items: orderItems,
    itemsCost: customerCart.cost,
    notes: checkoutReq.notes,
    deliveryCost: checkoutReq.deliveryCost,
    scheduledTime: checkoutReq.scheduledTime,
    chatId: response.insert_restaurant_order_one.chat_id
    
  }
  let deliveryOrder: DeliveryOrder;
  if(checkoutReq.deliveryType == DeliveryType.Delivery) {
    if(response.insert_restaurant_order_one.delivery == null) {
      throw new HttpsError(
        "internal",
        "order creation error"
      );
    }
    restaurantOrder.deliveryId = response.insert_restaurant_order_one.delivery.id;
    deliveryOrder = {
      deliveryId: response.insert_restaurant_order_one.delivery.id,
      orderType: OrderType.Restaurant,
      pickupLocation: restaurant.location,
      dropoffLocation: checkoutReq.customerLocation,
      chatWithServiceProviderId: response.insert_restaurant_order_one.delivery.chat_with_service_provider_id,
      chatWithCustomerId: response.insert_restaurant_order_one.delivery.chat_with_customer_id,
      paymentType: checkoutReq.paymentType,
      status: DeliveryOrderStatus.OrderReceived,
      customerId: customerCart.customerId,
      deliveryCost: checkoutReq.deliveryCost,
      packageCost: checkoutReq.paymentType == "cash" ? response.insert_restaurant_order_one.items_cost : 0,
      orderTime: response.insert_restaurant_order_one.order_time,
      tripDistance : checkoutReq.tripDistance,
      tripDuration : checkoutReq.tripDuration,
      tripPolyline : checkoutReq.tripPolyline,
      serviceProviderId: checkoutReq.restaurantId,
      serviceProviderType: DeliveryServiceProviderType.Restaurant,
      direction: DeliveryDirection.ToCustomer,
      packageReady:false,
    }
  } else {
    deliveryOrder = {
      deliveryId: 0,
      orderType: OrderType.Restaurant,
      pickupLocation: restaurant.location,
      dropoffLocation: checkoutReq.customerLocation,
      chatWithServiceProviderId: 0,
      chatWithCustomerId: 0,
      paymentType: checkoutReq.paymentType,
      status: DeliveryOrderStatus.OrderReceived,
      customerId: customerCart.customerId,
      deliveryCost: checkoutReq.deliveryCost,
      packageCost: checkoutReq.paymentType == PaymentType.Cash ? response.insert_restaurant_order_one.items_cost : 0,
      orderTime: response.insert_restaurant_order_one.order_time,
      tripDistance : checkoutReq.tripDistance,
      tripDuration : checkoutReq.tripDuration,
      tripPolyline : checkoutReq.tripPolyline,
      serviceProviderId: checkoutReq.restaurantId,
      serviceProviderType: DeliveryServiceProviderType.Restaurant,
      direction: DeliveryDirection.ToCustomer,
      packageReady:false,
    }
  }
  return {restaurantOrder, deliveryOrder}
}

