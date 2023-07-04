import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder } from "../../models/Generic/Delivery";
import { MezError } from "../../models/Generic/Generic";

export async function deleteDeliveryChatMessagesAndParticipant(deliveryOrder: DeliveryOrder/*, deliveryDriver: DeliveryDriver*/) {
  let chain = getHasura();

  if(deliveryOrder.chatWithServiceProviderId == undefined) {
    throw new MezError("serviceProviderDeliveryChatNotFound");
  }
  await chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: deliveryOrder.chatWithCustomerId
      },

      _set: {
        messages: []
      }
    }, {
      id: true,
    }],
    delete_chat_participant: [{
      where: {
        _and: [{
          participant_id: {
            _eq: deliveryOrder.deliveryDriverId
          },
          chat_id: {
            _eq: deliveryOrder.chatWithCustomerId
          },
        }] 
      }
    }, {
      affected_rows: true
    }]
  });

  // let response = await 
  await chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: deliveryOrder.chatWithServiceProviderId
      },
      _set: {
        messages: []
      }
    }, {
      id: true,
    }],
    delete_chat_participant: [{
      where: {
        _and: [{
          participant_id: {
            _eq: deliveryOrder.deliveryDriverId
          },
          chat_id: {
            _eq: deliveryOrder.chatWithServiceProviderId
          },
        }]
      }
    }, {
      affected_rows: true
    }]
  });
}