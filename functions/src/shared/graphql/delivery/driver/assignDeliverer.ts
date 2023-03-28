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
        change_price_request: null
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
  let chatParticipants = [{
    chat_id: response.update_delivery_order_by_pk.chat_with_customer_id,
    app_type_id: AppType.Delivery,
    participant_id: driverUserId
  }];
  if(response.update_delivery_order_by_pk.chat_with_service_provider_id) {
    chatParticipants.push({
      chat_id: response.update_delivery_order_by_pk.chat_with_service_provider_id,
      app_type_id: AppType.Delivery,
      participant_id: driverUserId
    })
  }
  await chain.mutation({
    insert_chat_participant: [{
      objects: chatParticipants
    }, {
      returning: {
        id: true,
      }
    }]
  })
}