import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus } from "../../../models/Generic/Generic";

export async function insertRestaurantOperators(data: any) {
    let chain = getHasura();
    // let queryResponse = await chain.query({
    //     restaurant_operator: [{}, {
    //         user: {
    //             firebase_id: true
    //         }
    //     }]
    // })
    // let insertedOps: Record<string, boolean> = {};
    // queryResponse.restaurant_operator.forEach((r) => {
    //     // if(rdetails?.firebase_id == null)
    //         // return;
    //     // console.log(typeof r.details.firebase_id)
    //     insertedOps[r.user.firebase_id] = true;
    // })
    console.log(data.length)
    // data = data.filter((r: any) => insertedOps[r.userFirebaseId] == undefined)
    // console.log(data)

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
            restaurant_restaurant: [{
                where: {
                    details: {
                        firebase_id: {
                            _eq: o.restaurantFirebaseId
                        }
                    }
                }
            }, {
                id: true, 
            }]
        })
        // if(!(opResponse.user[0].id))
            // console.log("user: ", o.userFirebaseId)
            // console.log(opResponse.user[0].id)
            // console.log("restaurant: ", o.restaurantFirebaseId)
            // console.log(opResponse.restaurant_restaurant[0])
            // console.log("\n")
        // if(!(opResponse.restaurant[0]))
        //     console.log("restaurant: ", o.restaurantFirebaseId)
        return {
            user_id: opResponse.user[0].id,
            restaurant_id: (opResponse.restaurant_restaurant[0]) ? opResponse.restaurant_restaurant[0].id : undefined,
            operator_details: {
                data: {
                    user_id: opResponse.user[0].id,
                    status: AuthorizationStatus.Authorized,
                    owner: true,
                    app_version: o.appVersion,
                    app_type_id: AppType.Restaurant,
                    // notification_info: (o.notificationToken) ? {
                    //     user_id: o.user_id,
                    //     app_type_id: AppType.RestaurantApp,
                    //     token: o.notification_token
                    // }: undefined
                }
            },
            notification_token: o.notificationToken
        }
    })
    operators = await Promise.all(operators)
    // console.log(operators)
    operators = operators.filter((o: any) => o.restaurant_id);

    let operatorsNotif = operators.map((o: any) => {
        return {
            user_id: o.user_id,
            app_type_id: AppType.Restaurant,
            token: o.notification_token
        }
    })
    operatorsNotif = operatorsNotif.filter((o: any) => o.token);

    operators = operators.map((o: any) => {
        return {
            user_id: o.user_id,
            restaurant_id: o.restaurant_id,
            operator_details: o.operator_details
        }
    });
    console.log(operators)
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
        // insert_notification_info: [{
        //     objects: operatorsNotif

        // }, {
        //     returning: {
        //         id: true,
        //     }
        // }],
    })
    console.log("response: ", response1)
}