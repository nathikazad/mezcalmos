import { AssignDriverDetails } from "../../../../delivery/assignDriver";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, MezError } from "../../../models/Generic/Generic";

export async function assignDeliveryDriver(assignDriverDetails: AssignDriverDetails, driverUserId: number) {
  let chain = getHasura();
  
  let response = await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: assignDriverDetails.deliveryOrderId
      },
      _set: {
        // delivery_driver_type: ParticipantType.DeliveryDriver,
        delivery_driver_id: assignDriverDetails.deliveryDriverId,
      }
    }, {
      id: true,
      chat_with_customer_id: true,
      chat_with_service_provider_id: true,
    }]
  });
  if(response.update_delivery_order_by_pk == null) {
    throw new MezError("deliveryOrderNotFound");
  }
  await chain.mutation({
    insert_chat_participant: [{
      objects: [{
        chat_id: response.update_delivery_order_by_pk.chat_with_customer_id,
        app_type_id: AppType.DeliveryApp,
        participant_id: driverUserId
      }, {
        chat_id: response.update_delivery_order_by_pk.chat_with_service_provider_id,
        app_type_id: AppType.DeliveryApp,
        participant_id: driverUserId
      }]
    }, {
      returning: {
        id: true,
      }
    }]
  })
}