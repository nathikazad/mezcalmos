import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder } from "../../models/Services/Delivery/DeliveryOrder";

export async function deleteDeliveryChatMessages(deliveryOrder: DeliveryOrder/*, deliveryDriver: DeliveryDriver*/) {
  let chain = getHasura();

  if(deliveryOrder.chatWithServiceProviderId == undefined) {
    throw new HttpsError(
      "internal",
      "No delivery chat with restaurant id"
    );
  }
  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: deliveryOrder.chatWithCustomerId
      },
      _set: {
        messages: null
      }
    }, {
      id: true,
    }]
  });

  chain.mutation({
    update_chat_by_pk: [{
      pk_columns: {
        id: deliveryOrder.chatWithServiceProviderId
      },
      _set: {
        messages: null
      }
    }, {
      id: true,
    }]
  });

}