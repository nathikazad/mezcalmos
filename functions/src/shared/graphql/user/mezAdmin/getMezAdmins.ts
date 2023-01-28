import { getHasura } from "../../../../utilities/hasura";
import { Language, NotificationInfo } from "../../../models/Generic/Generic";
import { MezAdmin } from "../../../models/Generic/User";

export async function getMezAdmins(): Promise<MezAdmin[]> {
    let chain = getHasura();
  
    let response = await chain.query({
        mez_admin: [{}, {
            user_id: true,
            version: true,
            notification_info: {
                token: true,
                turn_off_notifications: true
            },
            user: {
                firebase_id: true,
                language_id: true,
            }
        }],
       
    });
    return response.mez_admin.map((m) => {
        return <MezAdmin>{
            version: m.version,
            notificationInfo: (m.notification_info) ? <NotificationInfo> {
                token: m.notification_info.token,
                turnOffNotifications: m.notification_info.turn_off_notifications
            } : undefined,
            id: m.user_id,
            firebaseId: m.user?.firebase_id!,
            language: m.user?.language_id as Language
        }
    })

}