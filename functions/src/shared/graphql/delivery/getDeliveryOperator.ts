import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, Language, NotificationInfo } from "../../models/Generic/Generic";
import { DeliveryOperator, DeliveryOperatorStatus } from "../../models/Services/Delivery/DeliveryOrder";

export async function getDeliveryOperators(deliveryCompanyId: number): Promise<DeliveryOperator[]> {
    let chain = getHasura();

    let response = await chain.query({
        delivery_operator: [{
            where: {
                delivery_company_id: {
                    _eq: deliveryCompanyId
                }
            }
        }, {
            id: true,
            user_id: true,
            status: true,
            owner: true,
            app_version: true,
            current_gps: true,
            notification_token: true,
            user: {
                firebase_id: true,
                language_id: true
            }
        }]
    })
    if(response.delivery_operator == null) {
        throw new HttpsError(
          "internal",
          "No delivery company with that id found or company has no operators"
        );
      }
    
    return response.delivery_operator.map((d) => {
        return <DeliveryOperator>{
            id: d.id,
            userId: d.user_id,
            deliveryCompanyId: deliveryCompanyId,
            status: d.status as DeliveryOperatorStatus,
            owner: d.owner,
            appVersion: d.app_version,
            currentGPS: {
                lat: d.current_gps.coordinates[1],
                lng: d.current_gps.coordinates[0]
            },
            notificationInfo: (d.notification_token) ? <NotificationInfo>{
                AppTypeId: AppType.DeliveryAdmin,
                token: d.notification_token
            }: undefined,
            user: {
                id: d.user_id,
                firebaseId: d.user.firebase_id,
                language: d.user.language_id as Language
            }
        }
    })
}