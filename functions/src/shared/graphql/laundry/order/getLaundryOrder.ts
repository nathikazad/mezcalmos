import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder } from "../../../models/Generic/Delivery";
import { CustomerAppType, Location } from "../../../models/Generic/Generic";
import { DeliveryType, PaymentType } from "../../../models/Generic/Order";
import { LaundryOrder, LaundryOrderStatus, OrderCategory } from "../../../models/Services/Laundry/LaundryOrder";

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
      totalCost: response.laundry_order_by_pk.total_cost
    }
    if(response.laundry_order_by_pk.from_customer_delivery_id != undefined)
        laundryOrder.fromCustomerDeliveryId = response.laundry_order_by_pk.from_customer_delivery_id

    if(response.laundry_order_by_pk.to_customer_delivery_id != undefined)
        laundryOrder.toCustomerDeliveryId = response.laundry_order_by_pk.to_customer_delivery_id

    return laundryOrder;
}

export async function getLaundryOrderFromDelivery(deliveryOrder: DeliveryOrder): Promise<LaundryOrder> {
  let chain = getHasura();

  if(deliveryOrder.deliveryId == null) {
    throw new HttpsError(
      "internal",
      "delivery id not provided"
    );
  }

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