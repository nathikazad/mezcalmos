import { getHasura } from "../../../../utilities/hasura";

export async function insertDeliveryDrivers(data: any) {
    let chain = getHasura();

    let drivers = data.map(async (d: any) => {
        let driverResponse = await chain.query({
            user: [{
                where: {
                    firebase_id: {
                        _eq: d.userFirebaseId
                    }
                }
            }, {
                id: true,
            }]
        })
        return {
            user_id: driverResponse.user[0].id,
            status: d.status,
            app_version: d.appVersion,
            current_location: d.currentLocation,
            online: d.online,
            notification_token: d.notificationToken
        }
    })
    drivers = await Promise.all(drivers)

    let driversNotif = drivers.map((d: any) => {
        return {
            user_id: d.user_id,
            app_type_id: "delivery",
            token: d.notification_token
        }
    })
    driversNotif = driversNotif.filter((o: any) => o.token);

    drivers = drivers.map((d: any) => {
        return {
            user_id: d.user_id,
            delivery_company_type: "delivery_company",
            delivery_company_id: 1,
            status: d.status,
            app_version: d.appVersion,
            current_location: d.currentLocation,
            online: d.online,
        }
    });
    let mutationResponse = await chain.mutation({
        insert_delivery_driver: [{
            objects: drivers
            // [{
            //     user_id: ,
            //     delivery_company_type: "delivery_company",
            //     delivery_company_id: 1,
            //     status: ,
            //     app_version: ,//null
            //     current_location: ,//null
            //     online: ,//null
            //     notification_info_id: ,//null
            // }]
        }, {
            returning: {
                id: true,
            }
        }],
        insert_notification_info: [{
            objects: driversNotif
        }, {
            returning: {
                id: true,
            }
        }],
    })
    console.log("response: ", mutationResponse);
}