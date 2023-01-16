import { getHasura } from "../../../../utilities/hasura";


export async function insertCustomers(data: any) {
    let chain = getHasura();
    // console.log("Hi")

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
            }]
        })
        return {
            user_id: (response.user[0]) ? response.user[0].id : undefined,
            stripe_info: JSON.stringify(c.stripeInfo)
        }
    })
    customers = await Promise.all(customers)
    customers = customers.filter((c: any) => c.user_id)

    let response = await chain.mutation({
        insert_customer_customer: [{
            objects: customers
            // [{
            //     user_id: ,
            //     stripe_info: ,
            // }]
        }, {
            returning: {
                user_id: true
            }
        }]
    })
    console.log("response: ", response)
}