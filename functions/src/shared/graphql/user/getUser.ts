import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { Language } from "../../models/Generic/Generic";
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
        throw new HttpsError(
            "internal",
            "User not found"
        );
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