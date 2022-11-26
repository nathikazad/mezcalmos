import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, NotificationInfo } from "../../models/Generic/Generic";

export async function getNotificationInfo(userId: number): Promise<NotificationInfo> {
  let chain = getHasura();

  let response =  await chain.query({
    notification_info: [{
      where: {
        user_id: {
          _eq: userId
        }
      }
    }, {
      token: true,
      app_type_id: true
    }]
  });
  if(response.notification_info == null) {
    throw new HttpsError(
        "internal",
        "No notification information for user"
    );
  }
  return {
    token: response.notification_info[0].token,
    AppTypeId: response.notification_info[0].app_type_id as AppType
  }
}