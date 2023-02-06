import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
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
                to_location_address: true,
                estimated_food_ready_time: true,
                customer_app_type: true,
                delivery_cost: true,
                stripe_info: [{}, true],
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
    }
    if(response.laundry_order_by_pk.from_customer_delivery_id != undefined)
        laundryOrder.fromCustomerDeliveryId = response.laundry_order_by_pk.from_customer_delivery_id

    if(response.laundry_order_by_pk.to_customer_delivery_id != undefined)
        laundryOrder.toCustomerDeliveryId = response.laundry_order_by_pk.to_customer_delivery_id

    return laundryOrder;
}