import { getHasura } from "../../../utilities/hasura";

export async function insertUsers(data: any) {
    let chain = getHasura();

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