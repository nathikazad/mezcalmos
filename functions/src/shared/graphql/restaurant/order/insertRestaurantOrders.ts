import { getHasura } from "../../../../utilities/hasura";
// import * as fs from 'fs';
import { DeliveryServiceProviderType } from "../../../models/Generic/Delivery";

interface Restaurant {
    items: Record<string, number>; //en name to hasura id
    hsId: number,
    gps: any,
    address: string
}
export async function insertRestaurantOrders(data: any, response: any) {
    let chain = getHasura();

    // let queryResponse = await chain.query({
    //     restaurant_order: [{}, {
    //         firebase_id: true
    //     }]
    // })
    // let insertedOrders: Record<string, boolean> = {};
    // queryResponse.restaurant_order.forEach((r:any) => {
    //     if(r.firebase_id == null)
    //         return;
    //     // console.log(typeof r.details.firebase_id)
    //     insertedOrders[r.firebase_id] = true;
    // })
    // console.log(data.length)
    // data = data.filter((r: any) => insertedOrders[r.firebaseId] == undefined)
    // console.log(data.length)
    // let restaurantFbIds: number[] = [];
    // data.forEach((o: any) => {
    //     restaurantFbIds.push(o.restaurantFirebaseId)
    // })
    // let response = await chain.query({
    //     restaurant_restaurant: [{}, {
    //         id: true,
    //         firebase_id: true,
    //         items: [{}, {
    //             id: true,
    //             name: {
    //                 translations: [{
    //                     where: {
    //                         language_id: {
    //                             _eq: Language.EN
    //                         }
    //                     }
    //                 }, {
    //                     value: true
    //                 }]
    //             }
    //         }]
    //     }],
    //     user: [{}, {
    //         id: true,
    //         firebase_id: true,
    //     }],
    //     customer_customer: [{}, {
    //         user_id: true,
    //         user: {
    //             firebase_id: true
    //         }
    //     }]
    // });
    let restaurantFbIdToObject: Record<string, Restaurant> = {};

    for(let restaurant of response.restaurant_restaurant) {
        let items: Record<string, number> = {};
        for(let item of restaurant.items) {
            if(!item.name.translations[0])
                continue;
            items[item.name.translations[0].value] = item.id;
        }
        restaurantFbIdToObject[restaurant.details.firebase_id!] = {
            hsId: restaurant.id,
            items,
            gps: restaurant.details.location.gps,
            address: restaurant.details.location.address
        }
    }
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

        if(restaurantFbIdToObject[o.restaurantFirebaseId] == null) 
            continue;

        let orderItems: any[] = [];
        for(let i of o.items) {
            let itemHsId = restaurantFbIdToObject[o.restaurantFirebaseId].items[i.itemName]
            if(restaurantFbIdToObject[o.restaurantFirebaseId].items[i.itemName] == null) {
                if(i.inJSON.name == undefined || i.inJSON.name.en == undefined || i.inJSON.name.es == undefined)
                    continue;
                let a = await chain.mutation({
                    insert_restaurant_item_one: [{
                        object: {
                            name: {
                                data: {
                                    service_provider_id: restaurantFbIdToObject[o.restaurantFirebaseId].hsId,
                                    service_provider_type: "restaurant",
                                    translations: {
                                        data: [{
                                            language_id: "en",
                                            value: i.inJSON.name.en
                                        }, {
                                            language_id: "es",
                                            value: i.inJSON.name.es
                                        }]
                                    }
                                }
                            }
                        }
                    }, {
                        id: true
                    }]
                })
                console.log("item inserted: ", i.itemName)

                itemHsId = a.insert_restaurant_item_one?.id ?? itemHsId
            }

            orderItems.push({
                restaurant_item_id: itemHsId,
                in_json: i.inJSON,
                notes: i.notes,
                unavailable: i.unavailable,
                quantity: i.quantity,
                cost_per_one: i.costPerOne,
            })
        }
        if(customerFbIdToHsId[o.customerFirebaseId] == null) {
            if(userFbIdToHsId[o.customerFirebaseId] == null)
                continue;
            
            customerFbIdToHsId[o.customerFirebaseId] = userFbIdToHsId[o.customerFirebaseId]
            await chain.mutation({
                insert_customer_customer_one: [{
                    object: {
                        user_id: customerFbIdToHsId[o.customerFirebaseId],
                    }
                }, {
                    user_id: true
                }]
            })
            // console.log(customerFbIdToHsId[o.customerFirebaseId])
            // orders.push({
            //     customer: {
            //         data: {
            //             user_id: customerFbIdToHsId[o.customerFirebaseId]
            //         }
            //     },
            //     restaurant_id: restaurantFbIdToObject[o.restaurantFirebaseId].hsId,
            //     payment_type: o.paymentType,
            //     to_location_gps: o.toLocationGps,
            //     to_location_address: o.toLocationAddress,
            //     estimated_food_ready_time: o.estimatedFoodReadyTime,
            //     stripe_payment_id: o.stripePaymentId,
            //     status: o.status,
            //     order_time: o.orderTime,
            //     firebase_id: o.firebaseId,
            //     notes: o.notes,
            //     delivery_cost: o.deliveryCost,
            //     refund_amount:o.refundAmount,
            //     items: {
            //         data: orderItems
            //     },
            //     delivery: {
            //         data: {
            //             pickup_gps: JSON.stringify(restaurantFbIdToObject[o.restaurantFirebaseId].gps),
            //             pickup_address: restaurantFbIdToObject[o.restaurantFirebaseId].address,
            //             dropoff_address: o.toLocationAddress ?? "",
            //             dropoff_gps: o.toLocationGps ?? JSON.stringify({
            //                 "type": "point",
            //                 "coordinates": [0, 0]
            //             }),
            //             chat_with_customer_id: 1,
            //             payment_type: o.paymentType,
            //             status: o.status,
            //             customer_id: customerFbIdToHsId[o.customerFirebaseId],
            //             service_provider_id: 1,
            //             service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
            //             delivery_cost: o.deliveryCost,
            //             package_cost: o.itemsCost,
            //         }
            //     },
            //     review: (o.review) ? {
            //         data: {
            //             rating: o.review.rating,
            //             note: o.review.comment,
            //             from_entity_type: "customer",
            //             from_entity_id: customerFbIdToHsId[o.customerFirebaseId],
            //             to_entity_type: "restaurant",
            //             to_entity_id: response.restaurant_restaurant[0].id,
            //             created_at: o.review.createdAt
            //         }
            //     }: undefined
            // })
        } //else {
            orders.push({
                customer_id: customerFbIdToHsId[o.customerFirebaseId],
                restaurant_id: restaurantFbIdToObject[o.restaurantFirebaseId].hsId,
                payment_type: o.paymentType,
                to_location_gps: o.toLocationGps,
                to_location_address: o.toLocationAddress,
                estimated_food_ready_time: o.estimatedFoodReadyTime,
                stripe_payment_id: o.stripePaymentId,
                status: o.status,
                order_time: o.orderTime,
                firebase_id: o.firebaseId,
                notes: o.notes,
                delivery_cost: o.deliveryCost,
                refund_amount:o.refundAmount,
                items: {
                    data: orderItems
                },
                delivery: {
                    data: {
                        pickup_gps: JSON.stringify(restaurantFbIdToObject[o.restaurantFirebaseId].gps),
                        pickup_address: restaurantFbIdToObject[o.restaurantFirebaseId].address,
                        dropoff_address: o.toLocationAddress ?? "",
                        dropoff_gps: o.toLocationGps ?? JSON.stringify({
                            "type": "point",
                            "coordinates": [0, 0]
                        }),
                        chat_with_customer_id: 1,
                        payment_type: o.paymentType,
                        status: o.status,
                        customer_id: customerFbIdToHsId[o.customerFirebaseId],
                        service_provider_id: 1,
                        service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
                        delivery_cost: o.deliveryCost,
                        package_cost: o.itemsCost,
                    }
                },
                review: (o.review) ? {
                    data: {
                        rating: o.review.rating,
                        note: o.review.comment,
                        from_entity_type: "customer",
                        from_entity_id: customerFbIdToHsId[o.customerFirebaseId],
                        to_entity_type: "restaurant",
                        to_entity_id: response.restaurant_restaurant[0].id,
                        created_at: o.review.createdAt
                    }
                }: undefined
            })
        //}

    }
    // await chain.mutation({
    //     insert_restaurant_order: [{
    //         objects: [{
    //             delivery: {
    //                 data: {
    //                     pickup_gps: ,
    //                     pickup_address: ,
    //                     dropoff_address: ,
    //                     dropoff_gps: ,
    //                     chat_with_customer_id: 0,
    //                     payment_type: o.paymentType,
    //                     status: o.status,
    //                     customer_id: ,
    //                     service_provider_id: 1,
    //                     service_provider_type: "delivery_company",
    //                     delivery_cost: o.shippingCost,
    //                     package_cost: o.,

    //                 }
    //             }
    //         }]
    //     }, {}]
    // })
    // let orders = data.map(async (o: any) => {
        // let response = await chain.query({
        //     restaurant_restaurant: [{
        //         where: {
        //             firebase_id: {
        //                 _eq: o.restaurantFirebaseId
        //             }
        //         }
        //     }, {
        //         id: true,
        //     }]
        // });
        // if(!(response.restaurant_restaurant[0]))
        //     return {
        //         restaurant_id: undefined
        //     }
        // let items = o.items.map(async (i: any) => {
        //     let response1 = await chain.query({
        //         restaurant_item: [{
        //             where: {
        //                 restaurant_id: {
        //                     _eq: response.restaurant_restaurant[0].id
        //                 },
        //                 name: {
        //                     translations: {
        //                         value: {
        //                             _eq: i.itemName
        //                         }
        //                     }
        //                 }
        //             }
        //         }, {
        //             id: true,
        //         }]
        //     })
        //     if(!(response1.restaurant_item[0]))
        //         return {
        //             restaurant_item_id: undefined
        //         }
        //     return {
        //         restaurant_item_id: response1.restaurant_item[0].id,
        //         in_json: i.inJSON,
        //         notes: i.notes,
        //         unavailable: i.unavailable,
        //         quantity: i.quantity,
        //         cost_per_one: i.costPerOne,
        //     }
        // })
        // items = await Promise.all(items)
        // items = items.filter((i: any) => i.restaurant_item_id)

    //     if(customerFbIdToHsId[o.customerFirebaseId] == null) {
    //         // console.log("Hi")
    //         let response1 = await chain.query({
    //             user: [{
    //                 where: {
    //                     firebase_id: {
    //                         _eq: o.customerFirebaseId
    //                     }
    //                 }
    //             }, {
    //                 id: true
    //             }]
    //         })
    //         if(response1.user[0] == undefined)
    //             return {
    //                 restaurant_id: undefined
    //             }
    //         customerFbIdToHsId[o.customerFirebaseId] = response1.user[0].id
    //         console.log(customerFbIdToHsId[o.customerFirebaseId])

    //         return {
    //             customer: {
    //                 data: {
    //                     user_id: customerFbIdToHsId[o.customerFirebaseId]
    //                 }
    //             },
    //             restaurant_id: response.restaurant_restaurant[0].id,
    //             payment_type: o.paymentType,
    //             to_location_gps: o.toLocationGps,
    //             to_location_address: o.toLocationAddress,
    //             estimated_food_ready_time: o.estimatedFoodReadyTime,
    //             stripe_payment_id: o.stripePaymentId,
    //             status: o.status,
    //             order_time: o.orderTime,
    //             firebase_id: o.firebaseId,
    //             notes: o.notes,
    //             delivery_cost: o.deliveryCost,
    //             refund_amount:o.refundAmount,
    //             items: {
    //                 data: items
    //             },
    //             review: (o.review) ? {
    //                 data: {
    //                     rating: o.review.rating,
    //                     note: o.review.comment,
    //                     from_entity_type: "customer",
    //                     from_entity_id: customerFbIdToHsId[o.customerFirebaseId],
    //                     to_entity_type: "restaurant",
    //                     to_entity_id: response.restaurant_restaurant[0].id,
    //                     created_at: o.review.createdAt
    //                 }
    //             }: undefined
    //         }
    //     }
    //     console.log("Hi1")

    //     return {
    //         customer_id: customerFbIdToHsId[o.customerFirebaseId],
    //         restaurant_id: response.restaurant_restaurant[0].id,
    //         payment_type: o.paymentType,
    //         to_location_gps: o.toLocationGps,
    //         to_location_address: o.toLocationAddress,
    //         estimated_food_ready_time: o.estimatedFoodReadyTime,
    //         stripe_payment_id: o.stripePaymentId,
    //         status: o.status,
    //         order_time: o.orderTime,
    //         firebase_id: o.firebaseId,
    //         notes: o.notes,
    //         delivery_cost: o.deliveryCost,
    //         refund_amount:o.refundAmount,
    //         items: {
    //             data: items
    //         },
    //         review: (o.review) ? {
    //             data: {
    //                 rating: o.review.rating,
    //                 note: o.review.comment,
    //                 from_entity_type: "customer",
    //                 from_entity_id: customerFbIdToHsId[o.customerFirebaseId],
    //                 to_entity_type: "restaurant",
    //                 to_entity_id: response.restaurant_restaurant[0].id,
    //                 created_at: o.review.createdAt
    //             }
    //         }: undefined
    //     }
    // })
    // orders = await Promise.all(orders)
    // orders = orders.filter((o: any) => o.restaurant_id)
    console.log(orders.length);
    // fs.writeFileSync("./restaurant-orders.json", JSON.stringify(orders));

    // let response1 = 

    await chain.mutation({
        insert_restaurant_order: [{
            objects: orders//.slice(0, 200)
            // [{
            //     customer_id: ,
            //     customer: {
            //         data: {
            //             user_id:
            //         }
            //     },
            //     restaurant_id: ,
            //     payment_type: ,//null
            //     to_location_gps: ,//null
            //     to_location_address: ,//null
            //     estimated_food_ready_time: ,//null
            //     stripe_payment_id: ,//null
            //     status: ,
            //     // delivery: {
            //     //     data: {
            //     //         pickup_gps: , 
            //     //         pickup_address: ,
            //     //         dropoff_address: ,
            //     //         dropoff_gps: ,
            //     //         delivery_driver_type: "delivery_driver",
            //     //         delivery_driver: {
            //     //             data: {
            //     //                 user_id: ,
            //     //                 delivery_company_type: "delivery_company",
            //     //                 delivery_company_id: 1,
            //     //                 status: "authorized",

            //     //             }
            //     //         },
            //     //         payment_type: ,
            //     //         stripe_payment_id: ,
            //     //         estimated_package_ready_time: ,
            //     //         estimated_arrival_at_pickup_time: ,
            //     //         estimated_arrival_at_dropoff_time: ,
            //     //         status: ,
            //     //         customer_id: ,
            //     //         service_provider_id: 1,
            //     //         service_provider_type: "delivery_company",
            //     //         trip_polyline: ,
            //     //         delivery_cost: ,
            //     //         package_cost: ,
            //     //         trip_distance: ,
            //     //         trip_duration: ,
            //     //         order_time: ,
            //     //     }
            //     // },//null
            //     review: {
            //         data: {
            //             rating: ,
            //             note: ,// null
            //             from_entity_type: "customer",
            //             from_entity_id: ,
            //             to_entity_type: "restaurant",
            //             to_entity_id: ,
            //             created_at:
            //         }
            //     },//null
            //     order_time: ,//null
            //     firebase_id: ,//null
            //     notes: ,//null
            //     delivery_cost: ,//null
            //     refund_amount: ,//null
            //     items: {
            //         data: [{
            //             restaurant_item_id: ,
            //             in_json: ,
            //             notes: ,//null
            //             unavailable: ,//null
            //             quantity: ,//null
            //             cost_per_one: ,//null
            //         }]
            //     }
            // }]
        }, {
            returning: {
                id: true,
            }
        }]
    })
    await chain.mutation({
        insert_restaurant_order: [{
            objects: orders.slice(200)
        }, {
            returning: {
                id: true,
            }
        }]
    })
    // console.log("response: ", response1)
}