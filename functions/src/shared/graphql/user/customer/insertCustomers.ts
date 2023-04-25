import { getHasura } from "../../../../utilities/hasura";


export async function insertCustomers(data: any) {
    let chain = getHasura();
    // console.log("Hi")
    let queryResponse = await chain.query({
        customer_customer: [{}, {
            user: {
                firebase_id: true
            }
        }]
    })
    let insertedCustomers: Record<string, boolean> = {};
    queryResponse.customer_customer.forEach((r:any) => {
        // if(rdetails?.firebase_id == null)
            // return;
        // console.log(typeof r.details.firebase_id)
        insertedCustomers[r.user.firebase_id] = true;
    })
    console.log(data.length)
    data = data.filter((r: any) => insertedCustomers[r.userFirebaseId] == undefined)
    console.log(data.length)

    let customers = data.map(async (c: any) => {
        
        let response = await chain.query({
            user: [{
                where: {
                    firebase_id: {
                        _eq: c.userFirebaseId
                    }
                }
            }, {
                id: true
            }],
            
        })
        let stripeSPIdsArray = [];
        if(c.stripeSPIds) {
            for(let SPFirebaseId in c.stripeSPIds) {
                let stripeSPId = c.stripeSPIds[SPFirebaseId];
                if(!stripeSPId)
                    continue;

                let response1 = await chain.query({
                    restaurant_restaurant: [{
                        where: {
                            details: {
                                firebase_id: {
                                    _eq: SPFirebaseId
                                }
                            }
                        }
                    }, {
                        id: true,
                        details_id: true
                    }]
                });
                if(response1.restaurant_restaurant.length == 0)
                    continue;

                stripeSPIdsArray.push({
                    // customer_id: (response.user[0]) ? response.user[0].id : undefined,
                    sp_id: response1.restaurant_restaurant[0].details_id,
                    stripe_id: stripeSPId,
                })
            }
        }

        return {
            user_id: (response.user[0]) ? response.user[0].id : undefined,
            stripe_id: c.stripeId,
            // stripe_info: JSON.stringify(c.stripeInfo)
            stripe_sp_ids: {
                data: stripeSPIdsArray
            },
            stripe_cards: (c.cards.length) ? {
                data: c.cards.map((card: any) => {
                    return {
                        // customer_id: (response.user[0]) ? response.user[0].id : undefined,
                        brand: card.brand,
                        card_id: card.id,
                        exp_month: card.expMonth,
                        exp_year: card.expYear,
                        last_4: card.last4,
                    }
                })
            }: undefined
        }
    })
    customers = await Promise.all(customers)
    customers = customers.filter((c: any) => c.user_id)

    let response = await chain.mutation({
        insert_customer_customer: [{
            objects: customers
            // [{
            //     user_id: ,
            //     stripe_id: ,
            //     stripe_sp_ids: {
            //         data: [{
            //             customer_id: ,
            //             sp_id: ,
            //             stripe_id: ,
            //         }]
            //     },
            //     stripe_cards: {
            //         data: [{
            //             customer_id: ,
            //             brand: ,
            //             card_id: ,
            //             exp_month: ,
            //             exp_year: ,
            //             last_4: ,
            //             sp_card_ids: ,
            //         }]
            //     }
            // }]
        }, {
            returning: {
                user_id: true
            }
        }]
    })
    console.log("response: ", response)
}