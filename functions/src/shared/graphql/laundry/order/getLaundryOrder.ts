import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder } from "../../../models/Generic/Delivery";
import { AppType, AuthorizationStatus, CustomerAppType, Language, Location } from "../../../models/Generic/Generic";
import { DeliveryType, PaymentType } from "../../../models/Generic/Order";
import { LaundryOrder, LaundryOrderStatus, OrderCategory } from "../../../models/Services/Laundry/LaundryOrder";
import { Operator } from "../../../models/Services/Service";

export async function getLaundryOrder(orderId: number): Promise<LaundryOrder> {
    let chain = getHasura();
  
    let response =  await chain.query({
        laundry_order_by_pk: [{ id: orderId }, {
                store_id: true,
                delivery_type: true,
                status: true,
                payment_type: true,
                refund_amount: true,
                customer_id: true,
                customer_location_gps: true,
                customer_address: true,
                order_time: true,
                // store: {

                //     location: {
                //         gps: true
                //     },
                //     self_delivery :true,
                // },
                to_customer_delivery_id: true,
                from_customer_delivery_id: true,
                estimated_ready_time: true,
                actual_ready_time: true,
                notes: true,
                tax: true,
                customer_app_type: true,
                delivery_cost: true,
                stripe_info: [{}, true],
                stripe_fees: true,
                discount_value: true,
                items_cost: true,
                total_cost: true,
                store: {
                  details_id: true
                },
                //   customer: {
                //     user: {
                //       firebase_id: true,
                //       language_id: true,
                //     },
                //     app_version: true,
                //   },
                categories: [{}, {
                    id: true,
                    category_id: true,
                    weight_in_kilo: true,
                    category: {
                        // name : {
                        //     translations :  [{} , {
                        //         language_id : true,
                        //         value : true
                        //     }], 
                        // },
                        cost_by_kilo: true,
                    }
                }],
            }
        ]
    })
    if(response.laundry_order_by_pk == null) {
      throw new HttpsError(
        "internal",
        "No order with that id found"
      );
    }
    
    let customerLocation: Location = {
      lat: response.laundry_order_by_pk.customer_location_gps.coordinates[1],
      lng: response.laundry_order_by_pk.customer_location_gps.coordinates[0],
      address: response.laundry_order_by_pk.customer_address
    }
  
    let categories: OrderCategory[] = response.laundry_order_by_pk.categories.map((c) => {
      return {
        orderCategoryId: c.id,
        categoryId: c.category_id,
        orderId,
        weightInKilo: c.weight_in_kilo,
        costByKilo: c.category.cost_by_kilo
      }
    })
    let laundryOrder: LaundryOrder = {
      orderId,
      spDetailsId: response.laundry_order_by_pk.store.details_id,
      customerId: response.laundry_order_by_pk.customer_id,
      storeId: response.laundry_order_by_pk.store_id,
      paymentType: response.laundry_order_by_pk.payment_type as PaymentType,
      customerLocation,
      refundAmount: parseFloat(response.laundry_order_by_pk.refund_amount.replace("$","")),
      status: response.laundry_order_by_pk.status as LaundryOrderStatus,
      deliveryType: response.laundry_order_by_pk.delivery_type as DeliveryType,
      customerAppType: response.laundry_order_by_pk.customer_app_type as CustomerAppType,
      deliveryCost: parseFloat(response.laundry_order_by_pk.delivery_cost.replace("$","")),
      categories,
      stripeInfo: JSON.parse(response.laundry_order_by_pk.stripe_info),
      estimatedReadyTime: response.laundry_order_by_pk.estimated_ready_time,
      actualReadyTime: response.laundry_order_by_pk.actual_ready_time,
      stripeFees: response.laundry_order_by_pk.stripe_fees,
      discountValue: response.laundry_order_by_pk.discount_value,
      tax: response.laundry_order_by_pk.tax,
      itemsCost: response.laundry_order_by_pk.items_cost,
      totalCost: response.laundry_order_by_pk.total_cost ?? 0
    }
    if(response.laundry_order_by_pk.from_customer_delivery_id != undefined)
        laundryOrder.fromCustomerDeliveryId = response.laundry_order_by_pk.from_customer_delivery_id

    if(response.laundry_order_by_pk.to_customer_delivery_id != undefined)
        laundryOrder.toCustomerDeliveryId = response.laundry_order_by_pk.to_customer_delivery_id

    return laundryOrder;
}

export async function getLaundryOrderFromDelivery(deliveryOrder: DeliveryOrder): Promise<LaundryOrder> {
  let chain = getHasura();

  let response =  await chain.query({
      laundry_order: [{
        where: (deliveryOrder.direction == DeliveryDirection.ToCustomer) ? {
          to_customer_delivery_id: {
            _eq: deliveryOrder.deliveryId
          }
        }: {
          from_customer_delivery_id: {
            _eq: deliveryOrder.deliveryId
          }
        }
      }, {
        id: true,
        store_id: true,
        delivery_type: true,
        status: true,
        payment_type: true,
        refund_amount: true,
        customer_id: true,
        customer_location_gps: true,
        customer_address: true,
        order_time: true,
        // store: {

        //     location: {
        //         gps: true
        //     },
        //     self_delivery :true,
        // },
        to_customer_delivery_id: true,
        from_customer_delivery_id: true,
        estimated_ready_time: true,
        actual_ready_time: true,
        notes: true,
        tax: true,
        customer_app_type: true,
        delivery_cost: true,
        stripe_info: [{}, true],
        stripe_fees: true,
        discount_value: true,
        items_cost: true,
        total_cost: true,
        store: {
          details_id: true
        },
        //   customer: {
        //     user: {
        //       firebase_id: true,
        //       language_id: true,
        //     },
        //     app_version: true,
        //   },
        categories: [{}, {
            id: true,
            category_id: true,
            weight_in_kilo: true,
            category: {
                // name : {
                //     translations :  [{} , {
                //         language_id : true,
                //         value : true
                //     }], 
                // },
                cost_by_kilo: true,
            }
        }],
      }
    ]
  })
  if(response.laundry_order.length == 0) {
    throw new HttpsError(
      "internal",
      "No order with that id found"
    );
  }
  
  let customerLocation: Location = {
    lat: response.laundry_order[0].customer_location_gps.coordinates[1],
    lng: response.laundry_order[0].customer_location_gps.coordinates[0],
    address: response.laundry_order[0].customer_address
  }

  let categories: OrderCategory[] = response.laundry_order[0].categories.map((c) => {
    return {
      orderCategoryId: c.id,
      categoryId: c.category_id,
      orderId: response.laundry_order[0].id,
      weightInKilo: c.weight_in_kilo,
      costByKilo: c.category.cost_by_kilo
    }
  })
  let laundryOrder: LaundryOrder = {
    orderId: response.laundry_order[0].id,
    customerId: response.laundry_order[0].customer_id,
    storeId: response.laundry_order[0].store_id,
    spDetailsId: response.laundry_order[0].store.details_id,
    paymentType: response.laundry_order[0].payment_type as PaymentType,
    customerLocation,
    refundAmount: parseFloat(response.laundry_order[0].refund_amount.replace("$","")),
    status: response.laundry_order[0].status as LaundryOrderStatus,
    deliveryType: response.laundry_order[0].delivery_type as DeliveryType,
    customerAppType: response.laundry_order[0].customer_app_type as CustomerAppType,
    deliveryCost: parseFloat(response.laundry_order[0].delivery_cost.replace("$","")),
    categories,
    stripeInfo: JSON.parse(response.laundry_order[0].stripe_info),
    estimatedReadyTime: response.laundry_order[0].estimated_ready_time,
    actualReadyTime: response.laundry_order[0].actual_ready_time,
    stripeFees: response.laundry_order[0].stripe_fees,
    discountValue: response.laundry_order[0].discount_value,
    tax: response.laundry_order[0].tax,
    itemsCost: response.laundry_order[0].items_cost,
    totalCost: response.laundry_order[0].total_cost
  }
  if(response.laundry_order[0].from_customer_delivery_id != undefined)
      laundryOrder.fromCustomerDeliveryId = response.laundry_order[0].from_customer_delivery_id

  if(response.laundry_order[0].to_customer_delivery_id != undefined)
      laundryOrder.toCustomerDeliveryId = response.laundry_order[0].to_customer_delivery_id

  return laundryOrder;
}

export async function getCustomerLaundryOrders(customerId: number): Promise<LaundryOrder[]> {
  let chain = getHasura();

  let response =  await chain.query({
    laundry_order: [{
      where: {
        customer_id: {
          _eq: customerId
        }
      }
    }, {
      id: true,
      store_id: true,
      store: {
        details_id: true
      },
      delivery_type: true,
      status: true,
      payment_type: true,
      refund_amount: true,
      customer_id: true,
      customer_location_gps: true,
      customer_address: true,
      order_time: true,
      to_customer_delivery_id: true,
      from_customer_delivery_id: true,
      to_location_address: true,
      estimated_food_ready_time: true,
      customer_app_type: true,
      delivery_cost: true,
      stripe_info: [{}, true],
      categories: [{}, {
        id: true,
        category_id: true,
        weight_in_kilo: true,
        category: {
          cost_by_kilo: true,
        }
      }],
    }]
  });
  return response.laundry_order.map((o): LaundryOrder => {
    let categories: OrderCategory[] = o.categories.map((c) => {
      return {
        orderCategoryId: c.id,
        categoryId: c.category_id,
        orderId: o.id,
        weightInKilo: c.weight_in_kilo,
        costByKilo: c.category.cost_by_kilo
      }
    })
    return {
      orderId: o.id,
      spDetailsId: o.store.details_id,
      customerId: o.customer_id,
      storeId: o.store_id,
      paymentType: o.payment_type as PaymentType,
      customerLocation: {
        lat: o.customer_location_gps.coordinates[1],
        lng: o.customer_location_gps.coordinates[0],
        address: o.customer_address
      },
      orderTime: o.order_time,
      status: o.status as LaundryOrderStatus,
      deliveryType: o.delivery_type as DeliveryType,
      customerAppType: o.customer_app_type as CustomerAppType,
      deliveryCost: o.delivery_cost,
      categories
    }
  })
}

export async function getReceivedLaundryOrders(): Promise<LaundryOrder[]> {
  let chain = getHasura();

  let response =  await chain.query({
    laundry_order: [{
      where: {
        status: {
          _eq: LaundryOrderStatus.OrderReceived
        }
      }
    }, {
      id: true,
      store_id: true,
      delivery_type: true,
      status: true,
      payment_type: true,
      refund_amount: true,
      customer_id: true,
      customer_location_gps: true,
      customer_address: true,
      order_time: true,
      to_customer_delivery_id: true,
      from_customer_delivery_id: true,
      to_location_address: true,
      estimated_food_ready_time: true,
      customer_app_type: true,
      delivery_cost: true,
      stripe_info: [{}, true],
      categories: [{}, {
        id: true,
        category_id: true,
        weight_in_kilo: true,
        category: {
          cost_by_kilo: true,
        }
      }],
      store: {
        id: true,
        details_id: true,
        operators: [{}, {
          id: true,
          user_id: true,
          operator_details: {
            status: true,
            owner: true,
            notification_info: {
              token: true,
              turn_off_notifications: true
            },
          },
          user: {
            firebase_id: true,
            language_id: true,
          }
        }],
        details: {
          name: true,
          image: true,
          location: {
            gps: true
          },
          
          language: [{}, true]
        },
        delivery_details: {
          self_delivery: true,
          delivery_available: true,
          customer_pickup: true,
          radius: true,
          minimum_cost: true,
          cost_per_km: true,
        },
      },
    }]
  });
  return response.laundry_order.map((o): LaundryOrder => {
    let laundryOperators: Operator[] = o.store.operators.map((r) => {
      return <Operator>{
        id: r.id,
        userId: r.user_id,
        serviceProviderId: o.store_id,
        status: r.operator_details.status as AuthorizationStatus,
        owner: r.operator_details.owner,
        notificationInfo: (r.operator_details.notification_info) ? {
          AppTypeId: AppType.LaundryApp,
          token: r.operator_details.notification_info.token,
          turnOffNotifications: r.operator_details.notification_info.turn_off_notifications
        } : undefined,
        user: {
          id: r.user_id,
          firebaseId: r.user.firebase_id,
          language: r.user.language_id as Language
        }
      }
    })
    let categories: OrderCategory[] = o.categories.map((c) => {
      return {
        orderCategoryId: c.id,
        categoryId: c.category_id,
        orderId: o.id,
        weightInKilo: c.weight_in_kilo,
        costByKilo: c.category.cost_by_kilo
      }
    })
    return {
      orderId: o.id,
      spDetailsId: o.store.details_id,
      customerId: o.customer_id,
      storeId: o.store_id,
      paymentType: o.payment_type as PaymentType,
      customerLocation: {
        lat: o.customer_location_gps.coordinates[1],
        lng: o.customer_location_gps.coordinates[0],
        address: o.customer_address
      },
      orderTime: o.order_time,
      status: o.status as LaundryOrderStatus,
      deliveryType: o.delivery_type as DeliveryType,
      customerAppType: o.customer_app_type as CustomerAppType,
      deliveryCost: o.delivery_cost,
      categories,
      laundryStore: (o.store.details) ? {
        id: o.store.id,
        serviceProviderDetailsId: o.store.details_id,
        name: o.store.details.name,
        image: o.store.details.image,
        location: o.store.details.location.gps as Location,
        operators: laundryOperators,
        language: JSON.parse(o.store.details.language),
        deliveryDetails: {
          minimumCost:o.store.delivery_details.minimum_cost,
          costPerKm: o.store.delivery_details.cost_per_km,
          radius: o.store.delivery_details.radius,
          deliveryAvailable: o.store.delivery_details.delivery_available,
          customerPickup: o.store.delivery_details.customer_pickup,
          selfDelivery: o.store.delivery_details.self_delivery,
        }
      }: undefined
    }
  })
}

