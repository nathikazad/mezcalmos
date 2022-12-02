import { HttpsError } from "firebase-functions/v1/auth";
import { AssignDriverDetails } from "../../../delivery/assignDriver";
import { getHasura } from "../../../utilities/hasura";
import { AppType } from "../../models/Generic/Generic";
import { DeliveryDriverType } from "../../models/Services/Delivery/DeliveryOrder";

export async function assignDeliveryDriver(assignDriverDetails: AssignDriverDetails) {
  let chain = getHasura();
  let driverAppType: AppType = (assignDriverDetails.deliveryDriverType == DeliveryDriverType.DeliveryDriver)
    ? AppType.DeliveryApp
    : AppType.RestaurantApp;

  let response = await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: assignDriverDetails.deliveryId
      },
      _set: {
        deliverer_app_type_id: driverAppType,
        deliverer_id: assignDriverDetails.deliveryDriverId
      }
    }, {
      id: true
    }]
  });
  if(response.update_delivery_order_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No delivery with that id found"
    );
  }
}