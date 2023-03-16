import { getHasura } from "../../../utilities/hasura";

export async function insertUsers(data: any) {
    let chain = getHasura();
    let queryResponse = await chain.query({
        user: [{}, {
            firebase_id: true,
        }]
    })
    let insertedUsers: Record<string, boolean> = {};
    queryResponse.user.forEach((r) => {
        // if(rdetails?.firebase_id == null)
            // return;
        // console.log(typeof r.details.firebase_id)
        insertedUsers[r.firebase_id] = true;
    })
    console.log(data.length)
    data = data.filter((r: any) => insertedUsers[r.firebase_id] == undefined)
    console.log(data.length)

    let response = await chain.mutation({
        insert_user: [{
            objects: data
            // [{
            //     firebase_id: ,//non
            //     name: ,
            //     image: ,
            //     language_id: ,//non
            //     deleted: ,
            //     email: ,
            //     phone: ,
            // }]
        }, {
            returning: {
                id: true,
            }
        }]
    });
    console.log("response: ", response);

}