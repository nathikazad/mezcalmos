import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";

export async function deleteDeliveryDriver(deliveryDriverId: number)/*: Promise<DeliveryDriver>*/ {
    let chain = getHasura();

    let response = await chain.mutation({
        delete_delivery_driver_by_pk: [{
            id: deliveryDriverId
        }, {
            id: true,
        }]
    });
    if(!(response.delete_delivery_driver_by_pk)) {
        throw new HttpsError(
            "internal",
            "incorrect delivery driver id"
        );
    }
}