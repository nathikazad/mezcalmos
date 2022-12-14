import { getHasura } from "../../../../utilities/hasura";

export async function insertRestaurantOperators(data: any) {
    let chain = getHasura();

    let operators = data.map(async (o: any) => {
        let opResponse = await chain.query({
            user: [{
                where: {
                    firebase_id: {
                        _eq: o.userFirebaseId
                    }
                }
            }, {
                id: true,
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
        })
        // if(!(opResponse.user[0].id))
            // console.log("user: ", o.userFirebaseId)
            // console.log(opResponse.user[0].id)
            console.log("restaurant: ", o.restaurantFirebaseId)
            console.log(opResponse.restaurant[0])
            console.log("\n")
        // if(!(opResponse.restaurant[0]))
        //     console.log("restaurant: ", o.restaurantFirebaseId)
        return {
            user_id: opResponse.user[0].id,
            restaurant_id: (opResponse.restaurant[0]) ? opResponse.restaurant[0].id : undefined,
            status: "authorized",
            owner: true,
            app_version: o.appVersion,
            notification_token: o.notificationToken
        }
    })
    operators = await Promise.all(operators)
    // console.log(operators)
    operators = operators.filter((o: any) => o.restaurant_id);

    let operatorsNotif = operators.map((o: any) => {
        return {
            user_id: o.user_id,
            app_type_id: "restaurant",
            token: o.notification_token
        }
    })
    operatorsNotif = operatorsNotif.filter((o: any) => o.token);

    operators = operators.map((o: any) => {
        return {
            user_id: o.user_id,
            restaurant_id: o.restaurant_id,
            status: "authorized",
            owner: true,
            app_version: o.appVersion,
        }
    });

    let response1 = await chain.mutation({
        insert_restaurant_operator: [{
            objects: operators
            // [{
            //     user_id: 23,
            //     restaurant_id: 1,
            //     status: "authorized",
            //     owner: true,
            //     app_version: "1",

            // }],
        }, {
            returning: {
                id: true,
            }
        }],
        insert_notification_info: [{
            objects: operatorsNotif

        }, {
            returning: {
                id: true,
            }
        }],
    })
    console.log("response: ", response1)
}