import { getHasura } from "../../../utilities/hasura";
import { Language, MezError } from "../../models/Generic/Generic";
import { UserInfo } from "../../models/Generic/User";

export async function getUser(userId: number): Promise<UserInfo> {
    let chain = getHasura();
  
    let response = await chain.query({
        user_by_pk: [{
            id: userId
        }, {
            name: true,
            firebase_id: true,
            language_id: true,
            image: true,
            deleted: true,
            email: true,
            phone: true,
        }]
    });
    if(response.user_by_pk == null) {
        throw new MezError("userNotFound");
    }
    let user: UserInfo = {
        id: userId,
        name: response.user_by_pk.name,
        image: response.user_by_pk.image,
        language: response.user_by_pk.language_id as Language,
        firebaseId: response.user_by_pk.firebase_id,
        email: response.user_by_pk.email,
        phoneNumber: response.user_by_pk.phone
    }
    return user;
}


export async function getUserFromFbId(fbId: string): Promise<UserInfo | undefined> {
    let chain = getHasura();
  
    let response = await chain.query({
        user: [{
            where: {
                    firebase_id: {
                        _eq: fbId
                    }
            }
        }, {
                id: true,
                name: true,
                firebase_id: true,
                language_id: true,
                image: true,
                deleted: true,
                email: true,
                phone: true,
        }]
    });
    if(response.user.length == 0) {
        return undefined;
    }
    let user: UserInfo = {
        id: response.user[0].id,
        name: response.user[0].name,
        image: response.user[0].image,
        language: response.user[0].language_id as Language,
        firebaseId: response.user[0].firebase_id,
        email: response.user[0].email,
        phoneNumber: response.user[0].phone
    }
    return user;
}