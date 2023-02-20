import { getHasura } from "../../../../utilities/hasura";
import { LaundryOrderStatus } from "../../../models/Services/Laundry/LaundryOrder";


export async function insertLaundryOrders(data: any, response: any) {

    let chain = getHasura();

    let laundryFbIdToObject: Record<string, any> = {
        "fYlin8EkPo5v6VnmG1e4QuiJ2ti6": {
            hsId: 7,
            categoryHsId: 13,
            costByKilo: 16
        },
        "gtRe3GvCA92merPilaKi6B1hyNE3": {
            hsId: 8,
            categoryHsId: 16,
            costByKilo: 20
        },
        "nmG1e4QuiJ2ti6fYlin8EkPo5v6V": {
            hsId: 9,
            categoryHsId: 18,
            costByKilo: 15
        },
        "sZ2ridoRimaN8iL62ticaP5RxmA7": {
            hsId: 10,
            categoryHsId: 24,
            costByKilo: 18
        }
    };
    let userFbIdToHsId: Record<string, number> = {};
    for(let user of response.user) {
        userFbIdToHsId[user.firebase_id] = user.id
    }
    let customerFbIdToHsId: Record<string, number> = {};
    for(let customer of response.customer_customer) {
        customerFbIdToHsId[customer.user.firebase_id] = customer.user_id
    }
    let orders: any[] = [];

    for(let o of data) {
        if(laundryFbIdToObject[o.storeFirebaseId] == null) 
            continue;

        if(customerFbIdToHsId[o.customerFirebaseId] == null) {
            if(userFbIdToHsId[o.customerFirebaseId] == null)
                continue;
            
            customerFbIdToHsId[o.customerFirebaseId] = userFbIdToHsId[o.customerFirebaseId]
            // console.log(customerFbIdToHsId[o.customerFirebaseId])
            orders.push({
                customer: {
                    data: {
                        user_id: customerFbIdToHsId[o.customerFirebaseId]
                    }
                },
                store_id: laundryFbIdToObject[o.storeFirebaseId].hsId,
                status: o.status,
                order_time: o.orderTime,
                delivery_cost: o.deliveryCost,
                firebase_id: o.firebaseId,
                categories: {
                    data: [{
                        category_id: laundryFbIdToObject[o.storeFirebaseId].categoryHsId,
                        weight_in_kilo: o.itemsCost / laundryFbIdToObject[o.storeFirebaseId].costByKilo,
                    }]
                }
            })
        } else {
            orders.push({
                customer_id: customerFbIdToHsId[o.customerFirebaseId],
                store_id: laundryFbIdToObject[o.storeFirebaseId].hsId,
                status: o.status ?? LaundryOrderStatus.Delivered,
                order_time: o.orderTime,
                delivery_cost: o.deliveryCost,
                firebase_id: o.firebaseId,
                categories: {
                    data: [{
                        category_id: laundryFbIdToObject[o.storeFirebaseId].categoryHsId,
                        weight_in_kilo: o.itemsCost / laundryFbIdToObject[o.storeFirebaseId].costByKilo,
                    }]
                }
            })
        }
    }
    console.log(orders.length)
    let response1 = await chain.mutation({
        insert_laundry_order: [{
            objects: orders
            // [{
            //     customer_id: ,
            //     store_id: ,
            //     status: ,
            //     order_time: ,
            //     delivery_cost: ,
            //     firebase_id: ,
            //     categories: {
            //         data: [{
            //             category_id: ,
            //             weight_in_kilo: ,
            //         }]
            //     }
            // }]
        }, {
            returning: {
                id: true,
            }
        }]
    })
    console.log("response: ", response1)
}