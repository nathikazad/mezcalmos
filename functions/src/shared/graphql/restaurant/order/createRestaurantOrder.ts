import * as functions from "firebase-functions";
import { RestaurantOrderStatus, RestaurantOrderType } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { PaymentType } from "../shared/models/Generic/Order";
import { Location, AppType, ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { RestaurantOrder } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function createOrder(restaurantOrder: RestaurantOrder): Promise<ServerResponse> {

  let chain = getHasura();
  
  try {
    // if (data.stripePaymentId) {
    //   order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    // }

    // let restaurantOperators = response.restaurant_operator.map( (v) => {
    //   return {
    //     participant_id: v.id,
    //     app_type_id: "RestaurantApp"};
    // })
    
    
    await chain.mutation({
      insert_restaurant_order_one: [{
        object: {
          customer_id: restaurantOrder.customer.id,
          restaurant_id: checkoutRequest.restaurantId,
          customer_app_type: checkoutRequest.customerAppType,
          chat: {
            data: {
              chat_participants: {
                data: [{
                  participant_id: customerId,
                  app_type_id: checkoutRequest.customerAppType
                },
                ...restaurantOperators]
              }
            }
          },
          delivery_cost: checkoutRequest.deliveryCost,
          delivery: {
            data: {
              customer_id: customerId,
              dropoff_gps: JSON.stringify({
                "type": "Point",
                "coordinates": [
                  checkoutRequest.customerLocation.lng,
                  checkoutRequest.customerLocation.lat,
                ]
              }),
              dropoff_address: checkoutRequest.customerLocation.address,
              pickup_gps: JSON.stringify(response.restaurant_by_pk!.location_gps),
              pickup_address: response.restaurant_by_pk!.location_text,
              chat_with_customer: {
                data: {
                  chat_info: JSON.stringify({}),
                  chat_participants: {
                    data: [{
                      participant_id: customerId,
                      app_type_id: checkoutRequest.customerAppType
                    },]
                  }
                }
              },
              chat_with_service_provider: {
                data: {
                  chat_info: JSON.stringify({}),
                  chat_participants: {
                    data: restaurantOperators
                  }
                }
              },
              payment_type: checkoutRequest.paymentType,
              delivery_cost: checkoutRequest.deliveryCost,
              status: "orderReceived",
              service_provider_id: checkoutRequest.restaurantId,
              service_provider_type: "Restaurant",
              trip_distance: checkoutRequest.tripDistance,
              trip_duration: checkoutRequest.tripDuration,
              trip_polyline: checkoutRequest.tripPolyline,
              package_cost: 0
            }
          },
          payment_type: checkoutRequest.paymentType,
          to_location_gps: JSON.stringify({
            "type": "Point",
            "coordinates": [
              checkoutRequest.customerLocation.lng,
              checkoutRequest.customerLocation.lat,
            ]
          }),
          to_location_address: checkoutRequest.customerLocation.address,
          notes: checkoutRequest.notes,
          status: RestaurantOrderStatus.OrderReceieved,
          items: {
            data: response.customer_by_pk!.cart!.items.map((i) => {
              return {
                cost_per_one: i.cost_per_one,
                notes: i.note,
                quantity: i.quantity,
                restaurant_item_id: i.restaurant_item_id,
                in_json: JSON.stringify({
                  name: i.restaurant_item.name?.translations.reduce((prev:Record<any, any>, current) => {
                    prev[current.language_id] = current.value;
                    return prev;
                  }, {}),
                  selected_options: i.selected_options
                }),
              };
            })
          },
          order_type: checkoutRequest.restaurantOrderType,
        }
      }, {
        id: true,
        chat_id: true,
        delivery: {
          chat_with_customer_id: true,
          chat_with_service_provider_id: true,
        }
      }],
      delete_restaurant_cart_item: [
        {
          where: {
            customer_id: {
              _eq: customerId
            }
          }
        }, {
          affected_rows: true
        }
      ],
      delete_restaurant_cart_by_pk: [
        {
          customer_id: customerId ,
        }, {
          customer_id: true
        }
      ]
    });
  }
}

