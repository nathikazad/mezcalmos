import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryOrder, DeliveryOrderStatus } from "../../../models/Services/Delivery/DeliveryOrder";
import { Restaurant } from "../../../models/Services/Restaurant/Restaurant";
import { RestaurantOrder, RestaurantOrderStatus } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function createRestaurantOrder(restaurantOrder: RestaurantOrder, restaurant: Restaurant)
  : Promise<{ restaurantOrder: RestaurantOrder, deliveryOrder: DeliveryOrder }> {

  let chain = getHasura();
  
  // try {
    // if (data.stripePaymentId) {
    //   order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    // }

  let restaurantOperatorsDetails = restaurant.restaurantOperators!.map((v) => {
    return {
      participant_id: v.userId,
      app_type_id: "restaurant"
    };
  });

  let response = await chain.mutation({
    insert_restaurant_order_one: [{
      object: {
        customer_id: restaurantOrder.customerId,
        restaurant_id: restaurantOrder.restaurantId,
        customer_app_type: restaurantOrder.customerAppType,
        chat: {
        
          data: {
            
            chat_participants: {
              data: [{
                
              
                participant_id: restaurantOrder.customerId,
                app_type_id: restaurantOrder.customerAppType
              },
              ...restaurantOperatorsDetails]
            }
          }
        },
        delivery_cost: restaurantOrder.deliveryCost,
        delivery: {
          data: {
            customer_id: restaurantOrder.customerId,
            dropoff_gps: JSON.stringify({
              "type": "Point",
              "coordinates": [restaurantOrder.toLocation.lng,restaurantOrder.toLocation.lat],
            }),
            dropoff_address: restaurantOrder.toLocation.address,
            pickup_gps: JSON.stringify({
              "type": "Point",
              "coordinates": [restaurantOrder.toLocation.lng,restaurantOrder.toLocation.lat],
            }),
            pickup_address: restaurant.location.address,
            chat_with_customer: {
              data: {
                chat_info: JSON.stringify({}),
                chat_participants: {
                  data: [{
                    participant_id: restaurantOrder.customerId,
                    app_type_id: restaurantOrder.customerAppType
                  },]
                }
              }
            },
            chat_with_service_provider: {
              data: {
                chat_info: JSON.stringify({}),
                chat_participants: {
                  data: restaurantOperatorsDetails
                }
              }
            },
            payment_type: restaurantOrder.paymentType,
            delivery_cost: restaurantOrder.deliveryCost,
            status: DeliveryOrderStatus.OrderReceived,
            service_provider_id: restaurantOrder.restaurantId,
            service_provider_type: "restaurant",
            // trip_distance: deliveryDetails.tripDistance,
            // trip_duration: deliveryDetails.tripDuration,
            // trip_polyline: deliveryDetails.tripPolyline,
            package_cost: restaurantOrder.itemsCost
          }
        },
        payment_type: restaurantOrder.paymentType,
        to_location_gps: JSON.stringify({
          "type": "Point",
          "coordinates": [restaurantOrder.toLocation.lng,restaurantOrder.toLocation.lat],
        }),
        to_location_address: restaurantOrder.toLocation.address,
        notes: restaurantOrder.notes,
        status: RestaurantOrderStatus.OrderReceived,
        items: {
          data: restaurantOrder.items!.map((i) => {
            return {
              cost_per_one: i.costPerOne,
              notes: i.notes,
              quantity: i.quantity,
              restaurant_item_id: i.itemId,
              in_json: JSON.stringify({
                // name: i.restaurant_item.name?.translations.reduce((prev:Record<any, any>, current) => {
                //   prev[current.language_id] = current.value;
                //   return prev;
                // }, {}),
                name: i.name,
                selected_options: i.selectedOptions
              }),
            };
          })
        },
        order_type: restaurantOrder.orderType,
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

  if(response.insert_restaurant_order_one == null || response.insert_restaurant_order_one.delivery == null) {
    throw new HttpsError(
      "internal",
      "order creation error"
    );
  }
  restaurantOrder.orderId = response.insert_restaurant_order_one.id;
  restaurantOrder.chatId = response.insert_restaurant_order_one.chat_id;
  let deliveryOrder: DeliveryOrder = {
    deliveryId: response.insert_restaurant_order_one.delivery.id,
    pickupLocation: restaurant.location,
    dropoffLocation: restaurantOrder.toLocation,
    chatWithServiceProviderId: response.insert_restaurant_order_one.delivery.chat_with_service_provider_id,
    chatWithCustomerId: response.insert_restaurant_order_one.delivery.chat_with_customer_id,
    paymentType: restaurantOrder.paymentType,
    status: DeliveryOrderStatus.OrderReceived,
    customerId: restaurantOrder.customerId,
    deliveryCost: restaurantOrder.deliveryCost,
    packageCost: restaurantOrder.paymentType == "cash" ? response.insert_restaurant_order_one.items_cost : 0,
    orderTime: response.insert_restaurant_order_one.order_time
  }

  return { restaurantOrder, deliveryOrder };
  
}

