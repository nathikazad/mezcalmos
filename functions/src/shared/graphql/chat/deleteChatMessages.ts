import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder } from "../../models/Generic/Delivery";

export async function deleteDeliveryChatMessagesAndParticipant(deliveryOrder: DeliveryOrder/*, deliveryDriver: DeliveryDriver*/) {
  let chain = getHasura();

  if(deliveryOrder.chatWithServiceProviderId == undefined) {
    throw new HttpsError(
      "internal",
      "No delivery chat with restaurant id"
    );
  }
  await chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: deliveryOrder.chatWithCustomerId
      },
      _set: {
        messages: null
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
        messages: null
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