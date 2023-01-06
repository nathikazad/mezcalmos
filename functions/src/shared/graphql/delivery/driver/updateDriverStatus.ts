import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { DelivererStatus } from "../../../models/Generic/Delivery";

export async function updateDriverStatustoAuthorized(deliveryDriverId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_delivery_driver_by_pk: [{
            pk_columns: {
                id: deliveryDriverId
            },
            _set: {
                status: DelivererStatus.Authorized
            }
        }, {
            status: true,
        }]
    });
    if(!(response.update_delivery_driver_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect delivery driver id"
        );
    }
}