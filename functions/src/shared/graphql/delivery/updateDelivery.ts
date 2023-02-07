import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder, DeliveryServiceProviderType } from "../../models/Generic/Delivery";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();
  if(deliveryOrder.deliveryId == null) {
    throw new HttpsError(
      "internal",
      "delivery order id not provided"
    );
  }
  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        status: deliveryOrder.status,
      }
    }, { 
      status: true
    }]
  });
}

export async function updateDeliveryOrderCompany(deliveryOrderId: number, deliveryCompanyId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{ 
      pk_columns: {
        id: deliveryOrderId
      },
      _set: {
        service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
        service_provider_id: deliveryCompanyId
      }
    }, {
      delivery_company: {
        name: true
      }
    }]
  })
}
