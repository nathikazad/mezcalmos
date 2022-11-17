import * as functions from "firebase-functions";
import { RestaurantOrderStatus, RestaurantOrderType } from '../shared/models/Services/Restaurant/RestaurantOrder';
import { PaymentType } from "../shared/models/Generic/Order";
import { Location, AppType, ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { HttpsError } from "firebase-functions/v1/auth";

export interface CheckoutRequest {
  customerAppType: AppType,
  customerLocation: Location,
  deliveryCost: number,
  paymentType: PaymentType,
  notes: string,
  restaurantId: number,
  restaurantOrderType: RestaurantOrderType,
  tripDistance: number,
  tripDuration: number,
  tripPolyline: string
}

export async function checkout(customerId: number, checkoutRequest: CheckoutRequest): Promise<ServerResponse> {

  let chain = getHasura();
  let response = await getCheckoutDetails()
  errorChecks(response, checkoutRequest);
  try {
    // if (data.stripePaymentId) {
    //   order = (await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)) as RestaurantOrder
    // }

    let restaurantOperators = response.restaurant_operator.map( (v) => {
      return {
        participant_id: v.id,
        app_type_id: "RestaurantApp"};
    })
    // fetch the restaurant
    // construct the restaurant order model
    let orderResponse = await makeOrder(restaurantOperators)
    
    let orderId: number | undefined = orderResponse.insert_restaurant_order_one?.id;

    if(orderId == undefined) {
      throw new HttpsError(
        "internal",
        "Order creation error",
      );
    }
    // clear user cart

    setCustomerRestaurantChatInfo(orderResponse, orderId);
    setCustomerDeliveryDriverChatInfo(orderResponse, orderId);
    setRestaurantDeliveryDriverChatInfo(orderResponse, orderId);
    notifyAdmins(response, orderId);
    return <ServerResponse> {
      status: ServerResponseStatus.Success
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    throw new HttpsError(
      "internal",
       (<Error>e).message
    )
  }

  async function getCheckoutDetails() {
    return await chain.query({
      restaurant_by_pk: [
        { id: checkoutRequest.restaurantId },
        {
          open_status: true,
          approved: true,
          location_gps: true,
          location_text: true,
          name: true,
          image: true
        }
      ],
      customer_by_pk: [
        {
          user_id: customerId
        },
        {
          cart: {
            restaurant_id: true,
            items: [{},
            {
              cost_per_one: true,
              quantity: true,
              selected_options: [{}, true],
              restaurant_item_id: true,
              note: true,
              restaurant_item: {
                name: {
                  translations: [{},
                  {
                    language_id: true,
                    value: true
                  }]
                },
                description: {
                  translations: [{},
                  {
                    language_id: true,
                    value: true
                  }]
                },
              }
            }]
          },
          user: {
            name: true,
            image: true
          }
        }
      ],
      restaurant_operator: [{
        where: {
          restaurant_id: {
            _eq: checkoutRequest.restaurantId
          },
          status: {
            _eq: "authorized"
          }
        }
      }, {
        id: true,
        notification_info: {
          token: true,
          app_type_id: true
        }
      }],
      mez_admin: [{}, {
        notification_info: {
          token: true,
          app_type_id: true
        }
      }]
    });
  }

  async function makeOrder(restaurantOperators: { participant_id: number; app_type_id: string; }[]) {
    return await chain.mutation({
      insert_restaurant_order_one: [{
        object: {
          customer_id: customerId,
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

  function setCustomerRestaurantChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: orderResponse.insert_restaurant_order_one!.chat_id
        },
        _set: {
          chat_info: JSON.stringify({
            CustomerApp: {
              chatTitle: response.restaurant_by_pk!.name,
              chatImage: response.restaurant_by_pk!.image,
              parentLink: `/RestaurantOrders/${orderId}`
            },
            RestaurantApp: {
              chatTitle: response.customer_by_pk?.user.name ?? "Customer",
              chatImage: response.customer_by_pk?.user.image,
              parentLink: `/RestaurantOrders/${orderId}`
            },
            MezAdminApp: {
              chatTitle: response.customer_by_pk?.user.name ?? "Customer",
              chatImage: response.customer_by_pk?.user.image,
              parentLink: `/RestaurantOrders/${orderId}`
            },
          }),
        }
      }, {
        id: true
      },]
    });
  }

  function setCustomerDeliveryDriverChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: orderResponse.insert_restaurant_order_one!.delivery!.chat_with_customer_id
        },
        _set: {
          chat_info: JSON.stringify({
            RestaurantApp: {
              chatTitle: response.customer_by_pk?.user.name ?? "Customer",
              chatImage: response.customer_by_pk?.user.image,
              parentLink: `/RestaurantOrders/${orderId}`
            },
            DeliveryApp: {
              chatTitle: response.customer_by_pk?.user.name ?? "Customer",
              chatImage: response.customer_by_pk?.user.image,
              parentLink: `/RestaurantOrders/${orderId}`
            }
          }),
        }
      }, {
        id: true
      },]
    });
  }

  function setRestaurantDeliveryDriverChatInfo(orderResponse: { insert_restaurant_order_one: { id: number; chat_id: number; delivery: { chat_with_customer_id: number; chat_with_service_provider_id: number | undefined; } | undefined; } | undefined; delete_restaurant_cart_item: {} | undefined; delete_restaurant_cart_by_pk: {} | undefined; }, orderId: number) {
    chain.mutation({
      update_chat_by_pk: [{
        pk_columns: {
          id: orderResponse.insert_restaurant_order_one!.delivery!.chat_with_service_provider_id!
        },
        _set: {
          chat_info: JSON.stringify({
            DeliveryApp: {
              chatTitle: response.restaurant_by_pk!.name,
              chatImage: response.restaurant_by_pk!.image,
              parentLink: `/RestaurantOrders/${orderId}`
            }
          }),
        }
      }, {
        id: true
      },]
    });
  }

}

function errorChecks(response: { restaurant_by_pk: { open_status: string; approved: boolean; location_gps: any; location_text: string; } | undefined; customer_by_pk: { cart: { restaurant_id: number | undefined; items: { cost_per_one: any; quantity: number; selected_options: any; restaurant_item_id: number; note: string | undefined; restaurant_item: { name: { translations: { language_id: string; value: string; }[]; }; description: { translations: { language_id: string; value: string; }[]; } | undefined; }; }[]; } | undefined; } | undefined; restaurant_operator: { id: number; }[]; }, checkoutRequest: CheckoutRequest) {
  if (response.restaurant_by_pk == undefined) {
    throw new HttpsError(
      "internal",
      "Restaurant does not exist"
    );
  }
  if (response.restaurant_by_pk?.approved == false) {
    throw new HttpsError(
      "internal",
      "Restaurant is not approved and taking orders right now"
    );
  }

  if (response.restaurant_by_pk?.open_status != "open") {
    throw new HttpsError(
      "internal",
      "Restaurant is closed"
    );
  }
  if ((response.customer_by_pk?.cart?.items.length ?? 0) == 0) {
    throw new HttpsError(
      "internal",
      "Empty cart"
    );
  }

  if (response.customer_by_pk?.cart?.restaurant_id !== checkoutRequest.restaurantId) {
    throw new HttpsError(
      "internal",
      "Restaurant id mismatch"
    );
  }
}

function notifyAdmins(response: { restaurant_by_pk: { open_status: string; approved: boolean; location_gps: any; location_text: string; name: string; image: string; } | undefined; customer_by_pk: { cart: { restaurant_id: number | undefined; items: { cost_per_one: any; quantity: number; selected_options: any; restaurant_item_id: number; note: string | undefined; restaurant_item: { name: { translations: { language_id: string; value: string; }[]; }; description: { translations: { language_id: string; value: string; }[]; } | undefined; }; }[]; } | undefined; user: { name: string | undefined; image: string | undefined; }; } | undefined; restaurant_operator: { id: number; notification_info: { token: string; app_type_id: string; }; }[]; mez_admin: { notification_info: { token: string; app_type_id: string; } | undefined; }[]; }, orderId: number) {
  

  // let notification: Notification = {
  //   foreground: <NewRestaurantOrderNotification>{
  //     time: (new Date()).toISOString(),
  //     notificationType: NotificationType.NewOrder,
  //     orderType: OrderType.Restaurant,
  //     orderId: orderId,
  //     notificationAction: NotificationAction.ShowSnackBarAlways,
  //     restaurant: restaurant
  //   },
  //   background: {
  //     [Language.ES]: {
  //       title: "Nueva Pedido",
  //       body: `Hay una nueva orden de alimento`
  //     },
  //     [Language.EN]: {
  //       title: "New Order",
  //       body: `There is a new restaurant order`
  //     }
  //   },
  //   linkUrl: orderUrl(participantType, OrderType.Restaurant, orderId)
  // }

  // for (let index in participants) {
  //   let participantId: string = participants[index]
  //   pushNotification(participantId, notification, participantType);
  // }

}

