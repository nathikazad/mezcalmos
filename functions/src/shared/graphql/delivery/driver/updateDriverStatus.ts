import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus, MezError } from "../../../models/Generic/Generic";

export async function updateDriverStatustoAuthorized(deliveryDriverId: number) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_delivery_driver_by_pk: [{
            pk_columns: {
                id: deliveryDriverId
            },
            _set: {
                status: AuthorizationStatus.Authorized
            }
        }, {
            status: true,
        }]
    });
    if(!(response.update_delivery_driver_by_pk)) {
        throw new MezError("driverNotFound");
    }
}