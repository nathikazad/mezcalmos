import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, Location } from "../../../models/Generic/Generic";
import { PaymentType } from "../../../models/Generic/Order";
import { OperatorStatus, RestaurantOperator } from "../../../models/Services/Restaurant/Restaurant";
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
        stripe_info: [{}, true],
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
          restaurant_item : {
            name : {
              translations :  [{} , {
                language_id : true,
                value : true
              }], 
            },
            image : true,
          }   
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
      name: i.restaurant_item.name,
      image : i.restaurant_item.image,
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
    items,
    stripeInfo: JSON.parse(response.restaurant_order_by_pk.stripe_info),
    totalCost: response.restaurant_order_by_pk.total_cost
  }
  if(response.restaurant_order_by_pk.delivery_id != undefined) {
    restaurantOrder.deliveryId = response.restaurant_order_by_pk.delivery_id
  }
  return restaurantOrder;
}

export async function getReceivedRestaurantOrders(): Promise<RestaurantOrder[]> {
  let chain = getHasura();

  let response =  await chain.query({
    restaurant_order: [{
      where: {
        status: {
          _eq: RestaurantOrderStatus.OrderReceived,
        }
      }
    }, {
      id: true,
      restaurant_id: true,
      order_type: true,
      status: true,
      payment_type: true,
      customer_id: true,
      to_location_gps: true,
      order_time: true,
      restaurant: {
        restaurant_operators: [{}, {
          id: true,
          user_id: true,
          status: true,
          owner: true,
          notification_token: true,
          user: {
            firebase_id: true,
            language_id: true,
          }
        }],
        name: true,
        image: true,
        location_gps: true,
        self_delivery: true,
      },
      customer_app_type: true,
      delivery_cost: true,
      items: [{}, {
        // in_json: [{path: "[name(en,es), selected_options]"}, true]
        id: true,
        restaurant_item_id: true,
        quantity: true,
        cost_per_one: true,
        restaurant_item : {
          name : {
            translations :  [{} , {
              language_id : true,
              value : true
            }], 
          },
          image : true,
        } 
      }],
    }]
  });
  return response.restaurant_order.map((o) => {
    let restaurantOperators: RestaurantOperator[] = o.restaurant.restaurant_operators.map((r) => {
      return {
        id: r.id,
        userId: r.user_id,
        restaurantId: o.restaurant_id,
        status: r.status as OperatorStatus,
        owner: r.owner,
        notificationInfo: (r.notification_token) ? {
          AppTypeId: AppType.RestaurantApp,
          token: r.notification_token
        }: undefined,
        user: {
          id: r.user_id,
          firebaseId: r.user.firebase_id,
          language: r.user.language_id as Language
        }
      }
    })
    let items: OrderItem[] = o.items.map((i) => {
      return {
        name: i.restaurant_item.name,
        orderItemId: i.id,
        itemId: i.restaurant_item_id,
        quantity: i.quantity,
        costPerOne: i.cost_per_one
      }
    })
    return {
      orderId: o.id,
      customerId: o.customer_id,
      restaurantId: o.restaurant_id,
      paymentType: o.payment_type as PaymentType,
      toLocation: {
        lat: o.to_location_gps.coordinates[1],
        lng: o.to_location_gps.coordinates[0],
      },
      orderTime: o.order_time,
      status: o.status as RestaurantOrderStatus,
      orderType: o.order_type as RestaurantOrderType,
      customerAppType: o.customer_app_type as AppType,
      deliveryCost: o.delivery_cost,
      items,
      restaurant: {
        name: o.restaurant.name,
        image: o.restaurant.image,
        location: o.restaurant.location_gps as Location,
        restaurantOperators,
        selfDelivery: o.restaurant.self_delivery
      }
    }
  })
}

export async function getCustomerRestaurantOrders(customerId: number): Promise<RestaurantOrder[]> {
  let chain = getHasura();

  let response =  await chain.query({
    restaurant_order: [{
      where: {
        customer_id: {
          _eq: customerId
        }
      }
    }, {
      id: true,
      restaurant_id: true,
      order_type: true,
      status: true,
      payment_type: true,
      customer_id: true,
      to_location_gps: true,
      order_time: true,
      customer_app_type: true,
      delivery_cost: true,
      items: [{}, {
        id: true,
        restaurant_item_id: true,
        quantity: true,
        cost_per_one: true,
        restaurant_item : {
          name : {
            translations :  [{} , {
              language_id : true,
              value : true
            }], 
          },
          image : true,
        } 
      }],
    }]
  });
  return response.restaurant_order.map((o) => {
    let items: OrderItem[] = o.items.map((i) => {
      return {
        name: i.restaurant_item.name,
        orderItemId: i.id,
        itemId: i.restaurant_item_id,
        quantity: i.quantity,
        costPerOne: i.cost_per_one
      }
    })
    return {
      orderId: o.id,
      customerId: o.customer_id,
      restaurantId: o.restaurant_id,
      paymentType: o.payment_type as PaymentType,
      toLocation: {
        lat: o.to_location_gps.coordinates[1],
        lng: o.to_location_gps.coordinates[0],
      },
      orderTime: o.order_time,
      status: o.status as RestaurantOrderStatus,
      orderType: o.order_type as RestaurantOrderType,
      customerAppType: o.customer_app_type as AppType,
      deliveryCost: o.delivery_cost,
      items
    }
  })
}