import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { Operator, OperatorStatus } from "../../../models/Services/Service";

export async function getLaundryOperators(laundryStoreId: number): Promise<Operator[]> {
    let chain = getHasura();
  
    let response = await chain.query({
      laundry_operator: [{
        where: {
          store_id: {
            _eq: laundryStoreId
          },
          status: {
            _eq: "authorized"
          }
        }
      }, {
        id: true,
        user_id: true,
        status: true,
        owner: true,
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
        user: {
          firebase_id: true,
          language_id: true,
        }
      }]
    });
    if(response.laundry_operator == null) {
      throw new HttpsError(
        "internal",
        "No laundry with that id found"
      );
    }
    
    return response.laundry_operator.map((r): Operator => {
      return {
        id: r.id,
        userId: r.user_id,
        serviceProviderId: laundryStoreId,
        status: r.status as OperatorStatus,
        owner: r.owner,
        notificationInfo: (r.notification_info) ? {
          appType: AppType.LaundryApp,
          token: r.notification_info.token,
          turnOffNotifications: r.notification_info.turn_off_notifications
        }: undefined,
        user: {
          id: r.user_id,
          firebaseId: r.user.firebase_id,
          language: r.user.language_id as Language
        }
      }
    });
  
  }