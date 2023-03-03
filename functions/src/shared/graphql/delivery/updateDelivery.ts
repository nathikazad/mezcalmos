import { getHasura } from "../../../utilities/hasura";
import { DeliveryOrder, DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { MezError } from "../../models/Generic/Generic";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();
  if(deliveryOrder.deliveryId == null) {
    throw new MezError("noDeliveryOrderId");
  }
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