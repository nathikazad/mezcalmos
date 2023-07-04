import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, NotificationInfo } from "../../models/Generic/Generic";

export async function getNotificationInfo(userId: number, appType: AppType): Promise<NotificationInfo> {
  let chain = getHasura();

  let response =  await chain.query({
    notification_info: [{
      where: {
        _and: [{
          user_id: {
            _eq: userId
          },
          app_type_id: {
            _eq: appType
          }
        }]
      }
    }, {
      token: true,
      turn_off_notifications: true,
      app_type_id: true
    }]
  });
  if(response.notification_info == null) {
    throw new HttpsError(
        "internal",
        "No notification information for user"
    );
  }
  return <NotificationInfo>{
    token: response.notification_info[0].token,
    appType: response.notification_info[0].app_type_id as AppType,
    turnOffNotifications: response.notification_info[0].turn_off_notifications
  }
}