import { getHasura } from "../../../../utilities/hasura";

export async function insertRestaurantOrders(data: any) {
    let chain = getHasura();

    let orders = data.map(async (o: any) => {
        let response = await chain.query({
            customer: [{
                where: {
                    user: {
                        firebase_id: {
                            _eq: o.customerFirebaseId
                        }
                    }
                }
            }, {
                user_id: true
            }],
            restaurant: [{
                where: {
                    firebase_id: {
                        _eq: o.restaurantFirebaseId
                    }
                }
            }, {
                id: true,
            }]
        });
        if(!(response.restaurant[0]))
            return {
                restaurant_id: undefined
            }
        let items = o.items.map(async (i: any) => {
            let response1 = await chain.query({
                restaurant_item: [{
                    where: {
                        restaurant_id: {
                            _eq: response.restaurant[0].id
                        },
                        name: {
                            translations: {
                                value: {
                                    _eq: i.itemName
                                }
                            }
                        }
                    }
                }, {
                    id: true,
                }]
            })
            if(!(response1.restaurant_item[0]))
                return {
                    restaurant_item_id: undefined
                }
            return {
                restaurant_item_id: response1.restaurant_item[0].id,
                in_json: i.inJSON,
                notes: i.notes,
                unavailable: i.unavailable,
                quantity: i.quantity,
                cost_per_one: i.costPerOne,
            }
        })
        items = await Promise.all(items)
        items = items.filter((i: any) => i.restaurant_item_id)
        if(response.customer[0]) {
            return {
                customer_id: response.customer[0].user_id,
                restaurant_id:  response.restaurant[0].id,
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
                    data: items
                },
                review: (o.review) ? {
                    data: {
                        rating: o.review.rating,
                        note: o.review.comment,
                        from_entity_type: "customer",
                        from_entity_id: response.customer[0].user_id,
                        to_entity_type: "restaurant",
                        to_entity_id: response.restaurant[0].id,
                        created_at: o.review.createdAt
                    }
                }: undefined
            }
        } else {
            let response1 = await chain.query({
                user: [{
                    where: {
                        firebase_id: {
                            _eq: o.customerFirebaseId
                        }
                    }
                }, {
                    id: true
                }]
            })
            if(!(response1.user[0])) 
                return {
                    restaurant_id: undefined
                }
            return {
                customer: {
                    data: {
                        user_id: response1.user[0].id
                    }
                },
                restaurant_id: response.restaurant[0].id,
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
                    data: items
                },
                review: (o.review) ? {
                    data: {
                        rating: o.review.rating,
                        note: o.review.comment,
                        from_entity_type: "customer",
                        from_entity_id: response1.user[0].id,
                        to_entity_type: "restaurant",
                        to_entity_id: response.restaurant[0].id,
                        created_at: o.review.createdAt
                    }
                }: undefined
            }
        }
        
    })
    orders = await Promise.all(orders)
    orders = orders.filter((o: any) => o.restaurant_id)

    let response = await chain.mutation({
        insert_restaurant_order: [{
            objects: orders
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
    console.log("response: ", response)
}