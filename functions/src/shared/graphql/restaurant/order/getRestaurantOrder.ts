import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Location } from "../../../models/Generic/Generic";
import { PaymentType } from "../../../models/Generic/Order";
import { OrderItem, RestaurantOrder, RestaurantOrderStatus, RestaurantOrderType } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function getRestaurantOrder(orderId: number): Promise<RestaurantOrder> {
  let chain = getHasura();

  let response =  await chain.query({
    restaurant_order_by_pk: [
      { id: orderId }, {
        restaurant_id: true,
        total_cost: true,
        order_type: true,
        status: true,
        payment_type: true,
        customer_id: true,
        to_location_gps: true,
        order_time: true,
        restaurant: {
          location_gps: true,
        },
        delivery_id: true,
        to_location_address: true,
        estimated_food_ready_time: true,
        customer_app_type: true,
        delivery_cost: true,
        customer: {
          user: {
            firebase_id: true,
            language_id: true,
          },
          app_version: true,
        },
        items: [{}, {
          // in_json: [{path: "[name(en,es), selected_options]"}, true]
          id: true,
          restaurant_item_id: true,
          quantity: true,
          cost_per_one: true,
        }],
      }
    ]
  })
  if(response.restaurant_order_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No order with that id found"
    );
  }
  
  let toLocation: Location = {
    lat: response.restaurant_order_by_pk.to_location_gps.coordinates[1],
    lng: response.restaurant_order_by_pk.to_location_gps.coordinates[0],
  }

  let items: OrderItem[] = response.restaurant_order_by_pk.items.map((i) => {
    return {
      orderItemId: i.id,
      itemId: i.restaurant_item_id,
      quantity: i.quantity,
      costPerOne: i.cost_per_one
    }
  })
  let restaurantOrder: RestaurantOrder = {
    orderId,
    customerId: response.restaurant_order_by_pk.customer_id,
    restaurantId: response.restaurant_order_by_pk.restaurant_id,
    paymentType: response.restaurant_order_by_pk.payment_type as PaymentType,
    toLocation,
    estimatedFoodReadyTime: response.restaurant_order_by_pk.estimated_food_ready_time,
    status: response.restaurant_order_by_pk.status as RestaurantOrderStatus,
    orderType: response.restaurant_order_by_pk.order_type as RestaurantOrderType,
    customerAppType: response.restaurant_order_by_pk.customer_app_type as AppType,
    deliveryCost: response.restaurant_order_by_pk.delivery_cost,
    items
  }
  if(response.restaurant_order_by_pk.delivery_id != undefined) {
    restaurantOrder.deliveryId = response.restaurant_order_by_pk.delivery_id
  }
  return restaurantOrder;
}