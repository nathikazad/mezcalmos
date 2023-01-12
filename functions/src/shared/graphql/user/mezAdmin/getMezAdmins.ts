import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { MezAdmin } from "../../../models/Generic/User";

export async function getMezAdmins(): Promise<MezAdmin[]> {
    let chain = getHasura();
  
    let response = await chain.query({
        mez_admin: [{}, {
            user_id: true,
            version: true,
            notification_token: true,
            user: {
                firebase_id: true,
                language_id: true,
            }
        }],
       
    });
    return response.mez_admin.map((m) => {
        return {
            version: m.version,
            notificationInfo: (m.notification_token) ? {
                token: m.notification_token,
                AppTypeId: AppType.MezAdmin
            } : undefined,
            id: m.user_id,
            firebaseId: m.user?.firebase_id!,
            language: m.user?.language_id as Language
        }
    })

}