import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";

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
        throw new MezError("driverNotFound");
    }
}