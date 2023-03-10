import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ChangePriceStatus, DeliveryOrder, DeliveryServiceProviderType } from "../../models/Generic/Delivery";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        status: deliveryOrder.status,
        package_ready: deliveryOrder.packageReady ,
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
        id: true
      }
    }]
  })
}

export async function updateDeliveryPackageCost(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        package_cost: deliveryOrder.packageCost
      }
    }, { 
      package_cost: true
    }]
  });
}

export async function updateDeliveryChangePriceRequest(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  if(deliveryOrder.changePriceRequest == null) {
    throw new HttpsError(
      "internal",
      "Change Price Request not set"
    );
  }
  switch (deliveryOrder.changePriceRequest.status) {
    case ChangePriceStatus.Requested:
      await chain.mutation({
        update_delivery_order_by_pk: [{
          pk_columns: {
            id: deliveryOrder.deliveryId
          },
          _set: {
            change_price_request: JSON.stringify(deliveryOrder.changePriceRequest)
          }
        }, {
          delivery_cost: true
        }]
      })
      break;
    case ChangePriceStatus.Accepted:
      await chain.mutation({
        update_delivery_order_by_pk: [{
          pk_columns: {
            id: deliveryOrder.deliveryId
          },
          _set: {
            change_price_request: JSON.stringify(deliveryOrder.changePriceRequest)
          }
        }, {
          delivery_cost: true
        }]
      })
      break;
    default:
      break;
  }
  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      },
      _set: {
        change_price_request: JSON.stringify(deliveryOrder.changePriceRequest)
      }
    }, {
      delivery_cost: true
    }]
  })
}
